function SearchSetup(type, x, y, z, data)
    -- Chest Setup
    local chest = CreateObject(joaat('p_chest01x'), x, y, z - 1, true, false, false)
    PlaceObjectOnGroundProperly(chest, true)
    Wait(500)
    FreezeEntityPosition(chest, true)

    -- Chest Prompt Setup
    local ChestGroup = GetRandomIntInRange(0, 0xffffff)
    local chestPrompt = UiPromptRegisterBegin()
    UiPromptSetControlAction(chestPrompt, Config.keys.chest)
    UiPromptSetText(chestPrompt, CreateVarString(10, 'LITERAL_STRING', _U('Open')))
    UiPromptSetVisible(chestPrompt, true)
    UiPromptSetEnabled(chestPrompt, true)
    UiPromptSetHoldMode(chestPrompt, 2000)
    UiPromptSetGroup(chestPrompt, ChestGroup, 0)
    UiPromptRegisterEnd(chestPrompt)

    -- Blip and Waypoint Setup
    local chestBlip = Citizen.InvokeNative(0x45F13B7E0A15C880, -1282792512, x, y, z, 100.0) -- BlipAddForRadius
    Citizen.InvokeNative(0x9CB1A1623062F402, chestBlip, _U('Lastlocationblip')) -- SetBlipName
    StartGPS(x, y, z)

    -- Cleanup Function
    local function Cleanup()
        RemoveBlip(chestBlip)
        ClearGpsMultiRoute()
        UiPromptDelete(chestPrompt)
        DeleteEntity(chest)
    end

    -- Main Loop
    local sleep = 1000
    local playerPed = PlayerPedId()
    local animDict = 'mech_ransack@chest@med@open@crouch@b'
    local animName = 'base'
    local hintBoxCoords = vector3(x, y, z)

    RequestAnimDict(animDict)
    while not HasAnimDictLoaded(animDict) do
        Wait(0)
    end

    while true do
        if StopAll then
            Core.NotifyRightTip(_U('Deadtext'), 4000)
            Cleanup()
            return
        end

        local playerCoords = GetEntityCoords(playerPed)
        local dist = #(playerCoords - hintBoxCoords)

        if dist <= 3 then
            sleep = 0
            UiPromptSetActiveGroupThisFrame(ChestGroup, CreateVarString(10, 'LITERAL_STRING', _U('ChestPrompt')))
            if UiPromptHasHoldModeCompleted(chestPrompt) then
                HidePedWeapons(playerPed, 2, true)
                TaskPlayAnim(playerPed, animDict, animName, 8.0, 8.0, 5000, 17, 0.2, false, false, false)
                Wait(5000)
                Core.NotifyRightTip(_U('Cluefound'), 4000)
                Cleanup()
                break
            end
        else
            sleep = 1000
        end
        Wait(sleep)
    end

    -- NPC and Animal Spawning
    if type == 'InitSearch' and data.npc.enabled then
        SpawnNpcs(data)
    elseif type == 'InitSearch' or type == 'NpcSearch' then
        SpawnAnimal(data)
    end
end
