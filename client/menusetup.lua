------------------------------- Pulling Essentials -----------------------------------
local VORPcore = {}
TriggerEvent("getCore", function(core)
    VORPcore = core
end)

------------------- Variables ------------------------------------
StopAll = false --This is the variable used for the dead check
local level = 0 --Creates a variable to store the players level client side(sets to 0 when you join server)
local subtractamoount = 0 --Creates a variable used to store the amount to subtract off cost based on your level if config.level is true

----------------------------------------- Menu Setup -----------------------------------------
Citizen.CreateThread(function()
    WarMenu.CreateMenu('hd_legendaries:leg', Config.Language.Menuname) --creates the main menu
    repeat --repeates until it ends/breaks
        if WarMenu.IsMenuOpened('hd_legendaries:leg') then --if the menu is opened then
            for k, v in pairs(Config.locations) do --opens the tables
                Cost = v.hintcost
                ------------------------- Setup of level system true menu -------------------------
                if Config.LevelSystem == true then --if level system is true then
                    Cost = Cost - subtractamoount --Sets cost to = cost - subtractamoount
                    if WarMenu.Button(v.huntname .. ' Price to Hunt ' .. tostring(Cost) .. '$ ', '', Config.Language.Leveldisp .. ' ' .. tostring(level)) then --creates the spawnbutton(displays cost not v.hintcost to include the leveling system)
                        TriggerServerEvent('hd_legendaries:menuopen5', Cost) --triggers the server cooldown event
                        RegisterNetEvent('hd_legendaries:menuopen4') --creates a client event
                        AddEventHandler('hd_legendaries:menuopen4', function() --adds a function to the client event
                            Animal = v.pedmodel --sets varible to the config option to be used in the other .lua files
                            Animalcoords = v.coordinates
                            Npccoords = v.Npccoords
                            Npcblipcoords = v.npcblipcoord
                            Npcchest = v.npcschest
                            Investigate = v.investigationspot
                            Thuntname = v.huntname
                            Npcspawnyn = v.enemynpc
                            Rewards = v.GivenItems
                            Health = v.Leganimalhealth
                            Secondarynpcspawn = v.SecondaryAnimals.Animalspawns
                            Secondarynpcboolean = v.SecondaryAnimals.secondaryanimals
                            Secondarynpcmodel = v.SecondaryAnimals.animalmodel
                            VORPcore.NotifyBottomRight(Config.Language.Initialblipmark,6000) --text in bottom right
                            offcatcher() --triggers offcatcher
                            searchsetup1() --triggers the search setup
                            WarMenu.CloseMenu() --closes the menu
                        end) break
                    end
                elseif Config.LevelSystem == false then
                    if WarMenu.Button(v.huntname .. ' Price to Hunt ' .. tostring(Cost) .. '$ ') then --creates the spawnbutton(displays cost not v.hintcost to include the leveling system)
                        TriggerServerEvent('hd_legendaries:menuopen5', Cost) --triggers the server cooldown event
                        RegisterNetEvent('hd_legendaries:menuopen4') --creates a client event
                        AddEventHandler('hd_legendaries:menuopen4', function() --adds a function to the client event
                            Animal = v.pedmodel --sets varible to the config option to be used in the other .lua files
                            Animalcoords = v.coordinates
                            Npccoords = v.Npccoords
                            Npcblipcoords = v.npcblipcoord
                            Npcchest = v.npcschest
                            Investigate = v.investigationspot
                            Thuntname = v.huntname
                            Npcspawnyn = v.enemynpc
                            Rewards = v.GivenItems
                            Health = v.Leganimalhealth
                            Secondarynpcspawn = v.SecondaryAnimals.Animalspawns
                            Secondarynpcboolean = v.SecondaryAnimals.secondaryanimals
                            Secondarynpcmodel = v.SecondaryAnimals.animalmodel
                            VORPcore.NotifyBottomRight(Config.Language.Initialblipmark,6000) --text in bottom right
                            offcatcher() --triggers offcatcher
                            searchsetup1() --triggers the search setup
                            WarMenu.CloseMenu() --closes the menu
                        end) break
                    end
                end
            end
        end
    WarMenu.Display()
    Citizen.Wait(0)
    until false
end)

-------- Event to tell you cooldown is active ------------------------
RegisterNetEvent('hd_legendaries:failmenuopen')
AddEventHandler('hd_legendaries:failmenuopen', function()
    VORPcore.NotifyBottomRight(Config.Language.Cooldownactive, 4000)
end)

---------------- Creates a thread(runs on start) to check if your near the coords an hit the g button -----------------------
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(10)
        local l = Config.shop
        if GetDistanceBetweenCoords(l.shoplocation.x, l.shoplocation.y, l.shoplocation.z, GetEntityCoords(PlayerPedId()), false) < 2 then
            if IsControlJustReleased(0, 0x760A9C6F) then
                if Config.LevelSystem == true then
                    TriggerServerEvent('hd_legendaries:DBCheck') --triggers server event that makes sure you exist in the db
                    Wait(100) --waits 150 ms gives server time to check
                    TriggerServerEvent('hd_legendaries:GetTrustLevel') --triggers server event to get your level
                    Wait(100) --Waits 100ms gives server time to run
                    levelcalc() --triggers level check function
                end
                WarMenu.OpenMenu('hd_legendaries:leg') --opens menu regardless of config
            end
        end
    end
end)

------------------------ Level Catch Setup ---------------------------------
RegisterNetEvent('hd_legendaries:ClientLevelCatch')
AddEventHandler('hd_legendaries:ClientLevelCatch', function(trust) --Catches the trust variable from the server
    level = trust --sets the variable to = trust
end)

------------------------------------ Dead check Setup -------------------------------
function offcatcher()
    Citizen.CreateThread(function()
        while true do --creates a loop
            Citizen.Wait(1000) --prevents crashse
            local op = IsPedDeadOrDying(PlayerPedId()) --deteces if the player is alive or dead if alive it prints false if ded it prints 1
            if op == 1 then --if player is dead then it sets stop all to true 
                StopAll = true --global variable set to true
                break
            end
        end
    end)
end

-------------------------------- Detecting Level -----------------------------
function levelcalc()
    for key, value in pairs(Config.Levels) do --creates a for loop in config.levels
        if level >= value.level and level < value.nextlevel then --if level is greater than level, and less than the next then
            subtractamoount = value.costreduction  break --sets the variable and breaks the loop
        elseif level < value.level then --elseif you are not equal too or greater than the very first level then
            break --prints in client and breaks loop preventing the subtractamoount from being set(this keeps anyone below the first level from getting a reduction in cost)
        end
    end
end