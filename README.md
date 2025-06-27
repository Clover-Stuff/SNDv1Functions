# SNDv1 Helper Wrappers for SNDv2 Compatibility

This project provides wrappers for certain SND (SomethingNeedDoing) v1 functions that were removed or changed in SNDv2. It aims to ease migration for personal scripts and serve as practical examples for transitioning between versions.

While there is a similar utility by WigglyMuffin that covers many related functions, it includes additional features beyond just the core SND v1 helpers. This project offers a lean, focused set of functions that only cover the original SND v1 helpers for simpler import and use.

---

## ⚠️ Important Warning

**GetNodeText** behavior changed in SNDv2 and will **not work like it did in v1** without adjustment.

- It now uses **actual Node IDs** instead of node list indices.
- Calls using old node indices will likely return **nil or incorrect text**.
- To find the correct Node IDs, check sequences with `#` symbols in `/xldata` or `/tweaks Debug`.

Make sure to update your scripts accordingly before using `GetNodeText`.

---

## Usage

This script provides wrappers for certain **SND v1 functions whose interfaces or usage changed significantly in SND v2**. For example, many old functions like `GetCharacterName()` were replaced with direct references like `Entity.Player.Name`. These wrappers help older scripts behave more like they did in v1, easing the migration process.

The goal is **not** to magically make every v1 script work perfectly without changes, but to **restore familiar helper functions** where possible and offer examples to help with migration.

### How to Import

If you're new to importing Lua files in SND:

1. Type `/snd` in-game to open the SomethingNeedDoing window.
2. Click the **Settings** button at the top.
3. Under **Lua Options**, add the path to the folder where you keep imported Lua scripts (like this one).
   - Example: `D:/Users/Clover/Documents/snd_lua`
   - If using backslashes (`\`), either escape them like `D:\\Users\\Clover\\Documents\\snd_lua`  
     or replace them with forward slashes: `D:/Users/Clover/Documents/snd_lua`
4. In your Lua script, add this line at the top:

   ```lua
   require("SNDv1Functions.lua")
   ```

Once imported, your script will be able to call functions like `GetCharacterName()` etc *mostly* as they worked in SND v1.

> **Friendly Reminder:**  
> When running your scripts, keep an eye on the `/xllog` console for any errors or warnings. It’s a great way to catch issues, especially during migration or when using wrapper functions like these, but it won't necessarily cover certain things like GetNodeText returning nil because it hasn't been updated with appropriate new node ID's.

---

## Contributors

- [StrawberryClover](https://github.com/StrawberryClover) / [Clover-Stuff](https://github.com/Clover-Stuff)  
- [Nonu](https://github.com/Nonunon)  
- [Friendly](https://github.com/WigglyMuffin)  

---

## Additional Resources

- [Original vac_functions.lua repository by WigglyMuffin](https://github.com/WigglyMuffin/SNDScripts/blob/main/vac_functions.lua), which may be updated with functions I have not included in the future since they’re working on similar utilities.
