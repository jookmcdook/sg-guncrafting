CreateThread(function()
    for part, data in pairs(Config.GatherPoints) do
        exports.ox_target:addBoxZone({
            coords = data.coords,
            size = vec3(1, 1, 1),
            rotation = 0,
            debug = false,
            options = {
                {
                    name = 'gather_' .. part,
                    icon = 'fas fa-hand-rock',
                    label = ('Collect %s'):format(data.label),
                    onSelect = function()
                        TriggerServerEvent('weaponcraft:gatherItem', part)
                    end
                }
            }
        })
    end

    for craftId, data in pairs(Config.Crafters) do
        exports.ox_target:addBoxZone({
            coords = data.coords,
            size = vec3(1.5, 1.5, 1),
            rotation = 0,
            debug = false,
            options = {
                {
                    name = 'craft_' .. craftId,
                    icon = 'fas fa-hammer',
                    label = ('Craft %s'):format(data.label),
                    onSelect = function()
                        local weaponOptions = {}
                        for weaponId, weaponData in pairs(Config.Weapons) do
                            if weaponData.station == craftId then
                                table.insert(weaponOptions, {
                                    title = weaponData.label,
                                    description = ("Cost: $%s + materials"):format(weaponData.price),
                                    event = 'weaponcraft:startCrafting',
                                    args = weaponId
                                })
                            end
                        end
                        lib.registerContext({
                            id = 'craft_menu_' .. craftId,
                            title = data.label,
                            options = weaponOptions
                        })
                        lib.showContext('craft_menu_' .. craftId)
                    end
                }
            }
        })
    end
end)
