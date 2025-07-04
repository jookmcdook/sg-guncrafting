# sg-guncrafting

A modular weapon crafting system for FiveM powered by `ox_inventory`, featuring:

- Modular weapon blueprints (short-, long- and melee weapons)
- Material gathering points
- Multiple NPC crafters
- Configurable crafting time, fail chance, and material cost
- Uses `ox_lib` for UI & `ox_target` for interactions
- Completely extendable via `config.lua`

---

## Features

- 🔫 Craft pistols, rifles, and melee weapons (e.g., knives)
- 🛠️ Gather materials like `frame`, `barrel`, `spring`, `handle`, `blade`, `rod`
- 💰 Pay with black money (`black_money`)
- ⏱️ Long-term crafting (e.g., 1 hour for rifles)
- ❌ Failure chance system to balance weapon availability
- 🎯 Optimized for `ox_target` & `ox_lib` context menus

---

## Dependencies

- [`ox_inventory`](https://overextended.github.io/ox_inventory/)
- [`ox_lib`](https://overextended.github.io/ox_lib/)
- [`ox_target`](https://github.com/overextended/ox_target)
- Framework compatibility: **Qbox**, **QBCore** / **ESX** (via `Bridge`)

---

## Installation

1. Clone or download this resource into your `resources` folder:
   ```bash
   git clone https://github.com/jookmcdook/sg-guncrafting.git
   ```

2. Add to your `server.cfg`:
   ```cfg
   ensure sg-guncrafting
   ```

3. Copy the images from the install folder into `ox_inventory/web/images and run the included .sql file

4. Insert the following items into your `ox_inventory/data/items.lua`:

```lua
['frame'] = {
    label = 'Weapon Frame',
    weight = 200,
    stack = true,
    close = true,
    description = 'a frame, needed to build a firearm'
},
['barrel'] = {
    label = 'Barrel',
    weight = 150,
    stack = true,
    close = true,
    description = 'a barrel, needed to build a firearm'
},
['spring'] = {
    label = 'Spring',
    weight = 50,
    stack = true,
    close = true,
    description = 'a spring, needed to build a firearm'
},
['handle'] = {
    label = 'Handle',
    weight = 100,
    stack = true,
    close = true,
    description = 'a handle, needed to build a melee weapon'
},
['blade'] = {
    label = 'Blade',
    weight = 100,
    stack = true,
    close = true,
    description = 'a dull blade, needed to build a melee weapon'
},
['rod'] = {
    label = 'Metal Rod',
    weight = 120,
    stack = true,
    close = true,
    description = 'a metal rod, needed to build a melee weapon'
},
```

5. Configure `config.lua` as needed to add more weapons, materials or NPCs.

---

## How It Works

- **Gather Points**: Players go to defined locations and press `E` to collect crafting components.
- **Crafters**: NPCs at defined locations offer crafting via `ox_lib` context menu.
- **Crafting Logic**: Cost in black money and materials is deducted. Crafting takes X minutes and may fail.
- **Success**: Player receives the configured weapon as item (e.g., `weapon_carbinerifle`).

---

## Configuration

All behavior is controlled via `config.lua`. Example entry:

```lua
pistol = {
    label = "Combat Pistole",
    item = "weapon_combatpistol",
    blackMoneyCost = 2500,
    materials = {
        frame = 2,
        barrel = 1,
        spring = 1
    },
    craftingTime = 3600, -- seconds
    failChance = 15
}
```

---

## Credits

- ✨ **Script by:** Tao
- 💬 **Support & Community:** [discord.gg/southgate](https://discord.gg/southgate)

---

## License

This resource is free to use for non-commercial FiveM servers. Do not reupload or resell.
