------------------------------- Pulling Essentials -----------------------------------
local VORPcore = {}
TriggerEvent("getCore", function(core)
    VORPcore = core
end)

------------------- Variables ------------------------------------
StopAll = false           --This is the variable used for the dead check
local level = 0           --Creates a variable to store the players level client side(sets to 0 when you join server)
local subtractamoount = 0 --Creates a variable used to store the amount to subtract off cost based on your level if config.level is true
----------------------------------------- Menu Setup -----------------------------------------
TriggerEvent("menuapi:getData", function(call)
    MenuData = call
end)

--This closes the menu when you stop or restart the resources.
AddEventHandler("onResourceStop", function(resourceName)
    if resourceName ~= GetCurrentResourceName() then
        return
    end
    MenuData.CloseAll()
end)

--this is used to close the menu while you are on the main menu and hit backspace button
RegisterNetEvent('bcc-legendaries:MenuClose')
AddEventHandler('bcc-legendaries:MenuClose', function()
    while true do --loops will run permantely
        Citizen.Wait(10) --waits 10ms prevents crashing
        if IsControlJustReleased(0, 0x156F7119) then --if backspace is pressed then
            MenuData.CloseAll() --closes all menus
        end
    end
end)

local huntlocation
RegisterNetEvent('bcc:legendaries:openmenu')
AddEventHandler('bcc:legendaries:openmenu', function(location)
    huntlocation = location
    local elements = {} --sets the var to a table
    local elementindex = 1 --sets the var too 1
    Citizen.Wait(100) --waits 100ms
    TriggerEvent('bcc-legendaries:MenuClose') --triggers the event
    MenuData.CloseAll() --closes all menus
    for k, items in pairs(Config.locations) do --opens a for loop
        if items.location == huntlocation then
            if Config.LevelSystem then
                if items.level <= level then
                    Cost = items.hintcost - subtractamoount
                    elements[elementindex] = { --sets the elemnents to this table
                    label = items.huntname .. ' ' .. Cost .. '$', --sets the label
                    value = 'buyhint' .. tostring(elementindex), --sets the value
                    desc = '', --empty desc
                    info = items --sets info to the table(this will allow you too open the table in the menu setup below)
                    }
                    elementindex = elementindex + 1 --adds 1 to the var
                end
            else
                Cost = items.hintcost
                elements[elementindex] = { --sets the elemnents to this table
                    label = items.huntname .. ' ' .. Cost .. '$', --sets the label
                    value = 'buyhint' .. tostring(elementindex), --sets the value
                    desc = '', --empty desc
                    info = items --sets info to the table(this will allow you too open the table in the menu setup below)
                }
                elementindex = elementindex + 1 --adds 1 to the var
            end
        end
    end
    MenuData.Open('default', GetCurrentResourceName(), 'menuapi', {
        title = Config.Language.Menuname,
        align = 'top-left',
        elements = elements,
        lastmenu = "MainMenu"
    },
        function(data)
            if (data.current == "backup") then
                _G[data.trigger]()
            else
                if Config.LevelSystem == true then
                    if data.current.info.level <= level then
                        Cost = data.current.info.hintcost - subtractamoount
                    end
                else
                    Cost = data.current.info.hintcost
                end
                TriggerServerEvent('bcc:legendaries:menuopen5', Cost)                                                                                  --triggers the server cooldown event
                RegisterNetEvent('bcc:legendaries:menuopen4')                                                                                          --creates a client event
                AddEventHandler('bcc:legendaries:menuopen4', function()                                                                                                                         --adds a function to the client event
                    Animal = data.current.info.pedmodel                                                                                                                  --sets varible to the config option to be used in the other .lua files
                    Animalcoords = data.current.info.coordinates
                    Npccoords = data.current.info.Npccoords
                    Npcblipcoords = data.current.info.npcblipcoord
                    Npcchest = data.current.info.npcschest
                    Investigate = data.current.info.investigationspot
                    Thuntname = data.current.info.huntname
                    Npcspawnyn = data.current.info.enemynpc
                    Rewards = data.current.info.GivenItems
                    Health = data.current.info.Leganimalhealth
                    Secondarynpcspawn = data.current.info.SecondaryAnimals.Animalspawns
                    Secondarynpcboolean = data.current.info.SecondaryAnimals.secondaryanimals
                    Secondarynpcmodel = data.current.info.SecondaryAnimals.animalmodel
                    VORPcore.NotifyBottomRight(Config.Language.Initialblipmark, 2000) --text in bottom right
                    offcatcher()                                                      --triggers offcatcher
                    searchsetup1()                                                    --triggers the search setup
                end)
            end
        end)
end)

-------- Event to tell you cooldown is active ------------------------
RegisterNetEvent('bcc:legendaries:failmenuopen')
AddEventHandler('bcc:legendaries:failmenuopen', function()
    VORPcore.NotifyBottomRight(Config.Language.Cooldownactive, 6000) --text in bottom right
end)

---------------- Creates a thread(runs on start) to check if your near the coords an hit the g button -----------------------
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(10)
        for k, v in pairs(Config.shop) do
            if GetDistanceBetweenCoords(v.Pos.x, v.Pos.y, v.Pos.z, GetEntityCoords(PlayerPedId()), false) < 2 then
                if IsControlJustReleased(0, 0x760A9C6F) then
                    if Config.LevelSystem == true then
                        TriggerServerEvent('bcc:legendaries:DBCheck')       --triggers server event that makes sure you exist in the db
                        Wait(500)                                           --waits 150 ms gives server time to check
                        TriggerServerEvent('bcc:legendaries:GetTrustLevel') --triggers server event to get your level
                        Wait(300)                                           --Waits 100ms gives server time to run
                        levelcalc()                                         --triggers level check function
                    end
                    TriggerEvent('bcc:legendaries:openmenu', v.name)        --Trigger Menu Event with location name
                end
            end
        end
    end
end)

------------------------ Level Catch Setup ---------------------------------
RegisterNetEvent('bcc:legendaries:ClientLevelCatch')
AddEventHandler('bcc:legendaries:ClientLevelCatch',
    function(trust, sentname) --Catches the trust variable from the server
        level = trust
    end)

------------------------------------ Dead check Setup -------------------------------
function offcatcher()
    Citizen.CreateThread(function()
        while true do                                  --creates a loop
            Citizen.Wait(1000)                         --prevents crashse
            local op = IsPedDeadOrDying(PlayerPedId()) --deteces if the player is alive or dead if alive it prints false if ded it prints 1
            if op == 1 then                            --if player is dead then it sets stop all to true
                StopAll = true                         --global variable set to true
                break
            end
        end
    end)
end

-------------------------------- Detecting Level -----------------------------
function levelcalc()
    for key, value in pairs(Config.Levels) do                    --creates a for loop in config.levels
        if level >= value.level and level < value.nextlevel then --if level is greater than level, and less than the next then
            subtractamoount = value.costreduction
            break                                                --sets the variable and breaks the loop
        elseif level < value.level then                          --elseif you are not equal too or greater than the very first level then
            break                                                --prints in client and breaks loop preventing the subtractamoount from being set(this keeps anyone below the first level from getting a reduction in cost)
        end
    end
end
