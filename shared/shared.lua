Weapons = {
    pistol = {
        label = "Pistol",
        item = "weapon_combatpistol",
    },
    rifle = {
        label = "Carbine",
        item = "weapon_carbinerifle",
    },
    knife = {
        label = "Knife",
        item = "weapon_knife",
    }
}

Components = {
    body = "weapon_body",
    barrel = "weapon_barrel",
    spring = "weapon_spring",
    handle = "weapon_handle",
    blade = "weapon_blade",
    rod = "weapon_rod"
}

function GetRequiredComponents(weaponType)
    if weaponType == "pistol" or weaponType == "rifle" then
        return {
            { name = Components.body, amount = 1 },
            { name = Components.barrel, amount = 1 },
            { name = Components.spring, amount = 1 }
        }
    elseif weaponType == "knife" then
        return {
            { name = Components.handle, amount = 1 },
            { name = Components.blade, amount = 1 },
            { name = Components.rod, amount = 1 }
        }
    else
        return {}
    end
end
