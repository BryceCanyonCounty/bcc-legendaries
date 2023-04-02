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

        npc = CreatePed(model, v.Pos.x, v.Pos.y, v.Pos.z - 1.0, v.Pos.h, false, false, true, true)
        Citizen.InvokeNative(0x283978A15512B2FE, npc, true)
        SetEntityCanBeDamaged(npc, false)
        SetEntityInvincible(npc, true)
        FreezeEntityPosition(npc, true)
        SetBlockingOfNonTemporaryEvents(npc, true)
        x, y, z = v.Pos.x, v.Pos.y, v.Pos.z
        if v.allowblip then
            local blip = VORPutils.Blips:SetBlip(Config.Language.Hunterblip, 'blip_taxidermist', 0.8, x, y, z)
        end
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
