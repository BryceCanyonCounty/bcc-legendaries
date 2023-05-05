local npcs = {}
local blips = {}

Citizen.CreateThread(function()
    Citizen.Wait(1000)

    for k, v in pairs(Config.shop) do
        local model = joaat('mp_re_slumpedhunter_males_01') -- sets the npc model
        modelload(model)

        local npc = CreatePed(model, v.Pos.x, v.Pos.y, v.Pos.z - 1.0, v.Pos.h, false, false, true, true)
        Citizen.InvokeNative(0x283978A15512B2FE, npc, true)
        BccUtils.Ped.SetStatic(npc)
        
        if v.allowblip then
            local blip = Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, v.Pos.x, v.Pos.y, v.Pos.z) -- This create a blip with a defualt blip hash we given
            SetBlipSprite(blip, v.BlipHash, 1) -- This sets the blip hash to the given in config.
            SetBlipScale(blip, 0.8)
            Citizen.InvokeNative(0x662D364ABF16DE2F, blip, joaat(v.BlipColor))
            Citizen.InvokeNative(0x9CB1A1623062F402, blip, v.BlipName) -- Sets the blip Name
            table.insert(blips, blip)
        end

        table.insert(npcs, npc) -- Store the NPC in the npcs table
    end
end)

-- Function to delete NPCs
function DeleteNPCs()
    for k, v in pairs(npcs) do
        DeletePed(v)
    end
end

-- Function to delete blips
function DeleteBlips()
    for k, v in pairs(blips) do
        RemoveBlip(v)
    end
end

-- Call the DeleteNPCs function when the resource stops
AddEventHandler("onResourceStop", function(resource)
    if resource == GetCurrentResourceName() then
        DeleteNPCs()
        DeleteBlips()
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(10)
        local coords = GetEntityCoords(PlayerPedId())
        local sleep = true
        for k, v in pairs(Config.shop) do
            if GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < 2.5 then
                sleep = false
                BccUtils.Misc.DrawText3D(v.Pos.x, v.Pos.y, v.Pos.z, Config.Language.Shoptext) -- creates the text
            end
        end
        if sleep then
            Citizen.Wait(1500)
        end
    end
end)