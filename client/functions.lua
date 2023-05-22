--Pulling Essentials
VORPutils = {}
TriggerEvent("getUtils", function(utils)
    VORPutils = utils
end)
VORPcore = {}
TriggerEvent("getCore", function(core)
    VORPcore = core
end)
BccUtils = {}
TriggerEvent('bcc:getUtils', function(bccutils)
    BccUtils = bccutils
end)

function modelload(model) --Function To load the model
    RequestModel(model)
    while not HasModelLoaded(model) do
      Wait(100)
    end
end

function distcheck(x, y, z, dist, entity) --Function used to handle distance checking
    while true do
        if StopAll then break end
        Wait(200)
        local ec = GetEntityCoords(entity)
        if GetDistanceBetweenCoords(ec.x, ec.y, ec.z, x, y, z, true) < dist then break end
    end
end

function spawnPed(model, x, y, z, networked)
    local createdped = CreatePed(model, x, y, z, networked, true, true, true)
    Citizen.InvokeNative(0x283978A15512B2FE, createdped, true)
    Citizen.InvokeNative(0x23f74c2fda6e7c61, 953018525, createdped)
    return createdped
end