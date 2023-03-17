--Pulls utils and core
local VORPutils = {}
TriggerEvent("getUtils", function(utils)
    VORPutils = utils
end)
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
    local firstprompt = PromptGroup:RegisterPrompt(Config.Language.ChestPrompt, 0x760A9C6F, 1, 1, true, 'hold', {timedeventhash = "MEDIUM_TIMED_EVENT"}) --creates a prompt in the prompt group
    local blip = Citizen.InvokeNative(0x45F13B7E0A15C880, -1282792512, c.x, c.y, c.z, 100.0)
    Citizen.InvokeNative(0x9CB1A1623062F402, blip, Config.Language.Lastlocationblip)
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
            if dist < 3 then --if dist less than 5 do
                Searchinrange = 1 --sets global varible to 1 (acts as a trigger)
            elseif dist > 3 then --makes it so if you go in range but dont open it the prompt doesnt stay there the whole time 
                Searchinrange = 2 --sets the trigger to 2
            end
            if Searchinrange == 1 then --if the trigger is 1 then
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
                    VORPcore.NotifyBottomRight(Config.Language.Cluefound, 4000)
                    if Npcspawnyn == true then
                        npc() break
                    elseif Npcspawnyn == false then
                        spawnanimal() break
                    end
                end
            end
        elseif StopAll == true then --if it is false or if player is dead then stop everything above and do this
            RemoveBlip(blip)
            firstprompt:DeletePrompt() --removes the prompt
            ClearGpsMultiRoute() --removes waypoint/gps
            VORPcore.NotifyBottomRight(Config.Language.Deadtext, 6000) break --prints you died and failed in bottom right and breaks loop
        end
    end
end