Config = {
    Weapons = {
        pistol = {
            label = "Combat Pistol",
            item = "weapon_combatpistol",
            category = "pistols",
            price = 2500, -- required black money
            materials = {
                frame = 2,
                barrel = 1,
                spring = 1
            },
            craftingTime = 3600, -- seconds (1 hour)
            failChance = 15 -- percentage (%)
        },
        rifle = {
            label = "Carbine Rifle",
            item = "weapon_carbinerifle",
            category = "rifles",
            price = 5000,
            materials = {
                frame = 3,
                barrel = 2,
                spring = 2
            },
            craftingTime = 3600,
            failChance = 20
        },
        knife = {
            label = "Knife",
            item = "weapon_knife",
            category = "melee",
            price = 2500,
            materials = {
                handle = 1,
                blade = 1,
                rod = 1
            },
            craftingTime = 1800,
            failChance = 10
        }
    },

    GatherPoints = {
        frame = {
            label = "Collect Weapon Frame",
            coords = vector3(1234.56, 123.45, 78.90),
            time = 5000,
            item = "frame"
        },
        barrel = {
            label = "Collect Barrel",
            coords = vector3(1244.56, 130.45, 78.90),
            time = 5000,
            item = "barrel"
        },
        spring = {
            label = "Collect Spring",
            coords = vector3(1254.56, 140.45, 78.90),
            time = 5000,
            item = "spring"
        },
        handle = {
            label = "Collect Handle",
            coords = vector3(1264.56, 150.45, 78.90),
            time = 5000,
            item = "handle"
        },
        blade = {
            label = "Collect Blade",
            coords = vector3(1274.56, 160.45, 78.90),
            time = 5000,
            item = "blade"
        },
        rod = {
            label = "Collect Metal Rod",
            coords = vector3(1284.56, 170.45, 78.90),
            time = 5000,
            item = "rod"
        }
    },

    Crafters = {
        pistol = {
            coords = vector3(1400.1, 1100.2, 113.0),
            heading = 180.0,
            pedModel = "s_m_y_armymech_01",
            label = "Pistol Crafter"
        },
        rifle = {
            coords = vector3(1410.1, 1110.2, 113.0),
            heading = 180.0,
            pedModel = "s_m_y_blackops_01",
            label = "Rifle Mechanic"
        },
        knife = {
            coords = vector3(1420.1, 1120.2, 113.0),
            heading = 180.0,
            pedModel = "s_m_y_construct_01",
            label = "Knife Smith"
        }
    }
}

Config = CraftingConfig