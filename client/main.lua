local MenuPrompt
local MenuGroup = GetRandomIntInRange(0, 0xffffff)

local function StartPrompt()
    MenuPrompt = UiPromptRegisterBegin()
    UiPromptSetControlAction(MenuPrompt, Config.keys.menu)
    UiPromptSetText(MenuPrompt, CreateVarString(10, 'LITERAL_STRING', _U('OpenMenu')))
    UiPromptSetVisible(MenuPrompt, true)
    UiPromptSetEnabled(MenuPrompt, true)
    UiPromptSetStandardMode(MenuPrompt, true)
    UiPromptSetGroup(MenuPrompt, MenuGroup, 0)
    UiPromptRegisterEnd(MenuPrompt)
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
    Citizen.InvokeNative(0x662D364ABF16DE2F, Shops[shop].Blip, joaat(Config.BlipColors[color])) -- BlipAddModifier
end

local function AddShopNpcs(shop)
    local shopCfg = Shops[shop]

    if not shopCfg.NPC then
        local modelName = shopCfg.npc.model
        local model = joaat(modelName)

        LoadModel(model, modelName)

        shopCfg.NPC = CreatePed(model, shopCfg.npc.coords.x, shopCfg.npc.coords.y, shopCfg.npc.coords.z, shopCfg.npc.heading, false, true, true, true)
        Citizen.InvokeNative(0x283978A15512B2FE, shopCfg.NPC, true) -- SetRandomOutfitVariation
        SetEntityCanBeDamaged(shopCfg.NPC, false)
        SetEntityInvincible(shopCfg.NPC, true)
        Wait(500)
        FreezeEntityPosition(shopCfg.NPC, true)
        SetBlockingOfNonTemporaryEvents(shopCfg.NPC, true)
    end
end

local function RemoveShopNpcs(shop)
    local shopCfg = Shops[shop]

    if shopCfg.NPC then
        DeleteEntity(shopCfg.NPC)
        shopCfg.NPC = nil
    end
end

CreateThread(function()
    StartPrompt()
    while true do
        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)
        local sleep = 1000
        local hour = GetClockHours()

        if IsEntityDead(playerPed) then
            if InMission then
                StopAll = true
                TriggerServerEvent('bcc-legendaries:ClearActiveHunt')
                InMission = false
            end
            goto END
        end

        if InMenu then goto END end

        for shop, shopCfg in pairs(Shops) do
            local distance = #(playerCoords - shopCfg.npc.coords)
            local shopClosed = (shopCfg.shop.hours.active and hour >= shopCfg.shop.hours.close) or (shopCfg.shop.hours.active and hour < shopCfg.shop.hours.open)

            if shopClosed then
                if shopCfg.blip.show then
                    ManageShopBlips(shop, true)
                end
                RemoveShopNpcs(shop)
                if distance <= shopCfg.shop.distance then
                    sleep = 0
                    UiPromptSetActiveGroupThisFrame(MenuGroup, CreateVarString(10, 'LITERAL_STRING', shopCfg.shop.name .. _U('hours') ..
                    shopCfg.shop.hours.open .. _U('to') .. shopCfg.shop.hours.close .. _U('hundred')))
                    UiPromptSetEnabled(MenuPrompt, false)
                end

            else
                if shopCfg.blip.show then
                    ManageShopBlips(shop, false)
                end
                if distance <= shopCfg.npc.distance then
                    if shopCfg.npc.active then
                        AddShopNpcs(shop)
                    end
                else
                    RemoveShopNpcs(shop)
                end
                if distance <= shopCfg.shop.distance then
                    sleep = 0
                    UiPromptSetActiveGroupThisFrame(MenuGroup, CreateVarString(10, 'LITERAL_STRING', shopCfg.shop.prompt))
                    UiPromptSetEnabled(MenuPrompt, true)
                    if UiPromptHasStandardModeCompleted(MenuPrompt, 0) then
                        if shopCfg.shop.jobsEnabled then
                            local hasJob = Core.Callback.TriggerAwait('bcc-legendaries:CheckJob', shop)
                            if not hasJob then
                                Core.NotifyRightTip(_U('NeedJob'), 4000)
                                goto END
                            end
                        end
                        local trust = 0
                        if Config.levelSystem.active then
                            trust = Core.Callback.TriggerAwait('bcc-legendaries:CheckPlayerTrust')
                            if not trust then goto END end
                        end
                        OpenHuntMenu(shop, trust)
                    end
                end
            end
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