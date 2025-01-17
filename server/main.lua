local Core = exports.vorp_core:GetCore()
local BccUtils = exports['bcc-utils'].initiate()

local ActiveHunts = {}
local Cooldowns = {}

if Config.discord.active == true then
    Discord = BccUtils.Discord.setup(Config.discord.webhookURL, Config.discord.title, Config.discord.avatar)
end

function LogToDiscord(name, description, embeds)
    if Config.discord.active == true then
        Discord:sendMessage(name, description, embeds)
    end
end

RegisterServerEvent('bcc-legendaries:GiveItems', function(huntId)
    local src = source
    local user = Core.getUser(src)
    if not user or not ActiveHunts[src] then return end

    local rewards = Hunts[huntId].rewards
    for _, rewardCfg in pairs(rewards) do
        if exports.vorp_inventory:canCarryItem(src, rewardCfg.name, rewardCfg.count) then
            exports.vorp_inventory:addItem(src, rewardCfg.name, rewardCfg.count)
        end
    end

    if Config.levelSystem.active then
        local character = user.getUsedCharacter
        local identifier = character.identifier
        local charid = character.charIdentifier

        local result = MySQL.query.await('SELECT `trust` FROM `legendaries` WHERE `charidentifier` = ? AND `identifier` = ?',
        { charid, identifier })

        if result[1] then
            local newTrust = result[1].trust + Config.levelSystem.increment
            MySQL.query.await('UPDATE `legendaries` SET `trust` = ? WHERE charidentifier = ? AND identifier = ?',
            { newTrust, charid, identifier })
        end
    end

    ActiveHunts[src] = nil
    Core.NotifyRightTip(src, _U('AnimalSkinned'), 4000)
end)

Core.Callback.Register('bcc-legendaries:GetHuntApproval', function(source, cb, huntId)
    local src = source
    local user = Core.getUser(src)
    if not user then return cb(false) end

    local character = user.getUsedCharacter
    local identifier = character.identifier
    local charId = character.charIdentifier
    local huntCfg = Hunts[huntId]

    if ActiveHunts[src] then
        Core.NotifyRightTip(src, _U('HuntActive'), 4000)
        return cb(false)
    end

    -- Get Cost with Discount
    local cost = huntCfg.currency.amount
    local discountPercentage = 0
    if Config.levelSystem.active then
        local trust = 0
        local result = MySQL.query.await('SELECT `trust` FROM `legendaries` WHERE `identifier` = ? AND `charidentifier` = ?', { identifier, charId })
        if #result > 0 and result[1].trust then
            trust = result[1].trust
        end

        if trust >= Config.levelSystem.maxLevel then
            discountPercentage = Config.levelSystem.maxLevelDiscount
        else
            for _, levelCfg in pairs(Levels) do
                if trust >= levelCfg.level and trust < levelCfg.nextLevel then
                    discountPercentage = levelCfg.discount
                    break
                end
            end
        end
        cost = math.ceil(cost * (1 - discountPercentage / 100))
    end

    -- Check if Player has enough Currency
    local currencyType = huntCfg.currency.type == 'cash' and 0 or 1

    if (currencyType == 0 and character.money < cost) or (currencyType == 1 and character.gold < cost) then
        Core.NotifyRightTip(src, currencyType == 0 and _U('ShortCash') or _U('ShortGold'), 4000)
        return cb(false)
    end

    -- Check if Player is on Cooldown
    local currentTime = os.time()
    local cooldownDuration = huntCfg.cooldown * 60000

    if Cooldowns[huntId] and os.difftime(currentTime, Cooldowns[huntId]) < cooldownDuration then
        Core.NotifyRightTip(src, _U('Cooldownactive'), 6000)
        return cb(false)
    else
        Cooldowns[huntId] = currentTime
        character.removeCurrency(currencyType, cost)
        LogToDiscord('CharId: ' .. tostring(charId), ' ' .. _U('WebhookDesc') .. ' ' .. huntCfg.name)
        ActiveHunts[src] = true
        cb(true)
    end
end)

Core.Callback.Register('bcc-legendaries:CheckPlayerTrust', function(source, cb)
    local src = source
    local user = Core.getUser(src)
    if not user then return cb(false) end
    local character = user.getUsedCharacter
    local identifier = character.identifier
    local charId = character.charIdentifier

    MySQL.query.await([[
        INSERT INTO `legendaries` (`charidentifier`, `identifier`)
        VALUES (?, ?)
        ON DUPLICATE KEY UPDATE `charidentifier` = VALUES(`charidentifier`), `identifier` = VALUES(`identifier`)
    ]], { charId, identifier })

    local result = MySQL.query.await('SELECT `trust` FROM `legendaries` WHERE `identifier` = ? AND `charidentifier` = ?', { identifier, charId })
    if #result > 0 then
        if result[1].trust then
            local trust = result[1].trust
            cb(trust)
        end
    else
        print('Error: No trust found for charidentifier:', charId)
        cb(false)
    end
end)

Core.Callback.Register('bcc-legendaries:GetPlayerLevel', function(source, cb)
    local src = source
    local user = Core.getUser(src)
    if not user then return cb(false) end
    local character = user.getUsedCharacter

    local result = MySQL.query.await('SELECT `trust` FROM `legendaries` WHERE `identifier` = ? AND `charidentifier` = ?', { character.identifier, character.charIdentifier })
    if #result > 0 and result[1].trust then
        local trust = result[1].trust
        return cb(trust)
    end
    cb(false)
end)

AddEventHandler('playerDropped', function(reason)
    local src = source

    if ActiveHunts[src] then
        ActiveHunts[src] = nil
    end
end)

RegisterServerEvent('bcc-legendaries:ClearActiveHunt', function()
    local src = source

    if ActiveHunts[src] then
        ActiveHunts[src] = nil
    end
end)

Core.Callback.Register('bcc-legendaries:CheckJob', function(source, cb, location)
    local src = source
    local user = Core.getUser(src)
    if not user then return cb(false) end
    local character = user.getUsedCharacter

    local hasJob = false
    for _, job in pairs(Shops[location].shop.jobs) do
        if (character.job == job.name) and (tonumber(character.jobGrade) >= tonumber(job.grade)) then
            hasJob = true
            break
        end
    end

    cb(hasJob)
end)

BccUtils.Versioner.checkFile(GetCurrentResourceName(), 'https://github.com/BryceCanyonCounty/bcc-legendaries')
