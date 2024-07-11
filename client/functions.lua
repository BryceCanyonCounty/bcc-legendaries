--Pulling Essentials
VORPutils = {}
TriggerEvent("getUtils", function(utils)
    VORPutils = utils
end)
VORPcore = {}
TriggerEvent("getCore", function(core)
    VORPcore = core
end)
BccUtils = exports['bcc-utils'].initiate()
FeatherMenu =  exports['feather-menu'].initiate()
BCCLegendarieshMenu = FeatherMenu:RegisterMenu('bcc-legendaries:Menu', {
    top = '40%',
    left = '20%',
    ['720width'] = '500px',
    ['1080width'] = '600px',
    ['2kwidth'] = '700px',
    ['4kwidth'] = '900px',
    style = {},
    contentslot = {
        style = { --This style is what is currently making the content slot scoped and scrollable. If you delete this, it will make the content height dynamic to its inner content.
            ['height'] = '500px',
            ['min-height'] = '500px'
        }
    },
    draggable = true
})

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

function SetOutfitPreset(ped,preset)
    return Citizen.InvokeNative(0x77FF8D35EEC6BBC4,ped,preset)
end

function IsLegendaryDeadly(pedid)
    local Predators = {
        `mp_a_c_bear_01`,
        `mp_a_c_wolf_01`,
        `mp_a_c_panther_01`,
        `mp_a_c_cougar_01`,
        `mp_a_c_alligator_01`,
        `a_c_alligator_02`,
        `a_c_snake_01`,
        `a_c_snakeredboa10ft_01`,
		`a_c_lionmangy_01`,
        `a_c_cougar_01`,
        `A_C_Wolf`,
        `a_c_bear_01`,
    }
    local model = GetEntityModel(pedid)
    for i,v in pairs(Predators) do
        if model == v then
            return true
        end
    end
    return false
end