Config = {}

Config.defaultlang = "en_lang"
-----------------------------------------------------

Config.devMode = {
    active = false, -- Set to true to enable debug prints
}
-----------------------------------------------------

Config.keys = {
    menu = 0x760A9C6F,  --[G] Open Menu
    chest = 0x760A9C6F, --[G] Open Chest
}
-----------------------------------------------------

-- Discord Webhook
Config.discord = {
    active = false,
    webhookURL = '',
    title = 'BCC-Legendaries',
    avatar = ''
}
-----------------------------------------------------

-- Trust Level System (see "levels.lua")
-- Note: Trust discounts only apply to cash and gold currencies, not item-based currencies
Config.trustSystem = {
    active = true,          -- Default: true / Set to false to disable the level system
    increment = 1,          -- Default: 1 / Amount to Increase Level per Completed Hunt
    maxLevel = 100,         -- Default: 100 / Maximum Level + All Levels Above / Adjust based on "levels.lua"
    maxLevelDiscount = 100, -- Default: 100 / Maximum Level Discount Percentage / Adjust based on "levels.lua"
}
-----------------------------------------------------

-- Trust System Security Configuration
-- Controls security and access for the trust system exports
Config.trustSecurity = {
    enabled = true,                     -- Enable/disable trust system security features
    minTrust = 0,                      -- Minimum trust value allowed
    maxTrust = 100,                 -- Maximum trust value allowed
    maxSingleChange = 100,            -- Maximum trust change in a single operation
    rateLimitEnabled = true,           -- Enable rate limiting for export calls
    rateLimitCalls = 10,               -- Maximum calls per minute per resource
    rateLimitWindow = 60,              -- Rate limit window in seconds
    auditLogging = true,               -- Enable audit logging for trust changes
    discordAudit = false,              -- Send audit logs to Discord (requires discord.active = true)

    -- Resources authorized to modify trust values
    -- Add resource names here to allow them to use trust exports
    -- Format: ['resource-name'] = true
    authorizedResources = {
        -- ['your-resource'] = true,
    }
}
-----------------------------------------------------

-- Change / Translate Commands
Config.commands = {
    level = "hunterLevel", -- Command to Check your Level
}
-----------------------------------------------------

-- These Animals are Set Aggressive on Spawn
Config.predators = {
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
-----------------------------------------------------

Config.BlipColors = {
    LIGHT_BLUE    = "BLIP_MODIFIER_MP_COLOR_1",
    DARK_RED      = "BLIP_MODIFIER_MP_COLOR_2",
    PURPLE        = "BLIP_MODIFIER_MP_COLOR_3",
    ORANGE        = "BLIP_MODIFIER_MP_COLOR_4",
    TEAL          = "BLIP_MODIFIER_MP_COLOR_5",
    LIGHT_YELLOW  = "BLIP_MODIFIER_MP_COLOR_6",
    PINK          = "BLIP_MODIFIER_MP_COLOR_7",
    GREEN         = "BLIP_MODIFIER_MP_COLOR_8",
    DARK_TEAL     = "BLIP_MODIFIER_MP_COLOR_9",
    RED           = "BLIP_MODIFIER_MP_COLOR_10",
    LIGHT_GREEN   = "BLIP_MODIFIER_MP_COLOR_11",
    TEAL2         = "BLIP_MODIFIER_MP_COLOR_12",
    BLUE          = "BLIP_MODIFIER_MP_COLOR_13",
    DARK_PUPLE    = "BLIP_MODIFIER_MP_COLOR_14",
    DARK_PINK     = "BLIP_MODIFIER_MP_COLOR_15",
    DARK_DARK_RED = "BLIP_MODIFIER_MP_COLOR_16",
    GRAY          = "BLIP_MODIFIER_MP_COLOR_17",
    PINKISH       = "BLIP_MODIFIER_MP_COLOR_18",
    YELLOW_GREEN  = "BLIP_MODIFIER_MP_COLOR_19",
    DARK_GREEN    = "BLIP_MODIFIER_MP_COLOR_20",
    BRIGHT_BLUE   = "BLIP_MODIFIER_MP_COLOR_21",
    BRIGHT_PURPLE = "BLIP_MODIFIER_MP_COLOR_22",
    YELLOW_ORANGE = "BLIP_MODIFIER_MP_COLOR_23",
    BLUE2         = "BLIP_MODIFIER_MP_COLOR_24",
    TEAL3         = "BLIP_MODIFIER_MP_COLOR_25",
    TAN           = "BLIP_MODIFIER_MP_COLOR_26",
    OFF_WHITE     = "BLIP_MODIFIER_MP_COLOR_27",
    LIGHT_YELLOW2 = "BLIP_MODIFIER_MP_COLOR_28",
    LIGHT_PINK    = "BLIP_MODIFIER_MP_COLOR_29",
    LIGHT_RED     = "BLIP_MODIFIER_MP_COLOR_30",
    LIGHT_YELLOW3 = "BLIP_MODIFIER_MP_COLOR_31",
    WHITE         = "BLIP_MODIFIER_MP_COLOR_32"
}
