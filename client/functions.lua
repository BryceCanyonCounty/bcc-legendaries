--Pulling Essentials
VORPutils = {}
TriggerEvent("getUtils", function(utils)
    VORPutils = utils
end)
VORPcore = {}
TriggerEvent("getCore", function(core)
    VORPcore = core
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

--Creates the ability to use DrawText3D
function DrawText3D(x, y, z, text)
    local onScreen, _x, _y = GetScreenCoordFromWorldCoord(x, y, z)
    local px, py, pz = table.unpack(GetGameplayCamCoord())
    local dist = GetDistanceBetweenCoords(px, py, pz, x, y, z, 1)
    local str = CreateVarString(10, "LITERAL_STRING", text, Citizen.ResultAsLong())
    if onScreen then
        SetTextScale(0.30, 0.30)
        SetTextFontForCurrentCommand(1)
        SetTextColor(255, 255, 255, 215)
        SetTextCentre(1)
        DisplayText(str, _x, _y)
        local factor = (string.len(text)) / 225
        DrawSprite("feeds", "hud_menu_4a", _x, _y + 0.0125, 0.015 + factor, 0.03, 0.1, 35, 35, 35, 190, 0)
    end
end