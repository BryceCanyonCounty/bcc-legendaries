--Do not touch anything in here if you do not know what you are doing. At the very least make a back up before you do.


local VORPutils = {}

TriggerEvent("getUtils", function(utils)
    VORPutils = utils
end)
--Pulls vorp core

local VORPcore = {}

TriggerEvent("getCore", function(core)
    VORPcore = core
end)

--end pulling it

function searchsetup1()
    local c = Investigate --sets it to a shorter varible
    local object = CreateObject('p_chest01x', c.x, c.y, c.z - 1, true, false, false) --creates an object
    RequestModel(object, true) --requests the object model
    local PromptGroup = VORPutils.Prompts:SetupPromptGroup() --registers a prompt group
    local firstprompt = PromptGroup:RegisterPrompt('Search the Chest for clues', 0x760A9C6F, 1, 1, true, 'hold', {timedeventhash = "MEDIUM_TIMED_EVENT"}) --creates a prompt in the prompt group
    local blip = VORPutils.Blips:SetBlip('Clue', 'blip_mp_collector_map', 0.8, c.x, c.y, c.z) --sets blip
    --Waypointsetup
    local ul = GetEntityCoords(PlayerPedId()) --gets players location(not needed if alreadysetup)
    StartGpsMultiRoute(6, true, true) --sets the color and tells it to waypoint on foot and in vehicle
    AddPointToGpsMultiRoute(ul.x, ul.y, ul.z) --playerscoords
    AddPointToGpsMultiRoute(c.x, c.y, c.z) --Where the waypoint is set too
    SetGpsMultiRouteRender(true) --sets the waypoint to active
    --end waypoint setup
    while true do --starts loop
        Citizen.Wait(0) --Wait a slight amount prevents crashing
        if StopAll == false then --if stopall is false (set in the menusetup lua offcatcher funtion then)
            local l = GetEntityCoords(PlayerPedId()) --sets the varible l to the players position
            local dist = GetDistanceBetweenCoords(l.x, l.y, l.z, c.x, c.y, c.z) --get distance between player and config location
            if dist < 5 then --if dist less than 5 do
                Searchinrange = 1 --sets global varible to 1 (acts as a trigger)
            elseif dist > 5 then --makes it so if you go in range but dont open it the prompt doesnt stay there the whole time 
                Searchinrange = 2 --sets the trigger to 2
            end
            if Searchinrange == 1 then --if the trigger is 1 then
                PromptGroup:ShowGroup("Search Chest") --Names the prompt search chest
                if firstprompt:HasCompleted() then --if the prmpt has been done then
                    firstprompt:DeletePrompt() --deletes prompt
                    blip:Remove()
                    ClearGpsMultiRoute() --stops the gps waypoint system
                    Citizen.CreateThread(function() --Starts the play animation setup(This entire thread is needed)
                        RequestAnimDict('mech_ransack@chest@med@open@crouch@b') --Checks to see if its loaded
                        while not HasAnimDictLoaded('mech_ransack@chest@med@open@crouch@b') do --makes sure its loaded
                            Citizen.Wait(0)
                        end
                        TaskPlayAnim(PlayerPedId(), 'mech_ransack@chest@med@open@crouch@b', 'base', 8.0, 8.0, 1000, 17, 0.2, false, false, false) --plays the animation
                    end) --end of animation setup
                    VORPcore.NotifyBottomRight("You found a clue pointing to the " .. Thuntname)
                    if Npcspawnyn == true then
                        npc() break
                    elseif Npcspawnyn == false then
                        spawnanimal() break
                    end
                end
            end
        elseif StopAll == true then --if it is false or if player is dead then stop everything above and do this
            VORPutils.Blips:RemoveBlip(blip) --removes the blip
            firstprompt:DeletePrompt() --removes the prompt
            ClearGpsMultiRoute() --removes waypoint/gps
            VORPcore.NotifyBottomRight('You died. Hunt failed', 6000) break --prints in bottom right and breaks loop
        end
    end
end
