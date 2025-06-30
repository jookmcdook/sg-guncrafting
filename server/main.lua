local ox_inventory = exports.ox_inventory

RegisterNetEvent('sg-guncrafting:gatherItem', function(partType)
    local src = source
    local xPlayer = Framework.GetPlayerFromId(src)
    if not xPlayer then return end

    local partInfo = Config.GatherPoints[partType]
    if not partInfo then return end

    ox_inventory:AddItem(src, partType, 1)
    TriggerClientEvent('ox_lib:notify', src, { type = 'success', description = ('Collected %s'):format(partInfo.label) })
end)

RegisterNetEvent('sg-guncrafting:startCrafting', function(weaponId)
    local src = source
    local xPlayer = Framework.GetPlayerFromId(src)
    if not xPlayer then return end

    local weapon = Config.Weapons[weaponId]
    if not weapon then return end

    for part, required in pairs(weapon.materials) do
        local item = ox_inventory:GetItem(src, part, nil, true)
        if not item or item.count < required then
            TriggerClientEvent('ox_lib:notify', src, { type = 'error', description = ('Not enough %s'):format(Config.GatherPoints[part].label) })
            return
        end
    end

    local blackMoney = ox_inventory:GetItem(src, 'black_money', nil, true)
    if not blackMoney or blackMoney.count < weapon.price then
        TriggerClientEvent('ox_lib:notify', src, { type = 'error', description = 'Not enough black money' })
        return
    end

    for part, required in pairs(weapon.materials) do
        ox_inventory:RemoveItem(src, part, required)
    end
    ox_inventory:RemoveItem(src, 'black_money', weapon.price)

    SetTimeout(weapon.craftTime, function()
        if math.random(100) <= weapon.failChance then
            TriggerClientEvent('ox_lib:notify', src, { type = 'error', description = ('Crafting failed: %s'):format(weapon.label) })
        else
            ox_inventory:AddItem(src, weaponId, 1)
            TriggerClientEvent('ox_lib:notify', src, { type = 'success', description = ('Successfully crafted %s'):format(weapon.label) })
        end
    end)
end)

CreateThread(function()
    Wait(2000) -- Let the resource fully load first

    local localVersion = require("version").version
    local versionUrl = "https://raw.githubusercontent.com/jookmcdook/sg-guncrafting/main/version.json"

    PerformHttpRequest(versionUrl, function(code, body)
        if code == 200 then
            local success, data = pcall(function() return json.decode(body) end)
            if success and data.version then
                if data.version ~= localVersion then
                    print("^3[sg-guncrafting]^0 A new version is available!")
                    print(("^3Installed:^0 %s | ^2Latest:^0 %s"):format(localVersion, data.version))
                    print("^3Update here:^0 https://github.com/jookmcdook/sg-guncrafting")
                else
                    print("^2[sg-guncrafting]^0 is up to date. (v" .. localVersion .. ")")
                end
            end
        else
            print("^1[sg-guncrafting]^0 Failed to check for updates (HTTP " .. code .. ")")
        end
    end, "GET", "", { ["Content-Type"] = "application/json" })
end)
