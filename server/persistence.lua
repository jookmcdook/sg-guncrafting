local ox_inventory = exports.ox_inventory

local function getLicense(src)
    local ids = GetPlayerIdentifiers(src)
    for _, v in pairs(ids) do
        if v:find("license:") then
            return v
        end
    end
    return nil
end

function SaveCraftingQueue(playerSrc, weaponId, duration)
    local license = getLicense(playerSrc)
    if not license then return end

    local now = os.time()
    local endTime = now + duration

    exports.oxmysql:insert('INSERT INTO guncrafting_queue (license, weapon_id, started_at, end_at, completed) VALUES (?, ?, ?, ?, ?)', {
        license, weaponId, now, endTime, 0
    })
end

function CompleteCrafting(license, weaponId)
    exports.oxmysql:update('UPDATE guncrafting_queue SET completed = 1 WHERE license = ? AND weapon_id = ? AND completed = 0', {
        license, weaponId
    })
end

function ResumePendingCrafting()
    exports.oxmysql:query('SELECT * FROM guncrafting_queue WHERE completed = 0', {}, function(results)
        for _, row in ipairs(results) do
            local remaining = row.end_at - os.time()
            if remaining <= 0 then
                GrantCraftedWeapon(row.license, row.weapon_id)
            else
                SetTimeout(remaining * 1000, function()
                    GrantCraftedWeapon(row.license, row.weapon_id)
                end)
            end
        end
    end)
end

function GrantCraftedWeapon(license, weaponId)
    local player = nil
    for _, id in ipairs(GetPlayers()) do
        if getLicense(id) == license then
            player = tonumber(id)
            break
        end
    end

    CompleteCrafting(license, weaponId)

    if player then
        ox_inventory:AddItem(player, weaponId, 1)
        TriggerClientEvent('ox_lib:notify', player, {
            type = 'success',
            description = ('Your %s is now ready.'):format(Config.Weapons[weaponId].label)
        })
    end
end

CreateThread(function()
    Wait(3000)
    ResumePendingCrafting()
end)
