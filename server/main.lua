local Core = exports.vorp_core:GetCore()
local BccUtils = exports['bcc-utils'].initiate()
---@type BCCLegendariesDebugLib
local DBG = BCCLegendariesDebug

local ActiveHunts = {}
local Cooldowns = {}
local ActiveHuntTimestamps = {} -- Track when hunts were started

-- Cleanup stale ActiveHunts entries using timer (non-blocking)
local function cleanupStaleHunts()
    local currentTime = os.time()
    for src, timestamp in pairs(ActiveHuntTimestamps) do
        -- Remove hunts older than 30 minutes (assumed max hunt duration)
        if currentTime - timestamp > 1800 then
            ActiveHunts[src] = nil
            ActiveHuntTimestamps[src] = nil
            DBG.Info(string.format('Cleaned up stale hunt for player %d', src))
        end
    end
end

-- Set up cleanup timer (every 5 minutes)
SetTimeout(300000, function()
    cleanupStaleHunts()
    -- Reschedule the next cleanup
    local function scheduleCleanup()
        SetTimeout(300000, function()
            cleanupStaleHunts()
            scheduleCleanup() -- Continue the cycle
        end)
    end
    scheduleCleanup()
end)

if Config.discord.active == true then
    Discord = BccUtils.Discord.setup(Config.discord.webhookURL, Config.discord.title, Config.discord.avatar)
end

local function LogToDiscord(name, description, embeds)
    if Config.discord.active == true then
        Discord:sendMessage(name, description, embeds)
    end
end

RegisterServerEvent('bcc-legendaries:GiveItems', function(huntId)
    local src = source
    local user = Core.getUser(src)
    if not user or not ActiveHunts[src] then return end

    local huntConfig = Hunts[huntId]
    if not huntConfig then
        DBG.Error("Hunt not found with ID: " .. tostring(huntId))
        return
    end

    local rewards = huntConfig.rewards
    for _, rewardCfg in pairs(rewards) do
        if exports.vorp_inventory:canCarryItem(src, rewardCfg.name, rewardCfg.count) then
            exports.vorp_inventory:addItem(src, rewardCfg.name, rewardCfg.count)
        end
    end

    if Config.trustSystem.active then
        local character = user.getUsedCharacter
        local identifier = character.identifier
        local charid = character.charIdentifier

        local result = MySQL.query.await('SELECT `trust` FROM `legendaries` WHERE `charidentifier` = ? AND `identifier` = ?',
        { charid, identifier })

        if result[1] then
            local newTrust = result[1].trust + Config.trustSystem.increment
            MySQL.query.await('UPDATE `legendaries` SET `trust` = ? WHERE charidentifier = ? AND identifier = ?',
            { newTrust, charid, identifier })
        end
    end

    ActiveHunts[src] = nil
    ActiveHuntTimestamps[src] = nil
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

    if not huntCfg then
        DBG.Error("Hunt not found with ID: " .. tostring(huntId))
        return cb(false)
    end

    if ActiveHunts[src] then
        Core.NotifyRightTip(src, _U('HuntActive'), 4000)
        return cb(false)
    end

    -- Get Cost with Discount (only apply to monetary currencies)
    local cost = huntCfg.currency.amount
    local discountPercentage = 0
    local currencyType = huntCfg.currency.type

    -- Only apply trust discounts to cash and gold currencies, not items
    if Config.trustSystem.active and (currencyType == 'cash' or currencyType == 'gold') then
        local trust = 0
        local result = MySQL.query.await('SELECT `trust` FROM `legendaries` WHERE `identifier` = ? AND `charidentifier` = ?', { identifier, charId })
        if #result > 0 and result[1].trust then
            trust = result[1].trust
        end

        if trust >= Config.trustSystem.maxLevel then
            discountPercentage = Config.trustSystem.maxLevelDiscount
        else
            for _, levelCfg in pairs(Levels) do
                if trust >= levelCfg.level and trust < levelCfg.nextLevel then
                    discountPercentage = levelCfg.discount
                    break
                end
            end
        end
        -- Apply discount with proper rounding to avoid floating-point precision issues
        local discountAmount = math.floor(cost * discountPercentage / 100)
        cost = cost - discountAmount

        DBG.Info(string.format('Applied %d%% trust discount to %s currency. Original: %d, Final: %d',
            discountPercentage, currencyType, huntCfg.currency.amount, cost))
    elseif currencyType == 'item' then
        DBG.Info(string.format('No trust discount applied to item currency: %s', tostring(huntCfg.currency.item.name or 'Unknown Item')))
    end

    -- Check if Player has enough Currency
    local canAfford = false
    local costMessage = ""

    if currencyType == 'cash' then
        canAfford = character.money >= cost
        costMessage = _U('ShortCash')
    elseif currencyType == 'gold' then
        canAfford = character.gold >= cost
        costMessage = _U('ShortGold')
    elseif currencyType == 'item' then
        local itemConfig = huntCfg.currency.item
        local itemName = itemConfig and itemConfig.name or 'Unknown Item'

        -- Get item label from database for display
        local itemLabel = itemName
        local itemData = MySQL.query.await('SELECT label FROM items WHERE item = ?', { itemName })
        if itemData and itemData[1] and itemData[1].label then
            itemLabel = itemData[1].label
        end

        local playerItemCount = 0
        playerItemCount = exports.vorp_inventory:getItemCount(src, nil, itemName)

        local hasItem = playerItemCount >= cost
        canAfford = hasItem
        costMessage = _U('ShortItem') .. ' (' .. tostring(itemLabel) .. ' x' .. tostring(cost) .. ')'

        -- Debug information
        DBG.Info(string.format('Item check - Player: %d, Item: %s (%s), Has: %d, Needs: %d, CanAfford: %s',
            src, tostring(itemName), tostring(itemLabel), playerItemCount, tonumber(cost) or 0, tostring(hasItem)))
    else
        DBG.Error("Invalid currency type: " .. tostring(currencyType))
        return cb(false)
    end

    if not canAfford then
        Core.NotifyRightTip(src, costMessage, 4000)
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

        -- Deduct currency based on type
        if currencyType == 'cash' then
            character.removeCurrency(0, cost)
        elseif currencyType == 'gold' then
            character.removeCurrency(1, cost)
        elseif currencyType == 'item' then
            local itemConfig = huntCfg.currency.item
            if itemConfig and itemConfig.remove then
                local itemName = itemConfig.name or 'Unknown Item'

                -- Get item label for logging
                local itemLabel = itemName
                local itemData = MySQL.query.await('SELECT label FROM items WHERE item = ?', { itemName })
                if itemData and itemData[1] and itemData[1].label then
                    itemLabel = itemData[1].label
                end

                DBG.Info(string.format('Removing %d x %s (%s) from player %d', tonumber(cost) or 0, tostring(itemLabel), tostring(itemName), src))
                local success = false
                success = exports.vorp_inventory:subItem(src, itemName, cost)
                DBG.Info(string.format('Item removal result: %s', tostring(success)))
            elseif itemConfig and not itemConfig.remove then
                local itemName = (itemConfig and itemConfig.name) or 'Unknown Item'

                -- Get item label for logging
                local itemLabel = itemName
                local itemData = MySQL.query.await('SELECT label FROM items WHERE item = ?', { itemName })
                if itemData and itemData[1] and itemData[1].label then
                    itemLabel = itemData[1].label
                end

                DBG.Info(string.format('Item check only (remove=false) for %s (%s)', tostring(itemLabel), tostring(itemName)))
            end
            -- Note: If remove = false, we just check for the item but don't consume it
        end

        LogToDiscord('CharId: ' .. tostring(charId), ' ' .. _U('WebhookDesc') .. ' ' .. tostring(huntCfg.name or 'Unknown Hunt'))
        ActiveHunts[src] = true
        ActiveHuntTimestamps[src] = currentTime
        DBG.Info(string.format('Hunt started successfully for player %d, huntId: %s', src, huntId))
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
        DBG.Error('No trust found for charidentifier: ' .. tostring(charId))
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
        ActiveHuntTimestamps[src] = nil
    end
end)

RegisterServerEvent('bcc-legendaries:ClearActiveHunt', function()
    local src = source

    if ActiveHunts[src] then
        ActiveHunts[src] = nil
        ActiveHuntTimestamps[src] = nil
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

-- Secure Trust System Exports
local RATE_LIMITS = {}

local function getPlayerTrustInternal(identifier, charidentifier)
    local result = MySQL.query.await('SELECT trust FROM legendaries WHERE identifier = ? AND charidentifier = ?', { identifier, charidentifier })
    if result and result[1] then
        return tonumber(result[1].trust) or 0
    end
    return 0
end

local function setPlayerTrustInternal(identifier, charidentifier, trust)
    local result = MySQL.update.await('INSERT INTO legendaries (identifier, charidentifier, trust) VALUES (?, ?, ?) ON DUPLICATE KEY UPDATE trust = VALUES(trust)', 
        { identifier, charidentifier, trust })
    return result and result.affectedRows and result.affectedRows > 0
end

-- Rate limiting helper
local function checkRateLimit(resource, operation)
    if not Config.trustSecurity.rateLimitEnabled then return true end

    local key = resource .. ':' .. operation
    local now = os.time()

    if not RATE_LIMITS[key] then
        RATE_LIMITS[key] = { count = 0, lastReset = now }
    end

    local limit = RATE_LIMITS[key]
    if now - limit.lastReset > Config.trustSecurity.rateLimitWindow then
        limit.count = 0
        limit.lastReset = now
    end

    limit.count = limit.count + 1
    return limit.count <= Config.trustSecurity.rateLimitCalls
end

-- Input validation helper
local function validateTrustInput(identifier, charidentifier, trust)
    if type(identifier) ~= 'string' or identifier == '' then
        return false, 'Invalid identifier'
    end

    if type(charidentifier) ~= 'number' or charidentifier <= 0 then
        return false, 'Invalid character identifier'
    end

    if trust and (type(trust) ~= 'number' or trust < Config.trustSecurity.minTrust or trust > Config.trustSecurity.maxTrust) then
        return false, 'Trust value out of bounds (' .. Config.trustSecurity.minTrust .. '-' .. Config.trustSecurity.maxTrust .. ')'
    end

    return true
end

-- Security audit logger
local function logTrustChange(callingResource, operation, identifier, charidentifier, oldValue, newValue)
    if not Config.trustSecurity.auditLogging then return end

    -- Use print for security audit trail (should always be visible)
    print(string.format('[TRUST AUDIT] %s: %s called by %s - Player %s (char:%d) - %d -> %d',
        os.date('%Y-%m-%d %H:%M:%S'), operation, callingResource or 'unknown',
        identifier, charidentifier, oldValue or 0, newValue or 0))

    if Config.trustSecurity.discordAudit and Config.discord and Config.discord.active then
        LogToDiscord('Trust System Audit',
            string.format('**%s**\nResource: %s\nPlayer: %s (Char: %d)\nChange: %d → %d',
            operation, callingResource, identifier, charidentifier, oldValue or 0, newValue or 0))
    end
end

exports('GetPlayerTrust', function(identifier, charidentifier)
    local callingResource = GetInvokingResource()

    -- Validate input
    local valid, error = validateTrustInput(identifier, charidentifier)
    if not valid then
        print('[TRUST ERROR] GetPlayerTrust: ' .. error .. ' from ' .. (callingResource or 'unknown'))
        return 0
    end

    -- Rate limiting
    if not checkRateLimit(callingResource, 'GetPlayerTrust') then
        print('[TRUST ERROR] Rate limit exceeded for ' .. (callingResource or 'unknown'))
        return 0
    end

    return getPlayerTrustInternal(identifier, charidentifier)
end)

exports('SetPlayerTrust', function(identifier, charidentifier, trust)
    local callingResource = GetInvokingResource()

    -- Check if resource is authorized
    if Config.trustSecurity.enabled and not Config.trustSecurity.authorizedResources[callingResource] then
        print('[TRUST SECURITY] Unauthorized access attempt by ' .. (callingResource or 'unknown'))
        return false
    end

    -- Validate input
    local valid, error = validateTrustInput(identifier, charidentifier, trust)
    if not valid then
        print('[TRUST ERROR] SetPlayerTrust: ' .. error .. ' from ' .. callingResource)
        return false
    end

    -- Rate limiting
    if not checkRateLimit(callingResource, 'SetPlayerTrust') then
        print('[TRUST ERROR] Rate limit exceeded for ' .. callingResource)
        return false
    end

    -- Get old value for audit (using internal helper)
    local oldTrust = getPlayerTrustInternal(identifier, charidentifier)

    local success = setPlayerTrustInternal(identifier, charidentifier, trust)
    if success then
        logTrustChange(callingResource, 'SetPlayerTrust', identifier, charidentifier, oldTrust, trust)
    end

    return success
end)

exports('AddPlayerTrust', function(identifier, charidentifier, trustToAdd)
    local callingResource = GetInvokingResource()

    -- Check if resource is authorized
    if Config.trustSecurity.enabled and not Config.trustSecurity.authorizedResources[callingResource] then
        print('[TRUST SECURITY] Unauthorized access attempt by ' .. (callingResource or 'unknown'))
        return false
    end

    -- Validate input
    local valid, error = validateTrustInput(identifier, charidentifier)
    if not valid then
        print('[TRUST ERROR] AddPlayerTrust: ' .. error .. ' from ' .. callingResource)
        return false
    end

    if type(trustToAdd) ~= 'number' or trustToAdd <= 0 or trustToAdd > Config.trustSecurity.maxSingleChange then
        print('[TRUST ERROR] AddPlayerTrust: Invalid trust amount from ' .. callingResource)
        return false
    end

    -- Rate limiting
    if not checkRateLimit(callingResource, 'AddPlayerTrust') then
        print('[TRUST ERROR] Rate limit exceeded for ' .. callingResource)
        return false
    end

    local currentTrust = getPlayerTrustInternal(identifier, charidentifier)
    local newTrust = math.min(currentTrust + trustToAdd, Config.trustSecurity.maxTrust)

    local success = setPlayerTrustInternal(identifier, charidentifier, newTrust)
    if success then
        logTrustChange(callingResource, 'AddPlayerTrust', identifier, charidentifier, currentTrust, newTrust)
    end

    return success
end)

exports('RemovePlayerTrust', function(identifier, charidentifier, trustToRemove)
    local callingResource = GetInvokingResource()

    -- Check if resource is authorized
    if Config.trustSecurity.enabled and not Config.trustSecurity.authorizedResources[callingResource] then
        print('[TRUST SECURITY] Unauthorized access attempt by ' .. (callingResource or 'unknown'))
        return false
    end

    -- Validate input
    local valid, error = validateTrustInput(identifier, charidentifier)
    if not valid then
        print('[TRUST ERROR] RemovePlayerTrust: ' .. error .. ' from ' .. callingResource)
        return false
    end

    if type(trustToRemove) ~= 'number' or trustToRemove <= 0 or trustToRemove > Config.trustSecurity.maxSingleChange then
        print('[TRUST ERROR] RemovePlayerTrust: Invalid trust amount from ' .. callingResource)
        return false
    end

    -- Rate limiting
    if not checkRateLimit(callingResource, 'RemovePlayerTrust') then
        print('[TRUST ERROR] Rate limit exceeded for ' .. callingResource)
        return false
    end

    local currentTrust = getPlayerTrustInternal(identifier, charidentifier)
    local newTrust = math.max(currentTrust - trustToRemove, Config.trustSecurity.minTrust)

    local success = setPlayerTrustInternal(identifier, charidentifier, newTrust)
    if success then
        logTrustChange(callingResource, 'RemovePlayerTrust', identifier, charidentifier, currentTrust, newTrust)
    end

    return success
end)

-- Callback to get item label for display
Core.Callback.Register('bcc-legendaries:GetItemLabel', function(source, cb, itemName)
    if not itemName or itemName == '' then
        return cb(itemName or 'Unknown Item')
    end

    local itemData = MySQL.query.await('SELECT label FROM items WHERE item = ?', { itemName })
    if itemData and itemData[1] and itemData[1].label then
        cb(itemData[1].label)
    else
        cb(itemName) -- Fallback to item name if no label found
    end
end)

BccUtils.Versioner.checkFile(GetCurrentResourceName(), 'https://github.com/BryceCanyonCounty/bcc-legendaries')
