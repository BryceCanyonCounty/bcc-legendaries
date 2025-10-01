local Core = exports.vorp_core:GetCore()
---@type BCCLegendariesDebugLib
local DBG = BCCLegendariesDebug

InMenu, StopAll, InMission = false, false, false

function LoadModel(model, modelName)
    -- Validate input
    if not model or not modelName then
        DBG.Error(('Invalid model or modelName for LoadModel: %s, %s'):format(tostring(model), tostring(modelName)))
        return false
    end

    -- Check if model is already loaded
    if HasModelLoaded(model) then
        DBG.Success(('Model already loaded: %s'):format(tostring(modelName)))
        return true
    end

    -- Check if model is valid
    if not IsModelValid(model) then
        DBG.Error(('Invalid model: %s'):format(tostring(modelName)))
        return false
    end

    -- Request model
    DBG.Info(('Requesting model: %s'):format(tostring(modelName)))
    RequestModel(model, false)

    -- Set timeout (5 seconds)
    local timeout = 5000
    local startTime = GetGameTimer()

    -- Wait for model to load
    while not HasModelLoaded(model) do
        -- Check for timeout
        if GetGameTimer() - startTime > timeout then
            DBG.Error(('Timeout while loading model: %s'):format(tostring(modelName)))
            return false
        end
        Wait(10)
    end

    DBG.Success(('Model loaded successfully: %s'):format(tostring(modelName)))
    return true
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
