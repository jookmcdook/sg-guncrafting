Locales = {
    ['de'] = {
        ['gather_prompt'] = 'Drücke ~INPUT_CONTEXT~, um %s zu sammeln',
        ['craft_prompt'] = 'Drücke ~INPUT_CONTEXT~, um %s herzustellen',
        ['notify_missing'] = 'Nicht genug %s',
        ['notify_black_money'] = 'Nicht genug Schwarzgeld',
        ['notify_craft_start'] = 'Herstellung von %s gestartet...',
        ['notify_craft_fail'] = 'Herstellung von %s fehlgeschlagen',
        ['notify_craft_success'] = '%s erfolgreich hergestellt!',
        ['blip_gather'] = 'Material: %s',
        ['blip_craft'] = 'Herstellung: %s'
    },

    ['en'] = {
        ['gather_prompt'] = 'Press ~INPUT_CONTEXT~ to gather %s',
        ['craft_prompt'] = 'Press ~INPUT_CONTEXT~ to craft %s',
        ['notify_missing'] = 'Not enough %s',
        ['notify_black_money'] = 'Not enough black money',
        ['notify_craft_start'] = 'Crafting %s started...',
        ['notify_craft_fail'] = 'Crafting %s failed',
        ['notify_craft_success'] = '%s crafted successfully!',
        ['blip_gather'] = 'Material: %s',
        ['blip_craft'] = 'Crafting: %s'
    }
}

function _L(key, ...)
    local lang = 'en' 
    local str = Locales[lang][key] or key
    return string.format(str, ...)
end