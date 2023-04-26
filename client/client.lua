--Animal spawn setup
function spawnanimal()
    --Variables Setup
    local secondaryanimals = {}      --creates a table for the secondary animals that will be spawned (this way if the config is set to spawn more than one, the delete ped native can delete all of them not just one of them)
    local model = GetHashKey(Animal) --sets the model to the varible ped to make set in the menu part of the code(Animal is a global set in menusetup.lua)
    local coords = Animalcoords      -- pulls the global set in menusetup.lua

    modelload(model)
    
    --Blip and Waypoint Setup
    local blip = Citizen.InvokeNative(0x45F13B7E0A15C880, -1282792512, coords.x, coords.y, coords.z, 130.0) --creates a blip with the yellow circle around it
    Citizen.InvokeNative(0x9CB1A1623062F402, blip, Config.Language.Lastlocationblip) --names blip
    VORPutils.Gps:SetGps(coords.x, coords.y, coords.z) --Creates the gps waypoint

    --Dist Tracker Setup
    distcheck(coords.x, coords.y, coords.z, 40, PlayerPedId())
    if StopAll then -- if true then
        RemoveBlip(blip) --removes blip
        VORPutils.Gps:RemoveGps() --Removes the gps waypoint
        VORPcore.NotifyRightTip(Config.Language.Deadtext, 4000) return --prints on screen and returns ending the function here not allowing more code to run
    end
    RemoveBlip(blip) --deletes blip
    VORPutils.Gps:RemoveGps() --removes gps

    --Animal Spawning Setup
    if Secondarynpcboolean then
        for o, e in pairs(Secondarynpcspawn) do
            secondaryanimals[o] = CreatePed(Secondarynpcmodel, e.x, e.y, e.z, true, true, true, true) --spawns the animals and will store them in the seconday animals table for later deletion if you die
            Citizen.InvokeNative(0x283978A15512B2FE, secondaryanimals[o], true)                       --This sets the ped into a random outift(fixes an invisiblity bug)
            Citizen.InvokeNative(0x23f74c2fda6e7c61, 953018525, secondaryanimals[o])                  --sets the blip that tracks the ped
        end
    end
    Createdped2 = CreatePed(model, coords.x, coords.y, coords.z, true, true, true, true) --creates the ped
    Citizen.InvokeNative(0x283978A15512B2FE, Createdped2, true)      --This sets the ped into a random outift(fixes an invisiblity bug)
    Citizen.InvokeNative(0x23f74c2fda6e7c61, 953018525, Createdped2)      --sets the blip that tracks the ped
    VORPcore.NotifyRightTip(Config.Language.LegAnimalSpawned, 4000) --prints on screen
    SetEntityHealth(Createdped2, Health, 0) --changes the entity health to the set variable from config
    --Deadchecking
    while true do --while loop wont stop until broken
        Citizen.Wait(100) --waits 100ms preventing crashing
        if StopAll then break end --if var true then break loop
        if IsEntityDead(Createdped2) == 1 then --if entity is dead then
            skinnedped() break --trigger function and break loop
        end
    end
    if StopAll then --if var true then
        if Secondarynpcboolean then --if var true then
            for e, u in pairs(secondaryanimals) do --for loop in the secondaryanimals table
                DeletePed(u) --deletes ped (this for loop deletes all peds that were created)
            end
        end
        DeletePed(Createdped2) --deletes the main ped(legendary animal)
        VORPcore.NotifyRightTip(Config.Language.Deadtext, 4000) return --prints on screen and returns ending the function here
    end
end