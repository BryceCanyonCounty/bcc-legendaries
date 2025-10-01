---@type BCCLegendariesDebugLib
local DBG = BCCLegendariesDebug

local SEED_VERSION = 1

local CREATE_MIGRATIONS_SQL = [[
CREATE TABLE IF NOT EXISTS `resource_migrations` (
  `resource` VARCHAR(128) NOT NULL PRIMARY KEY,
  `version` INT NOT NULL
);
]]

local CREATE_LEGENDARIES_SQL = [[
CREATE TABLE IF NOT EXISTS `legendaries` (
    `identifier` varchar(50) NOT NULL,
    `charidentifier` int(11) NOT NULL,
    `trust` int(100) NOT NULL DEFAULT 0,
    UNIQUE KEY `charidentifier` (`charidentifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
]]

local function hasAwaitMySQL()
    return (MySQL ~= nil and MySQL.query ~= nil and MySQL.query.await ~= nil) or false
end

local function waitForDB(maxAttempts, delay)
    maxAttempts = maxAttempts or 8
    delay = delay or 500
    for i = 1, maxAttempts do
        if hasAwaitMySQL() then
            local ok = pcall(function() return MySQL.query.await('SELECT 1') end)
            if ok then return true end
        else
            if exports and (exports.mysql or exports.oxmysql) then
                return true
            end
        end
        Wait(delay)
        delay = delay * 2
    end
    return false
end

local function dbExecuteAwait(sql, params)
    if hasAwaitMySQL() then
        return MySQL.update.await(sql, params)
    end
    local done, result = false, nil
    local db = exports and (exports.mysql or exports.oxmysql) or nil
    if not db then error('No DB available') end
    db:execute(sql, params or {}, function(res)
        result = res
        done = true
    end)
    local tick = 0
    while not done and tick < 100 do
        Wait(50)
        tick = tick + 1
    end
    return result
end

local function dbQueryAwait(sql, params)
    if hasAwaitMySQL() then
        return MySQL.query.await(sql, params)
    end
    local done, result = false, nil
    local db = exports and (exports.mysql or exports.oxmysql) or nil
    if not db then error('No DB available') end
    db:execute(sql, params or {}, function(res)
        result = res
        done = true
    end)
    local tick = 0
    while not done and tick < 100 do
        Wait(50)
        tick = tick + 1
    end
    return result
end

local function ensureLegendariesSchema()
    local success, err = pcall(function()
        if hasAwaitMySQL() then
            MySQL.update.await(CREATE_LEGENDARIES_SQL)
        else
            dbExecuteAwait(CREATE_LEGENDARIES_SQL)
        end
    end)

    if not success then
        DBG.Error('Failed to create legendaries table: ' .. tostring(err))
        return
    end

    -- Check and add missing columns
    local function addColumnIfMissing(columnName, columnDef)
        local checkResult = dbQueryAwait("SHOW COLUMNS FROM `legendaries` LIKE ?", { columnName })
        if not checkResult or #checkResult == 0 then
            local alterSql = string.format("ALTER TABLE `legendaries` ADD COLUMN %s", columnDef)
            local ok, alterErr = pcall(dbExecuteAwait, alterSql)
            if ok then
                DBG.Info(string.format("Added '%s' column to legendaries table", columnName))
            else
                DBG.Error(string.format("Failed to add '%s' column: %s", columnName, tostring(alterErr)))
            end
        end
    end

    -- Add any future columns here if needed
    -- addColumnIfMissing('new_column', '`new_column` VARCHAR(50) DEFAULT NULL')
end

local function getMigrationVersion()
    if not waitForDB() then return 0 end

    if hasAwaitMySQL() then
        MySQL.update.await(CREATE_MIGRATIONS_SQL)
        local rows = MySQL.query.await('SELECT version FROM resource_migrations WHERE resource = ?', { GetCurrentResourceName() })
        if rows and rows[1] and rows[1].version then
            return tonumber(rows[1].version) or 0
        end
        return 0
    else
        dbExecuteAwait(CREATE_MIGRATIONS_SQL)
        local rows = dbQueryAwait('SELECT version FROM resource_migrations WHERE resource = ?', { GetCurrentResourceName() })
        if rows and rows[1] and rows[1].version then
            return tonumber(rows[1].version) or 0
        end
        return 0
    end
end

local function setMigrationVersion(v)
    if hasAwaitMySQL() then
        MySQL.update.await('INSERT INTO resource_migrations(resource, version) VALUES(?, ?) ON DUPLICATE KEY UPDATE version = VALUES(version);', { GetCurrentResourceName(), v })
    else
        dbExecuteAwait('INSERT INTO resource_migrations(resource, version) VALUES(?, ?) ON DUPLICATE KEY UPDATE version = VALUES(version);', { GetCurrentResourceName(), v })
    end
end

local function initializeDatabase(force)
    if not waitForDB() then
        DBG.Warning('Database not available after retries; skipping initialization.')
        return
    end

    local currentVersion = 0
    local ok, err = pcall(function() currentVersion = getMigrationVersion() end)
    if not ok then
        DBG.Warning(string.format('Failed to get migration version: %s', tostring(err)))
        currentVersion = 0
    end

    if currentVersion >= SEED_VERSION and not force then
        DBG.Info(string.format('Database already initialized (version %s), skipping.', tostring(currentVersion)))
        return
    end

    DBG.Info('Initializing legendaries database...')

    -- Perform any initial data seeding here if needed
    -- For example, default trust levels or configuration data

    pcall(function() setMigrationVersion(SEED_VERSION) end)
    DBG.Info(string.format('Database initialization complete; set version to %s', tostring(SEED_VERSION)))
end

-- Database API Functions removed - moved to server/main.lua

-- Console Commands
RegisterCommand('bcc-legendaries:init', function(source, args, raw)
    if source ~= 0 then
        DBG.Warning('bcc-legendaries:init can only be run from server console')
        return
    end
    initializeDatabase(true)
end, true)

RegisterCommand('bcc-legendaries:verify', function(source, args, raw)
    if source ~= 0 then
        DBG.Warning('bcc-legendaries:verify can only be run from server console')
        return
    end
    if not waitForDB() then
        DBG.Warning('Database not available; cannot verify schema.')
        return
    end

    local tables = dbQueryAwait("SHOW TABLES LIKE 'legendaries'")
    if tables and #tables > 0 then
        DBG.Info('Legendaries table exists and is accessible.')
        local columns = dbQueryAwait("SHOW COLUMNS FROM legendaries")
        if columns then
            DBG.Info(string.format('Legendaries table has %d columns:', #columns))
            for _, col in ipairs(columns) do
                DBG.Info(string.format('  - %s (%s)', col.Field, col.Type))
            end
        end
    else
        DBG.Warning('Legendaries table does not exist or is not accessible.')
    end
end, true)

-- Auto-initialize on resource start
AddEventHandler('onResourceStart', function(resourceName)
    if resourceName ~= GetCurrentResourceName() then return end
    CreateThread(function()
        Wait(1000)
        local ok, err = pcall(ensureLegendariesSchema)
        if not ok then
            DBG.Warning(string.format('Failed to ensure legendaries schema: %s', tostring(err)))
        end
        initializeDatabase(false)
    end)
end)
