----------------------------- Pulling Essentials --------------------------------------
local VorpInv = {}
VorpInv = exports.vorp_inventory:vorp_inventoryApi()
local VORPcore = {}

local activeHunts = {} -- NEW

TriggerEvent("getCore", function(core)
  VORPcore = core
end)
local BccUtils = {}
TriggerEvent('bcc:getUtils', function(bccutils)
  BccUtils = bccutils
end)


------------------------ Handles Giving Player Items when hunt over -----------------------
RegisterServerEvent('bcc:legendaries:giveitemsbear', function(huntId)
  local _source = source

  if not activeHunts[_source] then
    return
  end
  local huntConfig = Config.locations[tonumber(huntId)]
 
  local Rewards = Config.locations[huntId].GivenItems

  for k, v in pairs(Rewards) do
    VorpInv.addItem(_source, v.name, v.count)
  end
  if Config.LevelSystem then
    local Character = VORPcore.getUser(_source).getUsedCharacter
    local param = { ['charidentifier'] = Character.charIdentifier, ['identifier'] = Character.identifier, ['levelin'] = Config.LevelIncreaseperHunt }
    exports.oxmysql:execute('UPDATE legendaries SET `trust`=trust+@levelin WHERE charidentifier=@charidentifier AND identifier=@identifier', param)
  end
  activeHunts[_source] = nil
  VORPcore.NotifyBottomRight(_source, _U('AnimalSkinned'), 4000)
end)

--------------------- Cooldown Setup ------------------------------------------------
local cooldowns = {}
RegisterServerEvent('bcc:legendaries:menuopen5', function(Cost, shopid, cdownt)
  local _source = source


  if activeHunts[_source] then
    VORPcore.NotifyBottomRight(_source, _U('HuntActive'), 6000)
    return
  end


  local Character = VORPcore.getUser(_source).getUsedCharacter
  if cooldowns[shopid] then --Check if the robery has a cooldown registered yet.
    if os.difftime(os.time(), cooldowns[shopid]) >= cdownt then -- Checks the current time difference from the stored enacted time, then checks if that difference us past the seconds threshold
      cooldowns[shopid] = os.time() --Update the cooldown with the new enacted time.
      VORPcore.AddWebhook(_U('WebhookTitle'), Config.WebhookLink, Character.identifier .. ' ' .. _U('WebhookDesc') .. ' ' .. shopid)
      TriggerClientEvent('bcc:legendaries:menuopen4', _source)
      Character.removeCurrency(0, Cost)
      activeHunts[_source] = true
    else --robbery is on cooldown
      VORPcore.NotifyBottomRight(_source, _U('Cooldownactive'), 6000)
    end
  else
    cooldowns[shopid] = os.time() --Store the current time
    Character.removeCurrency(0, Cost)
    VORPcore.AddWebhook(_U('WebhookTitle'), Config.WebhookLink, Character.identifier .. ' ' .. _U('WebhookDesc') .. ' ' .. shopid)
    TriggerClientEvent('bcc:legendaries:menuopen4', _source)    --Robbery is not on cooldown
    activeHunts[_source] = true
  end
end)

--------- Checks if you exist in the DB, and if you do not it adds you to the DB aswell as adds 1 to your trust level----------------
RegisterServerEvent('bcc:legendaries:DBCheck', function(name)
  local _source = source
  local Character = VORPcore.getUser(_source).getUsedCharacter
  local param = { ['charidentifier'] = Character.charIdentifier  , ['identifier'] = Character.identifier  }
  --------The if you exist in db code was pulled from vorp_banking and modified ----------------
  local result = MySQL.query.await("SELECT identifier, charidentifier FROM legendaries WHERE identifier = @identifier AND charidentifier = @charidentifier", param)
  if #result <= 0 then
    MySQL.query.await("INSERT INTO legendaries ( `charidentifier`,`identifier` ) VALUES ( @charidentifier,@identifier )", param)
  end
  local result2 = MySQL.query.await("SELECT trust FROM legendaries WHERE charidentifier=@charidentifier AND identifier=@identifier", param)
  if #result2 > 0 then
    if result2[1].trust then
      TriggerClientEvent('bcc-legendaries:ClientLevelCatch', _source, result2[1].trust, name) --passes trust to client
    end
  end
end)

AddEventHandler('playerDropped', function(reason)
    local _source = source

    if activeHunts[_source] then
        activeHunts[_source] = nil
    end
end)


---------- If you are dead, then it will stop the hunt
RegisterServerEvent('bcc-legendaries:stophunt', function()
  local _source = source

  activeHunts[_source] = nil
end)

--This will handle version checking
BccUtils.Versioner.checkRelease(GetCurrentResourceName(), 'https://github.com/BryceCanyonCounty/bcc-legendaries')
