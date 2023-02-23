-- Pulls and allows the use of VORP Inventory

local VorpInv = {}

VorpInv = exports.vorp_inventory:vorp_inventoryApi()

--End of pulling VORP Inventory

--Given Rewards
RegisterServerEvent('giveitemsbear')
AddEventHandler('giveitemsbear', function(Rewards)
  for k, v in pairs(Rewards) do
    VorpInv.addItem(source, v.name, v.count)
  end
end)
--end of rewards

--Cooldown setups
local cooldown = false --sets the check to false on server start
RegisterServerEvent('menuopen5')
AddEventHandler('menuopen5', function()
  if cooldown == false then
    TriggerClientEvent('menuopen4', source, arg)
    cooldown = true
    Wait(GlobalHuntCooldown)
    cooldown = false
  elseif cooldown == true then
    TriggerClientEvent('failmenuopen', source)
  end
end)
--end cooldown setups

local shoppedspawn = 0
RegisterServerEvent('pedspawns')
AddEventHandler('pedspawns', function()
  if shoppedspawn == 0 then
    shoppedspawn = shoppedspawn + 1
    TriggerClientEvent('pedspawn', source)
  end
end)