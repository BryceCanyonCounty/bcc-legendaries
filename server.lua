-- Pulls and allows the use of VORP Inventory
local VorpInv = {}
VorpInv = exports.vorp_inventory:vorp_inventoryApi()
local VORPcore = {}
TriggerEvent("getCore", function(core)
  VORPcore = core
end)
--End of pulling VORP Inventory

--Given Rewards
RegisterServerEvent('hd_legendaries:giveitemsbear')
AddEventHandler('hd_legendaries:giveitemsbear', function(Rewards)
  for k, v in pairs(Rewards) do
    VorpInv.addItem(source, v.name, v.count)
  end
end)
--end of rewards

--Cooldown setups
local cooldown = false --sets the check to false on server start
RegisterServerEvent('hd_legendaries:menuopen5')
AddEventHandler('hd_legendaries:menuopen5', function(Cost)
  local Character = VORPcore.getUser(source).getUsedCharacter
  if cooldown == false then
    Character.removeCurrency(0, Cost)
    TriggerClientEvent('hd_legendaries:menuopen4', source, arg)
    cooldown = true
    Wait(GlobalHuntCooldown)
    cooldown = false
  elseif cooldown == true then
    TriggerClientEvent('hd_legendaries:failmenuopen', source)
  end
end)
--end cooldown setups

local shoppedspawn = 0
RegisterServerEvent('hd_legendaries:pedspawns')
AddEventHandler('hd_legendaries:pedspawns', function()
  if shoppedspawn == 0 then
    shoppedspawn = shoppedspawn + 1
    TriggerClientEvent('hd_legendaries:pedspawn', source)
  end
end)