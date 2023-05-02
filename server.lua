----------------------------- Pulling Essentials --------------------------------------
local VorpInv = {}
VorpInv = exports.vorp_inventory:vorp_inventoryApi()
local VORPcore = {}
TriggerEvent("getCore", function(core)
  VORPcore = core
end)
local BccUtils = {}
TriggerEvent('bcc:getUtils', function(bccutils)
  BccUtils = bccutils
end)

------------------------ Handles Giving Player Items when hunt over -----------------------
RegisterServerEvent('bcc:legendaries:giveitemsbear')
AddEventHandler('bcc:legendaries:giveitemsbear', function(Rewards)
  for k, v in pairs(Rewards) do
    VorpInv.addItem(source, v.name, v.count)
  end
  if Config.LevelSystem then
    local Character = VORPcore.getUser(source).getUsedCharacter
    local param = { ['charidentifier'] = Character.charIdentifier, ['identifier'] = Character.identifier, ['levelin'] = Config.LevelIncreaseperHunt }
    exports.oxmysql:execute('UPDATE legendaries SET `trust`=trust+@levelin WHERE charidentifier=@charidentifier AND identifier=@identifier', param)
  end
  VORPcore.NotifyBottomRight(source, Config.Language.AnimalSkinned, 4000)
end)

--------------------- Cooldown Setup ------------------------------------------------
local cooldowns = {}
RegisterServerEvent('bcc:legendaries:menuopen5', function(Cost, shopid, cdownt)
  local _source = source
  local Character = VORPcore.getUser(_source).getUsedCharacter
  if cooldowns[shopid] then --Check if the robery has a cooldown registered yet.
    if os.difftime(os.time(), cooldowns[shopid]) >= cdownt then -- Checks the current time difference from the stored enacted time, then checks if that difference us past the seconds threshold
      cooldowns[shopid] = os.time() --Update the cooldown with the new enacted time.
      VORPcore.AddWebhook(Config.Language.WebhookTitle, Config.WebhookLink, Character.identifier .. ' ' .. Config.Language.WebhookDesc .. ' ' .. shopid)
      TriggerClientEvent('bcc:legendaries:menuopen4', _source)
      Character.removeCurrency(0, Cost)
    else --robbery is on cooldown
      VORPcore.NotifyBottomRight(_source, Config.Language.Cooldownactive, 6000)
    end
  else
    cooldowns[shopid] = os.time() --Store the current time
    Character.removeCurrency(0, Cost)
    VORPcore.AddWebhook(Config.Language.WebhookTitle, Config.WebhookLink, Character.identifier .. ' ' .. Config.Language.WebhookDesc .. ' ' .. shopid)
    TriggerClientEvent('bcc:legendaries:menuopen4', _source)    --Robbery is not on cooldown
  end
end)
---------------------------------------- TESTING DATABASE --------------------------------------------------

--------- This will create the bcc:legendaries table on script launch if it does not already exist -----------------
-------Pulled from bcc:pets and modified ----------------------
Citizen.CreateThread(function()
  --Using oxmysql to create the table if its not already made every time script is launched
  if Config.LevelSystem then --if level system is true then
    exports.oxmysql:execute([[CREATE TABLE if NOT EXISTS `legendaries` (
      `identifier` varchar(50) NOT NULL, /*Creates a tab in the table for ident*/
      `charidentifier` int(11) NOT NULL,
      `trust` int(100) NOT NULL DEFAULT 0,
      UNIQUE KEY `charidentifier` (`charidentifier`))
    ]])
  end
end)

--------- Checks if you exist in the DB, and if you do not it adds you to the DB aswell as adds 1 to your trust level----------------
RegisterServerEvent('bcc:legendaries:DBCheck')
AddEventHandler('bcc:legendaries:DBCheck', function(name)
  local _source = source
  local Character = VORPcore.getUser(_source).getUsedCharacter
  local param = { ['charidentifier'] = Character.charIdentifier  , ['identifier'] = Character.identifier  }
  --------The if you exist in db code was pulled from vorp_banking and modified ----------------
  exports.oxmysql:execute("SELECT identifier, charidentifier FROM legendaries WHERE identifier = @Playeridentifier AND charidentifier = @CharIdentifier", { ["@Playeridentifier"] = Character.identifier, ["CharIdentifier"] = Character.charIdentifier }, function(result)
    if result[1] then                                                                                              --This will run if your char id or player id is in the db already
      --Player already exists do nothing
    else
      exports.oxmysql:execute("INSERT INTO legendaries ( `charidentifier`,`identifier` ) VALUES ( @charidentifier,@identifier )", param)
    end
  end)
  Wait(200)
  local rep = false
  repeat
    local ran = false
    exports.oxmysql:execute("SELECT trust FROM legendaries WHERE charidentifier=@charidentifier AND identifier=@identifier", param, function(result)
      if result[1].trust then
        rep = true
        TriggerClientEvent('bcc-legendaries:ClientLevelCatch', _source, result[1].trust, name) --passes trust to client
      end
      ran = true
    end)
    while true do
      Citizen.Wait(10)
      if ran then break end
    end
  until rep
end)

--This will handle version checking
BccUtils.Versioner.checkRelease(GetCurrentResourceName(), 'https://github.com/BryceCanyonCounty/bcc-legendaries')