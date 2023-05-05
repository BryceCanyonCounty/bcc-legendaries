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

--Function to load model
function modelload(model) --recieves the models hash from whereever this function is called
    RequestModel(model) -- requests the model to load into the game
    if not HasModelLoaded(model) then --checks if its loaded
      RequestModel(model) --if it hasnt loaded then request it to load again
    end
    while not HasModelLoaded(model) do
      Wait(100)
    end
end

--Function used to handle distance checking
function distcheck(x, y, z, dist, entity) --receives these variables from whereever it is triggered
    while true do --while loop will not stop until broken
        if StopAll then break end --if either variable is true then break loop
        Citizen.Wait(100) --waits 100ms preventing crashing
        local ec = GetEntityCoords(entity) --gets the entities coords
        if GetDistanceBetweenCoords(ec.x, ec.y, ec.z, x, y, z, true) < dist then break end --if the dist between the entity and the coords are less than the dist break loop
    end
end