StopAll, Inmission = false, false
local level, subtractamoount, elem, inmenu = 0, 0, {}, false

----------------------------------------- Menu Setup -----------------------------------------
TriggerEvent("menuapi:getData", function(call)
    MenuData = call
end)

----- Bspace to exit menu -----
AddEventHandler('bcc-legendaries:MenuClose', function()
    while inmenu do
        Wait(5)
        if IsControlJustReleased(0, 0x156F7119) then
            MenuData.CloseAll()
        end
    end
end)

local huntlocation
AddEventHandler('bcc:legendaries:openmenu', function(location)
    huntlocation = location
    local elements, elementindex = {}, 1
    inmenu = true
    TriggerEvent('bcc-legendaries:MenuClose')
    MenuData.CloseAll()
    for k, items in pairs(Config.locations) do
        if items.location == huntlocation then
            if Config.LevelSystem then
                if items.level <= level then
                    Cost = items.hintcost - subtractamoount
                    elements[elementindex] = {
                        label = items.huntname .. ' ' .. Cost .. '$',
                        value = 'buyhint' .. tostring(elementindex),
                        desc = '',
                        info = items
                    }
                    elementindex = elementindex + 1
                end
                elem = elements
            else
                Cost = items.hintcost
                elements[elementindex] = {
                    label = items.huntname .. ' ' .. Cost .. '$',
                    value = 'buyhint' .. tostring(elementindex),
                    desc = '',
                    info = items
                }
                elementindex = elementindex + 1
            end
        end
    end
    local next = next
    if next(elem) == nil then
        VORPcore.NotifyBottomRight(Config.Language.Nolevel, 6000)
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
                if Config.LevelSystem then
                    if data.current.info.level <= level then
                        Cost = data.current.info.hintcost - subtractamoount
                    end
                else
                    Cost = data.current.info.hintcost
                end
                if not Inmission then
                    TriggerServerEvent('bcc:legendaries:menuopen5', Cost, data.current.info.huntname, data.current.info.CooldownTime)
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
    VORPcore.NotifyBottomRight(Config.Language.Initialblipmark, 2000)
    TriggerEvent('bcc-legendaries:DeadCheck')
    searchsetupmain('InitSearch', Data.investigationspot.x, Data.investigationspot.y, Data.investigationspot.z)
end)

---------------- Creates a thread(runs on start) to check if your near the coords an hit the g button -----------------------
CreateThread(function()
    while true do
        Wait(5)
        for k, v in pairs(Config.shop) do
            if GetDistanceBetweenCoords(v.Pos.x, v.Pos.y, v.Pos.z, GetEntityCoords(PlayerPedId()), false) < 2 then
                if IsControlJustReleased(0, 0x760A9C6F) then
                    if Config.LevelSystem then
                        TriggerServerEvent('bcc:legendaries:DBCheck', v.name)
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
AddEventHandler('bcc-legendaries:DeadCheck', function()
    while true do
        Wait(1000)
        if IsPedDeadOrDying(PlayerPedId()) then
            StopAll = true break
        end
    end
end)

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

---- Cleanup ------
AddEventHandler("onResourceStop", function(resourceName)
    if resourceName ~= GetCurrentResourceName() then
        return
    end
    MenuData.CloseAll()
end)