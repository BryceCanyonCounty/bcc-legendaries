--Pulling Essentials
local VORPutils = {}
TriggerEvent("getUtils", function(utils)
    VORPutils = utils
end)
local VORPcore = {}
TriggerEvent("getCore", function(core)
    VORPcore = core
end)


--npc spawn setup
function npc()
    --variables
    local createdped = {}                     --creates a table inside the varible to store data
    local count = {}                     --creates a table inside the varible to store data
    local model = GetHashKey('a_m_m_huntertravelers_cool_01') --sets the model to the varible ped to make set in the menu part of the code(Animal is a global set in menusetup.lua)

    --Requesting Model Setup
    RequestModel(model) --requests the model
    if not HasModelLoaded(model) then --if it hasnt loaded then
        RequestModel(model) --requests model
    end
    while not HasModelLoaded(model) or HasModelLoaded(model) == 0 or model == 1 do --if it hasnt loaded then
        Citizen.Wait(1) --wait 1ms
    end

    --Blip and waypoint setup
    local blip = Citizen.InvokeNative(0x45F13B7E0A15C880, -1282792512, Npcblipcoords.x, Npcblipcoords.y, Npcblipcoords.z, 100.0) --creates a blip with the yellow circle around it
    Citizen.InvokeNative(0x9CB1A1623062F402, blip, Config.Language.Lastlocationblip) --names blip
    VORPutils.Gps:SetGps(Npcblipcoords.x, Npcblipcoords.y, Npcblipcoords.z) --Creates the gps waypoint

    --Distance Tracker Setup
    while true do --creates a loop that will run until broken
        Citizen.Wait(100) --waits 100ms prevents crashing
        if StopAll then break end --if var true then break loop
        local pl = GetEntityCoords(PlayerPedId()) --gets players coords
        if GetDistanceBetweenCoords(pl.x, pl.y, pl.z, Npcblipcoords.x, Npcblipcoords.y, Npcblipcoords.z, false) < 200 then break end --if dist less than 200 break loop
    end
    if StopAll then --if var true then
        RemoveBlip(blip) --removes blip
        VORPutils.Gps:RemoveGps() --removes gps
        VORPcore.NotifyRightTip(Config.Language.Deadtext, 4000) return --prints on screen and returns ending the function here not allowing code below to run
    end
    VORPutils.Gps:RemoveGps() --removes gps
    RemoveBlip(blip) --removes blip

    --Spawning Ped Setup
    for k, v in pairs(Npccoords) do
        createdped[k] = CreatePed(model, v.x, v.y, v.z, true, true, true, true) -- creates 1 ped per coordinate set in the npccoords table in config
        Citizen.InvokeNative(0x283978A15512B2FE, createdped[k], true)           -- sets the ped a random outfit helps it not bug is needed
        Citizen.InvokeNative(0x23f74c2fda6e7c61, 953018525, createdped[k])      --sets the blip that follows the peds
        TaskCombatPed(createdped[k], PlayerPedId())     --tells the ped to fight us
        count[k] = createdped[k] --sets the tables to match each other used to keep count later on
    end
    VORPcore.NotifyRightTip(Config.Language.Poachersattack, 6000)   --prints in bottom right
    
    --DeadCheckSetup
    local x = #Npccoords --sets x to equal the number of tables in the variable
    while true do --while loop wont stop till broken
        Citizen.Wait(100) --waits 100ms prevents crashing
        if StopAll then break end --if var true then break loop
        for k, v in pairs(createdped) do                            --opens the table we made earlier
            if IsEntityDead(v) then                                 --checks if the entities are dead
                if count[k] ~= nil then                             -- checks if the count is 0 or below
                    x = x - 1                                       --sets x
                    count[k] = nil                                  --sets it to nil
                    if x == 0 then                                  --if x = o then
                        VORPcore.NotifyRightTip(Config.Language.Poachersdead, 6000) --prints on screen
                        searchsetupmain('NpcSearch', Npcchest.x, Npcchest.y, Npcchest.z) break --triggers function and breaks loop
                    end
                end
            end
        end
    end
    if StopAll then --if var true then
        for k, v in pairs(createdped) do --for loop in the creted peds table
            DeletePed(v) --deletes every ped that was spawned
        end
        VORPcore.NotifyRightTip(Config.Language.Deadtext, 4000) return --prints on screen and returns ending the function here
    end
end