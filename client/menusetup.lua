--Pulls vorp core
local VORPcore = {}
TriggerEvent("getCore", function(core)
    VORPcore = core
end)
--end pulling it

StopAll = false --This is the variable used for the dead check
--Menu Setup
Citizen.CreateThread(function()
    WarMenu.CreateMenu('hd_legendaries:leg', _U("Menuname")) --creates the main menu
    repeat --repeates until it ends/breaks
        if WarMenu.IsMenuOpened('hd_legendaries:leg') then --if the menu is opened then
            for k, v in pairs(Config.locations) do --opens the tables
                if WarMenu.Button(v.huntname .. ' Price to Hunt ' .. tostring(v.hintcost) .. '$ ') then --creates the spawnbutton
                    Cost = v.hintcost
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
                        VORPcore.NotifyBottomRight(_U("Initialblipmark"),6000) --text in bottom right
                        offcatcher() --triggers offcatcher
                        searchsetup1() --triggers the search setup
                        WarMenu.CloseMenu() --closes the menu
                    end) break
                end
            end
        end
    WarMenu.Display()
    Citizen.Wait(0)
    until false
end)

RegisterNetEvent('hd_legendaries:failmenuopen')
AddEventHandler('hd_legendaries:failmenuopen', function()
    VORPcore.NotifyBottomRight(_U("Cooldownactive"), 4000)
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(10)
        local l = Config.shop
        if GetDistanceBetweenCoords(l.shoplocation.x, l.shoplocation.y, l.shoplocation.z, GetEntityCoords(PlayerPedId()), false) < 2 then
            if IsControlJustReleased(0, 0x760A9C6F) then
                WarMenu.OpenMenu('hd_legendaries:leg')
            end
        end
    end
end)
--End menu setup

--this creates a function that runs until the entire script is done
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