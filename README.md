# sg-guncrafting

A modular FiveM crafting system for creating weapons from components using `ox_inventory`, `ox_lib` and configurable crafting logic.

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
- ❌ Failure chance system to balance weapon availability and minimize output
- 🎯 Optimized for `ox_target` & `ox_lib` context menus

---

## Dependencies

- [`ox_inventory`](https://overextended.github.io/ox_inventory/)
- [`ox_lib`](https://overextended.github.io/ox_lib/)
- [`ox_target`](https://github.com/overextended/ox_target)
- Framework compatibility: **QBOX**, **QBCore** / **ESX** (via `Bridge`)

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

3. Insert the following items into your `ox_inventory/data/items.lua` and extract the images in `install/images` into `ox_inventory/web/images/`:

```lua
['frame'] = {
    label = 'Weapon Frame',
    weight = 200,
    stack = true,
    close = true,
    description = 'a frame, needed to build a firearm'
},
['barrel'] = {
    label = 'Weapon Barrel',
    weight = 150,
    stack = true,
    close = true,
    description = 'a barrel, needed to build a firearm'
},
['spring'] = {
    label = 'Weapon Spring',
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

4. Configure `config.lua` as needed to add more weapons, materials or NPCs.

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
```

---

## Credits

- ✨ **Script by:** Tao
- 💬 **Support & Community:** [discord.gg/southgate](https://discord.gg/qbox)

---

## License

This resource is free to use for non-commercial FiveM servers. Do not reupload or resell.
