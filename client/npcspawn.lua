--Pulls vorp utils and core
local VORPutils = {}
TriggerEvent("getUtils", function(utils)
    VORPutils = utils
end)
local VORPcore = {}
TriggerEvent("getCore", function(core)
    VORPcore = core
end)
--end pulling it

--npc spawn setup
function npc()
    Nnrange = 0
    local starting = false
    local createdped = {} --creates a table inside the varible to store data
    local count = {} --creates a table inside the varible to store data
    local distancetracker = false --acts as a trigger of sorts
    local model = GetHashKey('a_m_m_huntertravelers_cool_01') --sets the model to the varible ped to make set in the menu part of the code(Animal is a global set in menusetup.lua)
    local check = false
    distancetracker = true --sets the trigger to true so it allows the while loop to work
    local blip = Citizen.InvokeNative(0x45F13B7E0A15C880, -1282792512, Npcblipcoords.x, Npcblipcoords.y, Npcblipcoords.z, 100.0)
    Citizen.InvokeNative(0x9CB1A1623062F402, blip, Config.Language.Lastlocationblip)
    --Waypointsetup
    local ul = GetEntityCoords(PlayerPedId()) --gets players location(not needed if alreadysetup)
    StartGpsMultiRoute(6, true, true) --sets the color and tells it to waypoint on foot and in vehicle
    AddPointToGpsMultiRoute(ul.x, ul.y, ul.z) --playerscoords
    AddPointToGpsMultiRoute(Npcblipcoords.x, Npcblipcoords.y, Npcblipcoords.z) --Where the waypoint is set too
    SetGpsMultiRouteRender(true) --sets the waypoint to active
    while true do --creates loop
        Citizen.Wait(10) --waits to prevent crashing
        if StopAll == false then --if the variable from the function offcatch is false(player not dead) then
            RequestModel(model) --dont know but is needed
            if not HasModelLoaded(model) then
                RequestModel(model)
            end
            while not HasModelLoaded(model) or HasModelLoaded(model) == 0 or model == 1 do
                Citizen.Wait(1)
            end --end dont know but is needed
            --end waypoint setup
            while distancetracker == true do --creates a loop
                Citizen.Wait(0) -- sets a small delay preventing a crash
                local pl = GetEntityCoords(PlayerPedId()) --gets player coords
                local dist = GetDistanceBetweenCoords(pl.x, pl.y, pl.z, Npcblipcoords.x, Npcblipcoords.y, Npcblipcoords.z) --gets dist between player and global varible set in menusetup.lua
                if dist < 200 then --if distance is less than 200
                    Nrange = 1 break --sets variable to 1 and breaks loop
                end
            end
            if Nrange == 1 then --if varaible is 1 then
                if check == false then --if the catch varaible is false then do
                    check = true --sets it to true to prevent this running more than once
                    ClearGpsMultiRoute() --stops the gps waypoint system
                    RemoveBlip(blip)
                    Nrange = Nrange + 1 --makes nrange 2 prevents it from running more than once
                    for k, v in pairs(Npccoords) do --opens npccoords table
                        createdped[k] = CreatePed(model, v.x, v.y, v.z, true, true, true, true) -- creates 1 ped per coordinate set in the npccoords table in config
                        Citizen.InvokeNative(0x283978A15512B2FE, createdped[k], true) -- sets the ped a random outfit helps it not bug is needed
                        Citizen.InvokeNative(0x23f74c2fda6e7c61, 953018525, createdped[k]) --sets the blip that follows the peds
                        TaskCombatPed(createdped[k],PlayerPedId()) --tells the ped to fight us
                        count[k] = createdped[k] --sets count[k] to createped[k] allowing us to in the for loop below acces the created ped table while still using the data in the table
                        VORPcore.NotifyBottomRight(Config.Language.Poachersattack,6000) --prints in bottom right
                        Wait(200) --waits 2 seconds
                        starting = true -- sets trigger to true so it activates the below code
                        Citizen.CreateThread(function() -- creates a thread
                            local x = #Npccoords --sets x = to the table coords
                            while starting == true do -- while trigger is true do
                                Citizen.Wait(0) --wait to prevent crashing
                                if StopAll == false then --if stop all varaible is false(player not dead) then
                                    for k, v in pairs(createdped) do --opens the table we made earlier
                                        if IsEntityDead(v) then --checks if the entities are dead
                                            if count[k] ~= nil then -- checks if the count is 0 or below
                                                x = x - 1 --sets x
                                                count[k] = nil --sets it to nil
                                                if x == 0 then --if x = o then
                                                    VORPcore.NotifyBottomRight(Config.Language.Poachersdead,6000)
                                                    npcsearch1() --triggers the function below
                                                    break --no need for loop to continue after this point it just wastes rss
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end)
                    end
                end
            end
        elseif StopAll == true then --if varaible is true(player is dead then)
            for k, v in pairs(createdped) do --opens createdped table
                DeletePed(v) --deletes all peds spawned
            end
            RemoveBlip(blip)
            ClearGpsMultiRoute() --removes waypoint
            VORPcore.NotifyBottomRight(Config.Language.Deadtext, 6000) break --prints you died and failed in bottom right and breaks loop
        end
    end
end
--Registering the chest search requirment for the function above
function npcsearch1()
    local object = CreateObject('p_chest01x', Npcchest.x, Npcchest.y, Npcchest.z - 1, true, false, false) --creates an object
    RequestModel(object, true) --requests the object model
    local PromptGroup = VORPutils.Prompts:SetupPromptGroup() --registers a prompt group
    local firstprompt = PromptGroup:RegisterPrompt(Config.Language.ChestPrompt, 0x760A9C6F, 1, 1, true, 'hold', {timedeventhash = "MEDIUM_TIMED_EVENT"}) --creates a prompt in the prompt group
    local blip = Citizen.InvokeNative(0x45F13B7E0A15C880, -1282792512, Npcchest.x, Npcchest.y, Npcchest.z, 100.0)
    Citizen.InvokeNative(0x9CB1A1623062F402, blip, Config.Language.Lastlocationblip)
    --Waypointsetup
    local ul = GetEntityCoords(PlayerPedId()) --gets players location(not needed if alreadysetup)
    StartGpsMultiRoute(6, true, true) --sets the color and tells it to waypoint on foot and in vehicle
    AddPointToGpsMultiRoute(ul.x, ul.y, ul.z) --playerscoords
    AddPointToGpsMultiRoute(Npcchest.x, Npcchest.y, Npcchest.z) --Where the waypoint is set too
    SetGpsMultiRouteRender(true) --sets the waypoint to active
    --end waypoint setup
    while true do --starts loop
        Citizen.Wait(0) --Wait a slight amount prevents crashing
        if StopAll == false then --if varaible is false(player not dead) then
            local l = GetEntityCoords(PlayerPedId()) --sets the varible l to the players position
            local dist = GetDistanceBetweenCoords(l.x, l.y, l.z, Npcchest.x, Npcchest.y, Npcchest.z) --get distance between player and config location
            if dist < 3 then --if dist less than 5 do
                Searchinrange2 = 1 --sets global varible to 1 (acts as a trigger)
            elseif dist > 3 then --makes it so if you go in range but dont open it the prompt doesnt stay there the whole time 
                Searchinrange2 = 2 --sets it too 2
            end
            if Searchinrange2 == 1 then --if the trigger is 1 then
                PromptGroup:ShowGroup(Config.Language.ChestPrompt) --Names the prompt search chest
                if firstprompt:HasCompleted() then --if the prmpt has been done then
                    firstprompt:DeletePrompt() --deletes prompt
                    RemoveBlip(blip)
                    ClearGpsMultiRoute() --stops the gps waypoint system
                    Citizen.CreateThread(function() --Starts the play animation setup(This entire thread is needed)
                        RequestAnimDict('mech_ransack@chest@med@open@crouch@b') --Checks to see if its loaded
                        while not HasAnimDictLoaded('mech_ransack@chest@med@open@crouch@b') do --makes sure its loaded
                            Citizen.Wait(0)
                        end
                        TaskPlayAnim(PlayerPedId(), 'mech_ransack@chest@med@open@crouch@b', 'base', 8.0, 8.0, 1000, 17, 0.2, false, false, false) --plays the animation
                    end) --end of animation setup
                    VORPcore.NotifyBottomRight(Config.Language.Cluefound,6000)
                    spawnanimal() --triggers the spawn animal function and breaks the loop
                    break
                end
            end
        elseif StopAll == true then --if varaible = true(player is dead) then
            if Searchinrange2 == 1 then --if you are in range then it deletes the blip
                RemoveBlip(blip)
                ClearGpsMultiRoute() --clears gps
            end
            firstprompt:DeletePrompt() --deletes prompt group
            VORPcore.NotifyBottomRight(Config.Language.Deadtext, 6000) break --prints you died and failed in bottom right and breaks loop
        end
    end
end
--end npc spawn setup