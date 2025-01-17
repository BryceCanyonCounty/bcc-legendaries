-----------------------------------------------------
-- Hunter Shop Configurations
-----------------------------------------------------
Shops = {
    ["SD"] = {
        shop = {
            name = "St Denis Hunter",   -- Name of Shop on Menu Header
            prompt = "St Denis Hunter", -- Text Below the Menu Prompt Button
            distance = 2.0,             -- Distance Between Player and Shop to Show Menu Prompt
            jobsEnabled = false,        -- Allow Shop Access to Specified Jobs Only
            jobs = {                    -- Insert Job to Limit Access - ex. jobs = {{name = "hunter", grade = 0},{name = "blacksmith", grade = 3}}
                { name = "hunter",     grade = 0 },
                { name = "blacksmith", grade = 3 }
            },
            hours = {
                active = false, -- Shop uses Open and Closed Hours
                open = 7,       -- Shop Open Time / 24 Hour Clock
                close = 21      -- Shop Close Time / 24 Hour Clock
            }
        },
        blip = {
            show = true,              -- Show Blip On Map
            showClosed = true,        -- Show Blip On Map when Closed
            name = "St Denis Hunter", -- Name of Blip on Map
            sprite = -1733535731,     -- Default: -1733535731
            color = {
                open = "WHITE",       -- Shop Open - Default: White - Blip Colors Shown in "config.lua"
                closed = "RED",       -- Shop Closed - Default: Red - Blip Colors in "config.lua"
                job = "YELLOW_ORANGE" -- Shop Job Locked - Default: Yellow - Blip Colors Shown in "config.lua"
            }
        },
        npc = {
            active = true,                             -- Turns NPC On / Off
            model = "a_m_m_huntertravelers_cool_01",   -- Model Used for NPC
            coords = vector3(1891.76, -980.76, 41.54), -- NPC and Shop Blip Positions
            heading = 22.72,                           -- NPC Heading
            distance = 100.0                           -- Distance Between Player and Shop for NPC to Spawn
        },
    },
    -----------------------------------------------------

    ["OCR"] = {
        shop = {
            name = "O'Creagh's Run Hunter",   -- Name of Shop on Menu Header
            prompt = "O'Creagh's Run Hunter", -- Text Below the Menu Prompt Button
            distance = 2.0,                   -- Distance Between Player and Shop to Show Menu Prompt
            jobsEnabled = false,              -- Allow Shop Access to Specified Jobs Only
            jobs = {                          -- Insert Job to Limit Access - ex. jobs = {{name = "hunter", grade = 0},{name = "blacksmith", grade = 3}}
                { name = "hunter",     grade = 0 },
                { name = "blacksmith", grade = 3 }
            },
            hours = {
                active = false, -- Shop uses Open and Closed Hours
                open = 7,       -- Shop Open Time / 24 Hour Clock
                close = 21      -- Shop Close Time / 24 Hour Clock
            }
        },
        blip = {
            show = true,                    -- Show Blip On Map
            showClosed = true,              -- Show Blip On Map when Closed
            name = "O'Creagh's Run Hunter", -- Name of Blip on Map
            sprite = -1733535731,           -- Default: -1733535731
            color = {
                open = "WHITE",             -- Shop Open - Default: White - Blip Colors Shown in "config.lua"
                closed = "RED",             -- Shop Closed - Default: Red - Blip Colors in "config.lua"
                job = "YELLOW_ORANGE"       -- Shop Job Locked - Default: Yellow - Blip Colors Shown in "config.lua"
            }
        },
        npc = {
            active = true,                              -- Turns NPC On / Off
            model = "a_m_m_huntertravelers_cool_01",    -- Model Used for NPC
            coords = vector3(1780.66, 1619.56, 172.95), -- NPC and Shop Blip Positions
            heading = 280.89,                           -- NPC Heading
            distance = 100.0                            -- Distance Between Player and Shop for NPC to Spawn
        },
    },
    -----------------------------------------------------

    ["BW"] = {
        shop = {
            name = "Blackwater Hunter",   -- Name of Shop on Menu Header
            prompt = "Blackwater Hunter", -- Text Below the Menu Prompt Button
            distance = 2.0,               -- Distance Between Player and Shop to Show Menu Prompt
            jobsEnabled = false,          -- Allow Shop Access to Specified Jobs Only
            jobs = {                      -- Insert Job to Limit Access - ex. jobs = {{name = "hunter", grade = 0},{name = "blacksmith", grade = 3}}
                { name = "hunter",     grade = 0 },
                { name = "blacksmith", grade = 3 }
            },
            hours = {
                active = false, -- Shop uses Open and Closed Hours
                open = 7,       -- Shop Open Time / 24 Hour Clock
                close = 21      -- Shop Close Time / 24 Hour Clock
            }
        },
        blip = {
            show = true,                -- Show Blip On Map
            showClosed = true,          -- Show Blip On Map when Closed
            name = "Blackwater Hunter", -- Name of Blip on Map
            sprite = -1733535731,       -- Default: -1733535731
            color = {
                open = "WHITE",         -- Shop Open - Default: White - Blip Colors Shown in "config.lua"
                closed = "RED",         -- Shop Closed - Default: Red - Blip Colors in "config.lua"
                job = "YELLOW_ORANGE"   -- Shop Job Locked - Default: Yellow - Blip Colors Shown in "config.lua"
            }
        },
        npc = {
            active = true,                              -- Turns NPC On / Off
            model = "a_m_m_huntertravelers_cool_01",    -- Model Used for NPC
            coords = vector3(-772.18, -1345.77, 43.57), -- NPC and Shop Blip Positions
            heading = 0,                                -- NPC Heading
            distance = 100.0                            -- Distance Between Player and Shop for NPC to Spawn
        },
    },
    -----------------------------------------------------

    ["AD"] = {
        shop = {
            name = "Armadillo Hunter",   -- Name of Shop on Menu Header
            prompt = "Armadillo Hunter", -- Text Below the Menu Prompt Button
            distance = 2.0,              -- Distance Between Player and Shop to Show Menu Prompt
            jobsEnabled = false,         -- Allow Shop Access to Specified Jobs Only
            jobs = {                     -- Insert Job to Limit Access - ex. jobs = {{name = "hunter", grade = 0},{name = "blacksmith", grade = 3}}
                { name = "hunter",     grade = 0 },
                { name = "blacksmith", grade = 3 }
            },
            hours = {
                active = false, -- Shop uses Open and Closed Hours
                open = 7,       -- Shop Open Time / 24 Hour Clock
                close = 21      -- Shop Close Time / 24 Hour Clock
            }
        },
        blip = {
            show = true,               -- Show Blip On Map
            showClosed = true,         -- Show Blip On Map when Closed
            name = "Armadillo Hunter", -- Name of Blip on Map
            sprite = -1733535731,      -- Default: -1733535731
            color = {
                open = "WHITE",        -- Shop Open - Default: White - Blip Colors Shown in "config.lua"
                closed = "RED",        -- Shop Closed - Default: Red - Blip Colors in "config.lua"
                job = "YELLOW_ORANGE"  -- Shop Job Locked - Default: Yellow - Blip Colors Shown in "config.lua"
            }
        },
        npc = {
            active = true,                              -- Turns NPC On / Off
            model = "a_m_m_huntertravelers_cool_01",    -- Model Used for NPC
            coords = vector3(-3656.78, -2662.6, -13.8), -- NPC and Shop Blip Positions
            heading = 261.92,                           -- NPC Heading
            distance = 100.0                            -- Distance Between Player and Shop for NPC to Spawn
        },
    },
    -----------------------------------------------------

    ["CTP"] = {
        shop = {
            name = "Cat Tail Pond Hunter",   -- Name of Shop on Menu Header
            prompt = "Cat Tail Pond Hunter", -- Text Below the Menu Prompt Button
            distance = 2.0,                  -- Distance Between Player and Shop to Show Menu Prompt
            jobsEnabled = false,             -- Allow Shop Access to Specified Jobs Only
            jobs = {                         -- Insert Job to Limit Access - ex. jobs = {{name = "hunter", grade = 0},{name = "blacksmith", grade = 3}}
                { name = "hunter",     grade = 0 },
                { name = "blacksmith", grade = 3 }
            },
            hours = {
                active = false, -- Shop uses Open and Closed Hours
                open = 7,       -- Shop Open Time / 24 Hour Clock
                close = 21      -- Shop Close Time / 24 Hour Clock
            }
        },
        blip = {
            show = true,                   -- Show Blip On Map
            showClosed = true,             -- Show Blip On Map when Closed
            name = "Cat Tail Pond Hunter", -- Name of Blip on Map
            sprite = -1733535731,          -- Default: -1733535731
            color = {
                open = "WHITE",            -- Shop Open - Default: White - Blip Colors Shown in "config.lua"
                closed = "RED",            -- Shop Closed - Default: Red - Blip Colors in "config.lua"
                job = "YELLOW_ORANGE"      -- Shop Job Locked - Default: Yellow - Blip Colors Shown in "config.lua"
            }
        },
        npc = {
            active = true,                             -- Turns NPC On / Off
            model = "a_m_m_huntertravelers_cool_01",   -- Model Used for NPC
            coords = vector3(-1061.57, 875.9, 124.72), -- NPC and Shop Blip Positions
            heading = 171.65,                          -- NPC Heading
            distance = 100.0                           -- Distance Between Player and Shop for NPC to Spawn
        },
    },
}
