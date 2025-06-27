# SND Helper Functions for SNDv2

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

This script provides wrappers for certain **SND v1 functions whose interfaces or usage have changed significantly in SND v2**. For example, many old convenience functions like `GetCharacterName()` were replaced by direct variable calls like `Entity.Player.Name`. This means older scripts won’t break outright but **won’t work exactly the same without updating either the calls or by importing these wrappers**.

The goal is **not** to magically make all old SND v1 scripts work perfectly without modification, but to **help smooth the transition** by restoring familiar function calls where possible and providing practical examples of how to update your own scripts.

Simply **import this script alongside your existing Lua code** to regain many of the old helper function behaviors. Watch for specific warnings on functions that require additional attention, such as `GetNodeText`.

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
