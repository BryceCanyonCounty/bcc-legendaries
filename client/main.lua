local Core = exports.vorp_core:GetCore()
---@type BCCLegendariesDebugLib
local DBG = BCCLegendariesDebug

local MenuPrompt
local MenuGroup = GetRandomIntInRange(0, 0xffffff)
local PromptStarted = false

local function StartPrompt()
    if PromptStarted then
        DBG.Success('Prompts are already started')
        return
    end

    if not MenuGroup then
        DBG.Error('MenuGroup not initialized')
        return
    end

    if not Config or not Config.keys or not Config.keys.menu then
        DBG.Error('Menu key not configured')
        return
    end

    MenuPrompt = UiPromptRegisterBegin()
    if not MenuPrompt or MenuPrompt == 0 then
        DBG.Error('Failed to register MenuPrompt')
        return
    end
    UiPromptSetControlAction(MenuPrompt, Config.keys.menu)
    UiPromptSetText(MenuPrompt, CreateVarString(10, 'LITERAL_STRING', _U('OpenMenu')))
    UiPromptSetVisible(MenuPrompt, true)
    UiPromptSetEnabled(MenuPrompt, true)
    UiPromptSetStandardMode(MenuPrompt, true)
    UiPromptSetGroup(MenuPrompt, MenuGroup, 0)
    UiPromptRegisterEnd(MenuPrompt)

    PromptStarted = true
    DBG.Success('Menu prompt started successfully')
end

local function isShopClosed(shopCfg)
    local hour = GetClockHours()
    local hoursActive = shopCfg.shop.hours.active

    if not hoursActive then
        return
    end

    local openHour = shopCfg.shop.hours.open
    local closeHour = shopCfg.shop.hours.close

    if openHour < closeHour then
        -- Normal: shop opens and closes on the same day
        return hour < openHour or hour >= closeHour
    else
        -- Overnight: shop closes on the next day
        return hour < openHour and hour >= closeHour
    end
end

local function ManageShopBlips(shop, closed)
    local shopCfg = Shops[shop]

    if closed and not shopCfg.blip.showClosed or (not shopCfg.blip.show) then
        if Shops[shop].Blip then
            RemoveBlip(Shops[shop].Blip)
            Shops[shop].Blip = nil
        end
        return
    end

    if not Shops[shop].Blip then
        shopCfg.Blip = Citizen.InvokeNative(0x554d9d53f696d002, 1664425300, shopCfg.npc.coords) -- BlipAddForCoords
        SetBlipSprite(shopCfg.Blip, shopCfg.blip.sprite, true)
        Citizen.InvokeNative(0x9CB1A1623062F402, shopCfg.Blip, shopCfg.blip.name) -- SetBlipNameFromPlayerString
    end

    local color = shopCfg.blip.color.open
    if shopCfg.shop.jobsEnabled then color = shopCfg.blip.color.job end
    if closed then color = shopCfg.blip.color.closed end

    if Config.BlipColors[color] then
        Citizen.InvokeNative(0x662D364ABF16DE2F, Shops[shop].Blip, joaat(Config.BlipColors[color])) -- BlipAddModifier
    else
        print('Error: Blip color not defined for color: ' .. tostring(color))
    end
end

local function AddShopNpcs(shop)
    -- Validate shop configuration
    if not shop then
        DBG.Error(('Invalid shop: %s'):format(tostring(shop)))
        return
    end

    local shopCfg = Shops[shop]
    if not shopCfg or not shopCfg.npc then
        DBG.Error(('Invalid shop configuration for: %s'):format(tostring(shop)))
        return
    end

    -- Check if NPC already exists
    if shopCfg.NPC then
        return
    end

    -- Validate NPC coordinates and model
    local coords = shopCfg.npc.coords
    if not coords then
        DBG.Error(('Invalid NPC coordinates for shop: %s'):format(tostring(shop)))
        return
    end

    local modelName = shopCfg.npc.model
    if not modelName then
        DBG.Error(('Invalid NPC model for shop: %s'):format(tostring(shop)))
        return
    end

    -- Load model
    local model = joaat(modelName)
    if not LoadModel(model, modelName) then
        DBG.Error(('Failed to load NPC model for shop: %s'):format(tostring(shop)))
        return
    end

    -- Create NPC
    shopCfg.NPC = CreatePed(model, shopCfg.npc.coords.x, shopCfg.npc.coords.y, shopCfg.npc.coords.z, shopCfg.npc.heading, false, true, true, true)

    if not shopCfg.NPC or not DoesEntityExist(shopCfg.NPC) then
        DBG.Error(('Failed to create NPC for shop: %s'):format(tostring(shop)))
        return
    end

    -- Configure the NPC
    Citizen.InvokeNative(0x283978A15512B2FE, shopCfg.NPC, true) -- SetRandomOutfitVariation
    SetEntityCanBeDamaged(shopCfg.NPC, false)
    SetEntityInvincible(shopCfg.NPC, true)
    Wait(500)
    FreezeEntityPosition(shopCfg.NPC, true)
    SetBlockingOfNonTemporaryEvents(shopCfg.NPC, true)

    DBG.Success(('NPC created successfully for shop: %s'):format(tostring(shop)))
end

local function RemoveShopNpcs(shop)
    -- Validate shop input
    if not shop then
        DBG.Error(('Invalid shop: %s'):format(tostring(shop)))
        return
    end

    -- Check if shop configuration exists
    local shopCfg = Shops[shop]
    if not shopCfg then
        DBG.Error(('Shop configuration not found: %s'):format(tostring(shop)))
        return
    end

    -- Check if NPC exists
    if not shopCfg.NPC then
        return
    end

    -- Check if the entity exists before deletion
    if not DoesEntityExist(shopCfg.NPC) then
        DBG.Warning(('NPC entity does not exist for shop: %s'):format(tostring(shop)))
        shopCfg.NPC = nil -- Clean up reference
        return
    end

    -- Delete the NPC entity
    DeleteEntity(shopCfg.NPC)
    shopCfg.NPC = nil

    DBG.Info(('Successfully removed NPC for shop: %s'):format(tostring(shop)))
end

CreateThread(function()
    StartPrompt()
    while true do
        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)
        local sleep = 1000

        -- Skip processing if player is in menu or dead
        if IsEntityDead(playerPed) then
            if InMission then
                StopAll = true
                TriggerServerEvent('bcc-legendaries:ClearActiveHunt')
                InMission = false
            end
            Wait(1000)
            goto END
        else
            -- Reset StopAll flag when player is alive (after respawn)
            if StopAll then
                StopAll = false
            end
        end

        if InMenu then
            Wait(1000)
            goto END
        end

        for shop, shopCfg in pairs(Shops) do
            -- Calculate distance to site
            local distance = #(playerCoords - shopCfg.npc.coords)
            IsShopClosed = isShopClosed(shopCfg)
            ManageShopBlips(shop, IsShopClosed)

            -- Handle NPC spawning/despawning based on distance and shop status
            if distance > shopCfg.npc.distance or IsShopClosed then
                RemoveShopNpcs(shop)
            elseif shopCfg.npc.active then
                AddShopNpcs(shop)
            end

            -- Skip to next site if too far from shop
            if distance > shopCfg.shop.distance then
                    goto NEXT_SITE
            end

            sleep = 0

            -- Set prompt text based on shop status
            local promptText
            if IsShopClosed then
                promptText = ('%s %s %d %s %d %s'):format(
                    shopCfg.shop.name,
                    _U('hours'),
                    shopCfg.shop.hours.open,
                    _U('to'),
                    shopCfg.shop.hours.close,
                    _U('hundred')
                )
            else
                promptText = shopCfg.shop.prompt
            end

            UiPromptSetActiveGroupThisFrame(MenuGroup, CreateVarString(10, 'LITERAL_STRING', promptText), 1, 0, 0, 0)
            -- Enable/disable prompts based on shop status
            UiPromptSetEnabled(MenuPrompt, not IsShopClosed)

            -- Handle prompt interactions
            if not IsShopClosed then
                -- Shop menu prompt
                if UiPromptHasStandardModeCompleted(MenuPrompt, 0) then
                    if shopCfg.shop.jobsEnabled then
                        local hasJob = Core.Callback.TriggerAwait('bcc-legendaries:CheckJob', shop)
                        if not hasJob then
                            Core.NotifyRightTip(_U('NeedJob'), 4000)
                            goto NEXT_SITE
                        end
                    end
                    local trust = 0
                    if Config.trustSystem.active then
                        trust = Core.Callback.TriggerAwait('bcc-legendaries:CheckPlayerTrust')
                        if not trust then goto NEXT_SITE end
                    end
                    OpenHuntMenu(shop, trust)
                end
            end
            ::NEXT_SITE::
        end
        ::END::
        Wait(sleep)
    end
end)

AddEventHandler('onResourceStop', function(resource)
    if resource ~= GetCurrentResourceName() then
        return
    end

    UiPromptDelete(MenuPrompt)

    for _, shopCfg in pairs(Shops) do
        if shopCfg.Blip then
            RemoveBlip(shopCfg.Blip)
            shopCfg.Blip = nil
        end
        if shopCfg.NPC then
            DeleteEntity(shopCfg.NPC)
            shopCfg.NPC = nil
        end
    end
end)