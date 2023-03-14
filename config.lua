Config = {}

Language = "en_lang" -- change en to change the languarge. Supported languages: en, es, de, fr

Config.shop = {
    shoplocation = { x = 1704.63, y = 1489.88, z = 146.52 }, --this is where the shop will be
}

GlobalHuntCooldown = 7200000 --this is how long before the hunter will allow you to do another hunt this is server sided so once someone does it everyone has to wait until this timer is over to do another hunt

Config.locations = {
    { --gator setup
        hintcost = 50,
        Leganimalhealth = 500, -- sets the legendary animals health amount max is 1000 I believe
        investigationspot = {x = 1718.58, y = -1001.05, z = 41.84}, --this is where the first chest will spawn
        huntname = 'Legendary Gator', --the name of the hunt in the menu
        enemynpc = true, --if you want to fight enemy npcs or not
        coordinates = {x = 2002.28, y = -1758.61, z = 41.03}, --this is where the animal will spawn
        pedmodel = 'A_C_Alligator_02', -- Ped model of the animal
        GivenItems = { --this lists the items it gives you you can add more if you want
            {
                name = "legaligators",
                count = 1
            },
        },
        npcblipcoord = {x = 1885.23, y = -735.3, z = 41.96}, --where the blip of the npcs will show
        npcschest = {x = 1880.93, y = -734.88, z = 42.53}, --where the chest appears after you kill the npcs
        Npccoords = { --npcs coords you cann add as many as you want or as little as you want
            {x = 1893.72, y = -734.27, z = 42.09},
            {x = 1890.78, y = -741.34, z = 42.12},
            {x = 1894.06, y = -743.03, z = 42.27},
            {x = 1895.48, y = -752.23, z = 41.68},
            {x = 1881.26, y = -754.46, z = 41.7},
            {x = 1875.95, y = -755.99, z = 41.5},
        },
        SecondaryAnimals = {
            secondaryanimals = true, --if true it will spawn animals along with the legendary animal to help it
            animalmodel = 'A_C_Alligator_01', --this is the model of the secondary animal. Make sure this is not the same model as any legendary animals
            Animalspawns = {
                {x = 1996.61, y = -1761.09, z = 41.51},
                {x = 1992.2, y = -1761.04, z = 41.16},
            },
        },
    },
    {
        --bear setup
        hintcost = 50,
        Leganimalhealth = 500, --max is 1000 I believe
        investigationspot = {x = 1197.62, y = 2034.54, z = 322.93},
        huntname = 'Legendary Bear',
        enemynpc = true,
        coordinates = {x = 1416.96, y = 1802.72, z = 170.48},
        pedmodel = 'MP_A_C_BEAR_01',
        GivenItems = {
            {
                name = "leggbears",
                count = 1
            },
        },
        npcblipcoord = {x = 723.44, y = 1851.35, z = 239.16},
        npcschest = {x = 718.31, y = 1850.45, z = 238.88},
        Npccoords = {
            {x = 714.14, y = 1860.12, z = 239.46},
            {x = 724.25, y = 1859.29, z = 239.77},
            {x = 721.45, y = 1866.38, z = 239.81},
            {x = 722.36, y = 1845.43, z = 237.87},
        },
        SecondaryAnimals = {
            secondaryanimals = false, --if true it will spawn animals along with the legendary animal to help it
            animalmodel = 'A_C_Alligator_01', --this is the model of the secondary animal. Make sure this is not the same model as any legendary animals
            Animalspawns = {
                {x = 1996.61, y = -1761.09, z = 41.51},
                {x = 1992.2, y = -1761.04, z = 41.16},
            },
        },
    },
    {
        --wolf setup
        hintcost = 50,
        Leganimalhealth = 500, --max is 1000 I believe
        investigationspot = {x = -1726.5, y = -87.84, z = 181.28},
        huntname = 'Legendary Wolf',
        enemynpc = true,
        coordinates = {x = -1526.75, y = 517.37, z = 102.05},
        pedmodel = 'MP_A_C_Wolf_01',
        GivenItems = {
            {
                name = "legwolfs1", --this is the 2nd item it gives
                count = 1 --This is the amount of the 2nd item it gives
            },
        },
        npcblipcoord = {x = -1812.67, y = 651.78, z = 131.04},
        npcschest = {x = -1822.0, y = 657.03, z = 131.72},
        Npccoords = {
            {x = -1816.78, y = 647.18, z = 130.97},
            {x = -1808.41, y = 652.65, z = 131.11},
            {x = -1808.34, y = 660.62, z = 132.2},
            {x = -1809.72, y = 668.07, z = 133.31},
        },
        SecondaryAnimals = {
            secondaryanimals = false, --if true it will spawn animals along with the legendary animal to help it
            animalmodel = 'A_C_Alligator_01', --this is the model of the secondary animal. Make sure this is not the same model as any legendary animals
            Animalspawns = {
                {x = 1996.61, y = -1761.09, z = 41.51},
                {x = 1992.2, y = -1761.04, z = 41.16},
            },
        },
    },
    {
        --boar setup
        hintcost = 50,
        Leganimalhealth = 500, --max is 1000 I believe
        investigationspot = {x = 757.77, y = -842.5, z = 55.24},
        huntname = "Legendary Boar",
        enemynpc = true,
        coordinates = {x = 1182.4, y = -96.61, z = 96.55},
        pedmodel = 'MP_A_C_Boar_01',
        GivenItems = {
            {
                name = "legboars", --this is the 2nd item it gives
                count = 1 --This is the amount of the 2nd item it gives
            },
        },
        npcblipcoord = {x = 897.4, y = 255.53, z = 120.08},
        npcschest = {x = 894.56, y = 255.83, z = 119.81},
        Npccoords = {
            {x = 897.4, y = 255.53, z = 120.08},
            {x = 894.24, y = 251.26, z = 118.7},
            {x = 898.0, y = 249.3, z = 119.09},
            {x = 892.39, y = 247.5, z = 117.96},
        },
        SecondaryAnimals = {
            secondaryanimals = false, --if true it will spawn animals along with the legendary animal to help it
            animalmodel = 'A_C_Alligator_01', --this is the model of the secondary animal. Make sure this is not the same model as any legendary animals
            Animalspawns = {
                {x = 1996.61, y = -1761.09, z = 41.51},
                {x = 1992.2, y = -1761.04, z = 41.16},
            },
        },
    },
    {
        --fox
        hintcost = 70,
        Leganimalhealth = 500, --max is 1000 I believe
        investigationspot = {x = 1470.33, y = -1723.61, z = 61.85},
        huntname = "Legendary Fox",
        enemynpc = false,
        coordinates = {x = 751.77, y = -971.89, z = 48.7},
        pedmodel = 'MP_A_C_FOX_01',
        GivenItems = {
            {
                name = "legfoxs3", --this is the 2nd item it gives
                count = 1 --This is the amount of the 2nd item it gives
            },
        },
        npcblipcoord = {x = 897.4, y = 255.53, z = 120.08},
        npcschest = {x = 894.56, y = 255.83, z = 119.81},
        Npccoords = {
            {x = 897.4, y = 255.53, z = 120.08},
            {x = 894.24, y = 251.26, z = 118.7},
            {x = 898.0, y = 249.3, z = 119.09},
            {x = 892.39, y = 247.5, z = 117.96},
        },
        SecondaryAnimals = {
            secondaryanimals = false, --if true it will spawn animals along with the legendary animal to help it
            animalmodel = 'A_C_Alligator_01', --this is the model of the secondary animal. Make sure this is not the same model as any legendary animals
            Animalspawns = {
                {x = 1996.61, y = -1761.09, z = 41.51},
                {x = 1992.2, y = -1761.04, z = 41.16},
            },
        },
    },
    --Too add more hunts just copy and paste one from above and change what you need
}