# sg-guncrafting

A modular FiveM crafting system for creating weapons from components using `ox_inventory`, `ox_lib`, and configurable crafting logic.

## Features

* Modular weapon crafting system
* Gathering points for parts like barrels, frames, rods, handles, springs, blades
* Optional black money payment
* Configurable crafting time, failure chance, and required materials per weapon
* Support for melee, short- and long-range firearms
* No built-in selling – fits RP needs
* Easily expandable via `config.lua`

## Dependencies

* [ox\_inventory](https://overextended.github.io/ox_inventory/)
* [ox\_lib](https://overextended.github.io/ox_lib/)

## Installation

1. Clone or download the resource:

   ```bash
   git clone https://your-repo-url resources/[local]/sg-guncrafting
   ```

2. Add to your `server.cfg`:

   ```
   ensure sg-guncrafting
   ```

3. Configure your weapons, gather zones, and crafting parameters in `config.lua`

## Configuration

### Weapons

Edit `config.lua`:

```lua
Weapons = {
    weapon_pistol = {
        label = "Pistol",
        item = "weapon_pistol",
        materials = {
            barrel = 2,
            frame = 2,
            spring = 1,
        },
        price = 3000,
        craftTime = 3600000, -- 1 hour
        failChance = 15,
    },
    -- Add more weapons here
}
```

### Gather Points

```lua
GatherPoints = {
    barrel = { label = "Barrel" },
    frame = { label = "Frame" },
    spring = { label = "Spring" },
    blade = { label = "Blade" },
    handle = { label = "Handle" },
    rod = { label = "Rod" },
}
```

## Events

### Start crafting

```lua
TriggerServerEvent('sg-guncrafting:startCrafting', weaponType)
```

### Crafting finished

Client receives:

```lua
sg-guncrafting:startCraftProgress
```

## Localization

Edit `locales.lua` and `_L()` handles translations automatically.

## License

This project is open-source. Feel free to modify and contribute under your server needs.

- [Discord](https://discord.gg/southgate)
