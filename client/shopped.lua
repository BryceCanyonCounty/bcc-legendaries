--Pulls vorp utils
local VORPutils = {}
TriggerEvent("getUtils", function(utils)
    VORPutils = utils
end)

--end Pulling utils

local npc = {}
local close = false

local dist
local x, y, z = {}, {}, {}
Citizen.CreateThread(function()
    Citizen.Wait(1000)

    for k, v in pairs(Config.shop) do
        local model = GetHashKey('mp_re_slumpedhunter_males_01') --sets the npc model
        RequestModel(model)
        if IsModelValid(model) then
            RequestModel(model)
            while not HasModelLoaded(model) do
                Wait(100)
            end
        end

        npc = CreatePed(model, v.Pos.x, v.Pos.y, v.Pos.z - 1.0, v.Pos.h, true, false, true, true)
        Citizen.InvokeNative(0x283978A15512B2FE, npc, true)
        SetEntityCanBeDamaged(npc, false)
        SetEntityInvincible(npc, true)
        FreezeEntityPosition(npc, true)
        SetBlockingOfNonTemporaryEvents(npc, true)
        x, y, z = v.Pos.x, v.Pos.y, v.Pos.z
        local blip = VORPutils.Blips:SetBlip(Config.Language.Hunterblip, 'blip_taxidermist', 0.8, x, y, z)
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(10)
        local player = PlayerPedId()
        local coords = GetEntityCoords(player)
        local sleep = true
        for k, v in pairs(Config.shop) do
            if GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < 2.5 then
                sleep = false
                DrawText3D(v.Pos.x, v.Pos.y, v.Pos.z, Config.Language.Shoptext) --creates the text
            end
        end
        if sleep then
            Citizen.Wait(1500)
        end
    end
end)


-----------------Handles spawning the ped---------------------------
--[[Citizen.CreateThread(function()
    local model = GetHashKey('mp_re_slumpedhunter_males_01') --sets the npc model
    local v = Config.shop

    RequestModel(model)               -- requests the varible model
    if not HasModelLoaded(model) then --checks if its loaded
        RequestModel(model)
    end
    while not HasModelLoaded(model) or HasModelLoaded(model) == 0 or model == 1 do -- not sure but its needed
        Citizen.Wait(1)
    end
    local createdped = CreatePed(model, v.shoplocation.x, v.shoplocation.y, v.shoplocation.z - 1, false, true, true, true) --creates ped the minus one makes it so its standing on the ground not floating
    Citizen.InvokeNative(0x283978A15512B2FE, createdped, true)                                                             -- sets ped into random outfit, stops it being invis
    SetEntityAsMissionEntity(createdped, true, true)                                                                       -- sets ped as mission entity preventing it from despawning
    SetEntityInvincible(createdped, true)                                                                                  --sets ped invincible
    FreezeEntityPosition(createdped, true)                                                                                 --freezes the entity
    ---------------------------Handles opening the menu

end)]]
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
