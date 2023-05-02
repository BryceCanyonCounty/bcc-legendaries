------------------- Variables ------------------------------------
StopAll = false -- This is the variable used for the dead check
local level = 0 -- Creates a variable to store the players level client side(sets to 0 when you join server)
local subtractamoount = 0 -- Creates a variable used to store the amount to subtract off cost based on your level if config.level is true
local elem = {}
Inmission = false
----------------------------------------- Menu Setup -----------------------------------------
TriggerEvent("menuapi:getData", function(call)
    MenuData = call
end)

-- This closes the menu when you stop or restart the resources.
AddEventHandler("onResourceStop", function(resourceName)
    if resourceName ~= GetCurrentResourceName() then
        return
    end
    MenuData.CloseAll()
end)

-- this is used to close the menu while you are on the main menu and hit backspace button
AddEventHandler('bcc-legendaries:MenuClose', function()
    while true do -- loops will run permantely
        Citizen.Wait(10) -- waits 10ms prevents crashing
        if IsControlJustReleased(0, 0x156F7119) then -- if backspace is pressed then
            MenuData.CloseAll() -- closes all menus
        end
    end
end)

local huntlocation
AddEventHandler('bcc:legendaries:openmenu', function(location)
    huntlocation = location
    local elements = {} -- sets the var to a table
    local elementindex = 1 -- sets the var too 1
    Citizen.Wait(100) -- waits 100ms
    TriggerEvent('bcc-legendaries:MenuClose') -- triggers the event
    MenuData.CloseAll() -- closes all menus
    for k, items in pairs(Config.locations) do -- opens a for loop
        if items.location == huntlocation then
            if Config.LevelSystem then
                if items.level <= level then
                    Cost = items.hintcost - subtractamoount
                    elements[elementindex] = { -- sets the elemnents to this table
                        label = items.huntname .. ' ' .. Cost .. '$', -- sets the label
                        value = 'buyhint' .. tostring(elementindex), -- sets the value
                        desc = '', -- empty desc
                        info = items -- sets info to the table(this will allow you too open the table in the menu setup below)
                    }
                    elementindex = elementindex + 1 -- adds 1 to the var
                end
                elem = elements
            else
                Cost = items.hintcost
                elements[elementindex] = { -- sets the elemnents to this table
                    label = items.huntname .. ' ' .. Cost .. '$', -- sets the label
                    value = 'buyhint' .. tostring(elementindex), -- sets the value
                    desc = '', -- empty desc
                    info = items -- sets info to the table(this will allow you too open the table in the menu setup below)
                }
                elementindex = elementindex + 1 -- adds 1 to the var
            end
        end
    end
    local next = next
    if next(elem) == nil then
        VORPcore.NotifyBottomRight(Config.Language.Nolevel, 6000) -- text in bottom right
    else
        MenuData.Open('default', GetCurrentResourceName(), 'menuapi', {
            title = Config.Language.Menuname,
            align = 'top-left',
            elements = elements,
            lastmenu = "MainMenu"
        }, function(data)
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
                if not Inmission then
                    TriggerServerEvent('bcc:legendaries:menuopen5', Cost, data.current.info.huntname, data.current.info.CooldownTime) -- triggers the server cooldown event
                    Data = data.current.info
                else
                    VORPcore.NotifyBottomRight(Config.Language.AlreadyInMission, 4000)
                end
            end
        end)
    end
end)

---------- Event That Starts the hunt
RegisterNetEvent('bcc:legendaries:menuopen4', function()
    Inmission = true
    VORPcore.NotifyBottomRight(Config.Language.Initialblipmark, 2000) -- text in bottom right
    offcatcher() -- triggers offcatcher
    searchsetupmain('InitSearch', Data.investigationspot.x, Data.investigationspot.y, Data.investigationspot.z)
end)

---------------- Creates a thread(runs on start) to check if your near the coords an hit the g button -----------------------
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(10)
        for k, v in pairs(Config.shop) do
            if GetDistanceBetweenCoords(v.Pos.x, v.Pos.y, v.Pos.z, GetEntityCoords(PlayerPedId()), false) < 2 then
                if IsControlJustReleased(0, 0x760A9C6F) then
                    if Config.LevelSystem then
                        TriggerServerEvent('bcc:legendaries:DBCheck', v.name) -- triggers server event that makes sure you exist in the db
                        Wait(200)
                    else
                        TriggerEvent('bcc:legendaries:openmenu', v.name)
                    end
                end
            end
        end
    end
end)

------------------------------------ Dead check Setup -------------------------------
function offcatcher()
    Citizen.CreateThread(function()
        while true do -- creates a loop
            Citizen.Wait(1000) -- prevents crashse
            if IsPedDeadOrDying(PlayerPedId()) then -- if player is dead then it sets stop all to true
                StopAll = true -- global variable set to true
                break
            end
        end
    end)
end

-------------------------------- Detecting Level -----------------------------
RegisterNetEvent('bcc-legendaries:ClientLevelCatch', function(trust, name)
    level = trust
    Wait(100)
    for key, v in pairs(Config.Levels) do
        if level >= v.level and level < v.nextlevel then
            subtractamoount = v.costreduction break
        elseif level < v.level then break end
    end
    TriggerEvent('bcc:legendaries:openmenu', name)
end)