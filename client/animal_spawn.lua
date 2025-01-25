function SpawnAnimal(data)
    local secondaryAnimals = {}
    local modelName = data.legendary.model
    local model = joaat(modelName)
    local coords = data.legendary.coords

    LoadModel(model, modelName)

    -- Blip and Waypoint Setup
    local legendaryBlip = Citizen.InvokeNative(0x45F13B7E0A15C880, -1282792512, coords.x, coords.y, coords.z, 130.0) -- BlipAddForRadius
    Citizen.InvokeNative(0x9CB1A1623062F402, legendaryBlip, _U('Lastlocationblip')) -- SetBlipName
    StartGPS(coords.x, coords.y, coords.z)

    local function Cleanup()
        RemoveBlip(legendaryBlip)
        ClearGpsMultiRoute()
    end

    -- Check Distance to Animal
    DistanceCheck(coords, 40, PlayerPedId())

    if StopAll then
        Core.NotifyRightTip(_U('Deadtext'), 4000)
        Cleanup()
        return
    end

    Cleanup()

    local function IsLegendaryDeadly(pedId)
        local entityModel = GetEntityModel(pedId)
        local Predators = Config.predators
        for _, predatorModel in ipairs(Predators) do
            if entityModel == predatorModel then
                return true
            end
        end
        return false
    end

    -- Spawn Legendary Animal
    local function SpawnLegendaryAnimal()
        local ped = CreatePed(model, coords.x, coords.y, coords.z, 0.0, true, false, false, false)
        repeat Wait(0) until DoesEntityExist(ped)

        Citizen.InvokeNative(0x283978A15512B2FE, ped, true) -- SetRandomOutfitVariation
        Citizen.InvokeNative(0x23f74c2fda6e7c61, 953018525, ped) -- BlipAddForEntity
        Citizen.InvokeNative(0x77FF8D35EEC6BBC4, ped, data.legendary.outfit) -- EquipMetaPedOutfitPreset

        if IsLegendaryDeadly(ped) then
            Citizen.InvokeNative(0x9F7794730795E019, ped, 5, true) -- SetPedCombatAttributes / CA_ALWAYS_FIGHT
            Citizen.InvokeNative(0x9F7794730795E019, ped, 58, true) -- SetPedCombatAttributes / CA_DISABLE_FLEE_FROM_COMBAT
        end

        SetEntityHealth(ped, data.legendary.health, 0)
        Core.NotifyRightTip(_U('LegAnimalSpawned'), 4000)

        return ped
    end

    -- Spawn Secondary Animals
    local function SpawnSecondaryAnimals()
        local secondaryCoords = data.secondaryAnimals.coords
        local secondaryModel = joaat(data.secondaryAnimals.model)

        for i, coord in ipairs(secondaryCoords) do
            local ped = CreatePed(secondaryModel, coord.x, coord.y, coord.z, 0.0, true, false, false, false)
            repeat Wait(0) until DoesEntityExist(ped)

            Citizen.InvokeNative(0x283978A15512B2FE, ped, true) -- SetRandomOutfitVariation
            Citizen.InvokeNative(0x23f74c2fda6e7c61, 953018525, ped) -- BlipAddForEntity

            secondaryAnimals[i] = ped
        end
    end

    local legendaryPed = SpawnLegendaryAnimal()
    if data.secondaryAnimals.enabled then
        SpawnSecondaryAnimals()
    end

    while true do
        Wait(100)
        if StopAll then
            if #secondaryAnimals > 0 then
                for _, ped in ipairs(secondaryAnimals) do
                    DeletePed(ped)
                end
            end
            DeletePed(legendaryPed)
            Core.NotifyRightTip(_U('Deadtext'), 4000)
            return
        end
        if IsEntityDead(legendaryPed) then
            InMission = false
            SkinnedPed(legendaryPed, data)
            break
        end
    end
end
