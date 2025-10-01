-- DO NOT MAKE CHANGES TO THIS FILE
if not BCCLegendariesDebug then
    ---@class BCCLegendariesDebugLib
    ---@field Info fun(message: string)
    ---@field Error fun(message: string)
    ---@field Warning fun(message: string)
    ---@field Success fun(message: string)
    ---@field DevModeActive boolean
    BCCLegendariesDebug = {}

    BCCLegendariesDebug.DevModeActive = Config and Config.devMode and Config.devMode.active or false

    -- No-op function
    local function noop() end

    -- Function to create loggers
    local function createLogger(prefix, color)
        if BCCLegendariesDebug.DevModeActive then
            return function(message)
                print(('^%d[%s] ^3%s^0'):format(color, prefix, message))
            end
        else
            return noop
        end
    end

    -- Create loggers with appropriate colors
    BCCLegendariesDebug.Info = createLogger("INFO", 5)       -- Purple
    BCCLegendariesDebug.Error = createLogger("ERROR", 1)     -- Red
    BCCLegendariesDebug.Warning = createLogger("WARNING", 3) -- Yellow
    BCCLegendariesDebug.Success = createLogger("SUCCESS", 2) -- Green
end
