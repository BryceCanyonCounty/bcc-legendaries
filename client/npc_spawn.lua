function SpawnNpcs(data)
    local modelName = data.npc.model
    local model = joaat(modelName)

    LoadModel(model, modelName)

    --Blip and waypoint setup
    local blipCoords = data.npc.blip.coords
    local blip = Citizen.InvokeNative(0x45F13B7E0A15C880, data.npc.blip.sprite, blipCoords.x, blipCoords.y, blipCoords.z, 100.0) -- BlipAddForRadius
    Citizen.InvokeNative(0x9CB1A1623062F402, blip, _U('Lastlocationblip')) -- SetBlipName
    StartGPS(blipCoords.x, blipCoords.y, blipCoords.z)

    local function Cleanup()
        RemoveBlip(blip)
        ClearGpsMultiRoute()
    end

    -- Check Distance to Npcs
    DistanceCheck(blipCoords, 100, PlayerPedId())

    if StopAll then
        Core.NotifyRightTip(_U('Deadtext'), 4000)
        Cleanup()
        return
    end

    Cleanup()

    -- Spawn Npcs
    local playerPed = PlayerPedId()
    local npcCoords = data.npc.coords
    local enemyNpcs , npcStatus = {}, {}

    local function CreateNpcs()
        for i, coords in ipairs(npcCoords) do
            local ped = CreatePed(model, coords.x, coords.y, coords.z, 0.0, true, false, false, false)
            repeat Wait(0) until DoesEntityExist(ped)

            Citizen.InvokeNative(0x283978A15512B2FE, ped, true) -- SetRandomOutfitVariation
            Citizen.InvokeNative(0x23f74c2fda6e7c61, 953018525, ped) -- BlipAddForEntity

            SetPedRelationshipGroupHash(ped, `bandits`)
            SetRelationshipBetweenGroups(5, `PLAYER`, `bandits`)
            SetRelationshipBetweenGroups(5, `bandits`, `PLAYER`)
            TaskCombatPed(ped, playerPed, 0, 0)

            enemyNpcs[i] = ped
            npcStatus[ped] = true -- Mark the NPC as Alive
        end
        Core.NotifyRightTip(_U('Poachersattack'), 6000)
    end

    -- Check if any NPC is dead
    local function IsAnyNpcDead()
        for ped, isAlive in pairs(npcStatus) do
            if not IsEntityDead(ped) and isAlive then
                return false
            end
        end
        return true
    end

    CreateNpcs()

    -- Countdown loop
    while #enemyNpcs > 0 and not IsAnyNpcDead() do
        Wait(60)
        if StopAll then
            if #enemyNpcs > 0 then
                for _, ped in ipairs(enemyNpcs) do
                    DeletePed(ped)
                end
            end
            Core.NotifyRightTip(_U('Deadtext'), 4000)
            return
        end
        for i = #enemyNpcs, 1, -1 do
            local ped = enemyNpcs[i]
            if IsEntityDead(ped) then
                npcStatus[ped] = false -- Mark the NPC as dead
                table.remove(enemyNpcs, i)
            end
        end
    end

    Core.NotifyRightTip(_U('Poachersdead'), 6000)
    local chestCoords = data.npc.hintBox
    SearchSetup('NpcSearch', chestCoords.x, chestCoords.y, chestCoords.z, data)
end