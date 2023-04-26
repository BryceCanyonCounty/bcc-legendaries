local npc = {}
local x, y, z = {}, {}, {}
Citizen.CreateThread(function()
    Citizen.Wait(1000)

    for k, v in pairs(Config.shop) do
        local model = GetHashKey('mp_re_slumpedhunter_males_01') --sets the npc model
        modelload(model)

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