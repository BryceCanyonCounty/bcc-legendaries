Core = exports.vorp_core:GetCore()

InMenu, StopAll, InMission = false, false, false

function LoadModel(model, modelName)
    if not IsModelValid(model) then
        print('Invalid model:', modelName)
        return
    end

    RequestModel(model, false)

    local timeout = 10000
    local startTime = GetGameTimer()

    while not HasModelLoaded(model) do
        if GetGameTimer() - startTime > timeout then
            print('Failed to load model:', modelName)
            return
        end
        Wait(10)
    end
end

function StartGPS(x, y, z)
    local playerCoords = GetEntityCoords(PlayerPedId())
    local color = joaat('COLOR_RED')

    StartGpsMultiRoute(color, true, true)
    AddPointToGpsMultiRoute(playerCoords.x, playerCoords.y, playerCoords.z, false)
    AddPointToGpsMultiRoute(x, y, z, false)
    SetGpsMultiRouteRender(true)
end

function DistanceCheck(coords, dist, entity)
    local entityCoords = GetEntityCoords(entity)
    local distance = #(entityCoords - coords)

    while distance > dist do
        if StopAll then
            break
        end

        Wait(200)

        entityCoords = GetEntityCoords(entity)
        distance = #(entityCoords - coords)
    end
end

RegisterCommand(Config.commands.level, function(source, args, rawCommand)
    local level = Core.Callback.TriggerAwait('bcc-legendaries:GetPlayerLevel')
    if not level then
        level = 0
    end
    Core.NotifyRightTip(_U('LevelDisp') .. tostring(level), 5000)
end, false)
