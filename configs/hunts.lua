-----------------------------------------------------
-- Hunt Configurations
-----------------------------------------------------

Hunts = {
    -----------------------------------------------------
    -- Armadillo
    -----------------------------------------------------

    {
        name = "Legendary Pronghorn", -- Name of the Hunt in the Menu (Make Sure these are Unique)
        location = "AD",              -- Hunter Shop Location Key / MUST Match the Shop Key in "shops.lua" to Show in Menu
        level = 0,                    -- Level of Trust Needed to Start Hunt
        currency = {
            type = "cash",            -- "cash = Cash Only / "gold" = Gold Only
            amount = 70               -- Cost to Start the Hunt in Selected Currency Type
        },
        legendary = {
            health = 600,                              -- Sets Legendary Animals Health Amount / Max is 1000?
            coords = vector3(-3478.9, -3018.92, 4.51), -- Legendary Animal Spawn Coords
            model = "a_c_pronghorn_01",                -- Ped Model of the Legendary Animal mp_a_c_pronghorn_01
            outfit = 1,                                -- Set Outfit for Legendary Animal / Check Pastebin (https://pastebin.com/6Vc26NLL) or Alternatively Spooner
        },
        hintBox = vector3(-3414.79, -2731.7, -4.36),  -- Initial Hint Box Spawn Coords at Start of Hunt
        cooldown = 120,                                -- Time in Minutes Before Anyone can Hunt this Animal Again
        rewards = {                                    -- Items Given at End of Successful Hunt (name MUST match item in Database)
            { name = "legprongs", count = 1 },
            { name = "legprongh", count = 2 },
            { name = "venison", count = 2 },
        },
        npc = {
            enabled = true,                                   -- Enable / Disable Enemy NPCs
            model = "g_m_m_unibanditos_01",          -- Ped Model of Enemy NPCs
            blip = {
                sprite = -1282792512,                         -- Blip Sprite for Enemy NPCs
                coords = vector3(-3841.78, -3154.95, -13.07), -- Blip Coords for Enemy NPCs
            },
            coords = {                                        -- Enemy NPC Spawn Coords
                vector3(-3848.97, -3152.55, -13.04),
                vector3(-3858.95, -3157.43, -13.11),
                vector3(-3854.3, -3175.66, -13.04),
                vector3(-3831.0, -3178.34, -13.1),
            },
            hintBox = vector3(-3841.35, -3179.32, -12.63), -- Second Hint Box Spawn Coords / Available After Killing Enemy NPCs
        },
        secondaryAnimals = {                               -- Spawn Secondary Animals to Assist the Legendary Animal
            enabled = true,                                -- Enable / Disable Secondary Animals
            model = "a_c_pronghorn_01",                    -- Model of the Secondary Animal. Make Sure this is NOT the Same Model as any Legendary Animals
            coords = {                                     -- Spawn Coords for Secondary Animals
                vector3(-3482.06, -3014.65, 5.15),
                vector3(-3479.86, -3021.17, 4.48),
                vector3(-3474.63, -3024.05, 3.87),
                vector3(-3466.88, -3023.94, 3.22),
            },
        },
    },
    -----------------------------------------------------

    {
        name = "Legendary Rattlesnake", -- Name of the Hunt in the Menu (Make Sure these are Unique)
        location = "AD",                -- Hunter Shop Location Key / MUST Match the Shop Key in "shops.lua" to Show in Menu
        level = 5,                      -- Level of Trust Needed to Start Hunt
        currency = {
            type = "cash",              -- "cash = Cash Only / "gold" = Gold Only
            amount = 70                 -- Cost to Start the Hunt in Selected Currency Type
        },
        legendary = {
            health = 500,                               -- Sets Legendary Animals Health Amount / Max is 1000?
            coords = vector3(-3621.65, -2923.94, 2.28), -- Legendary Animal Spawn Coords
            model = "a_c_snake_01",                     -- Ped Model of the Legendary Animal
            outfit = 3,                                 -- Set Outfit for Legendary Animal / Check Pastebin (https://pastebin.com/6Vc26NLL) or Alternatively Spooner
        },
        hintBox = vector3(-3414.79, -2731.47, -4.36),   -- Initial Hint Box Spawn Coords at Start of Hunt
        cooldown = 120,                                 -- Time in Minutes Before Anyone can Hunt this Animal Again
        rewards = {                                     -- Items Given at End of Successful Hunt (name MUST match item in Database)
            { name = "legfsnakes",     count = 1 },
            { name = "snaket",      count = 2 },
            { name = "snakeeye",      count = 2 },
        },
        npc = {
            enabled = true,                                   -- Enable / Disable Enemy NPCs
            model = "g_m_m_unibanditos_01",          -- Ped Model of Enemy NPCs
            blip = {
                sprite = -1282792512,                         -- Blip Sprite for Enemy NPCs
                coords = vector3(-3841.78, -3154.95, -13.07), -- Blip Coords for Enemy NPCs
            },
            coords = {                                        -- Enemy NPC Spawn Coords
                vector3(-3848.97, -3152.55, -13.04),
                vector3(-3858.95, -3157.43, -13.11),
                vector3(-3854.3, -3175.66, -13.04),
                vector3(-3831.0, -3178.34, -13.1),
            },
            hintBox = vector3(-3841.35, -3179.32, -12.63), -- Second Hint Box Spawn Coords / Available After Killing Enemy NPCs
        },
        secondaryAnimals = {                               -- Spawn Secondary Animals to Assist the Legendary Animal
            enabled = true,                                -- Enable / Disable Secondary Animals
            model = "a_c_snakeblacktailrattle_01",                        -- Model of the Secondary Animal. Make Sure this is NOT the Same Model as any Legendary Animals
            coords = {                                     -- Spawn Coords for Secondary Animals
                vector3(-3621.25, -2928.37, 2.72),
                vector3(-3626.32, -2930.1, 2.76),
                vector3(-3620.66, -2927.06, 2.61),
                vector3(-3617.53, -2923.84, 2.41),
                vector3(-3622.54, -2920.21, 2.02),
                vector3(-3629.87, -2924.75, 2.03),
                vector3(-3624.69, -2926.7, 4.09),
            },
        },
    },
    -----------------------------------------------------

    {
        name = "Legendary Ota Fox", -- Name of the Hunt in the Menu (Make Sure these are Unique)
        location = "AD",            -- Hunter Shop Location Key / MUST Match the Shop Key in "shops.lua" to Show in Menu
        level = 10,                 -- Level of Trust Needed to Start Hunt
        currency = {
            type = "cash",          -- "cash = Cash Only / "gold" = Gold Only
            amount = 70             -- Cost to Start the Hunt in Selected Currency Type
        },
        legendary = {
            health = 600,                                 -- Sets Legendary Animals Health Amount / Max is 1000?
            coords = vector3(-4497.55, -2842.55, -10.28), -- Legendary Animal Spawn Coords
            model = "mp_a_c_fox_01",                      -- Ped Model of the Legendary Animal
            outfit = 0,                                   -- Set Outfit for Legendary Animal / Check Pastebin (https://pastebin.com/6Vc26NLL) or Alternatively Spooner
        },
        hintBox = vector3(-3818.46, -2976.44, -6.28),     -- Initial Hint Box Spawn Coords at Start of Hunt
        cooldown = 120,                                   -- Time in Minutes Before Anyone can Hunt this Animal Again
        rewards = {                                       -- Items Given at End of Successful Hunt (name MUST match item in Database)
            { name = "legfoxs1", count = 1 },
            { name = "stringy",  count = 1 },
            { name = "foxt",     count = 2 },
        },
        npc = {
            enabled = true,                                   -- Enable / Disable Enemy NPCs
            model = "g_m_m_unibanditos_01",          -- Ped Model of Enemy NPCs
            blip = {
                sprite = -1282792512,                         -- Blip Sprite for Enemy NPCs
                coords = vector3(-4364.93, -3075.09, -10.04), -- Blip Coords for Enemy NPCs
            },
            coords = {                                        -- Enemy NPC Spawn Coords
                vector3(-4367.86, -3077.14, -9.93),
                vector3(-4363.23, -3077.75, -9.88),
                vector3(-4363.78, -3082.65, -10.12),
                vector3(-4371.15, -3077.19, -10.05),
                vector3(-4370.42, -3071.13, -10.02),
            },
            hintBox = vector3(-4367.85, -3074.7, -9.93), -- Second Hint Box Spawn Coords / Available After Killing Enemy NPCs
        },
        secondaryAnimals = {                             -- Spawn Secondary Animals to Assist the Legendary Animal
            enabled = true,                              -- Enable / Disable Secondary Animals
            model = "a_c_fox_01",                        -- Model of the Secondary Animal. Make Sure this is NOT the Same Model as any Legendary Animals
            coords = {                                   -- Spawn Coords for Secondary Animals
                vector3(-4481.41, -2845.44, -10.27),
                vector3(-4489.9, -2841.02, -10.83),
                vector3(-4488.47, -2849.76, -9.27),
                vector3(-4500.13, -2848.49, -9.47),
            },
        },
    },
    -----------------------------------------------------

    {
        name = "Legendary Coyote", -- Name of the Hunt in the Menu (Make Sure these are Unique)
        location = "AD",           -- Hunter Shop Location Key / MUST Match the Shop Key in "shops.lua" to Show in Menu
        level = 15,                -- Level of Trust Needed to Start Hunt
        currency = {
            type = "cash",         -- "cash = Cash Only / "gold" = Gold Only
            amount = 70            -- Cost to Start the Hunt in Selected Currency Type
        },
        legendary = {
            health = 700,                                -- Sets Legendary Animals Health Amount / Max is 1000?
            coords = vector3(-4004.01, -3479.46, 51.49), -- Legendary Animal Spawn Coords
            model = "a_c_coyote_01",                     -- Ped Model of the Legendary Animal
            outfit = 1,                                  -- Set Outfit for Legendary Animal / Check Pastebin (https://pastebin.com/6Vc26NLL) or Alternatively Spooner
        },
        hintBox = vector3(-3442.0, -2714.98, -4.18),     -- Initial Hint Box Spawn Coords at Start of Hunt
        cooldown = 120,                                  -- Time in Minutes Before Anyone can Hunt this Animal Again
        rewards = {                                      -- Items Given at End of Successful Hunt (name MUST match item in Database)
            { name = "legcoyotes", count = 1 },
            { name = "stringy",    count = 1 },
            { name = "coyotef",    count = 2 },
        },
        npc = {
            enabled = true,                                 -- Enable / Disable Enemy NPCs
            model = "g_m_m_unibanditos_01",        -- Ped Model of Enemy NPCs
            blip = {
                sprite = -1282792512,                       -- Blip Sprite for Enemy NPCs
                coords = vector3(-3846.6, -3009.02, -6.98), -- Blip Coords for Enemy NPCs
            },
            coords = {                                      -- Enemy NPC Spawn Coords
                vector3(-3843.31, -3011.24, -6.83),
                vector3(-3846.41, -3014.15, -6.9),
                vector3(-3851.12, -3009.29, -7.07),
                vector3(-3848.82, -3006.37, -7.02),
                vector3(-3844.53, -3005.42, -6.93),
            },
            hintBox = vector3(-3841.57, -3009.35, -6.87), -- Second Hint Box Spawn Coords / Available After Killing Enemy NPCs
        },
        secondaryAnimals = {                              -- Spawn Secondary Animals to Assist the Legendary Animal
            enabled = true,                               -- Enable / Disable Secondary Animals
            model = "a_c_coyote_01",                      -- Model of the Secondary Animal. Make Sure this is NOT the Same Model as any Legendary Animals
            coords = {                                    -- Spawn Coords for Secondary Animals
                vector3(-4007.14, -3479.21, 51.16),
                vector3(-4008.39, -3482.4, 50.61),
                vector3(-4004.97, -3486.11, 50.54),
                vector3(-3999.3, -3486.08, 51.22),
            },
        },
    },
    -----------------------------------------------------

    {
        name = "Legendary Milk Coyote", -- Name of the Hunt in the Menu (Make Sure these are Unique)
        location = "AD",                -- Hunter Shop Location Key / MUST Match the Shop Key in "shops.lua" to Show in Menu
        level = 20,                     -- Level of Trust Needed to Start Hunt
        currency = {
            type = "cash",              -- "cash = Cash Only / "gold" = Gold Only
            amount = 70                 -- Cost to Start the Hunt in Selected Currency Type
        },
        legendary = {
            health = 700,                                -- Sets Legendary Animals Health Amount / Max is 1000?
            coords = vector3(-4547.57, -3400.33, 30.94), -- Legendary Animal Spawn Coords
            model = "mp_a_c_coyote_01",                  -- Ped Model of the Legendary Animal
            outfit = 2,                                  -- Set Outfit for Legendary Animal / Check Pastebin (https://pastebin.com/6Vc26NLL) or Alternatively Spooner
        },
        hintBox = vector3(-3872.34, -3160.26, -13.0),    -- Initial Hint Box Spawn Coords at Start of Hunt
        cooldown = 120,                                  -- Time in Minutes Before Anyone can Hunt this Animal Again
        rewards = {                                      -- Items Given at End of Successful Hunt (name MUST match item in Database)
            { name = "legcoyotes3", count = 1 },
            { name = "stringy",     count = 1 },
            { name = "coyotef",     count = 2 },
        },
        npc = {
            enabled = true,                                 -- Enable / Disable Enemy NPCs
            model = "g_m_m_unibanditos_01",        -- Ped Model of Enemy NPCs
            blip = {
                sprite = -1282792512,                       -- Blip Sprite for Enemy NPCs
                coords = vector3(-3846.6, -3009.02, -6.98), -- Blip Coords for Enemy NPCs
            },
            coords = {                                      -- Enemy NPC Spawn Coords
                vector3(-3843.31, -3011.24, -6.83),
                vector3(-3846.41, -3014.15, -6.9),
                vector3(-3851.12, -3009.29, -7.07),
                vector3(-3848.82, -3006.37, -7.02),
                vector3(-3844.53, -3005.42, -6.93),
                vector3(-3851.4, -2992.98, -7.06),
            },
            hintBox = vector3(-3841.57, -3009.35, -6.87), -- Second Hint Box Spawn Coords / Available After Killing Enemy NPCs
        },
        secondaryAnimals = {                              -- Spawn Secondary Animals to Assist the Legendary Animal
            enabled = true,                               -- Enable / Disable Secondary Animals
            model = "a_c_coyote_01",                      -- Model of the Secondary Animal. Make Sure this is NOT the Same Model as any Legendary Animals
            coords = {                                    -- Spawn Coords for Secondary Animals
                vector3(-4548.33, -3404.09, 30.69),
                vector3(-4543.33, -3403.46, 31.16),
                vector3(-4540.29, -3399.0, 31.42),
                vector3(-4543.55, -3394.82, 31.54),
            },
        },
    },
    -----------------------------------------------------

    {
        name = "Legendary Red Streak Coyote", -- Name of the Hunt in the Menu (Make Sure these are Unique)
        location = "AD",                      -- Hunter Shop Location Key / MUST Match the Shop Key in "shops.lua" to Show in Menu
        level = 25,                           -- Level of Trust Needed to Start Hunt
        currency = {
            type = "cash",                    -- "cash = Cash Only / "gold" = Gold Only
            amount = 70                       -- Cost to Start the Hunt in Selected Currency Type
        },
        legendary = {
            health = 700,                              -- Sets Legendary Animals Health Amount / Max is 1000?
            coords = vector3(-3317.65, -2496.94, 3.9), -- Legendary Animal Spawn Coords
            model = "mp_a_c_coyote_01",                -- Ped Model of the Legendary Animal
            outfit = 2,                                -- Set Outfit for Legendary Animal / Check Pastebin (https://pastebin.com/6Vc26NLL) or Alternatively Spooner
        },
        hintBox = vector3(-3872.34, -3160.26, -13.0),  -- Initial Hint Box Spawn Coords at Start of Hunt
        cooldown = 120,                                -- Time in Minutes Before Anyone can Hunt this Animal Again
        rewards = {                                    -- Items Given at End of Successful Hunt (name MUST match item in Database)
            { name = "legcoyotes1", count = 1 },
            { name = "stringy",     count = 1 },
            { name = "coyotef",     count = 2 },
        },
        npc = {
            enabled = true,                                 -- Enable / Disable Enemy NPCs
            model = "g_m_m_unibanditos_01",        -- Ped Model of Enemy NPCs
            blip = {
                sprite = -1282792512,                       -- Blip Sprite for Enemy NPCs
                coords = vector3(-3846.6, -3009.02, -6.98), -- Blip Coords for Enemy NPCs
            },
            coords = {                                      -- Enemy NPC Spawn Coords
                vector3(-3843.31, -3011.24, -6.83),
                vector3(-3846.41, -3014.15, -6.9),
                vector3(-3851.12, -3009.29, -7.07),
                vector3(-3848.82, -3006.37, -7.02),
                vector3(-3844.53, -3005.42, -6.93),
                vector3(-3851.4, -2992.98, -7.06),
            },
            hintBox = vector3(-3841.57, -3009.35, -6.87), -- Second Hint Box Spawn Coords / Available After Killing Enemy NPCs
        },
        secondaryAnimals = {                              -- Spawn Secondary Animals to Assist the Legendary Animal
            enabled = true,                               -- Enable / Disable Secondary Animals
            model = "a_c_coyote_01",                      -- Model of the Secondary Animal. Make Sure this is NOT the Same Model as any Legendary Animals
            coords = {                                    -- Spawn Coords for Secondary Animals
                vector3(-3311.15, -2508.41, 8.75),
                vector3(-3319.95, -2510.41, 7.24),
                vector3(-3324.33, -2503.3, 3.22),
                vector3(-3319.09, -2487.28, 8.03),
            },
        },
    },
    -----------------------------------------------------

    {
        name = "Legendary Midnight Paw Coyote", -- Name of the Hunt in the Menu (Make Sure these are Unique)
        location = "AD",                        -- Hunter Shop Location Key / MUST Match the Shop Key in "shops.lua" to Show in Menu
        level = 30,                             -- Level of Trust Needed to Start Hunt
        currency = {
            type = "cash",                      -- "cash = Cash Only / "gold" = Gold Only
            amount = 70                         -- Cost to Start the Hunt in Selected Currency Type
        },
        legendary = {
            health = 700,                               -- Sets Legendary Animals Health Amount / Max is 1000?
            coords = vector3(-3714.85, -3602.87, 45.2), -- Legendary Animal Spawn Coords
            model = "mp_a_c_coyote_01",                 -- Ped Model of the Legendary Animal
            outfit = 2,                                 -- Set Outfit for Legendary Animal / Check Pastebin (https://pastebin.com/6Vc26NLL) or Alternatively Spooner
        },
        hintBox = vector3(-3940.04, -2171.31, -4.34),   -- Initial Hint Box Spawn Coords at Start of Hunt
        cooldown = 120,                                 -- Time in Minutes Before Anyone can Hunt this Animal Again
        rewards = {                                     -- Items Given at End of Successful Hunt (name MUST match item in Database)
            { name = "legcoyotes2", count = 1 },
            { name = "stringy",     count = 1 },
            { name = "coyotef",     count = 2 },
        },
        npc = {
            enabled = true,                                   -- Enable / Disable Enemy NPCs
            model = "g_m_m_unibanditos_01",          -- Ped Model of Enemy NPCs
            blip = {
                sprite = -1282792512,                         -- Blip Sprite for Enemy NPCs
                coords = vector3(-4364.93, -3075.09, -10.04), -- Blip Coords for Enemy NPCs
            },
            coords = {                                        -- Enemy NPC Spawn Coords
                vector3(-4367.86, -3077.14, -9.93),
                vector3(-4363.23, -3077.75, -9.88),
                vector3(-4363.78, -3082.65, -10.12),
                vector3(-4371.15, -3077.19, -10.05),
                vector3(-4370.42, -3071.13, -10.02),
                vector3(-4363.56, -3080.54, -10.12),
                vector3(-4368.52, -3084.53, -10.15),
            },
            hintBox = vector3(-4367.85, -3074.7, -9.93), -- Second Hint Box Spawn Coords / Available After Killing Enemy NPCs
        },
        secondaryAnimals = {                             -- Spawn Secondary Animals to Assist the Legendary Animal
            enabled = true,                              -- Enable / Disable Secondary Animals
            model = "a_c_coyote_01",                     -- Model of the Secondary Animal. Make Sure this is NOT the Same Model as any Legendary Animals
            coords = {                                   -- Spawn Coords for Secondary Animals
                vector3(-3720.03, -3601.07, 45.72),
                vector3(-3714.6, -3598.22, 46.08),
                vector3(-3705.43, -3602.95, 44.71),
                vector3(-3712.89, -3609.97, 43.31),
            },
        },
    },
    -----------------------------------------------------

    {
        name = "Legendary Ozula Elk", -- Name of the Hunt in the Menu (Make Sure these are Unique)
        location = "AD",              -- Hunter Shop Location Key / MUST Match the Shop Key in "shops.lua" to Show in Menu
        level = 35,                   -- Level of Trust Needed to Start Hunt
        currency = {
            type = "cash",            -- "cash = Cash Only / "gold" = Gold Only
            amount = 70               -- Cost to Start the Hunt in Selected Currency Type
        },
        legendary = {
            health = 1000,                              -- Sets Legendary Animals Health Amount / Max is 1000?
            coords = vector3(-5185.91, -3019.42, 8.0), -- Legendary Animal Spawn Coords
            model = "mp_a_c_elk_01",                   -- Ped Model of the Legendary Animal
            outfit = 2,                                -- Set Outfit for Legendary Animal / Check Pastebin (https://pastebin.com/6Vc26NLL) or Alternatively Spooner
        },
        hintBox = vector3(-4442.21, -2711.31, -11.32), -- Initial Hint Box Spawn Coords at Start of Hunt
        cooldown = 120,                                -- Time in Minutes Before Anyone can Hunt this Animal Again
        rewards = {                                    -- Items Given at End of Successful Hunt (name MUST match item in Database)
            { name = "legelks2",     count = 1 },
            { name = "legelkantler", count = 1 },
            { name = "biggame",      count = 2 },
        },
        npc = {
            enabled = true,                                   -- Enable / Disable Enemy NPCs
            model = "g_m_m_unibanditos_01",          -- Ped Model of Enemy NPCs
            blip = {
                sprite = -1282792512,                         -- Blip Sprite for Enemy NPCs
                coords = vector3(-5424.39, -3653.71, -22.04), -- Blip Coords for Enemy NPCs
            },
            coords = {                                        -- Enemy NPC Spawn Coords
                vector3(-5428.15, -3652.08, -22.02),
                vector3(-5421.36, -3650.95, -22.04),
                vector3(-5422.22, -3656.88, -22.14),
                vector3(-5413.94, -3647.81, -22.01),
                vector3(-5431.07, -3642.7, -22.14),
                vector3(-5428.79, -3664.66, -22.1),
                vector3(-5418.68, -3672.89, -21.98),
            },
            hintBox = vector3(-5421.4, -3650.83, -22.04), -- Second Hint Box Spawn Coords / Available After Killing Enemy NPCs
        },
        secondaryAnimals = {                              -- Spawn Secondary Animals to Assist the Legendary Animal
            enabled = true,                               -- Enable / Disable Secondary Animals
            model = "a_c_wolf_01",                        -- Model of the Secondary Animal. Make Sure this is NOT the Same Model as any Legendary Animals
            coords = {                                    -- Spawn Coords for Secondary Animals
                vector3(-5193.73, -3025.87, 7.66),
                vector3(-5184.55, -3030.52, 7.07),
                vector3(-5172.2, -3026.5, 7.34),
            },
        },
    },
    -----------------------------------------------------

    {
        name = "Legendary Wakpa Boar", -- Name of the Hunt in the Menu (Make Sure these are Unique)
        location = "AD",              -- Hunter Shop Location Key / MUST Match the Shop Key in "shops.lua" to Show in Menu
        level = 40,                   -- Level of Trust Needed to Start Hunt
        currency = {
            type = "cash",            -- "cash = Cash Only / "gold" = Gold Only
            amount = 70               -- Cost to Start the Hunt in Selected Currency Type
        },
        legendary = {
            health = 900,                              -- Sets Legendary Animals Health Amount / Max is 1000?
            coords = vector3(-1781.48, -2425.57, 44.39), -- Legendary Animal Spawn Coords
            model = "mp_a_c_boar_01",                   -- Ped Model of the Legendary Animal
            outfit = 1,                                -- Set Outfit for Legendary Animal / Check Pastebin (https://pastebin.com/6Vc26NLL) or Alternatively Spooner
        },
        hintBox = vector3(-3425.17, -3295.24, -6.19) , -- Initial Hint Box Spawn Coords at Start of Hunt
        cooldown = 120,                                -- Time in Minutes Before Anyone can Hunt this Animal Again
        rewards = {                                    -- Items Given at End of Successful Hunt (name MUST match item in Database)
            { name = "legboars2",   count = 1 },
            { name = "boartusk",    count = 1 },
            { name = "pork",        count = 2 },
        },
        npc = {
            enabled = true,                                   -- Enable / Disable Enemy NPCs
            model = "g_m_m_unibanditos_01",          -- Ped Model of Enemy NPCs
            blip = {
                sprite = -1282792512,                         -- Blip Sprite for Enemy NPCs
                coords = vector3(-2770.35, -3209.06, -7.91), -- Blip Coords for Enemy NPCs
            },
            coords = {                                        -- Enemy NPC Spawn Coords
                vector3(-2774.44, -3206.76, -7.81),
                vector3(-2774.54, -3210.63, -7.76),
                vector3(-2771.85, -3212.14, -7.87),
                vector3(-2769.04, -3212.58, -7.68),
                vector3(-2766.63, -3209.7, -7.81),
                vector3(-2766.77, -3214.68, -8.34),
                vector3(-2769.39, -3215.1, -8.48),
                vector3(-2773.41, -3215.09, -8.4),
                
            },
            hintBox = vector3(-2774.6, -3213.09, -7.8), -- Second Hint Box Spawn Coords / Available After Killing Enemy NPCs
        },
        secondaryAnimals = {                              -- Spawn Secondary Animals to Assist the Legendary Animal
            enabled = true,                               -- Enable / Disable Secondary Animals
            model = "A_C_Boar_01",                        -- Model of the Secondary Animal. Make Sure this is NOT the Same Model as any Legendary Animals
            coords = {                                    -- Spawn Coords for Secondary Animals
                vector3(-5193.73, -3025.87, 7.66),
                vector3(-5184.55, -3030.52, 7.07),
                vector3(-5172.2, -3026.5, 7.34),
            },
        },
    },
    -----------------------------------------------------

    {
        name = "Legendary Maza Cougar", -- Name of the Hunt in the Menu (Make Sure these are Unique)
        location = "AD",              -- Hunter Shop Location Key / MUST Match the Shop Key in "shops.lua" to Show in Menu
        level = 45,                   -- Level of Trust Needed to Start Hunt
        currency = {
            type = "cash",            -- "cash = Cash Only / "gold" = Gold Only
            amount = 70               -- Cost to Start the Hunt in Selected Currency Type
        },
        legendary = {
            health = 900,                                   -- Sets Legendary Animals Health Amount / Max is 1000?
            coords = vector3(-6252.3, -3611.1, -29.91),    -- Legendary Animal Spawn Coords
            model = "mp_a_c_cougar_01",                     -- Ped Model of the Legendary Animal
            outfit = 1,                                     -- Set Outfit for Legendary Animal / Check Pastebin (https://pastebin.com/6Vc26NLL) or Alternatively Spooner
        },
        hintBox = vector3(-5424.94, -3652.51, -22.04),      -- Initial Hint Box Spawn Coords at Start of Hunt
        cooldown = 120,                                     -- Time in Minutes Before Anyone can Hunt this Animal Again
        rewards = {                                         -- Items Given at End of Successful Hunt (name MUST match item in Database)
            { name = "legcougars2",     count = 1 },
            { name = "cougarf",         count = 2 },
            { name = "cougareye",       count = 2 },
        },
        npc = {
            enabled = true,                                   -- Enable / Disable Enemy NPCs
            model = "g_m_m_unibanditos_01",          -- Ped Model of Enemy NPCs
            blip = {
                sprite = -1282792512,                         -- Blip Sprite for Enemy NPCs
                coords = vector3(-4687.36, -3754.09, 13.13), -- Blip Coords for Enemy NPCs
            },
            coords = {                                        -- Enemy NPC Spawn Coords
                vector3(-4684.64, -3757.22, 13.26),
                vector3(-4686.83, -3758.95, 13.11),
                vector3(-4688.58, -3757.87, 13.05),
                vector3(-4691.16, -3756.74, 13.0),
                vector3(-4692.22, -3754.86, 13.11),
                vector3(-4692.27, -3752.24, 13.07),
                vector3(-4690.02, -3750.22, 12.96),
                vector3(-4689.76, -3747.92, 12.91),                               
            },
            hintBox = vector3(-4690.95, -3749.72, 12.96), -- Second Hint Box Spawn Coords / Available After Killing Enemy NPCs
        },
        secondaryAnimals = {                              -- Spawn Secondary Animals to Assist the Legendary Animal
            enabled = true,                               -- Enable / Disable Secondary Animals
            model = "a_c_wolf_medium",                        -- Model of the Secondary Animal. Make Sure this is NOT the Same Model as any Legendary Animals
            coords = {                                    -- Spawn Coords for Secondary Animals
                vector3(-6254.82, -3618.94, -27.67),
                vector3(-6238.3, -3600.37, -26.44),
                vector3(-6225.06, -3613.39, -29.1),
            },
        },
    },
    -----------------------------------------------------

    {
        name = "Legendary Sun Alligator", -- Name of the Hunt in the Menu (Make Sure these are Unique)
        location = "AD",              -- Hunter Shop Location Key / MUST Match the Shop Key in "shops.lua" to Show in Menu
        level = 50,                   -- Level of Trust Needed to Start Hunt
        currency = {
            type = "cash",            -- "cash = Cash Only / "gold" = Gold Only
            amount = 70               -- Cost to Start the Hunt in Selected Currency Type
        },
        legendary = {
            health = 900,                                   -- Sets Legendary Animals Health Amount / Max is 1000?
            coords = vector3(-3283.28, -3140.63, -9.42),    -- Legendary Animal Spawn Coords
            model = "mp_a_c_alligator_01",                     -- Ped Model of the Legendary Animal
            outfit = 1,                                     -- Set Outfit for Legendary Animal / Check Pastebin (https://pastebin.com/6Vc26NLL) or Alternatively Spooner
        },
        hintBox = vector3(-5852.75, -3739.84, -25.22),      -- Initial Hint Box Spawn Coords at Start of Hunt
        cooldown = 120,                                     -- Time in Minutes Before Anyone can Hunt this Animal Again
        rewards = {                                         -- Items Given at End of Successful Hunt (name MUST match item in Database)
            { name = "legaligators2",     count = 1 },
            { name = "aligatorto",         count = 2 },
            { name = "aligatormeat",       count = 2 },
        },
        npc = {
            enabled = true,                                   -- Enable / Disable Enemy NPCs
            model = "g_m_m_unibanditos_01",          -- Ped Model of Enemy NPCs
            blip = {
                sprite = -1282792512,                         -- Blip Sprite for Enemy NPCs
                coords = vector3(-5424.39, -3653.71, -22.04), -- Blip Coords for Enemy NPCs
            },
            coords = {                                        -- Enemy NPC Spawn Coords
                vector3(-5428.15, -3652.08, -22.02),
                vector3(-5421.36, -3650.95, -22.04),
                vector3(-5422.22, -3656.88, -22.14),
                vector3(-5413.94, -3647.81, -22.01),
                vector3(-5431.07, -3642.7, -22.14),
                vector3(-5428.79, -3664.66, -22.1),
                vector3(-5418.68, -3672.89, -21.98),
                vector3(-5429.28, -3645.09, -22.15),
            },
            hintBox = vector3(-5421.4, -3650.83, -22.04), -- Second Hint Box Spawn Coords / Available After Killing Enemy NPCs
        },
        secondaryAnimals = {                              -- Spawn Secondary Animals to Assist the Legendary Animal
            enabled = true,                               -- Enable / Disable Secondary Animals
            model = "a_c_wolf_medium",                        -- Model of the Secondary Animal. Make Sure this is NOT the Same Model as any Legendary Animals
            coords = {                                    -- Spawn Coords for Secondary Animals
                vector3(-3287.73, -3139.55, -9.28),
                vector3(-3283.86, -3133.08, -7.77),
                vector3(-3276.61, -3137.36, -9.04),
            },
        },
    },
    -----------------------------------------------------

    {
        name = "Legendary Iguga Cougar", -- Name of the Hunt in the Menu (Make Sure these are Unique)
        location = "AD",              -- Hunter Shop Location Key / MUST Match the Shop Key in "shops.lua" to Show in Menu
        level = 55,                   -- Level of Trust Needed to Start Hunt
        currency = {
            type = "cash",            -- "cash = Cash Only / "gold" = Gold Only
            amount = 70               -- Cost to Start the Hunt in Selected Currency Type
        },
        legendary = {
            health = 900,                                   -- Sets Legendary Animals Health Amount / Max is 1000?
            coords = vector3(-5267.93, -3200.59, -18.75),    -- Legendary Animal Spawn Coords
            model = "mp_a_c_cougar_01",                     -- Ped Model of the Legendary Animal
            outfit = 0,                                     -- Set Outfit for Legendary Animal / Check Pastebin (https://pastebin.com/6Vc26NLL) or Alternatively Spooner
        },
        hintBox = vector3(-5094.14, -2516.3, -11.03),      -- Initial Hint Box Spawn Coords at Start of Hunt
        cooldown = 120,                                     -- Time in Minutes Before Anyone can Hunt this Animal Again
        rewards = {                                         -- Items Given at End of Successful Hunt (name MUST match item in Database)
            { name = "legcougars1",     count = 1 },
            { name = "cougarf",         count = 2 },
            { name = "cougareye",       count = 2 },
        },
        npc = {
            enabled = true,                                   -- Enable / Disable Enemy NPCs
            model = "g_m_m_unibanditos_01",          -- Ped Model of Enemy NPCs
            blip = {
                sprite = -1282792512,                         -- Blip Sprite for Enemy NPCs
                coords = vector3(-3137.32, -2430.98, 33.14), -- Blip Coords for Enemy NPCs
            },
            coords = {                                        -- Enemy NPC Spawn Coords
                vector3(-3136.95, -2425.39, 33.14),
                vector3(-3140.24, -2424.15, 33.14),
                vector3(-3142.68, -2426.88, 33.14),
                vector3(-3145.83, -2430.72, 33.14),
                vector3(-3150.21, -2428.98, 33.14),
                vector3(-3147.93, -2424.43, 33.14),
                vector3(-3136.89, -2424.85, 33.14),
                vector3(-3136.14, -2429.92, 33.14),
                vector3(-3137.4, -2435.91, 33.14),
            },
            hintBox = vector3(-3128.74, -2429.7, 33.14), -- Second Hint Box Spawn Coords / Available After Killing Enemy NPCs
        },
        secondaryAnimals = {                              -- Spawn Secondary Animals to Assist the Legendary Animal
            enabled = true,                               -- Enable / Disable Secondary Animals
            model = "a_c_lionmangy_01",                        -- Model of the Secondary Animal. Make Sure this is NOT the Same Model as any Legendary Animals
            coords = {                                    -- Spawn Coords for Secondary Animals
                vector3(-5264.31, -3195.69, -18.49),
                vector3(-5274.99, -3209.04, -19.01),
                vector3(-5279.21, -3198.64, -18.98),
            },
        },
    },
   
    -----------------------------------------------------
    -- Blackwater
    -----------------------------------------------------

    {
        name = "Legendary Beaver", -- Name of the Hunt in the Menu (Make Sure these are Unique)
        location = "BW",           -- Hunter Shop Location Key / MUST Match the Shop Key in "shops.lua" to Show in Menu
        level = 0,                 -- Level of Trust Needed to Start Hunt
        currency = {
            type = "cash",         -- "cash = Cash Only / "gold" = Gold Only
            amount = 70            -- Cost to Start the Hunt in Selected Currency Type
        },
        legendary = {
            health = 500,                                -- Sets Legendary Animals Health Amount / Max is 1000?
            coords = vector3(-2442.11, -541.23, 144.36), -- Legendary Animal Spawn Coords
            model = "a_c_beaver_01",                     -- Ped Model of the Legendary Animal
            outfit = 1,                                  -- Set Outfit for Legendary Animal / Check Pastebin (https://pastebin.com/6Vc26NLL) or Alternatively Spooner
        },
        hintBox = vector3(-1397.58, -977.1, 62.74),      -- Initial Hint Box Spawn Coords at Start of Hunt
        cooldown = 120,                                  -- Time in Minutes Before Anyone can Hunt this Animal Again
        rewards = {                                      -- Items Given at End of Successful Hunt (name MUST match item in Database)
            { name = "legbeavers", count = 1 },
            { name = "beavertail", count = 1 },
            { name = "stringy",    count = 2 },
        },
        npc = {
            enabled = true,                                  -- Enable / Disable Enemy NPCs
            model = "a_m_m_huntertravelers_warm_01",         -- Ped Model of Enemy NPCs
            blip = {
                sprite = -1282792512,                        -- Blip Sprite for Enemy NPCs
                coords = vector3(-1497.17, -792.89, 102.96), -- Blip Coords for Enemy NPCs
            },
            coords = {                                       -- Enemy NPC Spawn Coords
                vector3(-1498.06, -786.41, 103.69),
                vector3(-1491.41, -797.29, 102.51),
                vector3(-1483.52, -777.94, 103.65),
                vector3(-1495.67, -760.75, 104.87),
            },
            hintBox = vector3(-1506.05, -785.26, 103.78), -- Second Hint Box Spawn Coords / Available After Killing Enemy NPCs
        },
        secondaryAnimals = {                              -- Spawn Secondary Animals to Assist the Legendary Animal
            enabled = true,                               -- Enable / Disable Secondary Animals
            model = "a_c_beaver_01",                      -- Model of the Secondary Animal. Make Sure this is NOT the Same Model as any Legendary Animals
            coords = {                                    -- Spawn Coords for Secondary Animals
                vector3(-2448.05, -541.24, 145.23),
                vector3(-2440.53, -544.78, 145.22),
            },
        },
    },
    -----------------------------------------------------

    {
        name = "Legendary Rutile Horn Ram", -- Name of the Hunt in the Menu (Make Sure these are Unique)
        location = "BW",                    -- Hunter Shop Location Key / MUST Match the Shop Key in "shops.lua" to Show in Menu
        level = 5,                          -- Level of Trust Needed to Start Hunt
        currency = {
            type = "cash",                  -- "cash = Cash Only / "gold" = Gold Only
            amount = 70                     -- Cost to Start the Hunt in Selected Currency Type
        },
        legendary = {
            health = 800,                                -- Sets Legendary Animals Health Amount / Max is 1000?
            coords = vector3(-1881.09, -155.52, 204.08), -- Legendary Animal Spawn Coords
            model = "mp_a_c_bighornram_01",              -- Ped Model of the Legendary Animal
            outfit = 2,                                  -- Set Outfit for Legendary Animal / Check Pastebin (https://pastebin.com/6Vc26NLL) or Alternatively Spooner
        },
        hintBox = vector3(-1388.8, -1401.5, 94.62),      -- Initial Hint Box Spawn Coords at Start of Hunt
        cooldown = 120,                                  -- Time in Minutes Before Anyone can Hunt this Animal Again
        rewards = {                                      -- Items Given at End of Successful Hunt (name MUST match item in Database)
            { name = "legrams",    count = 1 },
            { name = "legramhorn", count = 1 },
            { name = "Gamey_Meat", count = 2 },
        },
        npc = {
            enabled = true,                                 -- Enable / Disable Enemy NPCs
            model = "a_m_m_huntertravelers_warm_01",        -- Ped Model of Enemy NPCs
            blip = {
                sprite = -1282792512,                       -- Blip Sprite for Enemy NPCs
                coords = vector3(-1573.18, -917.18, 83.79), -- Blip Coords for Enemy NPCs
            },
            coords = {                                      -- Enemy NPC Spawn Coords
                vector3(-1572.99, -926.03, 84.57),
                vector3(-1580.07, -926.09, 84.57),
                vector3(-1592.36, -925.41, 84.5),
                vector3(-1584.11, -938.82, 83.83),
            },
            hintBox = vector3(-1576.41, -921.58, 83.95), -- Second Hint Box Spawn Coords / Available After Killing Enemy NPCs
        },
        secondaryAnimals = {                             -- Spawn Secondary Animals to Assist the Legendary Animal
            enabled = true,                              -- Enable / Disable Secondary Animals
            model = "a_c_bighornram_01",                 -- Model of the Secondary Animal. Make Sure this is NOT the Same Model as any Legendary Animals
            coords = {                                   -- Spawn Coords for Secondary Animals
                vector3(-1878.27, -156.64, 203.69),
                vector3(-1886.42, -160.32, 202.25),
            },
        },
    },
    -----------------------------------------------------

    {
        name = "Legendary Black Beaver", -- Name of the Hunt in the Menu (Make Sure these are Unique)
        location = "BW",                 -- Hunter Shop Location Key / MUST Match the Shop Key in "shops.lua" to Show in Menu
        level = 10,                      -- Level of Trust Needed to Start Hunt
        currency = {
            type = "cash",               -- "cash = Cash Only / "gold" = Gold Only
            amount = 70                  -- Cost to Start the Hunt in Selected Currency Type
        },
        legendary = {
            health = 500,                               -- Sets Legendary Animals Health Amount / Max is 1000?
            coords = vector3(-2478.78, -534.75, 146.4), -- Legendary Animal Spawn Coords
            model = "mp_a_c_beaver_01",                 -- Ped Model of the Legendary Animal
            outfit = 2,                                 -- Set Outfit for Legendary Animal / Check Pastebin (https://pastebin.com/6Vc26NLL) or Alternatively Spooner
        },
        hintBox = vector3(-1497.37, -1072.35, 66.68),   -- Initial Hint Box Spawn Coords at Start of Hunt
        cooldown = 120,                                 -- Time in Minutes Before Anyone can Hunt this Animal Again
        rewards = {                                     -- Items Given at End of Successful Hunt (name MUST match item in Database)
            { name = "lebeavers3", count = 1 },
            { name = "beavertail", count = 1 },
            { name = "stringy",    count = 2 },
        },
        npc = {
            enabled = true,                                  -- Enable / Disable Enemy NPCs
            model = "a_m_m_huntertravelers_warm_01",         -- Ped Model of Enemy NPCs
            blip = {
                sprite = -1282792512,                        -- Blip Sprite for Enemy NPCs
                coords = vector3(-2177.58, -247.56, 192.82), -- Blip Coords for Enemy NPCs
            },
            coords = {                                       -- Enemy NPC Spawn Coords
                vector3(-2172.46, -243.87, 192.38),
                vector3(-2166.15, -250.82, 192.28),
                vector3(-2176.14, -259.14, 191.6),
                vector3(-2182.42, -251.93, 191.98),
                vector3(-2177.07, -247.65, 192.82),
            },
            hintBox = vector3(-2180.11, -253.33, 191.94), -- Second Hint Box Spawn Coords / Available After Killing Enemy NPCs
        },
        secondaryAnimals = {                              -- Spawn Secondary Animals to Assist the Legendary Animal
            enabled = true,                               -- Enable / Disable Secondary Animals
            model = "A_C_Badger_01",                      -- Model of the Secondary Animal. Make Sure this is NOT the Same Model as any Legendary Animals
            coords = {                                    -- Spawn Coords for Secondary Animals
                vector3(-2467.81, -526.81, 142.54),
                vector3(-2482.75, -528.29, 145.61),
                vector3(-2471.66, -542.25, 147.6),
            },
        },
    },
    -----------------------------------------------------

    {
        name = "Legendary Great Horn Ram", -- Name of the Hunt in the Menu (Make Sure these are Unique)
        location = "BW",                   -- Hunter Shop Location Key / MUST Match the Shop Key in "shops.lua" to Show in Menu
        level = 15,                        -- Level of Trust Needed to Start Hunt
        currency = {
            type = "cash",                 -- "cash = Cash Only / "gold" = Gold Only
            amount = 70                    -- Cost to Start the Hunt in Selected Currency Type
        },
        legendary = {
            health = 800,                               -- Sets Legendary Animals Health Amount / Max is 1000?
            coords = vector3(-2217.22, -26.17, 267.21), -- Legendary Animal Spawn Coords
            model = "a_c_bighornram_01",                -- Ped Model of the Legendary Animal
            outfit = 12,                                -- Set Outfit for Legendary Animal / Check Pastebin (https://pastebin.com/6Vc26NLL) or Alternatively Spooner
        },
        hintBox = vector3(-1576.4, -921.45, 83.9),      -- Initial Hint Box Spawn Coords at Start of Hunt
        cooldown = 120,                                 -- Time in Minutes Before Anyone can Hunt this Animal Again
        rewards = {                                     -- Items Given at End of Successful Hunt (name MUST match item in Database)
            { name = "legrams4",   count = 1 },
            { name = "legramhorn", count = 1 },
            { name = "Gamey_Meat", count = 1 },
        },
        npc = {
            enabled = true,                                -- Enable / Disable Enemy NPCs
            model = "a_m_m_huntertravelers_warm_01",       -- Ped Model of Enemy NPCs
            blip = {
                sprite = -1282792512,                      -- Blip Sprite for Enemy NPCs
                coords = vector3(-1409.32, -248.3, 99.69), -- Blip Coords for Enemy NPCs
            },
            coords = {                                     -- Enemy NPC Spawn Coords
                vector3(-1408.13, -252.77, 99.68),
                vector3(-1415.26, -252.3, 99.78),
                vector3(-1415.79, -246.43, 99.78),
                vector3(-1415.83, -241.74, 99.86),
                vector3(-1412.08, -241.72, 99.8),
            },
            hintBox = vector3(-1413.95, -246.83, 99.76), -- Second Hint Box Spawn Coords / Available After Killing Enemy NPCs
        },
        secondaryAnimals = {                             -- Spawn Secondary Animals to Assist the Legendary Animal
            enabled = true,                              -- Enable / Disable Secondary Animals
            model = "a_c_bighornram_01",                 -- Model of the Secondary Animal. Make Sure this is NOT the Same Model as any Legendary Animals
            coords = {                                   -- Spawn Coords for Secondary Animals
                vector3(-2207.63, -22.22, 268.57),
                vector3(-2214.94, -33.13, 264.23),
                vector3(-2228.48, -30.89, 263.3),
            },
        },
    },
    -----------------------------------------------------

    {
        name = "Legendary Fox", -- Name of the Hunt in the Menu (Make Sure these are Unique)
        location = "BW",        -- Hunter Shop Location Key / MUST Match the Shop Key in "shops.lua" to Show in Menu
        level = 20,             -- Level of Trust Needed to Start Hunt
        currency = {
            type = "cash",      -- "cash = Cash Only / "gold" = Gold Only
            amount = 70         -- Cost to Start the Hunt in Selected Currency Type
        },
        legendary = {
            health = 600,                                -- Sets Legendary Animals Health Amount / Max is 1000?
            coords = vector3(-1828.77, -900.36, 106.36), -- Legendary Animal Spawn Coords
            model = "a_c_fox_01",                        -- Ped Model of the Legendary Animal
            outfit = 3,                                  -- Set Outfit for Legendary Animal / Check Pastebin (https://pastebin.com/6Vc26NLL) or Alternatively Spooner
        },
        hintBox = vector3(-1202.25, -1944.85, 43.34),    -- Initial Hint Box Spawn Coords at Start of Hunt
        cooldown = 120,                                  -- Time in Minutes Before Anyone can Hunt this Animal Again
        rewards = {                                      -- Items Given at End of Successful Hunt (name MUST match item in Database)
            { name = "legfoxskin", count = 1 },
            { name = "foxt",       count = 2 },
            { name = "stringy",    count = 2 },
        },
        npc = {
            enabled = true,                                   -- Enable / Disable Enemy NPCs
            model = "a_m_m_huntertravelers_warm_01",          -- Ped Model of Enemy NPCs
            blip = {
                sprite = -1282792512,                         -- Blip Sprite for Enemy NPCs
                coords = vector3(-2038.19, -1916.04, 110.18), -- Blip Coords for Enemy NPCs
            },
            coords = {                                        -- Enemy NPC Spawn Coords
                vector3(-2060.15, -1916.37, 113.04),
                vector3(-2065.62, -1924.76, 113.17),
                vector3(-2041.66, -1899.93, 110.36),
                vector3(-2039.64, -1893.68, 110.28),
                vector3(-2053.41, -1900.97, 111.34),
                vector3(-2053.15, -1930.37, 112.98),
            },
            hintBox = vector3(-2033.57, -1902.58, 110.26), -- Second Hint Box Spawn Coords / Available After Killing Enemy NPCs
        },
        secondaryAnimals = {                               -- Spawn Secondary Animals to Assist the Legendary Animal
            enabled = true,                                -- Enable / Disable Secondary Animals
            model = "a_c_fox_01",                          -- Model of the Secondary Animal. Make Sure this is NOT the Same Model as any Legendary Animals
            coords = {                                     -- Spawn Coords for Secondary Animals
                vector3(-1825.21, -898.54, 106.23),
                vector3(-1828.72, -910.24, 106.61),
                vector3(-1839.2, -894.5, 107.01),
            },
        },
    },
    -----------------------------------------------------

    {
        name = "Legendary Boar", -- Name of the Hunt in the Menu (Make Sure these are Unique)
        location = "BW",         -- Hunter Shop Location Key / MUST Match the Shop Key in "shops.lua" to Show in Menu
        level = 25,              -- Level of Trust Needed to Start Hunt
        currency = {
            type = "cash",       -- "cash = Cash Only / "gold" = Gold Only
            amount = 70          -- Cost to Start the Hunt in Selected Currency Type
        },
        legendary = {
            health = 900,                               -- Sets Legendary Animals Health Amount / Max is 1000?
            coords = vector3(-2006.3, -307.81, 190.13), -- Legendary Animal Spawn Coords
            model = "mp_a_c_boar_01",                   -- Ped Model of the Legendary Animal
            outfit = 2,                                 -- Set Outfit for Legendary Animal / Check Pastebin (https://pastebin.com/6Vc26NLL) or Alternatively Spooner
        },
        hintBox = vector3(-866.73, -730.91, 59.84),     -- Initial Hint Box Spawn Coords at Start of Hunt
        cooldown = 120,                                 -- Time in Minutes Before Anyone can Hunt this Animal Again
        rewards = {                                     -- Items Given at End of Successful Hunt (name MUST match item in Database)
            { name = "legboars4", count = 1 },
            { name = "boartusk",  count = 2 },
            { name = "fat",       count = 2 },
            { name = "pork",      count = 2 },
        },
        npc = {
            enabled = true,                                  -- Enable / Disable Enemy NPCs
            model = "a_m_m_huntertravelers_warm_01",         -- Ped Model of Enemy NPCs
            blip = {
                sprite = -1282792512,                        -- Blip Sprite for Enemy NPCs
                coords = vector3(-1419.19, -232.79, 100.49), -- Blip Coords for Enemy NPCs
            },
            coords = {                                       -- Enemy NPC Spawn Coords
                vector3(-1415.9, -241.08, 99.89),
                vector3(-1415.91, -246.37, 99.79),
                vector3(-1415.41, -251.78, 99.78),
                vector3(-1408.82, -252.91, 99.69),
                vector3(-1411.62, -242.06, 99.78),
                vector3(-1403.09, -233.94, 100.05),
            },
            hintBox = vector3(-1429.32, -226.45, 100.97), -- Second Hint Box Spawn Coords / Available After Killing Enemy NPCs
        },
        secondaryAnimals = {                              -- Spawn Secondary Animals to Assist the Legendary Animal
            enabled = true,                               -- Enable / Disable Secondary Animals
            model = "a_c_boar_01",                        -- Model of the Secondary Animal. Make Sure this is NOT the Same Model as any Legendary Animals
            coords = {                                    -- Spawn Coords for Secondary Animals
                vector3(-2003.09, -312.36, 189.88),
                vector3(-1998.97, -308.26, 190.33),
                vector3(-1993.53, -311.05, 190.28),
            },
        },
    },
    -----------------------------------------------------

    {
        name = "Legendary Inahme Elk", -- Name of the Hunt in the Menu (Make Sure these are Unique)
        location = "BW",               -- Hunter Shop Location Key / MUST Match the Shop Key in "shops.lua" to Show in Menu
        level = 30,                    -- Level of Trust Needed to Start Hunt
        currency = {
            type = "cash",             -- "cash = Cash Only / "gold" = Gold Only
            amount = 70                -- Cost to Start the Hunt in Selected Currency Type
        },
        legendary = {
            health = 1000,                               -- Sets Legendary Animals Health Amount / Max is 1000?
            coords = vector3(-2063.7, -329.62, 174.43), -- Legendary Animal Spawn Coords
            model = "mp_a_c_elk_01",                    -- Ped Model of the Legendary Animal
            outfit = 3,                                 -- Set Outfit for Legendary Animal / Check Pastebin (https://pastebin.com/6Vc26NLL) or Alternatively Spooner
        },
        hintBox = vector3(-862.73, -742.68, 56.97),     -- Initial Hint Box Spawn Coords at Start of Hunt
        cooldown = 120,                                 -- Time in Minutes Before Anyone can Hunt this Animal Again
        rewards = {                                     -- Items Given at End of Successful Hunt (name MUST match item in Database)
            { name = "legelks",      count = 1 },
            { name = "legelkantler", count = 2 },
            { name = "biggame",      count = 2 },
        },
        npc = {
            enabled = true,                                  -- Enable / Disable Enemy NPCs
            model = "a_m_m_huntertravelers_warm_01",         -- Ped Model of Enemy NPCs
            blip = {
                sprite = -1282792512,                        -- Blip Sprite for Enemy NPCs
                coords = vector3(-1502.04, -770.37, 104.56), -- Blip Coords for Enemy NPCs
            },
            coords = {                                       -- Enemy NPC Spawn Coords
                vector3(-1479.72, -764.4, 104.46),
                vector3(-1481.19, -768.07, 104.47),
                vector3(-1506.04, -752.74, 110.71),
                vector3(-1505.86, -784.65, 103.81),
                vector3(-1502.96, -786.75, 103.69),
                vector3(-1494.81, -801.49, 102.45),
            },
            hintBox = vector3(-1508.44, -756.42, 106.14), -- Second Hint Box Spawn Coords / Available After Killing Enemy NPCs
        },
        secondaryAnimals = {                              -- Spawn Secondary Animals to Assist the Legendary Animal
            enabled = true,                               -- Enable / Disable Secondary Animals
            model = "a_c_elk_01",                         -- Model of the Secondary Animal. Make Sure this is NOT the Same Model as any Legendary Animals
            coords = {                                    -- Spawn Coords for Secondary Animals
                vector3(-2062.94, -335.14, 172.52),
                vector3(-2056.39, -333.75, 171.77),
                vector3(-2058.88, -325.23, 174.99),
            },
        },
    },
    -----------------------------------------------------

    {
        name = "Legendary Wolf", -- Name of the Hunt in the Menu (Make Sure these are Unique)
        location = "BW",         -- Hunter Shop Location Key / MUST Match the Shop Key in "shops.lua" to Show in Menu
        level = 35,              -- Level of Trust Needed to Start Hunt
        currency = {
            type = "cash",       -- "cash = Cash Only / "gold" = Gold Only
            amount = 70          -- Cost to Start the Hunt in Selected Currency Type
        },
        legendary = {
            health = 900,                                -- Sets Legendary Animals Health Amount / Max is 1000?
            coords = vector3(-2431.4, -1003.28, 168.09), -- Legendary Animal Spawn Coords
            model = "a_c_wolf",                          -- Ped Model of the Legendary Animal
            outfit = 3,                                  -- Set Outfit for Legendary Animal / Check Pastebin (https://pastebin.com/6Vc26NLL) or Alternatively Spooner
        },
        hintBox = vector3(-2074.18, -1892.26, 113.48),   -- Initial Hint Box Spawn Coords at Start of Hunt
        cooldown = 120,                                  -- Time in Minutes Before Anyone can Hunt this Animal Again
        rewards = {                                      -- Items Given at End of Successful Hunt (name MUST match item in Database)
            { name = "legwolfpelt", count = 1 },
            { name = "wolftooth",   count = 2 },
            { name = "wolfheart",   count = 1 },
        },
        npc = {
            enabled = true,                                 -- Enable / Disable Enemy NPCs
            model = "a_m_m_huntertravelers_warm_01",        -- Ped Model of Enemy NPCs
            blip = {
                sprite = -1282792512,                       -- Blip Sprite for Enemy NPCs
                coords = vector3(-1578.36, -918.06, 83.79), -- Blip Coords for Enemy NPCs
            },
            coords = {                                      -- Enemy NPC Spawn Coords
                vector3(-1552.26, -918.32, 89.49),
                vector3(-1571.79, -901.98, 84.47),
                vector3(-1595.97, -921.93, 84.62),
                vector3(-1583.5, -932.06, 84.0),
                vector3(-1581.17, -924.46, 84.56),
                vector3(-1576.04, -926.07, 84.58),
                vector3(-1574.1, -932.4, 84.02),
            },
            hintBox = vector3(-1571.19, -927.96, 84.21), -- Second Hint Box Spawn Coords / Available After Killing Enemy NPCs
        },
        secondaryAnimals = {                             -- Spawn Secondary Animals to Assist the Legendary Animal
            enabled = true,                              -- Enable / Disable Secondary Animals
            model = "a_c_wolf_medium",                   -- Model of the Secondary Animal. Make Sure this is NOT the Same Model as any Legendary Animals
            coords = {                                   -- Spawn Coords for Secondary Animals
                vector3(-2441.12, -998.56, 168.6),
                vector3(-2419.08, -989.44, 168.0),
                vector3(-2416.94, -1005.75, 167.85),
            },
        },
    },
    -----------------------------------------------------

    {
        name = "Legendary Giaguaro Cougar", -- Name of the Hunt in the Menu (Make Sure these are Unique)
        location = "BW",                    -- Hunter Shop Location Key / MUST Match the Shop Key in "shops.lua" to Show in Menu
        level = 40,                         -- Level of Trust Needed to Start Hunt
        currency = {
            type = "cash",                  -- "cash = Cash Only / "gold" = Gold Only
            amount = 70                     -- Cost to Start the Hunt in Selected Currency Type
        },
        legendary = {
            health = 900,                                -- Sets Legendary Animals Health Amount / Max is 1000?
            coords = vector3(-1277.06, -1937.63, 46.72), -- Legendary Animal Spawn Coords
            model = "a_c_cougar_01",                     -- Ped Model of the Legendary Animal
            outfit = 5,                                  -- Set Outfit for Legendary Animal / Check Pastebin (https://pastebin.com/6Vc26NLL) or Alternatively Spooner
        },
        hintBox = vector3(-761.93, -398.46, 41.88),      -- Initial Hint Box Spawn Coords at Start of Hunt
        cooldown = 120,                                  -- Time in Minutes Before Anyone can Hunt this Animal Again
        rewards = {                                      -- Items Given at End of Successful Hunt (name MUST match item in Database)
            { name = "legcougars1", count = 1 },
            { name = "cougarf",     count = 2 },
        },
        npc = {
            enabled = true,                                  -- Enable / Disable Enemy NPCs
            model = "a_m_m_huntertravelers_warm_01",         -- Ped Model of Enemy NPCs
            blip = {
                sprite = -1282792512,                        -- Blip Sprite for Enemy NPCs
                coords = vector3(-1499.43, -779.17, 104.35), -- Blip Coords for Enemy NPCs
            },
            coords = {                                       -- Enemy NPC Spawn Coords
                vector3(-1485.05, -786.86, 102.62),
                vector3(-1503.38, -792.18, 104.43),
                vector3(-1506.87, -780.96, 110.81),
                vector3(-1507.91, -777.32, 110.72),
                vector3(-1508.99, -755.96, 106.35),
                vector3(-1476.46, -761.3, 104.23),
                vector3(-1474.62, -766.93, 104.31),
                vector3(-1472.48, -775.07, 103.57),
            },
            hintBox = vector3(-1503.36, -779.84, 110.7), -- Second Hint Box Spawn Coords / Available After Killing Enemy NPCs
        },
        secondaryAnimals = {                             -- Spawn Secondary Animals to Assist the Legendary Animal
            enabled = true,                              -- Enable / Disable Secondary Animals
            model = "a_c_wolf_medium",                   -- Model of the Secondary Animal. Make Sure this is NOT the Same Model as any Legendary Animals
            coords = {                                   -- Spawn Coords for Secondary Animals
                vector3(-1279.16, -1944.01, 46.26),
                vector3(-1268.26, -1939.75, 45.18),
                vector3(-1265.02, -1928.12, 47.22),
            },
        },
    },
    -----------------------------------------------------

    {
        name = "Legendary Golden Spirit Bear", -- Name of the Hunt in the Menu (Make Sure these are Unique)
        location = "BW",                       -- Hunter Shop Location Key / MUST Match the Shop Key in "shops.lua" to Show in Menu
        level = 45,                            -- Level of Trust Needed to Start Hunt
        currency = {
            type = "cash",                     -- "cash = Cash Only / "gold" = Gold Only
            amount = 70                        -- Cost to Start the Hunt in Selected Currency Type
        },
        legendary = {
            health = 1000,                                 -- Sets Legendary Animals Health Amount / Max is 1000?
            coords = vector3(-2766.08, -1436.83, 162.36), -- Legendary Animal Spawn Coords
            model = "mp_a_c_bear_01",                     -- Ped Model of the Legendary Animal
            outfit = 3,                                   -- Set Outfit for Legendary Animal / Check Pastebin (https://pastebin.com/6Vc26NLL) or Alternatively Spooner
        },
        hintBox = vector3(-1188.89, -1786.44, 62.52),     -- Initial Hint Box Spawn Coords at Start of Hunt
        cooldown = 120,                                   -- Time in Minutes Before Anyone can Hunt this Animal Again
        rewards = {                                       -- Items Given at End of Successful Hunt (name MUST match item in Database)
            { name = "legbears4", count = 1 },
            { name = "beart",     count = 2 },
            { name = "bearc",     count = 1 },
        },
        npc = {
            enabled = true,                                  -- Enable / Disable Enemy NPCs
            model = "a_m_m_huntertravelers_warm_01",         -- Ped Model of Enemy NPCs
            blip = {
                sprite = -1282792512,                        -- Blip Sprite for Enemy NPCs
                coords = vector3(-2098.55, -2107.92, 48.94), -- Blip Coords for Enemy NPCs
            },
            coords = {                                       -- Enemy NPC Spawn Coords
                vector3(-2089.61, -2076.21, 58.16),
                vector3(-2074.89, -2071.51, 66.54),
                vector3(-2069.27, -2076.51, 68.1),
                vector3(-2072.0, -2090.81, 61.29),
                vector3(-2073.36, -2106.5, 54.45),
                vector3(-2087.53, -2090.15, 57.22),
                vector3(-2117.64, -2098.31, 50.79),
                vector3(-2107.59, -2111.14, 49.63),
            },
            hintBox = vector3(-2089.65, -2083.8, 57.69), -- Second Hint Box Spawn Coords / Available After Killing Enemy NPCs
        },
        secondaryAnimals = {                             -- Spawn Secondary Animals to Assist the Legendary Animal
            enabled = true,                              -- Enable / Disable Secondary Animals
            model = "a_c_wolf_medium",                   -- Model of the Secondary Animal. Make Sure this is NOT the Same Model as any Legendary Animals
            coords = {                                   -- Spawn Coords for Secondary Animals
                vector3(-2756.85, -1432.93, 161.06),
                vector3(-2757.34, -1445.87, 157.4),
                vector3(-2753.7, -1460.42, 159.14),
                vector3(-2733.12, -1426.78, 156.76),
            },
        },
    },
    -----------------------------------------------------

    {
        name = "Legendary Iwakta Panther", -- Name of the Hunt in the Menu (Make Sure these are Unique)
        location = "BW",                   -- Hunter Shop Location Key / MUST Match the Shop Key in "shops.lua" to Show in Menu
        level = 50,                        -- Level of Trust Needed to Start Hunt
        currency = {
            type = "cash",                 -- "cash = Cash Only / "gold" = Gold Only
            amount = 70                    -- Cost to Start the Hunt in Selected Currency Type
        },
        legendary = {
            health = 900,                                 -- Sets Legendary Animals Health Amount / Max is 1000?
            coords = vector3(-2534.03, 1167.09, 224.97), -- Legendary Animal Spawn Coords
            model = "mp_a_c_panther_01",                  -- Ped Model of the Legendary Animal
            outfit = 2,                                   -- Set Outfit for Legendary Animal / Check Pastebin (https://pastebin.com/6Vc26NLL) or Alternatively Spooner
        },
        hintBox = vector3(-1577.98, -942.26, 84.02),      -- Initial Hint Box Spawn Coords at Start of Hunt
        cooldown = 120,                                   -- Time in Minutes Before Anyone can Hunt this Animal Again
        rewards = {                                       -- Items Given at End of Successful Hunt (name MUST match item in Database)
            { name = "legpanthers3", count = 1 },
            { name = "panthere",     count = 2 },
        },
        npc = {
            enabled = true,                                  -- Enable / Disable Enemy NPCs
            model = "a_m_m_huntertravelers_warm_01",         -- Ped Model of Enemy NPCs
            blip = {
                sprite = -1282792512,                        -- Blip Sprite for Enemy NPCs
                coords = vector3(-1519.89, 514.85, 101.48), -- Blip Coords for Enemy NPCs
            },
            coords = {                                       -- Enemy NPC Spawn Coords
                vector3(-1532.23, 507.23, 102.17),
                vector3(-1533.45, 515.91, 102.24),
                vector3(-1535.02, 521.62, 102.47),
                vector3(-1530.3, 525.93, 102.49),
                vector3(-1530.88, 541.6, 103.04),
                vector3(-1512.86, 530.98, 102.44),
                vector3(-1506.22, 517.07, 102.18),
                vector3(-1502.2, 501.93, 101.96),
                vector3(-1519.67, 519.85, 101.77),
            },
            hintBox = vector3(-1521.3, 517.34, 102.04), -- Second Hint Box Spawn Coords / Available After Killing Enemy NPCs
        },
        secondaryAnimals = {                             -- Spawn Secondary Animals to Assist the Legendary Animal
            enabled = true,                              -- Enable / Disable Secondary Animals
            model = "a_c_wolf_medium",                   -- Model of the Secondary Animal. Make Sure this is NOT the Same Model as any Legendary Animals
            coords = {                                   -- Spawn Coords for Secondary Animals
                vector3(-2528.47, 1162.22, 224.58),
                vector3(-2533.96, 1155.23, 222.73),
                vector3(-2541.6, 1156.08, 222.62),
                vector3(-2550.65, 1164.7, 224.28),
            },
        },
    },
    -----------------------------------------------------

    {
        name = "Legendary Bull Gator", -- Name of the Hunt in the Menu (Make Sure these are Unique)
        location = "BW",               -- Hunter Shop Location Key / MUST Match the Shop Key in "shops.lua" to Show in Menu
        level = 55,                    -- Level of Trust Needed to Start Hunt
        currency = {
            type = "cash",             -- "cash = Cash Only / "gold" = Gold Only
            amount = 70                -- Cost to Start the Hunt in Selected Currency Type
        },
        legendary = {
            health = 1000,                                -- Sets Legendary Animals Health Amount / Max is 1000?
            coords = vector3(-1622.44, -2097.84, 42.53), -- Legendary Animal Spawn Coords
            model = "a_c_alligator_02",                  -- Ped Model of the Legendary Animal
            outfit = 0,                                  -- Set Outfit for Legendary Animal / Check Pastebin (https://pastebin.com/6Vc26NLL) or Alternatively Spooner
        },
        hintBox = vector3(-1824.64, -627.4, 155.22),     -- Initial Hint Box Spawn Coords at Start of Hunt
        cooldown = 120,                                  -- Time in Minutes Before Anyone can Hunt this Animal Again
        rewards = {                                      -- Items Given at End of Successful Hunt (name MUST match item in Database)
            { name = "legaligators", count = 1 },
            { name = "aligatorto",   count = 2 },
            { name = "aligatormeat", count = 2 },
        },
        npc = {
            enabled = true,                                   -- Enable / Disable Enemy NPCs
            model = "a_m_m_huntertravelers_warm_01",          -- Ped Model of Enemy NPCs
            blip = {
                sprite = -1282792512,                         -- Blip Sprite for Enemy NPCs
                coords = vector3(-2053.32, -1911.79, 112.05), -- Blip Coords for Enemy NPCs
            },
            coords = {                                        -- Enemy NPC Spawn Coords
                vector3(-2060.84, -1917.0, 113.09),
                vector3(-2069.45, -1907.13, 112.96),
                vector3(-2060.31, -1898.18, 112.13),
                vector3(-2078.36, -1897.47, 113.29),
                vector3(-2053.6, -1891.36, 111.47),
                vector3(-2040.82, -1895.77, 110.26),
                vector3(-2023.59, -1894.48, 110.15),
                vector3(-2021.93, -1918.31, 109.13),
                vector3(-2036.88, -1931.55, 109.42),
                vector3(-2016.07, -1919.88, 108.86),
            },
            hintBox = vector3(-2061.18, -1926.13, 113.35), -- Second Hint Box Spawn Coords / Available After Killing Enemy NPCs
        },
        secondaryAnimals = {                               -- Spawn Secondary Animals to Assist the Legendary Animal
            enabled = true,                                -- Enable / Disable Secondary Animals
            model = "A_C_Alligator_01",                    -- Model of the Secondary Animal. Make Sure this is NOT the Same Model as any Legendary Animals
            coords = {                                     -- Spawn Coords for Secondary Animals
                vector3(-1621.18, -2083.75, 41.75),
                vector3(-1614.98, -2102.19, 41.65),
                vector3(-1617.5, -2111.22, 42.52),
                vector3(-1633.26, -2093.75, 45.07),
            },
        },
    },
    -----------------------------------------------------

    {
        name = "Legendary Sapa Cougar", -- Name of the Hunt in the Menu (Make Sure these are Unique)
        location = "BW",              -- Hunter Shop Location Key / MUST Match the Shop Key in "shops.lua" to Show in Menu
        level = 60,                   -- Level of Trust Needed to Start Hunt
        currency = {
            type = "cash",            -- "cash = Cash Only / "gold" = Gold Only
            amount = 70               -- Cost to Start the Hunt in Selected Currency Type
        },
        legendary = {
            health = 900,                            -- Sets Legendary Animals Health Amount / Max is 1000?
            coords = vector3(-1387.66, -1398.83, 94.33), -- Legendary Animal Spawn Coords
            model = "mp_a_c_cougar_01",            -- Ped Model of the Legendary Animal
            outfit = 2,                              -- Set Outfit for Legendary Animal / Check Pastebin (https://pastebin.com/6Vc26NLL) or Alternatively Spooner
        },
        hintBox = vector3(-1046.24, 420.29, 47.46),   -- Initial Hint Box Spawn Coords at Start of Hunt
        cooldown = 120,                              -- Time in Minutes Before Anyone can Hunt this Animal Again
        rewards = {                                  -- Items Given at End of Successful Hunt (name MUST match item in Database)
            { name = "legcougars3", count = 1 },
            { name = "cougarf", count = 2 },
            { name = "cougareye", count = 2 },
        },
        npc = {
            enabled = true,                                 -- Enable / Disable Enemy NPCs vector3(2250.19, -768.52, 42.81)
            model = "a_m_m_huntertravelers_warm_01",        -- Ped Model of Enemy NPCs
            blip = {
                sprite = -1282792512,                       -- Blip Sprite for Enemy NPCs
                vector3(-2545.13, 1159.7, 223.38), -- Blip Coords for Enemy NPCs
            },
            coords = {                                      -- Enemy NPC Spawn Coords
                vector3(-2542.19, 1157.37, 222.95),
                vector3(-2554.54, 1156.98, 222.51),
                vector3(-2551.7, 1164.48, 224.41),
                vector3(-2542.97, 1163.24, 223.95),
                vector3(-2539.18, 1166.69, 224.77),
                vector3(-2531.18, 1166.97, 225.02),
                vector3(-2538.46, 1171.29, 225.49),
                vector3(-2525.18, 1159.88, 224.21),
                vector3(-2528.69, 1151.43, 222.41),
            },
            hintBox = vector3(-2540.6, 1170.08, 225.34), -- Second Hint Box Spawn Coords / Available After Killing Enemy NPCs
        },
        secondaryAnimals = {                          -- Spawn Secondary Animals to Assist the Legendary Animal
            enabled = true,                           -- Enable / Disable Secondary Animals
            model = "a_c_cougar_01",    -- Model of the Secondary Animal. Make Sure this is NOT the Same Model as any Legendary Animals
            coords = {                                -- Spawn Coords for Secondary Animals
                vector3(-1383.74, -1402.8, 94.43),
                vector3(-1386.6, -1406.06, 94.56),
                vector3(-1391.34, -1397.25, 94.0),
            },
        },
    },
    -----------------------------------------------------
    -- Cat Tail Pond
    -----------------------------------------------------

    {
        name = "Legendary Cross Fox", -- Name of the Hunt in the Menu (Make Sure these are Unique)
        location = "CTP",             -- Hunter Shop Location Key / MUST Match the Shop Key in "shops.lua" to Show in Menu
        level = 0,                    -- Level of Trust Needed to Start Hunt
        currency = {
            type = "cash",            -- "cash = Cash Only / "gold" = Gold Only
            amount = 70               -- Cost to Start the Hunt in Selected Currency Type
        },
        legendary = {
            health = 600,                              -- Sets Legendary Animals Health Amount / Max is 1000?
            coords = vector3(150.07, 1845.12, 200.57), -- Legendary Animal Spawn Coords
            model = "mp_a_c_fox_01",                   -- Ped Model of the Legendary Animal
            outfit = 2,                                -- Set Outfit for Legendary Animal / Check Pastebin (https://pastebin.com/6Vc26NLL) or Alternatively Spooner
        },
        hintBox = vector3(-468.45, 1412.87, 208.68),   -- Initial Hint Box Spawn Coords at Start of Hunt
        cooldown = 120,                                -- Time in Minutes Before Anyone can Hunt this Animal Again
        rewards = {                                    -- Items Given at End of Successful Hunt (name MUST match item in Database)
            { name = "legfox3", count = 1 },
            { name = "foxt",    count = 2 },
            { name = "stringy", count = 2 },
        },
        npc = {
            enabled = true,                                 -- Enable / Disable Enemy NPCs
            model = "g_m_m_unimountainmen_01",        -- Ped Model of Enemy NPCs
            blip = {
                sprite = -1282792512,                       -- Blip Sprite for Enemy NPCs
                coords = vector3(-156.63, 1481.09, 115.12), -- Blip Coords for Enemy NPCs
            },
            coords = {                                      -- Enemy NPC Spawn Coords
                vector3(-156.13, 1491.15, 116.16),
                vector3(-157.57, 1486.53, 115.67),
                vector3(-153.46, 1488.34, 116.19),
                vector3(-152.89, 1493.27, 115.64),
            },
            hintBox = vector3(-151.74, 1488.42, 115.35), -- Second Hint Box Spawn Coords / Available After Killing Enemy NPCs
        },
        secondaryAnimals = {                             -- Spawn Secondary Animals to Assist the Legendary Animal
            enabled = true,                              -- Enable / Disable Secondary Animals
            model = "a_c_fox_01",                        -- Model of the Secondary Animal. Make Sure this is NOT the Same Model as any Legendary Animals
            coords = {                                   -- Spawn Coords for Secondary Animals
                vector3(148.59, 1841.01, 200.56),
                vector3(157.19, 1849.6, 200.71),
            },
        },
    },
    -----------------------------------------------------

    {
        name = "Legendary Chalk Ram", -- Name of the Hunt in the Menu (Make Sure these are Unique)
        location = "CTP",             -- Hunter Shop Location Key / MUST Match the Shop Key in "shops.lua" to Show in Menu
        level = 5,                    -- Level of Trust Needed to Start Hunt
        currency = {
            type = "cash",            -- "cash = Cash Only / "gold" = Gold Only
            amount = 70               -- Cost to Start the Hunt in Selected Currency Type
        },
        legendary = {
            health = 800,                                -- Sets Legendary Animals Health Amount / Max is 1000?
            coords = vector3(-1428.07, 1524.95, 232.22), -- Legendary Animal Spawn Coords
            model = "mp_a_c_bighornram_01",              -- Ped Model of the Legendary Animal
            outfit = 1,                                  -- Set Outfit for Legendary Animal / Check Pastebin (https://pastebin.com/6Vc26NLL) or Alternatively Spooner
        },
        hintBox = vector3(-684.42, 1043.74, 134.69),     -- Initial Hint Box Spawn Coords at Start of Hunt
        cooldown = 120,                                  -- Time in Minutes Before Anyone can Hunt this Animal Again
        rewards = {                                      -- Items Given at End of Successful Hunt (name MUST match item in Database)
            { name = "legrams2",   count = 1 },
            { name = "legramhorn", count = 2 },
            { name = "Gamey_Meat", count = 2 },
        },
        npc = {
            enabled = true,                                 -- Enable / Disable Enemy NPCs
            model = "g_m_m_unimountainmen_01",        -- Ped Model of Enemy NPCs
            blip = {
                sprite = -1282792512,                       -- Blip Sprite for Enemy NPCs
                coords = vector3(-1397.45, 1151.2, 224.54), -- Blip Coords for Enemy NPCs
            },
            coords = {                                      -- Enemy NPC Spawn Coords
                vector3(-1389.59, 1151.4, 223.76),
                vector3(-1384.31, 1153.46, 225.05),
                vector3(-1400.1, 1154.11, 225.16),
                vector3(-1407.18, 1138.62, 225.2),
            },
            hintBox = vector3(-1387.94, 1158.86, 224.82), -- Second Hint Box Spawn Coords / Available After Killing Enemy NPCs
        },
        secondaryAnimals = {                              -- Spawn Secondary Animals to Assist the Legendary Animal
            enabled = true,                               -- Enable / Disable Secondary Animals
            model = "a_c_bighornram_01",                  -- Model of the Secondary Animal. Make Sure this is NOT the Same Model as any Legendary Animals
            coords = {                                    -- Spawn Coords for Secondary Animals
                vector3(-1427.74, 1522.82, 232.2),
                vector3(-1428.42, 1518.56, 231.93),
            },
        },
    },
    -----------------------------------------------------

    {
        name = "Legendary Shadow Buck", -- Name of the Hunt in the Menu (Make Sure these are Unique)
        location = "CTP",               -- Hunter Shop Location Key / MUST Match the Shop Key in "shops.lua" to Show in Menu
        level = 10,                     -- Level of Trust Needed to Start Hunt
        currency = {
            type = "cash",              -- "cash = Cash Only / "gold" = Gold Only
            amount = 70                 -- Cost to Start the Hunt in Selected Currency Type
        },
        legendary = {
            health = 800,                               -- Sets Legendary Animals Health Amount / Max is 1000?
            coords = vector3(-2363.12, 896.89, 158.14), -- Legendary Animal Spawn Coords
            model = "mp_a_c_buck_01",                   -- Ped Model of the Legendary Animal
            outfit = 4,                                 -- Set Outfit for Legendary Animal / Check Pastebin (https://pastebin.com/6Vc26NLL) or Alternatively Spooner
        },
        hintBox = vector3(-915.54, 539.32, 57.2),       -- Initial Hint Box Spawn Coords at Start of Hunt
        cooldown = 120,                                 -- Time in Minutes Before Anyone can Hunt this Animal Again
        rewards = {                                     -- Items Given at End of Successful Hunt (name MUST match item in Database)
            { name = "legbucks4",        count = 1 },
            { name = "legendbuckantler", count = 2 },
            { name = "venison",          count = 2 },
        },
        npc = {
            enabled = true,                                -- Enable / Disable Enemy NPCs
            model = "g_m_m_unimountainmen_01",       -- Ped Model of Enemy NPCs
            blip = {
                sprite = -1282792512,                      -- Blip Sprite for Enemy NPCs
                coords = vector3(-1519.2, 517.14, 101.58), -- Blip Coords for Enemy NPCs
            },
            coords = {                                     -- Enemy NPC Spawn Coords
                vector3(-1521.2, 511.77, 101.39),
                vector3(-1526.71, 519.17, 102.14),
                vector3(-1516.16, 524.8, 101.91),
                vector3(-1512.75, 514.14, 101.54),
                vector3(-1519.46, 516.29, 101.55),
            },
            hintBox = vector3(-1519.83, 520.02, 101.79), -- Second Hint Box Spawn Coords / Available After Killing Enemy NPCs
        },
        secondaryAnimals = {                             -- Spawn Secondary Animals to Assist the Legendary Animal
            enabled = true,                              -- Enable / Disable Secondary Animals
            model = "a_c_buck_01",                       -- Model of the Secondary Animal. Make Sure this is NOT the Same Model as any Legendary Animals
            coords = {                                   -- Spawn Coords for Secondary Animals
                vector3(-2361.01, 890.59, 158.12),
                vector3(-2358.63, 891.32, 156.46),
                vector3(-2372.2, 895.52, 159.5),
            },
        },
    },
    -----------------------------------------------------

    {
        name = "Legendary Snowflake Moose", -- Name of the Hunt in the Menu (Make Sure these are Unique)
        location = "CTP",                   -- Hunter Shop Location Key / MUST Match the Shop Key in "shops.lua" to Show in Menu
        level = 15,                         -- Level of Trust Needed to Start Hunt
        currency = {
            type = "cash",                  -- "cash = Cash Only / "gold" = Gold Only
            amount = 70                     -- Cost to Start the Hunt in Selected Currency Type
        },
        legendary = {
            health = 1000,                               -- Sets Legendary Animals Health Amount / Max is 1000?
            coords = vector3(-1963.22, 1967.3, 262.62), -- Legendary Animal Spawn Coords
            model = "mp_a_c_moose_01",                  -- Ped Model of the Legendary Animal
            outfit = 1,                                 -- Set Outfit for Legendary Animal / Check Pastebin (https://pastebin.com/6Vc26NLL) or Alternatively Spooner
        },
        hintBox = vector3(-1307.5, 1316.81, 202.44),    -- Initial Hint Box Spawn Coords at Start of Hunt
        cooldown = 120,                                 -- Time in Minutes Before Anyone can Hunt this Animal Again
        rewards = {                                     -- Items Given at End of Successful Hunt (name MUST match item in Database)
            { name = "legmoose1",      count = 1 },
            { name = "legmooseantler", count = 2 },
            { name = "venison",        count = 2 },
        },
        npc = {
            enabled = true,                                 -- Enable / Disable Enemy NPCs
            model = "g_m_m_unimountainmen_01",        -- Ped Model of Enemy NPCs
            blip = {
                sprite = -1282792512,                       -- Blip Sprite for Enemy NPCs
                coords = vector3(-1759.08, 1542.9, 238.76), -- Blip Coords for Enemy NPCs
            },
            coords = {                                      -- Enemy NPC Spawn Coords
                vector3(-1761.81, 1539.95, 238.34),
                vector3(-1758.76, 1545.93, 238.34),
                vector3(-1755.2, 1551.85, 238.28),
                vector3(-1762.13, 1529.15, 238.08),
                vector3(-1769.89, 1521.81, 236.83),
            },
            hintBox = vector3(-1762.01, 1531.45, 237.72), -- Second Hint Box Spawn Coords / Available After Killing Enemy NPCs
        },
        secondaryAnimals = {                              -- Spawn Secondary Animals to Assist the Legendary Animal
            enabled = true,                               -- Enable / Disable Secondary Animals
            model = "a_c_moose_01",                       -- Model of the Secondary Animal. Make Sure this is NOT the Same Model as any Legendary Animals
            coords = {                                    -- Spawn Coords for Secondary Animals
                vector3(-1959.15, 1967.68, 261.05),
                vector3(-1960.18, 1961.03, 259.81),
                vector3(-1966.28, 1959.11, 260.59),
            },
        },
    },
    -----------------------------------------------------
    {
        name = "Legendary Snow Buck", -- Name of the Hunt in the Menu (Make Sure these are Unique)
        location = "CTP",                   -- Hunter Shop Location Key / MUST Match the Shop Key in "shops.lua" to Show in Menu
        level = 20,                         -- Level of Trust Needed to Start Hunt
        currency = {
            type = "cash",                  -- "cash = Cash Only / "gold" = Gold Only
            amount = 70                     -- Cost to Start the Hunt in Selected Currency Type
        },
        legendary = {
            health = 800,                               -- Sets Legendary Animals Health Amount / Max is 1000?
            coords = vector3(-1026.79, 2666.15, 318.5), -- Legendary Animal Spawn Coords
            model = "mp_a_c_buck_01",                  -- Ped Model of the Legendary Animal
            outfit = 3,                                 -- Set Outfit for Legendary Animal / Check Pastebin (https://pastebin.com/6Vc26NLL) or Alternatively Spooner
        },
        hintBox = vector3(-1499.48, 1252.13, 313.96),    -- Initial Hint Box Spawn Coords at Start of Hunt
        cooldown = 120,                                 -- Time in Minutes Before Anyone can Hunt this Animal Again
        rewards = {                                     -- Items Given at End of Successful Hunt (name MUST match item in Database)
            { name = "legbucks3",      count = 1 },
            { name = "legendbuckantler", count = 2 },
            { name = "venison",        count = 2 },
        },
        npc = {
            enabled = true,                                 -- Enable / Disable Enemy NPCs
            model = "g_m_m_unimountainmen_01",        -- Ped Model of Enemy NPCs
            blip = {
                sprite = -1282792512,                       -- Blip Sprite for Enemy NPCs
                coords = vector3(-2102.24, 1837.56, 254.16), -- Blip Coords for Enemy NPCs
            },
            coords = {                                      -- Enemy NPC Spawn Coords
                vector3(-2106.49, 1844.79, 255.4),
                vector3(-2107.77, 1843.87, 255.44),
                vector3(-2113.84, 1832.73, 255.52),
                vector3(-2116.32, 1838.51, 256.17),
                vector3(-2114.47, 1846.14, 256.57),
                vector3(-2112.15, 1848.94, 256.85),
            },
            hintBox = vector3(-2106.39, 1843.32, 255.38), -- Second Hint Box Spawn Coords / Available After Killing Enemy NPCs
        },
        secondaryAnimals = {                              -- Spawn Secondary Animals to Assist the Legendary Animal
            enabled = true,                               -- Enable / Disable Secondary Animals
            model = "a_c_buck_01",                       -- Model of the Secondary Animal. Make Sure this is NOT the Same Model as any Legendary Animals
            coords = {                                    -- Spawn Coords for Secondary Animals
                vector3(-1033.96, 2666.64, 318.56),
                vector3(-1023.99, 2656.87, 316.98),
                vector3(-1028.9, 2650.41, 315.36),
            },
        },
    },
    -----------------------------------------------------
    {
        name = "Legendary Greathorn Ram",                    -- Name of the Hunt in the Menu (Make Sure these are Unique)
        location = "CTP",                                   -- Hunter Shop Location Key / MUST Match the Shop Key in "shops.lua" to Show in Menu
        level = 25,                                         -- Level of Trust Needed to Start Hunt
        currency = {
            type = "cash",                                  -- "cash = Cash Only / "gold" = Gold Only
            amount = 70                                     -- Cost to Start the Hunt in Selected Currency Type
        },
        legendary = {
            health = 800,                                   -- Sets Legendary Animals Health Amount / Max is 1000?
            coords = vector3(-1175.27, 1348.56, 254.85),   -- Legendary Animal Spawn Coords
            model = "mp_a_c_bighornram_01",                -- Ped Model of the Legendary Animal
            outfit = 3,                                     -- Set Outfit for Legendary Animal / Check Pastebin (https://pastebin.com/6Vc26NLL) or Alternatively Spooner
        },
        hintBox = vector3(-176.49, 1403.14, 125.73),       -- Initial Hint Box Spawn Coords at Start of Hunt
        cooldown = 700,                                     -- Time in Minutes Before Anyone can Hunt this Animal Again
        rewards = {                                         -- Items Given at End of Successful Hunt (name MUST match item in Database)
            { name = "legrams4",    count = 1 },
            { name = "legramhorn",   count = 2 },
            { name = "Mutton",       count = 2 },
        },
        npc = {
            enabled = true,                                  -- Enable / Disable Enemy NPCs
            model = "g_m_m_unimountainmen_01",       -- Ped Model of Enemy NPCs
            blip = {
                sprite = -1282792512,                       -- Blip Sprite for Enemy NPCs
                coords = vector3(-955.4, 1607.91, 238.43),  -- Blip Coords for Enemy NPCs
            },
            coords = {                                       -- Enemy NPC Spawn Coords
                vector3(-952.14, 1636.37, 238.43),
                vector3(-967.19, 1642.92, 238.43),
                vector3(-961.6, 1634.02, 246.81),
                vector3(-960.22, 1629.45, 246.52),
                vector3(-960.27, 1625.74, 245.32),
                vector3(-959.54, 1634.47, 246.6),
            },
            hintBox = vector3(-955.4, 1607.91, 238.43),     -- Second Hint Box Spawn Coords / Available After Killing Enemy NPCs
        },
        secondaryAnimals = {                                -- Spawn Secondary Animals to Assist the Legendary Animal
            enabled = true,                                  -- Enable / Disable Secondary Animals
            model = "a_c_bighornram_01",                    -- Model of the Secondary Animal. Make Sure this is NOT the Same Model as any Legendary Animals
            coords = {                                       -- Spawn Coords for Secondary Animals
                vector3(-1174.59, 1356.77, 256.92),
                vector3(-1163.02, 1346.9, 256.46),
                vector3(-1183.65, 1345.88, 252.16),
            },
        },
    },
    -----------------------------------------------------
    {
        name = "Legendary Gabbro Horn Ram",                     -- Name of the Hunt in the Menu (Make Sure these are Unique)
        location = "CTP",                                       -- Hunter Shop Location Key / MUST Match the Shop Key in "shops.lua" to Show in Menu
        level = 25,                                            -- Level of Trust Needed to Start Hunt
        currency = {
            type = "cash",                                     -- "cash = Cash Only / "gold" = Gold Only
            amount = 70                                        -- Cost to Start the Hunt in Selected Currency Type
        },
        legendary = {
            health = 800,                                      -- Sets Legendary Animals Health Amount / Max is 1000?
            coords = vector3(-2364.52, 122.06, 240.32),       -- Legendary Animal Spawn Coords
            model = "mp_a_c_bighornram_01",                   -- Ped Model of the Legendary Animal
            outfit = 0,                                        -- Set Outfit for Legendary Animal / Check Pastebin (https://pastebin.com/6Vc26NLL) or Alternatively Spooner
        },
        hintBox = vector3(-1308.96, 387.97, 95.38),           -- Initial Hint Box Spawn Coords at Start of Hunt
        cooldown = 7000,                                       -- Time in Minutes Before Anyone can Hunt this Animal Again (Convert from milliseconds to minutes)
        rewards = {                                           -- Items Given at End of Successful Hunt (name MUST match item in Database)
            { name = "legrams1", count = 1 },
            { name = "legramhorn", count = 2 },
            { name = "Mutton", count = 2 },
        },
        npc = {
            enabled = true,                                   -- Enable / Disable Enemy NPCs
            model = "g_m_m_unimountainmen_01",        -- Ped Model of Enemy NPCs (change as necessary)
            blip = {
                sprite = -1282792512,                         -- Blip Sprite for Enemy NPCs
                coords = vector3(-2460.73, 832.9, 142.07),   -- Blip Coords for Enemy NPCs
            },
            coords = {                                        -- Enemy NPC Spawn Coords
                vector3(-2459.49, 838.31, 146.36),
                vector3(-2460.81, 838.39, 146.37),
                vector3(-2461.8, 839.63, 142.8),
                vector3(-2469.45, 844.81, 143.96),
                vector3(-2461.67, 852.44, 145.1),
                vector3(-2452.07, 848.51, 143.6),
                vector3(-2453.75, 840.93, 142.32),
            },
            hintBox = vector3(-2459.43, 842.19, 142.76),     -- Second Hint Box Spawn Coords / Available After Killing Enemy NPCs
        },
        secondaryAnimals = {                                  -- Spawn Secondary Animals to Assist the Legendary Animal
            enabled = true,                                   -- Enable / Disable Secondary Animals
            model = "a_c_bighornram_01",                      -- Model of the Secondary Animal. Make Sure this is NOT the Same Model as any Legendary Animals
            coords = {                                        -- Spawn Coords for Secondary Animals
                vector3(-2364.45, 114.61, 240.05),
                vector3(-2365.35, 130.04, 239.96),
                vector3(-2355.48, 126.17, 241.88),
            },
        },
    },
    -----------------------------------------------------
    {
        name = "Legendary Elk",                -- Name of the Hunt in the Menu (Make Sure these are Unique)
        location = "CTP",                      -- Hunter Shop Location Key / MUST Match the Shop Key in "shops.lua" to Show in Menu
        level = 30,                            -- Level of Trust Needed to Start Hunt
        currency = {
            type = "cash",                     -- "cash = Cash Only / "gold" = Gold Only
            amount = 70                        -- Cost to Start the Hunt in Selected Currency Type
        },
        legendary = {
            health = 1000,                      -- Sets Legendary Animals Health Amount / Max is 1000?
            coords = vector3(-1347.13, 2565.62, 317.15), -- Legendary Animal Spawn Coords
            model = "a_c_elk_01",              -- Ped Model of the Legendary Animal
            outfit = 1,                        -- Set Outfit for Legendary Animal / Check Pastebin (https://pastebin.com/6Vc26NLL) or Alternatively Spooner
        },
        hintBox = vector3(-1630.2, 1229.33, 352.0), -- Initial Hint Box Spawn Coords at Start of Hunt
        cooldown = 120,                        -- Time in Minutes Before Anyone can Hunt this Animal Again
        rewards = {                            -- Items Given at End of Successful Hunt (name MUST match item in Database)
            { name = "legelks", count = 1 },
            { name = "legelkantler", count = 2 },
            { name = "venison", count = 2 },
        },
        npc = {
            enabled = true,                    -- Enable / Disable Enemy NPCs
            model = "g_m_m_unimountainmen_01", -- Ped Model of Enemy NPCs (can be changed if specific to this hunt)
            blip = {
                sprite = -1282792512,          -- Blip Sprite for Enemy NPCs
                coords = vector3(-1950.9, 2162.68, 326.48), -- Blip Coords for Enemy NPCs
            },
            coords = {                         -- Enemy NPC Spawn Coords
                vector3(-1965.3, 2162.02, 328.36),
                vector3(-1965.91, 2157.23, 328.39),
                vector3(-1949.63, 2160.64, 326.29),
                vector3(-1963.13, 2161.46, 330.73),
                vector3(-1951.49, 2164.44, 326.4),
                vector3(-1948.44, 2175.62, 325.24),
                vector3(-1941.0, 2166.05, 323.84),
            },
            hintBox = vector3(-1965.2, 2160.05, 328.16), -- Second Hint Box Spawn Coords / Available After Killing Enemy NPCs
        },
        secondaryAnimals = {                    -- Spawn Secondary Animals to Assist the Legendary Animal
            enabled = true,                    -- Enable / Disable Secondary Animals
            model = "a_c_elk_01",              -- Model of the Secondary Animal. Make Sure this is NOT the Same Model as any Legendary Animals
            coords = {                         -- Spawn Coords for Secondary Animals
                vector3(-1354.18, 2556.56, 317.48),
                vector3(-1339.67, 2562.28, 315.7),                
                vector3(-1345.36, 2572.21, 318.0),                
            },
        },
    },
    -----------------------------------------------------
    {
        name = "Legendary Bear",               -- Name of the Hunt in the Menu (Make Sure these are Unique)
        location = "CTP",                      -- Hunter Shop Location Key / MUST Match the Shop Key in "shops.lua" to Show in Menu
        level = 35,                            -- Level of Trust Needed to Start Hunt
        currency = {
            type = "cash",                     -- "cash = Cash Only / "gold" = Gold Only
            amount = 70                        -- Cost to Start the Hunt in Selected Currency Type
        },
        legendary = {
            health = 1000,                      -- Sets Legendary Animals Health Amount / Max is 1000?
            coords = vector3(-1053.06, 2191.67, 356.61), -- Legendary Animal Spawn Coords
            model = "a_c_bear_01",            -- Ped Model of the Legendary Animal
            outfit = 10,                       -- Set Outfit for Legendary Animal / Check Pastebin (https://pastebin.com/6Vc26NLL) or Alternatively Spooner
        },
        hintBox = vector3(-1630.2, 1229.33, 352.0), -- Initial Hint Box Spawn Coords at Start of Hunt
        cooldown = 120,                        -- Time in Minutes Before Anyone can Hunt this Animal Again
        rewards = {                            -- Items Given at End of Successful Hunt (name MUST match item in Database)
            { name = "legbears", count = 1 },
            { name = "bearc", count = 2 },
            { name = "beart", count = 2 },
            { name = "biggame", count = 2 },
        },
        npc = {
            enabled = true,                    -- Enable / Disable Enemy NPCs
            model = "g_m_m_unimountainmen_01", -- Ped Model of Enemy NPCs (can be changed if specific to this hunt)
            blip = {
                sprite = -1282792512,          -- Blip Sprite for Enemy NPCs
                coords = vector3(-1892.76, 1344.68, 200.84), -- Blip Coords for Enemy NPCs
            },
            coords = {                         -- Enemy NPC Spawn Coords
                vector3(-1894.6, 1333.6, 200.18),
                vector3(-1899.13, 1333.31, 200.1),
                vector3(-1906.64, 1350.38, 202.37),
                vector3(-1884.57, 1353.99, 203.27),
                vector3(-1899.53, 1362.37, 203.37),
                vector3(-1910.77, 1360.24, 207.6),
                vector3(-1899.16, 1337.23, 204.27),
            },
            hintBox = vector3(-1897.93, 1360.18, 203.18), -- Second Hint Box Spawn Coords / Available After Killing Enemy NPCs
        },
        secondaryAnimals = {                    -- Spawn Secondary Animals to Assist the Legendary Animal
            enabled = true,                    -- Enable / Disable Secondary Animals
            model = "a_c_bear_01",            -- Model of the Secondary Animal. Make Sure this is NOT the Same Model as any Legendary Animals
            coords = {                         -- Spawn Coords for Secondary Animals
                vector3(-1042.38, 2187.48, 354.48),
                vector3(-1041.02, 2202.27, 352.68),                                
            },
        },
    },
    -----------------------------------------------------
    {-- Legendary Winyan Bison setup
        name = "Legendary Winyan Bison",                  -- Name of the Hunt in the Menu
        location = "CTP",                                 -- Hunter Shop Location Key
        level = 40,                                       -- Level of Trust Needed to Start Hunt
        currency = {
            type = "cash",                                -- Currency type
            amount = 70                                   -- Cost to Start the Hunt in Selected Currency Type
        },
        legendary = {
            health = 1000,                                 -- Sets Legendary Animals Health Amount / Max is 1000?
            coords = vector3(-1788.01, 1691.31, 238.7),  -- Legendary Animal Spawn Coords
            model = "mp_a_c_buffalo_01",                  -- Ped Model of the Legendary Animal
            outfit = 1,                                   -- Set Outfit for Legendary Animal
        },
        hintBox = vector3(-157.43, 1598.94, 178.26),    -- Initial Hint Box Spawn Coords at Start of Hunt
        cooldown = 120,                                   -- Time in Minutes Before Anyone can Hunt this Animal Again
        rewards = {                                       -- Items Given at End of Successful Hunt
            { name = "legbisons2", count = 1 },
            { name = "legbisonhorn", count = 2 },
            { name = "beef", count = 2 },
        },
        npc = {
            enabled = true,                               -- Enable / Disable Enemy NPCs
            model = "g_m_m_unimountainmen_01",     -- Ped Model of Enemy NPCs
            blip = {
                sprite = -1282792512,                     -- Blip Sprite for Enemy NPCs
                coords = vector3(-955.4, 1607.91, 238.43), -- Blip Coords for Enemy NPCs
            },
            coords = {                                    -- Enemy NPC Spawn Coords
                vector3(-952.14, 1636.37, 238.43),
                vector3(-967.19, 1642.92, 238.43),
                vector3(-961.6, 1634.02, 246.81),
                vector3(-960.22, 1629.45, 246.52),
                vector3(-960.27, 1625.74, 245.32),
                vector3(-959.54, 1634.47, 246.6),
                vector3(-967.69, 1630.89, 246.53),
                vector3(-955.48, 1631.15, 246.08),
            },
            hintBox = vector3(-965.27, 1627.01, 247.41),  -- Second Hint Box Spawn Coords / Available After Killing Enemy NPCs
        },
        secondaryAnimals = {                              -- Spawn Secondary Animals to Assist the Legendary Animal
            enabled = true,                               -- Enable / Disable Secondary Animals
            model = "a_c_buffalo_01",                     -- Model of the Secondary Animal
            coords = {                                    -- Spawn Coords for Secondary Animals
                vector3(-1778.68, 1700.76, 239.37),
                vector3(-1787.44, 1704.61, 239.25),
                vector3(-1787.55, 1686.9, 238.12),
            },
        },
    },
    -----------------------------------------------------
    {-- Legendary Owiza Bear setup
        name = "Legendary Owiza Bear",                    -- Name of the Hunt in the Menu
        location = "CTP",                                 -- Hunter Shop Location Key
        level = 45,                                       -- Level of Trust Needed to Start Hunt
        currency = {
            type = "cash",                                -- Currency type
            amount = 70                                   -- Cost to Start the Hunt in Selected Currency Type
        },
        legendary = {
            health = 1000,                                 -- Sets Legendary Animals Health Amount / Max is 1000?
            coords = vector3(83.65, 465.89, 159.11),     -- Legendary Animal Spawn Coords
            model = "mp_a_c_bear_01",                     -- Ped Model of the Legendary Animal
            outfit = 1,                                   -- Set Outfit for Legendary Animal
        },
        hintBox = vector3(-1093.95, 436.54, 47.02),      -- Initial Hint Box Spawn Coords at Start of Hunt
        cooldown = 120,                                   -- Time in Minutes Before Anyone can Hunt this Animal Again
        rewards = {                                       -- Items Given at End of Successful Hunt
            { name = "legbears2", count = 1 },
            { name = "bearc", count = 2 },
            { name = "beart", count = 2 },
            { name = "biggame", count = 2 },
        },
        npc = {
            enabled = true,                               -- Enable / Disable Enemy NPCs
            model = "g_m_m_unimountainmen_01",     -- Ped Model of Enemy NPCs
            blip = {
                sprite = -121.56,                         -- Blip Sprite for Enemy NPCs
                coords = vector3(-121.56, -59.99, 93.45), -- Blip Coords for Enemy NPCs
            },
            coords = {                                    -- Enemy NPC Spawn Coords
                vector3(-115.64, -70.1, 90.67),
                vector3(-118.18, -76.22, 90.08),
                vector3(-123.99, -73.45, 90.91),
                vector3(-128.19, -66.68, 91.72),
                vector3(-122.93, -62.46, 92.64),
                vector3(-115.35, -69.94, 90.67),
                vector3(-112.68, -78.52, 89.25),
                vector3(-117.14, -77.95, 89.87),
            },
            hintBox = vector3(-127.71, -69.47, 91.6),      -- Second Hint Box Spawn Coords / Available After Killing Enemy NPCs
        },
        secondaryAnimals = {                              -- Spawn Secondary Animals to Assist the Legendary Animal
            enabled = true,                               -- Enable / Disable Secondary Animals
            model = "a_c_wolf_medium",                           -- Model of the Secondary Animal
            coords = {                                    -- Spawn Coords for Secondary Animals
                vector3(79.2, 476.41, 158.69),
                vector3(73.53, 465.83, 157.66),
                vector3(77.72, 455.05, 157.69),
            },
        },
    },
    -----------------------------------------------------
    {
        name = "Legendary Ridgeback Spirit Bear",  -- Name of the Hunt in the Menu (Make Sure these are Unique)
        location = "CTP",                           -- Hunter Shop Location Key / MUST Match the Shop Key in "shops.lua" to Show in Menu
        level = 50,                                 -- Level of Trust Needed to Start Hunt
        currency = {
            type = "cash",                          -- "cash = Cash Only / "gold" = Gold Only
            amount = 70                             -- Cost to Start the Hunt in Selected Currency Type
        },
        legendary = {
            health = 1000,                           -- Sets Legendary Animals Health Amount / Max is 1000?
            coords = vector3(-33.72, 1229.26, 172.78), -- Legendary Animal Spawn Coords
            model = "mp_a_c_bear_01",              -- Ped Model of the Legendary Animal
            outfit = 2,                             -- Set Outfit for Legendary Animal / Check Pastebin (https://pastebin.com/6Vc26NLL) or Alternatively Spooner
        },
        hintBox = vector3(-159.2, 493.26, 104.45), -- Initial Hint Box Spawn Coords at Start of Hunt
        cooldown = 120,                             -- Time in Minutes Before Anyone can Hunt this Animal Again
        rewards = {                                 -- Items Given at End of Successful Hunt (name MUST match item in Database)
            { name = "legbears3", count = 1 },
            { name = "bearc", count = 2 },
            { name = "beart", count = 2 },
            { name = "biggame", count = 2 },
        },
        npc = {
            enabled = true,                          -- Enable / Disable Enemy NPCs
            model = "g_m_m_unimountainmen_01",               -- Ped Model of Enemy NPCs
            blip = {
                sprite = -600.97,                   -- Blip Sprite for Enemy NPCs
                coords = vector3(-600.97, 522.1, 97.2), -- Blip Coords for Enemy NPCs
            },
            coords = {                               -- Enemy NPC Spawn Coords
                vector3(-614.37, 528.54, 94.62),
                vector3(-611.78, 527.51, 94.66),
                vector3(-611.26, 524.31, 94.62),
                vector3(-606.21, 517.47, 96.49),
                vector3(-618.46, 516.64, 97.2),
                vector3(-621.24, 515.04, 97.19),
                vector3(-627.97, 527.24, 97.0),
                vector3(-628.63, 538.19, 97.76),
                vector3(-619.57, 541.81, 98.05),
            },
            hintBox = vector3(-631.15, 526.16, 97.53), -- Second Hint Box Spawn Coords / Available After Killing Enemy NPCs
        },
        secondaryAnimals = {                        -- Spawn Secondary Animals to Assist the Legendary Animal
            enabled = true,                          -- Enable / Disable Secondary Animals
            model = "a_c_wolf_medium",                     -- Model of the Secondary Animal. Make Sure this is NOT the Same Model as any Legendary Animals
            coords = {                               -- Spawn Coords for Secondary Animals
                vector3(-40.61, 1227.35, 172.46),
                vector3(-36.68, 1219.71, 172.71),
                vector3(-27.44, 1219.81, 173.1),
            },
        },
    },
    -----------------------------------------------------
    {
        name = "Legendary Ghost Panther",           -- Name of the Hunt in the Menu (Make Sure these are Unique)
        location = "CTP",                           -- Hunter Shop Location Key / MUST Match the Shop Key in "shops.lua" to Show in Menu
        level = 55,                                 -- Level of Trust Needed to Start Hunt
        currency = {
            type = "cash",                          -- "cash = Cash Only / "gold" = Gold Only
            amount = 70                             -- Cost to Start the Hunt in Selected Currency Type
        },
        legendary = {
            health = 900,                           -- Sets Legendary Animals Health Amount / Max is 1000?
            coords = vector3(818.45, 2131.79, 275.33), -- Legendary Animal Spawn Coords
            model = "mp_a_c_panther_01",           -- Ped Model of the Legendary Animal
            outfit = 1,                             -- Set Outfit for Legendary Animal / Check Pastebin (https://pastebin.com/6Vc26NLL) or Alternatively Spooner
        },
        hintBox = vector3(-939.65, 663.21, 109.52), -- Initial Hint Box Spawn Coords at Start of Hunt
        cooldown = 120,                             -- Time in Minutes Before Anyone can Hunt this Animal Again
        rewards = {                                 -- Items Given at End of Successful Hunt (name MUST match item in Database)
            { name = "legpanthers2", count = 1 },
            { name = "legbisonhorn", count = 2 },
            { name = "beef", count = 2 },
        },
        npc = {
            enabled = true,                          -- Enable / Disable Enemy NPCs
            model = "g_m_m_unimountainmen_01",            -- Ped Model of Enemy NPCs
            blip = {
                sprite = -1015.8,                   -- Blip Sprite for Enemy NPCs
                coords = vector3(-1015.8, 1681.41, 240.62), -- Blip Coords for Enemy NPCs
            },
            coords = {                               -- Enemy NPC Spawn Coords
                vector3(-1018.46, 1687.08, 244.2),
                vector3(-1020.88, 1685.86, 244.26),
                vector3(-1024.01, 1687.1, 243.43),
                vector3(-1024.86, 1697.61, 247.11),
                vector3(-1023.33, 1698.4, 246.65),
                vector3(-1017.72, 1696.99, 244.16),
                vector3(-1018.84, 1694.95, 243.92),
                vector3(-1001.7, 1681.82, 239.24),
                vector3(-1001.93, 1677.64, 238.43),
                vector3(-1018.94, 1675.67, 238.63),
            },
            hintBox = vector3(-1018.48, 1694.53, 243.83), -- Second Hint Box Spawn Coords / Available After Killing Enemy NPCs
        },
        secondaryAnimals = {                        -- Spawn Secondary Animals to Assist the Legendary Animal
            enabled = true,                          -- Enable / Disable Secondary Animals
            model = "a_c_panther_01",               -- Model of the Secondary Animal. Make Sure this is NOT the Same Model as any Legendary Animals
            coords = {                               -- Spawn Coords for Secondary Animals
                vector3(811.57, 2140.31, 272.83),
                vector3(801.92, 2134.09, 269.97),
                vector3(802.02, 2117.83, 269.51),
            },
        },
    },

    -----------------------------------------------------
    -- St Denis
    -----------------------------------------------------

    {
        name = "Legendary Buck", -- Name of the Hunt in the Menu (Make Sure these are Unique)
        location = "SD",         -- Hunter Shop Location Key / MUST Match the Shop Key in "shops.lua" to Show in Menu
        level = 0,               -- Level of Trust Needed to Start Hunt
        currency = {
            type = "cash",       -- "cash = Cash Only / "gold" = Gold Only
            amount = 70          -- Cost to Start the Hunt in Selected Currency Type
        },
        legendary = {
            health = 800,                              -- Sets Legendary Animals Health Amount / Max is 1000?
            coords = vector3(1379.25, -992.61, 51.58), -- Legendary Animal Spawn Coords
            model = "mp_a_c_buck_01",                  -- Ped Model of the Legendary Animal
            outfit = 0,                                -- Set Outfit for Legendary Animal / Check Pastebin (https://pastebin.com/6Vc26NLL) or Alternatively Spooner
        },
        hintBox = vector3(1755.38, -1056.41, 41.71),   -- Initial Hint Box Spawn Coords at Start of Hunt
        cooldown = 120,                                -- Time in Minutes Before Anyone can Hunt this Animal Again
        rewards = {                                    -- Items Given at End of Successful Hunt (name MUST match item in Database)
            { name = "legbucks",         count = 1 },
            { name = "legendbuckantler", count = 2 },
            { name = "venison",          count = 2 },
        },
        npc = {
            enabled = true,                                 -- Enable / Disable Enemy NPCs
            model = "mp_g_m_m_unicriminals_03",        -- Ped Model of Enemy NPCs
            blip = {
                sprite = -1282792512,                       -- Blip Sprite for Enemy NPCs
                coords = vector3(1757.92, -1131.77, 42.02), -- Blip Coords for Enemy NPCs
            },
            coords = {                                      -- Enemy NPC Spawn Coords
                vector3(1752.09, -1138.21, 42.05),
                vector3(1764.24, -1127.18, 41.97),
                vector3(1768.87, -1131.37, 41.56),
                vector3(1758.88, -1141.13, 42.32),
            },
            hintBox = vector3(1751.99, -1134.7, 41.83), -- Second Hint Box Spawn Coords / Available After Killing Enemy NPCs
        },
        secondaryAnimals = {                            -- Spawn Secondary Animals to Assist the Legendary Animal
            enabled = true,                             -- Enable / Disable Secondary Animals
            model = "A_C_Deer_01",                      -- Model of the Secondary Animal. Make Sure this is NOT the Same Model as any Legendary Animals
            coords = {                                  -- Spawn Coords for Secondary Animals
                vector3(1379.66, -996.54, 52.21),
                vector3(1374.01, -992.61, 52.58),
            },
        },
    },
    -----------------------------------------------------

    {
        name = "Legendary Cogi Boar", -- Name of the Hunt in the Menu (Make Sure these are Unique)
        location = "SD",              -- Hunter Shop Location Key / MUST Match the Shop Key in "shops.lua" to Show in Menu
        level = 5,                    -- Level of Trust Needed to Start Hunt
        currency = {
            type = "cash",            -- "cash = Cash Only / "gold" = Gold Only
            amount = 70               -- Cost to Start the Hunt in Selected Currency Type
        },
        legendary = {
            health = 900,                              -- Sets Legendary Animals Health Amount / Max is 1000?
            coords = vector3(2217.31, -548.18, 41.75), -- Legendary Animal Spawn Coords
            model = "mp_a_c_boar_01",                  -- Ped Model of the Legendary Animal
            outfit = 0,                                -- Set Outfit for Legendary Animal / Check Pastebin (https://pastebin.com/6Vc26NLL) or Alternatively Spooner
        },
        hintBox = vector3(2217.71, -896.48, 41.84),    -- Initial Hint Box Spawn Coords at Start of Hunt
        cooldown = 120,                                -- Time in Minutes Before Anyone can Hunt this Animal Again
        rewards = {                                    -- Items Given at End of Successful Hunt (name MUST match item in Database)
            { name = "legboars1", count = 1 },
            { name = "boartusk",  count = 2 },
            { name = "fat",       count = 2 },
            { name = "pork",      count = 2 },
        },
        npc = {
            enabled = true,                                -- Enable / Disable Enemy NPCs
            model = "mp_g_m_m_unicriminals_03",       -- Ped Model of Enemy NPCs
            blip = {
                sprite = -1282792512,                      -- Blip Sprite for Enemy NPCs
                coords = vector3(2154.52, -612.83, 41.54), -- Blip Coords for Enemy NPCs
            },
            coords = {                                     -- Enemy NPC Spawn Coords
                vector3(2165.29, -615.71, 42.89),
                vector3(2138.44, -630.95, 42.71),
                vector3(2142.38, -640.74, 42.61),
                vector3(2151.09, -639.49, 42.49),
            },
            hintBox = vector3(2152.86, -621.95, 41.54), -- Second Hint Box Spawn Coords / Available After Killing Enemy NPCs
        },
        secondaryAnimals = {                            -- Spawn Secondary Animals to Assist the Legendary Animal
            enabled = true,                             -- Enable / Disable Secondary Animals
            model = "a_c_boar_01",                      -- Model of the Secondary Animal. Make Sure this is NOT the Same Model as any Legendary Animals
            coords = {                                  -- Spawn Coords for Secondary Animals
                vector3(2214.55, -539.86, 41.12),
                vector3(2221.73, -553.11, 41.22),
            },
        },
    },
    -----------------------------------------------------

    {
        name = "Legendary Ruddy Moose", -- Name of the Hunt in the Menu (Make Sure these are Unique)
        location = "SD",                -- Hunter Shop Location Key / MUST Match the Shop Key in "shops.lua" to Show in Menu
        level = 10,                     -- Level of Trust Needed to Start Hunt
        currency = {
            type = "cash",              -- "cash = Cash Only / "gold" = Gold Only
            amount = 70                 -- Cost to Start the Hunt in Selected Currency Type
        },
        legendary = {
            health = 1000,                             -- Sets Legendary Animals Health Amount / Max is 1000?
            coords = vector3(2422.32, 100.09, 46.42), -- Legendary Animal Spawn Coords
            model = "mp_a_c_moose_01",                -- Ped Model of the Legendary Animal
            outfit = 3,                               -- Set Outfit for Legendary Animal / Check Pastebin (https://pastebin.com/6Vc26NLL) or Alternatively Spooner
        },
        hintBox = vector3(1594.1, -798.15, 41.78),    -- Initial Hint Box Spawn Coords at Start of Hunt
        cooldown = 120,                               -- Time in Minutes Before Anyone can Hunt this Animal Again
        rewards = {                                   -- Items Given at End of Successful Hunt (name MUST match item in Database)
            { name = "legmooses3",     count = 1 },
            { name = "legmooseantler", count = 2 },
            { name = "biggame",        count = 2 },
        },
        npc = {
            enabled = true,                                -- Enable / Disable Enemy NPCs
            model = "mp_g_m_m_unicriminals_03",       -- Ped Model of Enemy NPCs
            blip = {
                sprite = -1282792512,                      -- Blip Sprite for Enemy NPCs
                coords = vector3(1739.89, -462.41, 47.68), -- Blip Coords for Enemy NPCs
            },
            coords = {                                     -- Enemy NPC Spawn Coords
                vector3(1736.4, -465.18, 46.73),
                vector3(1736.47, -460.61, 47.21),
                vector3(1745.9, -463.54, 47.11),
                vector3(1742.74, -464.5, 47.72),
                vector3(1739.81, -463.54, 47.72),
            },
            hintBox = vector3(1743.77, -465.11, 47.72), -- Second Hint Box Spawn Coords / Available After Killing Enemy NPCs
        },
        secondaryAnimals = {                            -- Spawn Secondary Animals to Assist the Legendary Animal
            enabled = true,                             -- Enable / Disable Secondary Animals
            model = "a_c_buck_01",                      -- Model of the Secondary Animal. Make Sure this is NOT the Same Model as any Legendary Animals
            coords = {                                  -- Spawn Coords for Secondary Animals
                vector3(2419.43, 105.03, 46.78),
                vector3(2418.05, 101.35, 46.75),
                vector3(2426.33, 92.54, 45.84),
            },
        },
    },
    -----------------------------------------------------

    {
        name = "Legendary Icahi Boar", -- Name of the Hunt in the Menu (Make Sure these are Unique)
        location = "SD",               -- Hunter Shop Location Key / MUST Match the Shop Key in "shops.lua" to Show in Menu
        level = 15,                    -- Level of Trust Needed to Start Hunt
        currency = {
            type = "cash",             -- "cash = Cash Only / "gold" = Gold Only
            amount = 70                -- Cost to Start the Hunt in Selected Currency Type
        },
        legendary = {
            health = 900,                               -- Sets Legendary Animals Health Amount / Max is 1000?
            coords = vector3(1386.19, -2165.08, 47.86), -- Legendary Animal Spawn Coords
            model = "mp_a_c_boar_01",                   -- Ped Model of the Legendary Animal
            outfit = 2,                                 -- Set Outfit for Legendary Animal / Check Pastebin (https://pastebin.com/6Vc26NLL) or Alternatively Spooner
        },
        hintBox = vector3(2206.09, -1246.67, 41.53),    -- Initial Hint Box Spawn Coords at Start of Hunt
        cooldown = 120,                                 -- Time in Minutes Before Anyone can Hunt this Animal Again
        rewards = {                                     -- Items Given at End of Successful Hunt (name MUST match item in Database)
            { name = "legboars3", count = 1 },
            { name = "boartusk",  count = 2 },
            { name = "fat",       count = 2 },
            { name = "pork",      count = 2 },
        },
        npc = {
            enabled = true,                                 -- Enable / Disable Enemy NPCs
            model = "mp_g_m_m_unicriminals_03",        -- Ped Model of Enemy NPCs
            blip = {
                sprite = -1282792512,                       -- Blip Sprite for Enemy NPCs
                coords = vector3(2085.94, -1821.32, 42.93), -- Blip Coords for Enemy NPCs
            },
            coords = {                                      -- Enemy NPC Spawn Coords
                vector3(2082.85, -1817.66, 41.53),
                vector3(2099.18, -1813.55, 42.88),
                vector3(2094.92, -1812.97, 42.84),
                vector3(2089.27, -1823.4, 42.85),
                vector3(2088.48, -1826.83, 41.7),
            },
            hintBox = vector3(2095.49, -1820.58, 41.77), -- Second Hint Box Spawn Coords / Available After Killing Enemy NPCs
        },
        secondaryAnimals = {                             -- Spawn Secondary Animals to Assist the Legendary Animal
            enabled = true,                              -- Enable / Disable Secondary Animals
            model = "a_c_boar_01",                       -- Model of the Secondary Animal. Make Sure this is NOT the Same Model as any Legendary Animals
            coords = {                                   -- Spawn Coords for Secondary Animals
                vector3(1383.24, -2166.04, 48.33),
                vector3(1382.13, -2173.01, 48.62),
                vector3(1387.91, -2177.14, 48.61),
            },
        },
    },
    -----------------------------------------------------

    {
        name = "Legendary Great Boar", -- Name of the Hunt in the Menu (Make Sure these are Unique)
        location = "SD",               -- Hunter Shop Location Key / MUST Match the Shop Key in "shops.lua" to Show in Menu
        level = 25,                    -- Level of Trust Needed to Start Hunt
        currency = {
            type = "cash",             -- "cash = Cash Only / "gold" = Gold Only
            amount = 70                -- Cost to Start the Hunt in Selected Currency Type
        },
        legendary = {
            health = 900,                               -- Sets Legendary Animals Health Amount / Max is 1000?
            coords = vector3(2031.53, -1738.17, 41.65), -- Legendary Animal Spawn Coords
            model = "a_c_boarlegendary_01",             -- Ped Model of the Legendary Animal
            outfit = 0,                                 -- Set Outfit for Legendary Animal / Check Pastebin (https://pastebin.com/6Vc26NLL) or Alternatively Spooner
        },
        hintBox = vector3(1704.97, -1015.92, 41.65),    -- Initial Hint Box Spawn Coords at Start of Hunt
        cooldown = 120,                                 -- Time in Minutes Before Anyone can Hunt this Animal Again
        rewards = {                                     -- Items Given at End of Successful Hunt (name MUST match item in Database)
            { name = "legboars", count = 1 },
            { name = "boartusk", count = 2 },
            { name = "fat",      count = 2 },
            { name = "pork",     count = 4 },
        },
        npc = {
            enabled = true,                                 -- Enable / Disable Enemy NPCs
            model = "mp_g_m_m_unicriminals_03",        -- Ped Model of Enemy NPCs
            blip = {
                sprite = -1282792512,                       -- Blip Sprite for Enemy NPCs
                coords = vector3(1503.08, -1825.48, 56.23), -- Blip Coords for Enemy NPCs
            },
            coords = {                                      -- Enemy NPC Spawn Coords
                vector3(1503.46, -1819.03, 53.57),
                vector3(1509.56, -1818.78, 53.45),
                vector3(1514.55, -1829.2, 51.94),
                vector3(1510.04, -1839.29, 52.64),
                vector3(1488.24, -1836.54, 53.45),
                vector3(1481.91, -1827.46, 53.16),
            },
            hintBox = vector3(1500.39, -1836.13, 57.02), -- Second Hint Box Spawn Coords / Available After Killing Enemy NPCs
        },
        secondaryAnimals = {                             -- Spawn Secondary Animals to Assist the Legendary Animal
            enabled = true,                              -- Enable / Disable Secondary Animals
            model = "a_c_boar_01",                       -- Model of the Secondary Animal. Make Sure this is NOT the Same Model as any Legendary Animals
            coords = {                                   -- Spawn Coords for Secondary Animals
                vector3(2026.55, -1750.78, 41.53),
                vector3(2013.79, -1747.53, 41.52),
                vector3(2012.53, -1734.24, 41.58),
            },
        },
    },
    -----------------------------------------------------

    {
        name = "Legendary Boa Snake", -- Name of the Hunt in the Menu (Make Sure these are Unique)
        location = "SD",              -- Hunter Shop Location Key / MUST Match the Shop Key in "shops.lua" to Show in Menu
        level = 30,                   -- Level of Trust Needed to Start Hunt
        currency = {
            type = "cash",            -- "cash = Cash Only / "gold" = Gold Only
            amount = 70               -- Cost to Start the Hunt in Selected Currency Type
        },
        legendary = {
            health = 500,                            -- Sets Legendary Animals Health Amount / Max is 1000?
            coords = vector3(962.74, -216.81, 86.5), -- Legendary Animal Spawn Coords
            model = "a_c_snakeredboa_01",            -- Ped Model of the Legendary Animal
            outfit = 2,                              -- Set Outfit for Legendary Animal / Check Pastebin (https://pastebin.com/6Vc26NLL) or Alternatively Spooner
        },
        hintBox = vector3(1204.04, -568.05, 68.7),   -- Initial Hint Box Spawn Coords at Start of Hunt
        cooldown = 120,                              -- Time in Minutes Before Anyone can Hunt this Animal Again
        rewards = {                                  -- Items Given at End of Successful Hunt (name MUST match item in Database)
            { name = "legendsnakes", count = 1 },
            { name = "snaket", count = 2 },
            { name = "snakeeye", count = 2 },
        },
        npc = {
            enabled = true,                               -- Enable / Disable Enemy NPCs
            model = "mp_g_m_m_unicriminals_03",      -- Ped Model of Enemy NPCs
            blip = {
                sprite = -1282792512,                     -- Blip Sprite for Enemy NPCs
                coords = vector3(651.51, -559.19, 67.76), -- Blip Coords for Enemy NPCs
            },
            coords = {                                    -- Enemy NPC Spawn Coords
                vector3(647.08, -534.19, 77.15),
                vector3(637.96, -535.17, 77.41),
                vector3(632.47, -540.07, 77.02),
                vector3(629.11, -566.25, 74.13),
                vector3(642.17, -571.27, 64.85),
                vector3(644.77, -568.49, 66.14),
            },
            hintBox = vector3(646.09, -563.4, 66.99), -- Second Hint Box Spawn Coords / Available After Killing Enemy NPCs
        },
        secondaryAnimals = {                          -- Spawn Secondary Animals to Assist the Legendary Animal
            enabled = true,                           -- Enable / Disable Secondary Animals
            model = "a_c_snakeblacktailrattle_01",    -- Model of the Secondary Animal. Make Sure this is NOT the Same Model as any Legendary Animals
            coords = {                                -- Spawn Coords for Secondary Animals
                vector3(946.84, -237.07, 86.24),
                vector3(952.2, -246.84, 86.4),
                vector3(961.8, -236.74, 85.68),
                vector3(961.93, -224.06, 86.73),
                vector3(954.42, -229.72, 86.62),
                vector3(952.34, -234.28, 86.47),
                vector3(956.23, -236.61, 86.41),
            },
        },
    },
    -----------------------------------------------------

    {
        name = "Legendary Onyx Wolf", -- Name of the Hunt in the Menu (Make Sure these are Unique)
        location = "SD",              -- Hunter Shop Location Key / MUST Match the Shop Key in "shops.lua" to Show in Menu
        level = 35,                   -- Level of Trust Needed to Start Hunt
        currency = {
            type = "cash",            -- "cash = Cash Only / "gold" = Gold Only
            amount = 70               -- Cost to Start the Hunt in Selected Currency Type
        },
        legendary = {
            health = 900,                            -- Sets Legendary Animals Health Amount / Max is 1000?
            coords = vector3(1740.11, -558.89, 44.18), -- Legendary Animal Spawn Coords
            model = "mp_a_c_wolf_01",            -- Ped Model of the Legendary Animal
            outfit = 1,                              -- Set Outfit for Legendary Animal / Check Pastebin (https://pastebin.com/6Vc26NLL) or Alternatively Spooner
        },
        hintBox = vector3(1060.42, -1111.5, 67.41),   -- Initial Hint Box Spawn Coords at Start of Hunt
        cooldown = 120,                              -- Time in Minutes Before Anyone can Hunt this Animal Again
        rewards = {                                  -- Items Given at End of Successful Hunt (name MUST match item in Database)
            { name = "legwolfs2", count = 1 },
            { name = "wolftooth", count = 2 },
            { name = "wolfheart", count = 1 },
        },
        npc = {
            enabled = true,                               -- Enable / Disable Enemy NPCs
            model = "mp_g_m_m_unicriminals_03",      -- Ped Model of Enemy NPCs
            blip = {
                sprite = -1282792512,                     -- Blip Sprite for Enemy NPCs
                coords = vector3(1266.8, -409.37, 97.63), -- Blip Coords for Enemy NPCs
            },
            coords = {                                    -- Enemy NPC Spawn Coords
                vector3(1265.24, -412.64, 97.62),
                vector3(1262.58, -412.53, 97.63),
                vector3(1259.63, -412.85, 97.59),
                vector3(1254.81, -405.88, 96.39),
                vector3(1265.04, -402.08, 97.61),
                vector3(1259.46, -402.87, 97.61),
                vector3(1276.0, -403.65, 96.76),
            },
            hintBox = vector3(1267.65, -414.92, 96.67), -- Second Hint Box Spawn Coords / Available After Killing Enemy NPCs
        },
        secondaryAnimals = {                          -- Spawn Secondary Animals to Assist the Legendary Animal
            enabled = true,                           -- Enable / Disable Secondary Animals
            model = "a_c_wolf_medium",    -- Model of the Secondary Animal. Make Sure this is NOT the Same Model as any Legendary Animals
            coords = {                                -- Spawn Coords for Secondary Animals
                vector3(1744.3, -564.05, 43.77),
                vector3(1738.63, -567.59, 43.68),
                vector3(1729.8, -567.17, 43.55),
                vector3(1729.8, -567.17, 43.55),
            },
        },
    },
    -----------------------------------------------------

    {
        name = "Legendary Banded Alligator", -- Name of the Hunt in the Menu (Make Sure these are Unique)
        location = "SD",              -- Hunter Shop Location Key / MUST Match the Shop Key in "shops.lua" to Show in Menu
        level = 40,                   -- Level of Trust Needed to Start Hunt
        currency = {
            type = "cash",            -- "cash = Cash Only / "gold" = Gold Only
            amount = 70               -- Cost to Start the Hunt in Selected Currency Type
        },
        legendary = {
            health = 900,                            -- Sets Legendary Animals Health Amount / Max is 1000?
            coords = vector3(2275.46, -576.56, 41.61), -- Legendary Animal Spawn Coords
            model = "mp_a_c_alligator_01",            -- Ped Model of the Legendary Animal
            outfit = 2,                              -- Set Outfit for Legendary Animal / Check Pastebin (https://pastebin.com/6Vc26NLL) or Alternatively Spooner
        },
        hintBox = vector3(2302.59, -349.68, 42.79),   -- Initial Hint Box Spawn Coords at Start of Hunt
        cooldown = 120,                              -- Time in Minutes Before Anyone can Hunt this Animal Again
        rewards = {                                  -- Items Given at End of Successful Hunt (name MUST match item in Database)
            { name = "legaligators3", count = 1 },
            { name = "aligatorto", count = 2 },
            { name = "aligatormeat", count = 2 },
        },
        npc = {
            enabled = true,                               -- Enable / Disable Enemy NPCs
            model = "mp_g_m_m_unicriminals_03",      -- Ped Model of Enemy NPCs
            blip = {
                sprite = -1282792512,                     -- Blip Sprite for Enemy NPCs
                coords = vector3(2886.01, -252.28, 42.91), -- Blip Coords for Enemy NPCs
            },
            coords = {                                    -- Enemy NPC Spawn Coords
                vector3(2886.01, -252.28, 42.91),
                vector3(2888.01, -252.32, 42.93),
                vector3(2883.4, -258.45, 42.39),
                vector3(2885.86, -258.0, 42.41),
                vector3(2889.99, -257.18, 42.35),
                vector3(2890.79, -253.11, 42.34),
                vector3(2884.98, -247.31, 42.63),
            },
            hintBox = vector3(2884.5, -249.64, 42.72), -- Second Hint Box Spawn Coords / Available After Killing Enemy NPCs
        },
        secondaryAnimals = {                          -- Spawn Secondary Animals to Assist the Legendary Animal
            enabled = true,                           -- Enable / Disable Secondary Animals
            model = "a_c_alligator_01",    -- Model of the Secondary Animal. Make Sure this is NOT the Same Model as any Legendary Animals
            coords = {                                -- Spawn Coords for Secondary Animals
                vector3(2271.33, -577.91, 41.75),
                vector3(2269.29, -573.98, 41.69),
                vector3(2279.54, -580.42, 41.45),
            },
        },
    },
    -----------------------------------------------------

    {
        name = "Legendary Emerald Wolf", -- Name of the Hunt in the Menu (Make Sure these are Unique)
        location = "SD",              -- Hunter Shop Location Key / MUST Match the Shop Key in "shops.lua" to Show in Menu
        level = 45,                   -- Level of Trust Needed to Start Hunt
        currency = {
            type = "cash",            -- "cash = Cash Only / "gold" = Gold Only
            amount = 70               -- Cost to Start the Hunt in Selected Currency Type
        },
        legendary = {
            health = 900,                            -- Sets Legendary Animals Health Amount / Max is 1000?
            coords = vector3(1278.66, 340.61, 90.36), -- Legendary Animal Spawn Coords
            model = "mp_a_c_wolf_01",            -- Ped Model of the Legendary Animal
            outfit = 2,                              -- Set Outfit for Legendary Animal / Check Pastebin (https://pastebin.com/6Vc26NLL) or Alternatively Spooner
        },
        hintBox = vector3(1129.47, -975.95, 68.8),   -- Initial Hint Box Spawn Coords at Start of Hunt
        cooldown = 120,                              -- Time in Minutes Before Anyone can Hunt this Animal Again
        rewards = {                                  -- Items Given at End of Successful Hunt (name MUST match item in Database)
            { name = "legwolfs1", count = 1 },
            { name = "wolftooth", count = 2 },
            { name = "wolfheart", count = 1 },
        },
        npc = {
            enabled = true,                               -- Enable / Disable Enemy NPCs
            model = "mp_g_m_m_unicriminals_03",      -- Ped Model of Enemy NPCs
            blip = {
                sprite = -1282792512,                     -- Blip Sprite for Enemy NPCs
                coords = vector3(725.1, -463.42, 79.33), -- Blip Coords for Enemy NPCs
            },
            coords = {                                    -- Enemy NPC Spawn Coords
                vector3(725.89, -458.79, 79.38),
                vector3(723.14, -461.43, 79.43),
                vector3(725.36, -468.59, 85.88),
                vector3(727.81, -470.76, 85.88),
                vector3(732.51, -460.53, 79.38),
                vector3(734.11, -471.56, 77.23),
                vector3(728.99, -476.67, 76.34),
            },
            hintBox = vector3(725.55, -474.11, 77.5), -- Second Hint Box Spawn Coords / Available After Killing Enemy NPCs
        },
        secondaryAnimals = {                          -- Spawn Secondary Animals to Assist the Legendary Animal
            enabled = true,                           -- Enable / Disable Secondary Animals
            model = "a_c_wolf_medium",    -- Model of the Secondary Animal. Make Sure this is NOT the Same Model as any Legendary Animals
            coords = {                                -- Spawn Coords for Secondary Animals
                vector3(1279.52, 334.96, 90.15),
                vector3(1275.22, 339.83, 90.64),
                vector3(1282.04, 346.3, 90.53),
            },
        },
    },
    -----------------------------------------------------

    {
        name = "Legendary Tecas Alligator", -- Name of the Hunt in the Menu (Make Sure these are Unique)
        location = "SD",              -- Hunter Shop Location Key / MUST Match the Shop Key in "shops.lua" to Show in Menu
        level = 50,                   -- Level of Trust Needed to Start Hunt
        currency = {
            type = "cash",            -- "cash = Cash Only / "gold" = Gold Only
            amount = 70               -- Cost to Start the Hunt in Selected Currency Type
        },
        legendary = {
            health = 900,                            -- Sets Legendary Animals Health Amount / Max is 1000?
            coords = vector3(2181.04, -562.4, 41.6), -- Legendary Animal Spawn Coords
            model = "mp_a_c_alligator_01",            -- Ped Model of the Legendary Animal
            outfit = 0,                              -- Set Outfit for Legendary Animal / Check Pastebin (https://pastebin.com/6Vc26NLL) or Alternatively Spooner
        },
        hintBox = vector3(1307.11, -1130.81, 81.61),   -- Initial Hint Box Spawn Coords at Start of Hunt
        cooldown = 120,                              -- Time in Minutes Before Anyone can Hunt this Animal Again
        rewards = {                                  -- Items Given at End of Successful Hunt (name MUST match item in Database)
            { name = "legaligators1", count = 1 },
            { name = "aligatorto", count = 2 },
            { name = "aligatormeat", count = 2 },
        },
        npc = {
            enabled = true,                                 -- Enable / Disable Enemy NPCs
            model = "mp_g_m_m_unicriminals_03",        -- Ped Model of Enemy NPCs
            blip = {
                sprite = -1282792512,                       -- Blip Sprite for Enemy NPCs
                coords = vector3(1503.08, -1825.48, 56.23), -- Blip Coords for Enemy NPCs
            },
            coords = {                                      -- Enemy NPC Spawn Coords
                vector3(1503.46, -1819.03, 53.57),
                vector3(1509.56, -1818.78, 53.45),
                vector3(1514.55, -1829.2, 51.94),
                vector3(1510.04, -1839.29, 52.64),
                vector3(1488.24, -1836.54, 53.45),
                vector3(1481.91, -1827.46, 53.16),
                vector3(1504.54, -1812.07, 54.12),
                vector3(1491.91, -1813.53, 54.29),
            },
            hintBox = vector3(1500.39, -1836.13, 57.02), -- Second Hint Box Spawn Coords / Available After Killing Enemy NPCs
        },
        secondaryAnimals = {                          -- Spawn Secondary Animals to Assist the Legendary Animal
            enabled = true,                           -- Enable / Disable Secondary Animals
            model = "A_C_Alligator_01",    -- Model of the Secondary Animal. Make Sure this is NOT the Same Model as any Legendary Animals
            coords = {                                -- Spawn Coords for Secondary Animals
                vector3(2171.7, -563.97, 41.91),
                vector3(2182.06, -569.96, 41.44),
                vector3(2186.43, -564.12, 41.35),
                vector3(2179.88, -554.01, 41.54),
            },
        },
    },
    -----------------------------------------------------

    {
        name = "Legendary Tiger Cougar", -- Name of the Hunt in the Menu (Make Sure these are Unique)
        location = "SD",              -- Hunter Shop Location Key / MUST Match the Shop Key in "shops.lua" to Show in Menu
        level = 55,                   -- Level of Trust Needed to Start Hunt
        currency = {
            type = "cash",            -- "cash = Cash Only / "gold" = Gold Only
            amount = 70               -- Cost to Start the Hunt in Selected Currency Type
        },
        legendary = {
            health = 900,                            -- Sets Legendary Animals Health Amount / Max is 1000?
            coords = vector3(2015.18, -847.69, 43.11), -- Legendary Animal Spawn Coords
            model = "a_c_cougar_01",            -- Ped Model of the Legendary Animal
            outfit = 2,                              -- Set Outfit for Legendary Animal / Check Pastebin (https://pastebin.com/6Vc26NLL) or Alternatively Spooner
        },
        hintBox = vector3(2414.95, -735.83, 41.83),   -- Initial Hint Box Spawn Coords at Start of Hunt
        cooldown = 120,                              -- Time in Minutes Before Anyone can Hunt this Animal Again
        rewards = {                                  -- Items Given at End of Successful Hunt (name MUST match item in Database)
            { name = "legcougars", count = 1 },
            { name = "cougarf", count = 2 },
            { name = "cougareye", count = 2 },
        },
        npc = {
            enabled = true,                                 -- Enable / Disable Enemy NPCs
            model = "mp_g_m_m_unicriminals_03",        -- Ped Model of Enemy NPCs
            blip = {
                sprite = -1282792512,                       -- Blip Sprite for Enemy NPCs
                coords = vector3(757.32, -973.67, 48.69), -- Blip Coords for Enemy NPCs
            },
            coords = {                                      -- Enemy NPC Spawn Coords
                vector3(751.88, -970.07, 48.73),
                vector3(752.6, -973.1, 48.68),
                vector3(753.67, -976.44, 48.69),
                vector3(752.58, -987.45, 48.96),
                vector3(762.09, -992.77, 49.94),
                vector3(761.84, -976.55, 48.89),
                vector3(763.04, -967.12, 48.6),
                vector3(738.39, -967.88, 49.76),
            },
            hintBox = vector3(757.32, -973.67, 48.69), -- Second Hint Box Spawn Coords / Available After Killing Enemy NPCs
        },
        secondaryAnimals = {                          -- Spawn Secondary Animals to Assist the Legendary Animal
            enabled = true,                           -- Enable / Disable Secondary Animals
            model = "a_c_wolf_medium",    -- Model of the Secondary Animal. Make Sure this is NOT the Same Model as any Legendary Animals
            coords = {                                -- Spawn Coords for Secondary Animals
                vector3(2013.52, -841.81, 43.05),
                vector3(2012.52, -847.73, 43.11),
                vector3(2022.58, -848.56, 43.12),
                vector3(2031.36, -849.62, 42.74),
            },
        },
    },
    
    -----------------------------------------------------

    {
        name = "Legendary Nightwalker Panther", -- Name of the Hunt in the Menu (Make Sure these are Unique)
        location = "SD",              -- Hunter Shop Location Key / MUST Match the Shop Key in "shops.lua" to Show in Menu
        level = 60,                   -- Level of Trust Needed to Start Hunt
        currency = {
            type = "cash",            -- "cash = Cash Only / "gold" = Gold Only
            amount = 70               -- Cost to Start the Hunt in Selected Currency Type
        },
        legendary = {
            health = 900,                            -- Sets Legendary Animals Health Amount / Max is 1000?
            coords = vector3(1590.64, -1839.81, 52.35), -- Legendary Animal Spawn Coords
            model = "mp_a_c_panther_01",            -- Ped Model of the Legendary Animal
            outfit = 0,                              -- Set Outfit for Legendary Animal / Check Pastebin (https://pastebin.com/6Vc26NLL) or Alternatively Spooner
        },
        hintBox = vector3(2288.64, -661.37, 41.24),   -- Initial Hint Box Spawn Coords at Start of Hunt
        cooldown = 120,                              -- Time in Minutes Before Anyone can Hunt this Animal Again
        rewards = {                                  -- Items Given at End of Successful Hunt (name MUST match item in Database)
            { name = "legpanthers1", count = 1 },
            
            { name = "panthere", count = 2 },
        },
        npc = {
            enabled = true,                                 -- Enable / Disable Enemy NPCs vector3(2250.19, -768.52, 42.81)
            model = "mp_g_m_m_unicriminals_03",        -- Ped Model of Enemy NPCs
            blip = {
                sprite = -1282792512,                       -- Blip Sprite for Enemy NPCs
                coords = vector3(1886.29, -738.05, 41.9), -- Blip Coords for Enemy NPCs
            },
            coords = {                                      -- Enemy NPC Spawn Coords
                vector3(1875.13, -744.35, 42.11),
                vector3(1879.31, -744.6, 42.0),
                vector3(1892.2, -745.26, 41.94),
                vector3(1895.68, -747.15, 41.82),
                vector3(1881.92, -755.0, 41.73),
                vector3(1877.24, -755.95, 41.59),
                vector3(1892.93, -738.51, 42.29),
                vector3(1895.63, -736.25, 42.28),
                vector3(1893.69, -732.55, 42.08),
                
                
            },
            hintBox = vector3(1879.69, -743.2, 42.04), -- Second Hint Box Spawn Coords / Available After Killing Enemy NPCs
        },
        secondaryAnimals = {                          -- Spawn Secondary Animals to Assist the Legendary Animal
            enabled = true,                           -- Enable / Disable Secondary Animals
            model = "a_c_lionmangy_01",    -- Model of the Secondary Animal. Make Sure this is NOT the Same Model as any Legendary Animals
            coords = {                                -- Spawn Coords for Secondary Animals
                vector3(1584.47, -1851.13, 52.35),
                vector3(1594.94, -1840.69, 52.35),
            },
        },
    },
    -----------------------------------------------------
    -- O'Creagh's Run
    -----------------------------------------------------

    {
        name = "Legendary Grey Beaver", -- Name of the Hunt in the Menu (Make Sure these are Unique)
        location = "OCR",               -- Hunter Shop Location Key / MUST Match the Shop Key in "shops.lua" to Show in Menu
        level = 0,                      -- Level of Trust Needed to Start Hunt
        currency = {
            type = "cash",              -- "cash = Cash Only / "gold" = Gold Only
            amount = 70                 -- Cost to Start the Hunt in Selected Currency Type
        },
        legendary = {
            health = 600,                              -- Sets Legendary Animals Health Amount / Max is 1000?
            coords = vector3(2306.99, 1656.13, 88.62), -- Legendary Animal Spawn Coords
            model = "mp_a_c_beaver_01",                -- Ped Model of the Legendary Animal
            outfit = 0,                                -- Set Outfit for Legendary Animal / Check Pastebin (https://pastebin.com/6Vc26NLL) or Alternatively Spooner
        },
        hintBox = vector3(1528.46, 1434.07, 148.92),   -- Initial Hint Box Spawn Coords at Start of Hunt
        cooldown = 120,                                -- Time in Minutes Before Anyone can Hunt this Animal Again
        rewards = {                                    -- Items Given at End of Successful Hunt (name MUST match item in Database)
            { name = "legbeavers1", count = 1 },
            { name = "beavertail",  count = 1 },
            { name = "stringy",     count = 2 },
        },
        npc = {
            enabled = true,                                 -- Enable / Disable Enemy NPCs
            model = "a_m_m_huntertravelers_cool_01",        -- Ped Model of Enemy NPCs
            blip = {
                sprite = -1282792512,                       -- Blip Sprite for Enemy NPCs
                coords = vector3(2008.51, 1320.15, 191.48), -- Blip Coords for Enemy NPCs
            },
            coords = {                                      -- Enemy NPC Spawn Coords
                vector3(2017.48, 1327.57, 189.92),
                vector3(2013.07, 1311.74, 191.11),
                vector3(2006.41, 1303.69, 191.64),
                vector3(2004.8, 1338.09, 190.26),
            },
            hintBox = vector3(2001.55, 1312.36, 193.17), -- Second Hint Box Spawn Coords / Available After Killing Enemy NPCs
        },
        secondaryAnimals = {                             -- Spawn Secondary Animals to Assist the Legendary Animal
            enabled = true,                              -- Enable / Disable Secondary Animals
            model = "a_c_beaver_01",                     -- Model of the Secondary Animal. Make Sure this is NOT the Same Model as any Legendary Animals
            coords = {                                   -- Spawn Coords for Secondary Animals
                vector3(2301.05, 1657.23, 87.93),
                vector3(2305.7, 1644.05, 87.09),
            },
        },
    },
    -----------------------------------------------------

    {
        name = "Legendary White Beaver", -- Name of the Hunt in the Menu (Make Sure these are Unique)
        location = "OCR",                -- Hunter Shop Location Key / MUST Match the Shop Key in "shops.lua" to Show in Menu
        level = 5,                       -- Level of Trust Needed to Start Hunt
        currency = {
            type = "cash",               -- "cash = Cash Only / "gold" = Gold Only
            amount = 70                  -- Cost to Start the Hunt in Selected Currency Type
        },
        legendary = {
            health = 600,                             -- Sets Legendary Animals Health Amount / Max is 1000?
            coords = vector3(2638.86, 876.05, 93.64), -- Legendary Animal Spawn Coords
            model = "mp_a_c_beaver_01",               -- Ped Model of the Legendary Animal
            outfit = 1,                               -- Set Outfit for Legendary Animal / Check Pastebin (https://pastebin.com/6Vc26NLL) or Alternatively Spooner
        },
        hintBox = vector3(1869.57, 1469.41, 186.82),  -- Initial Hint Box Spawn Coords at Start of Hunt
        cooldown = 120,                               -- Time in Minutes Before Anyone can Hunt this Animal Again
        rewards = {                                   -- Items Given at End of Successful Hunt (name MUST match item in Database)
            { name = "legbeavers2", count = 1 },
            { name = "beavertail",  count = 1 },
            { name = "stringy",     count = 2 },
        },
        npc = {
            enabled = true,                                 -- Enable / Disable Enemy NPCs
            model = "a_m_m_huntertravelers_cool_01",        -- Ped Model of Enemy NPCs
            blip = {
                sprite = -1282792512,                       -- Blip Sprite for Enemy NPCs
                coords = vector3(2376.11, 1353.24, 106.13), -- Blip Coords for Enemy NPCs
            },
            coords = {                                      -- Enemy NPC Spawn Coords
                vector3(2362.3, 1368.67, 106.38),
                vector3(2346.58, 1348.53, 106.12),
                vector3(2374.65, 1343.12, 106.16),
                vector3(2378.9, 1362.29, 110.1),
            },
            hintBox = vector3(2369.65, 1364.4, 106.18), -- Second Hint Box Spawn Coords / Available After Killing Enemy NPCs
        },
        secondaryAnimals = {                            -- Spawn Secondary Animals to Assist the Legendary Animal
            enabled = true,                             -- Enable / Disable Secondary Animals
            model = "a_c_beaver_01",                    -- Model of the Secondary Animal. Make Sure this is NOT the Same Model as any Legendary Animals
            coords = {                                  -- Spawn Coords for Secondary Animals
                vector3(2641.79, 871.78, 93.6),
                vector3(2640.13, 887.3, 93.56),
            },
        },
    },
    -----------------------------------------------------

    {
        name = "Legendary Marble Fox", -- Name of the Hunt in the Menu (Make Sure these are Unique)
        location = "OCR",              -- Hunter Shop Location Key / MUST Match the Shop Key in "shops.lua" to Show in Menu
        level = 10,                    -- Level of Trust Needed to Start Hunt
        currency = {
            type = "cash",             -- "cash = Cash Only / "gold" = Gold Only
            amount = 70                -- Cost to Start the Hunt in Selected Currency Type
        },
        legendary = {
            health = 700,                               -- Sets Legendary Animals Health Amount / Max is 1000?
            coords = vector3(1735.09, 1496.12, 150.18), -- Legendary Animal Spawn Coords
            model = "mp_a_c_fox_01",                    -- Ped Model of the Legendary Animal
            outfit = 1,                                 -- Set Outfit for Legendary Animal / Check Pastebin (https://pastebin.com/6Vc26NLL) or Alternatively Spooner
        },
        hintBox = vector3(2247.42, 1223.87, 120.11),    -- Initial Hint Box Spawn Coords at Start of Hunt
        cooldown = 120,                                 -- Time in Minutes Before Anyone can Hunt this Animal Again
        rewards = {                                     -- Items Given at End of Successful Hunt (name MUST match item in Database)
            { name = "legfoxs2", count = 1 },
            { name = "foxt",     count = 2 },
            { name = "stringy",  count = 2 },
        },
        npc = {
            enabled = true,                                -- Enable / Disable Enemy NPCs
            model = "a_m_m_huntertravelers_cool_01",       -- Ped Model of Enemy NPCs
            blip = {
                sprite = -1282792512,                      -- Blip Sprite for Enemy NPCs
                coords = vector3(1258.55, 1157.5, 150.38), -- Blip Coords for Enemy NPCs
            },
            coords = {                                     -- Enemy NPC Spawn Coords
                vector3(1246.54, 1158.55, 151.3),
                vector3(1240.5, 1155.11, 151.16),
                vector3(1239.84, 1151.64, 150.3),
                vector3(1246.13, 1142.97, 149.99),
                vector3(1240.35, 1175.23, 149.6),
            },
            hintBox = vector3(1251.18, 1152.12, 150.78), -- Second Hint Box Spawn Coords / Available After Killing Enemy NPCs
        },
        secondaryAnimals = {                             -- Spawn Secondary Animals to Assist the Legendary Animal
            enabled = true,                              -- Enable / Disable Secondary Animals
            model = "a_c_fox_01",                        -- Model of the Secondary Animal. Make Sure this is NOT the Same Model as any Legendary Animals
            coords = {                                   -- Spawn Coords for Secondary Animals
                vector3(1733.82, 1491.1, 149.75),
                vector3(1723.39, 1499.05, 148.17),
                vector3(1724.31, 1513.3, 149.94),
            },
        },
    },
    -----------------------------------------------------

    {
        name = "Legendary Mudrunner Buck", -- Name of the Hunt in the Menu (Make Sure these are Unique)
        location = "OCR",                  -- Hunter Shop Location Key / MUST Match the Shop Key in "shops.lua" to Show in Menu
        level = 15,                        -- Level of Trust Needed to Start Hunt
        currency = {
            type = "cash",                 -- "cash = Cash Only / "gold" = Gold Only
            amount = 70                    -- Cost to Start the Hunt in Selected Currency Type
        },
        legendary = {
            health = 800,                               -- Sets Legendary Animals Health Amount / Max is 1000?
            coords = vector3(1735.09, 1496.12, 150.18), -- Legendary Animal Spawn Coords
            model = "mp_a_c_buck_01",                   -- Ped Model of the Legendary Animal
            outfit = 2,                                 -- Set Outfit for Legendary Animal / Check Pastebin (https://pastebin.com/6Vc26NLL) or Alternatively Spooner
        },
        hintBox = vector3(2247.42, 1223.87, 120.11),    -- Initial Hint Box Spawn Coords at Start of Hunt
        cooldown = 120,                                 -- Time in Minutes Before Anyone can Hunt this Animal Again
        rewards = {                                     -- Items Given at End of Successful Hunt (name MUST match item in Database)
            { name = "legbucks2",        count = 1 },
            { name = "legendbuckantler", count = 2 },
            { name = "venison",          count = 2 },
        },
        npc = {
            enabled = true,                                -- Enable / Disable Enemy NPCs
            model = "a_m_m_huntertravelers_cool_01",       -- Ped Model of Enemy NPCs
            blip = {
                sprite = -1282792512,                      -- Blip Sprite for Enemy NPCs
                coords = vector3(1258.55, 1157.5, 150.38), -- Blip Coords for Enemy NPCs
            },
            coords = {                                     -- Enemy NPC Spawn Coords
                vector3(1246.54, 1158.55, 151.3),
                vector3(1240.5, 1155.11, 151.16),
                vector3(1239.84, 1151.64, 150.3),
                vector3(1246.13, 1142.97, 149.99),
                vector3(1240.35, 1175.23, 149.6),
            },
            hintBox = vector3(1251.18, 1152.12, 150.78), -- Second Hint Box Spawn Coords / Available After Killing Enemy NPCs
        },
        secondaryAnimals = {                             -- Spawn Secondary Animals to Assist the Legendary Animal
            enabled = true,                              -- Enable / Disable Secondary Animals
            model = "a_c_fox_01",                        -- Model of the Secondary Animal. Make Sure this is NOT the Same Model as any Legendary Animals
            coords = {                                   -- Spawn Coords for Secondary Animals
                vector3(1733.82, 1491.1, 149.75),
                vector3(1723.39, 1499.05, 148.17),
                vector3(1724.31, 1513.3, 149.94),
            },
        },
    },
    -----------------------------------------------------

    {
        name = "Legendary Moose", -- Name of the Hunt in the Menu (Make Sure these are Unique)
        location = "OCR",         -- Hunter Shop Location Key / MUST Match the Shop Key in "shops.lua" to Show in Menu
        level = 20,               -- Level of Trust Needed to Start Hunt
        currency = {
            type = "cash",        -- "cash = Cash Only / "gold" = Gold Only
            amount = 70           -- Cost to Start the Hunt in Selected Currency Type
        },
        legendary = {
            health = 1000,                              -- Sets Legendary Animals Health Amount / Max is 1000?
            coords = vector3(406.69, 2396.29, 285.85), -- Legendary Animal Spawn Coords
            model = "a_c_moose_01",                    -- Ped Model of the Legendary Animal
            outfit = 6,                                -- Set Outfit for Legendary Animal / Check Pastebin (https://pastebin.com/6Vc26NLL) or Alternatively Spooner
        },
        hintBox = vector3(1228.79, 2036.57, 321.35),   -- Initial Hint Box Spawn Coords at Start of Hunt
        cooldown = 120,                                -- Time in Minutes Before Anyone can Hunt this Animal Again
        rewards = {                                    -- Items Given at End of Successful Hunt (name MUST match item in Database)
            { name = "legmooses",      count = 1 },
            { name = "legmooseantler", count = 2 },
            { name = "biggame",        count = 2 },
        },
        npc = {
            enabled = true,                                -- Enable / Disable Enemy NPCs
            model = "a_m_m_huntertravelers_cool_01",       -- Ped Model of Enemy NPCs
            blip = {
                sprite = -1282792512,                      -- Blip Sprite for Enemy NPCs
                coords = vector3(727.18, 1739.65, 225.13), -- Blip Coords for Enemy NPCs
            },
            coords = {                                     -- Enemy NPC Spawn Coords
                vector3(720.27, 1745.16, 224.52),
                vector3(727.31, 1732.28, 225.33),
                vector3(743.91, 1729.47, 226.1),
                vector3(732.9, 1755.63, 227.29),
                vector3(715.22, 1749.13, 224.06),
            },
            hintBox = vector3(718.53, 1733.97, 224.31), -- Second Hint Box Spawn Coords / Available After Killing Enemy NPCs
        },
        secondaryAnimals = {                            -- Spawn Secondary Animals to Assist the Legendary Animal
            enabled = true,                             -- Enable / Disable Secondary Animals
            model = "a_c_moose_01",                     -- Model of the Secondary Animal. Make Sure this is NOT the Same Model as any Legendary Animals
            coords = {                                  -- Spawn Coords for Secondary Animals
                vector3(414.83, 2388.42, 284.03),
                vector3(401.27, 2385.54, 282.95),
                vector3(409.36, 2377.72, 282.27),
            },
        },
    },
    -----------------------------------------------------

    {
        name = "Legendary Knight Moose", -- Name of the Hunt in the Menu (Make Sure these are Unique)
        location = "OCR",                -- Hunter Shop Location Key / MUST Match the Shop Key in "shops.lua" to Show in Menu
        level = 25,                      -- Level of Trust Needed to Start Hunt
        currency = {
            type = "cash",               -- "cash = Cash Only / "gold" = Gold Only
            amount = 70                  -- Cost to Start the Hunt in Selected Currency Type
        },
        legendary = {
            health = 1000,                               -- Sets Legendary Animals Health Amount / Max is 1000?
            coords = vector3(2738.87, 2328.23, 156.85), -- Legendary Animal Spawn Coords
            model = "mp_a_c_moose_01",                  -- Ped Model of the Legendary Animal
            outfit = 2,                                 -- Set Outfit for Legendary Animal / Check Pastebin (https://pastebin.com/6Vc26NLL) or Alternatively Spooner
        },
        hintBox = vector3(2302.15, 1696.61, 97.45),     -- Initial Hint Box Spawn Coords at Start of Hunt
        cooldown = 120,                                 -- Time in Minutes Before Anyone can Hunt this Animal Again
        rewards = {                                     -- Items Given at End of Successful Hunt (name MUST match item in Database)
            { name = "legmooses2",     count = 1 },
            { name = "legmooseantler", count = 2 },
            { name = "biggame",        count = 2 },
        },
        npc = {
            enabled = true,                                 -- Enable / Disable Enemy NPCs
            model = "a_m_m_huntertravelers_cool_01",        -- Ped Model of Enemy NPCs
            blip = {
                sprite = -1282792512,                       -- Blip Sprite for Enemy NPCs
                coords = vector3(2723.68, 1846.88, 114.55), -- Blip Coords for Enemy NPCs
            },
            coords = {                                      -- Enemy NPC Spawn Coords
                vector3(2728.28, 1848.49, 116.5),
                vector3(2724.54, 1870.18, 112.06),
                vector3(2727.52, 1866.28, 113.36),
                vector3(2707.62, 1845.47, 108.2),
                vector3(2725.13, 1846.51, 115.22),
                vector3(2722.58, 1845.48, 114.22),
            },
            hintBox = vector3(2723.87, 1855.93, 113.88), -- Second Hint Box Spawn Coords / Available After Killing Enemy NPCs
        },
        secondaryAnimals = {                             -- Spawn Secondary Animals to Assist the Legendary Animal
            enabled = true,                              -- Enable / Disable Secondary Animals
            model = "a_c_moose_01",                      -- Model of the Secondary Animal. Make Sure this is NOT the Same Model as any Legendary Animals
            coords = {                                   -- Spawn Coords for Secondary Animals
                vector3(2733.26, 2331.48, 156.92),
                vector3(2746.69, 2325.0, 157.0),
                vector3(2740.53, 2317.37, 156.97),
            },
        },
    },
    -----------------------------------------------------
    { -- Legendary Katata Elk setup
        name = "Legendary Katata Elk",                   -- Name of the Hunt in the Menu (Make Sure these are Unique)
        location = "OCR",                                -- Hunter Shop Location Key / MUST Match the Shop Key in "shops.lua" to Show in Menu
        level = 30,                                      -- Level of Trust Needed to Start Hunt
        currency = {
            type = "cash",                               -- "cash = Cash Only / "gold" = Gold Only
            amount = 70                                  -- Cost to Start the Hunt in Selected Currency Type
        },
        legendary = {
            health = 1000,                                -- Sets Legendary Animals Health Amount / Max is 1000?
            coords = vector3(2287.04, 2092.92, 200.53), -- Legendary Animal Spawn Coords
            model = "mp_a_c_elk_01",                     -- Ped Model of the Legendary Animal
            outfit = 1,                                  -- Set Outfit for Legendary Animal
        },
        hintBox = vector3(1237.1, 2041.46, 320.58),      -- Initial Hint Box Spawn Coords at Start of Hunt
        cooldown = 120,                                  -- Time in Minutes Before Anyone can Hunt this Animal Again
        rewards = {                                      -- Items Given at End of Successful Hunt
            { name = "legelks1", count = 1 },
            { name = "legelkantler", count = 2 },
            { name = "venison", count = 2 },
        },
        npc = {
            enabled = true,                               -- Enable / Disable Enemy NPCs
            model = "a_m_m_huntertravelers_cool_01",    -- Ped Model of Enemy NPCs
            blip = {
                sprite = -1282792512,                   -- Blip Sprite for Enemy NPCs
                coords = vector3(2470.5, 2003.08, 168.16), -- Blip Coords for Enemy NPCs
            },
            coords = {                                   -- Enemy NPC Spawn Coords
                vector3(2458.03, 2012.18, 169.3),
                vector3(2465.08, 2018.49, 170.16),
                vector3(2476.88, 2003.43, 168.14),
                vector3(2482.34, 1997.21, 168.22),
                vector3(2478.03, 1993.23, 168.18),
                vector3(2471.49, 1995.91, 168.16),
                vector3(2474.31, 2000.03, 168.26),
            },
            hintBox = vector3(2485.71, 1993.87, 168.09), -- Second Hint Box Spawn Coords / Available After Killing Enemy NPCs
        },
        secondaryAnimals = {                              -- Spawn Secondary Animals to Assist the Legendary Animal
            enabled = true,                               -- Enable / Disable Secondary Animals
            model = "a_c_wolf_medium",                            -- Model of the Secondary Animal
            coords = {                                    -- Spawn Coords for Secondary Animals
                vector3(2293.32, 2092.13, 200.8),
                vector3(2291.98, 2099.6, 202.41),
                vector3(2279.33, 2094.26, 200.47),
                vector3(2278.17, 2088.14, 200.08),
            },
        },
    },
    -----------------------------------------------------
    { -- Legendary Takanta Bison setup
        name = "Legendary Takanta Bison",               -- Name of the Hunt in the Menu (Make Sure these are Unique)
        location = "OCR",                                -- Hunter Shop Location Key / MUST Match the Shop Key in "shops.lua" to Show in Menu
        level = 35,                                      -- Level of Trust Needed to Start Hunt
        currency = {
            type = "cash",                               -- "cash = Cash Only / "gold" = Gold Only
            amount = 70                                  -- Cost to Start the Hunt in Selected Currency Type
        },
        legendary = {
            health = 1000,                                -- Sets Legendary Animals Health Amount / Max is 1000?
            coords = vector3(1107.78, 599.44, 90.05),   -- Legendary Animal Spawn Coords
            model = "mp_a_c_buffalo_01",                 -- Ped Model of the Legendary Animal
            outfit = 0,                                  -- Set Outfit for Legendary Animal
        },
        hintBox = vector3(1698.84, 1140.38, 191.32),    -- Initial Hint Box Spawn Coords at Start of Hunt
        cooldown = 120,                                  -- Time in Minutes Before Anyone can Hunt this Animal Again
        rewards = {                                      -- Items Given at End of Successful Hunt
            { name = "legbisonstak", count = 1 },
            { name = "legbisonhorn", count = 2 },
            { name = "beef", count = 2 },
        },
        npc = {
            enabled = true,                               -- Enable / Disable Enemy NPCs
            model = "a_m_m_huntertravelers_cool_01",    -- Ped Model of Enemy NPCs
            blip = {
                sprite = -1282792512,                   -- Blip Sprite for Enemy NPCs
                coords = vector3(2017.63, 615.78, 157.4), -- Blip Coords for Enemy NPCs
            },
            coords = {                                   -- Enemy NPC Spawn Coords
                vector3(2015.7, 621.52, 158.54),
                vector3(2016.54, 623.81, 158.58),
                vector3(2007.72, 622.64, 158.85),
                vector3(2014.15, 613.29, 157.3),
                vector3(2020.66, 603.07, 155.3),
                vector3(2018.41, 602.69, 161.05),
                vector3(2026.57, 629.58, 157.55),
            },
            hintBox = vector3(2015.45, 620.78, 158.43), -- Second Hint Box Spawn Coords / Available After Killing Enemy NPCs
        },
        secondaryAnimals = {                              -- Spawn Secondary Animals to Assist the Legendary Animal
            enabled = true,                               -- Enable / Disable Secondary Animals
            model = "a_c_wolf_medium",                            -- Model of the Secondary Animal
            coords = {                                    -- Spawn Coords for Secondary Animals
                vector3(1099.59, 598.81, 91.24),
                vector3(1107.75, 609.76, 90.58),
                vector3(1115.63, 603.1, 90.18),
            },
        },
    },
    -----------------------------------------------------
    {
        name = "Legendary Bison", -- Name of the Hunt in the Menu
        location = "OCR",         -- Hunter Shop Location Key / MUST Match the Shop Key in "shops.lua" to Show in Menu
        level = 40,               -- Level of Trust Needed to Start Hunt
        currency = {
            type = "cash",        -- "cash = Cash Only / "gold" = Gold Only
            amount = 70           -- Cost to Start the Hunt in Selected Currency Type
        },
        legendary = {
            health = 1000,         -- Sets Legendary Animals Health Amount / Max is 1000?
            coords = vector3(1001.98, 669.23, 110.73), -- Legendary Animal Spawn Coords
            model = "a_c_buffalo_01",                  -- Ped Model of the Legendary Animal
            outfit = 4,                                 -- Set Outfit for Legendary Animal / Check Pastebin (https://pastebin.com/6Vc26NLL) or Alternatively Spooner
        },
        hintBox = vector3(1444.28, 1458.46, 189.08),    -- Initial Hint Box Spawn Coords at Start of Hunt
        npc = {
            enabled = true,                             -- Enable / Disable Enemy NPCs
            model = "a_m_m_huntertravelers_cool_01",    -- Ped Model of Enemy NPCs
            blip = {
                sprite = -1282792512,                  -- Blip Sprite for Enemy NPCs
                coords = vector3(988.45, 1456.78, 278.35), -- Blip Coords for Enemy NPCs
            },
            coords = {                                 -- Enemy NPC Spawn Coords
                vector3(1003.29, 1473.5, 278.97),
                vector3(993.4, 1480.2, 279.87),
                vector3(990.56, 1472.66, 278.38),
                vector3(980.6, 1446.85, 278.97),
                vector3(973.71, 1440.76, 281.59),
                vector3(998.35, 1435.39, 281.0),
                vector3(1008.22, 1444.88, 277.88),
            },
            hintBox = vector3(980.6, 1446.85, 278.97),  -- Second Hint Box Spawn Coords / Available After Killing Enemy NPCs
        },
        secondaryAnimals = {                           -- Spawn Secondary Animals to Assist the Legendary Animal
            enabled = true,                            -- Enable / Disable Secondary Animals
            model = "a_c_wolf_medium",                        -- Model of the Secondary Animal. Make Sure this is NOT the Same Model as any Legendary Animals
            coords = {                                 -- Spawn Coords for Secondary Animals
                vector3(994.3, 670.7, 110.26),
                vector3(997.99, 682.42, 110.9),
                vector3(1014.2, 682.88, 110.79),
            },
        },
        rewards = {                                     -- Items Given at End of Successful Hunt (name MUST match item in Database)
            { name = "legbisons",      count = 1 },
            { name = "legbisonhorn",   count = 2 },
            { name = "beef",           count = 2 },
        },
        cooldown = 120,                                 -- Time in Minutes Before Anyone can Hunt this Animal Again
    },
    -----------------------------------------------------
    {
        name = "Legendary Tatanka Bison", -- Name of the Hunt in the Menu
        location = "OCR",         -- Hunter Shop Location Key / MUST Match the Shop Key in "shops.lua" to Show in Menu
        level = 45,               -- Level of Trust Needed to Start Hunt
        currency = {
            type = "cash",        -- "cash = Cash Only / "gold" = Gold Only
            amount = 70           -- Cost to Start the Hunt in Selected Currency Type
        },
        legendary = {
            health = 1000,         -- Sets Legendary Animals Health Amount / Max is 1000?
            coords = vector3(1462.03, -123.88, 99.07), -- Legendary Animal Spawn Coords
            model = "a_c_buffalo_tatanka_01",                  -- Ped Model of the Legendary Animal
            outfit = 0,                                 -- Set Outfit for Legendary Animal / Check Pastebin (https://pastebin.com/6Vc26NLL) or Alternatively Spooner
        },
        hintBox = vector3(1868.34, 1314.85, 204.03),    -- Initial Hint Box Spawn Coords at Start of Hunt
        npc = {
            enabled = true,                             -- Enable / Disable Enemy NPCs
            model = "a_m_m_huntertravelers_cool_01",    -- Ped Model of Enemy NPCs
            blip = {
                sprite = -1282792512,                  -- Blip Sprite for Enemy NPCs
                coords = vector3(2709.22, 708.2, 78.58), -- Blip Coords for Enemy NPCs
            },
            coords = {                                 -- Enemy NPC Spawn Coords
                vector3(2696.66, 707.91, 76.84),
                vector3(2694.08, 705.54, 76.48),
                vector3(2713.55, 702.07, 77.98),
                vector3(2713.85, 707.85, 79.14),
                vector3(2713.45, 711.8, 79.01),
                vector3(2716.0, 714.34, 78.9),
                vector3(2720.33, 712.95, 78.94),
                vector3(2722.8, 707.8, 78.8),
            },
            hintBox = vector3(2722.8, 707.8, 78.8),      -- Second Hint Box Spawn Coords / Available After Killing Enemy NPCs
        },
        secondaryAnimals = {                           -- Spawn Secondary Animals to Assist the Legendary Animal
            enabled = true,                            -- Enable / Disable Secondary Animals
            model = "A_C_Panther_01",                  -- Model of the Secondary Animal. Make Sure this is NOT the Same Model as any Legendary Animals
            coords = {                                 -- Spawn Coords for Secondary Animals
                vector3(1471.39, -114.38, 96.87),
                vector3(1468.22, -132.85, 97.72),
            },
        },
        rewards = {                                     -- Items Given at End of Successful Hunt (name MUST match item in Database)
            { name = "legbisons1",      count = 1 },
            { name = "legbisonhorn",   count = 2 },
            { name = "beef",           count = 2 },
        },
        cooldown = 120,                                 -- Time in Minutes Before Anyone can Hunt this Animal Again
    },
    -----------------------------------------------------
    {
        name = "Legendary Moonstone Wolf", -- Name of the Hunt in the Menu
        location = "OCR",         -- Hunter Shop Location Key / MUST Match the Shop Key in "shops.lua" to Show in Menu
        level = 50,               -- Level of Trust Needed to Start Hunt
        currency = {
            type = "cash",        -- "cash = Cash Only / "gold" = Gold Only
            amount = 70           -- Cost to Start the Hunt in Selected Currency Type
        },
        legendary = {
            health = 800,         -- Sets Legendary Animals Health Amount / Max is 1000?
            coords = vector3(1239.53, 1134.5, 148.54), -- Legendary Animal Spawn Coords
            model = "mp_a_c_wolf_01",                  -- Ped Model of the Legendary Animal
            outfit = 2,                                 -- Set Outfit for Legendary Animal / Check Pastebin (https://pastebin.com/6Vc26NLL) or Alternatively Spooner
        },
        hintBox = vector3(1237.03, 2072.22, 316.62),    -- Initial Hint Box Spawn Coords at Start of Hunt
        npc = {
            enabled = true,                             -- Enable / Disable Enemy NPCs
            model = "a_m_m_huntertravelers_cool_01",    -- Ped Model of Enemy NPCs
            blip = {
                sprite = -1282792512,                  -- Blip Sprite for Enemy NPCs
                coords = vector3(744.35, 1850.5, 241.03), -- Blip Coords for Enemy NPCs
            },
            coords = {                                 -- Enemy NPC Spawn Coords
                vector3(741.49, 1861.99, 240.79),
                vector3(738.23, 1855.25, 239.82),
                vector3(731.2, 1850.61, 239.63),
                vector3(724.93, 1842.27, 238.73),
                vector3(722.52, 1829.27, 236.72),
                vector3(732.99, 1814.23, 236.5),
                vector3(733.91, 1810.32, 236.35),
                vector3(744.54, 1840.13, 239.61),
            },
            hintBox = vector3(732.07, 1846.87, 239.98),      -- Second Hint Box Spawn Coords / Available After Killing Enemy NPCs
        },
        secondaryAnimals = {                           -- Spawn Secondary Animals to Assist the Legendary Animal
            enabled = true,                            -- Enable / Disable Secondary Animals
            model = "a_c_wolf_medium",                  -- Model of the Secondary Animal. Make Sure this is NOT the Same Model as any Legendary Animals
            coords = {                                 -- Spawn Coords for Secondary Animals
                vector3(1243.64, 1130.03, 147.69),
                vector3(1242.82, 1140.64, 149.66),
                vector3(1239.48, 1121.04, 145.55),
                vector3(1251.53, 1124.81, 146.93),
            },
        },
        rewards = {                                     -- Items Given at End of Successful Hunt (name MUST match item in Database)
            { name = "legwolfs3",   count = 1 },
            { name = "wolftooth",   count = 2 },
            { name = "wolfheart",   count = 2 },
        },
        cooldown = 120,                                 -- Time in Minutes Before Anyone can Hunt this Animal Again
    },
    -----------------------------------------------------
    {
        name = "Legendary Black Cougar", -- Name of the Hunt in the Menu
        location = "OCR",         -- Hunter Shop Location Key / MUST Match the Shop Key in "shops.lua" to Show in Menu
        level = 55,               -- Level of Trust Needed to Start Hunt
        currency = {
            type = "cash",        -- "cash = Cash Only / "gold" = Gold Only
            amount = 70           -- Cost to Start the Hunt in Selected Currency Type
        },
        legendary = {
            health = 800,         -- Sets Legendary Animals Health Amount / Max is 1000?
            coords = vector3(2399.65, 2361.03, 253.2), -- Legendary Animal Spawn Coords
            model = "mp_a_c_cougar_01",                  -- Ped Model of the Legendary Animal
            outfit = 3,                                 -- Set Outfit for Legendary Animal / Check Pastebin (https://pastebin.com/6Vc26NLL) or Alternatively Spooner
        },
        hintBox = vector3(2325.98, 1092.86, 103.26),    -- Initial Hint Box Spawn Coords at Start of Hunt
        npc = {
            enabled = true,                             -- Enable / Disable Enemy NPCs
            model = "a_m_m_huntertravelers_cool_01",    -- Ped Model of Enemy NPCs -- a_m_m_wapwarriors_01
            blip = {
                sprite = -1282792512,                  -- Blip Sprite for Enemy NPCs
                coords = vector3(2543.89, 707.56, 79.18), -- Blip Coords for Enemy NPCs
            },
            coords = {                                 -- Enemy NPC Spawn Coords
                vector3(2536.57, 690.82, 78.47),
                vector3(2536.14, 696.33, 78.38),
                vector3(2543.33, 692.18, 79.13),
                vector3(2548.48, 695.39, 79.72),
                vector3(2548.88, 699.47, 79.77),
                vector3(2542.47, 703.41, 79.45),
                vector3(2538.32, 700.7, 78.7),
                vector3(2535.13, 698.82, 78.19),
                vector3(2537.62, 705.14, 78.24),
            },
            hintBox = vector3(2545.84, 694.23, 79.59),      -- Second Hint Box Spawn Coords / Available After Killing Enemy NPCs
        },
        secondaryAnimals = {                           -- Spawn Secondary Animals to Assist the Legendary Animal
            enabled = true,                            -- Enable / Disable Secondary Animals
            model = "a_c_wolf_medium",                  -- Model of the Secondary Animal. Make Sure this is NOT the Same Model as any Legendary Animals
            coords = {                                 -- Spawn Coords for Secondary Animals
                vector3(2398.99, 2357.12, 252.86),
                vector3(2392.05, 2364.23, 254.28),
                vector3(2385.53, 2356.76, 254.37),
                vector3(2395.35, 2377.71, 252.25),
                vector3(2384.81, 2379.23, 254.44),
            },
        },
        rewards = {                                     -- Items Given at End of Successful Hunt (name MUST match item in Database)
            { name = "legcougars4",   count = 1 },
            { name = "cougarf",   count = 2 },
        },
        cooldown = 120,                                 -- Time in Minutes Before Anyone can Hunt this Animal Again
    },
    -----------------------------------------------------
    {
        name = "Legendary Deadly Bear", -- Name of the Hunt in the Menu
        location = "OCR",         -- Hunter Shop Location Key / MUST Match the Shop Key in "shops.lua" to Show in Menu
        level = 60,               -- Level of Trust Needed to Start Hunt
        currency = {
            type = "cash",        -- "cash = Cash Only / "gold" = Gold Only
            amount = 70           -- Cost to Start the Hunt in Selected Currency Type
        },
        legendary = {
            health = 1000,         -- Sets Legendary Animals Health Amount / Max is 1000?
            coords = vector3(2356.04, 1367.8, 106.2), -- Legendary Animal Spawn Coords
            model = "mp_a_c_bear_01",                  -- Ped Model of the Legendary Animal
            outfit = 0,                                 -- Set Outfit for Legendary Animal / Check Pastebin (https://pastebin.com/6Vc26NLL) or Alternatively Spooner
        },
        hintBox = vector3(1399.71, 1467.19, 189.86),    -- Initial Hint Box Spawn Coords at Start of Hunt
        npc = {
            enabled = true,                             -- Enable / Disable Enemy NPCs
            model = "a_m_m_huntertravelers_cool_01",    -- Ped Model of Enemy NPCs
            blip = {
                sprite = -1282792512,                  -- Blip Sprite for Enemy NPCs
                coords = vector3(2486.25, 1766.62, 86.84), -- Blip Coords for Enemy NPCs
            },
            coords = {                                 -- Enemy NPC Spawn Coords
                vector3(2481.33, 1765.36, 86.72),
                vector3(2472.07, 1762.84, 86.58),
                vector3(2469.41, 1755.37, 86.65),
                vector3(2485.06, 1748.51, 87.25),
                vector3(2495.12, 1760.37, 87.52),
                vector3(2491.66, 1772.58, 86.96),
                vector3(2480.95, 1765.33, 86.71),
                vector3(2474.1, 1740.76, 86.95),
                vector3(2475.69, 1729.87, 86.94),
                vector3(2487.5, 1738.1, 87.3),
            },
            hintBox = vector3(2479.16, 1774.39, 86.5),      -- Second Hint Box Spawn Coords / Available After Killing Enemy NPCs
        },
        secondaryAnimals = {                           -- Spawn Secondary Animals to Assist the Legendary Animal
            enabled = true,                            -- Enable / Disable Secondary Animals
            model = "a_c_bear_01",                  -- Model of the Secondary Animal. Make Sure this is NOT the Same Model as any Legendary Animals
            coords = {                                 -- Spawn Coords for Secondary Animals
                vector3(2368.87, 1361.77, 106.16),
                vector3(2337.67, 1364.07, 106.3),
            },
        },
        rewards = {                                     -- Items Given at End of Successful Hunt (name MUST match item in Database)
            { name = "legbears1",   count = 1 },
            { name = "beart",   count = 2 },
            { name = "bearc",   count = 2 },
            { name = "biggame",   count = 2 },
        },
        cooldown = 120,                                 -- Time in Minutes Before Anyone can Hunt this Animal Again
    },
}
