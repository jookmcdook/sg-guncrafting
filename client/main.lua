local Bridge = require('bridge/loader')
local Framework = Bridge.Load()
local ox_target = exports.ox_target
local vector3 = vector3

local function DebugLog(msg)
    Bridge.Debug(msg)
end

CreateThread(function()
    for part, data in pairs(Config.GatherPoints) do
        local model = data.ped or 's_m_y_construct_01'
        RequestModel(model)
        while not HasModelLoaded(model) do Wait(0) end

        local ped = CreatePed(0, model, data.coords.x, data.coords.y, data.coords.z - 1.0, data.coords.w or 0.0, false, true)
        SetEntityInvincible(ped, true)
        FreezeEntityPosition(ped, true)
        SetBlockingOfNonTemporaryEvents(ped, true)

        ox_target:addLocalEntity(ped, {
            {
                name = 'gather_' .. part,
                icon = 'fa-solid fa-box',
                label = ('Collect %s'):format(data.label),
                onSelect = function()
                local isCancelled = false

                Bridge.ShowTextUI('[X] Cancel gathering', 'info')

                CreateThread(function()
                    while not isCancelled do
                        TriggerServerEvent('sg-guncrafting:gatherItem', part)
                        Wait(data.time or 5000)

                        if IsControlJustPressed(0, 73) then -- Taste X
                            isCancelled = true
                            Bridge.Notify('Gathering canceled', 'info')
                            Bridge.HideTextUI()
            end
        end
    end)
end

            }
        })
    end
end)


CreateThread(function()
    for weaponType, data in pairs(Config.Crafters) do
        local model = data.ped or 's_m_m_ammucountry'
        RequestModel(model)
        while not HasModelLoaded(model) do Wait(0) end

        local ped = CreatePed(0, model, data.coords.x, data.coords.y, data.coords.z - 1.0, data.coords.w, false, true)
        SetEntityInvincible(ped, true)
        FreezeEntityPosition(ped, true)
        SetBlockingOfNonTemporaryEvents(ped, true)

        ox_target:addLocalEntity(ped, {
            {
                name = 'craft_' .. weaponType,
                icon = 'fa-solid fa-gun',
                label = ('Craft %s'):format(Config.Weapons[weaponType].label),
                onSelect = function()
                    TriggerServerEvent('sg-guncrafting:startCrafting', weaponType)
                end
            }
        })
    end
end)

RegisterNetEvent('sg-guncrafting:startCraftProgress', function(weaponType, duration)
    local weapon = Config.Weapons[weaponType]
    local success = Bridge.ProgressBar(('Crafting %s...'):format(weapon.label), duration, 'crafting', true)
    if success then
        TriggerServerEvent('sg-guncrafting:completeCraft', weaponType)
    else
        Bridge.Notify('Crafting canceled', 'error', 'Failed')
    end
end)

local function openCraftMenu()
    local categories = {
        pistols = { title = 'Pistols', menu = 'craft_pistols', weapons = {}, icon = 'gun' },
        rifles = { title = 'Rifles', menu = 'craft_rifles', weapons = {}, icon = 'rifle' },
        melee  = { title = 'Melee Weapons', menu = 'craft_melee', weapons = {}, icon = 'knife' },
    }

    for weapon, data in pairs(Config.Weapons) do
        local entry = {
            title = data.label,
            description = string.format('Cost: %s black money\nSuccess chance: %d%%', data.price, 100 - data.failChance),
            icon = categories[data.category].icon,
            onSelect = function()
                TriggerServerEvent('sg-guncrafting:startCrafting', weapon)
            end
        }
        table.insert(categories[data.category].weapons, entry)
    end

    for _, cat in pairs(categories) do
        table.sort(cat.weapons, function(a, b)
            return a.title < b.title
        end)

        lib.registerContext({
            id = cat.menu,
            title = cat.title,
            menu = 'craft_main',
            options = cat.weapons
        })
    end

    lib.registerContext({
        id = 'craft_main',
        title = 'Weapon Crafting',
        options = {
            { title = 'Pistols', menu = 'craft_pistols', icon = 'gun' },
            { title = 'Rifles', menu = 'craft_rifles', icon = 'rifle' },
            { title = 'Melee Weapons', menu = 'craft_melee', icon = 'knife' }
        }
    })

    lib.showContext('craft_main')
end

CreateThread(function()
    local craftLocation = vector3(1234.56, 456.78, 78.90) -- change to your desired coordinates

    lib.marker.new({
        type = 2,
        coords = craftLocation,
        width = 0.5,
        height = 0.5,
        color = { r = 255, g = 100, b = 100, a = 200 },
        bob = true,
        rotate = true,
        onEnter = function()
            Bridge.ShowTextUI('[E] Craft weapons', 'gather')
        end,
        onExit = function()
            Bridge.HideTextUI()
        end,
        onPress = function()
            openCraftMenu()
        end,
        distance = 1.5
    })
end)
