--[[
********************************************************************************
********************************************************************************
*** !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!  ***
*** !!! WARNING  !!!  WARNING  !!!  WARNING  !!!  WARNING  !!!  WARNING !!!  ***
*** !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!  ***
***                                                                          ***
***  The following are differences between SNDv1 and SNDv2 that cannot be    ***
***  fixed and WILL function differently, even with a wrapper.               ***
***                                                                          ***
*** * GetNodeText Change *                                                   ***
*** GetNodeText no longer works like v1 — it uses actual Node IDs,           ***
*** not node list indices. Without adjusting your calls, it will             ***
*** return nil or incorrect text!                                            ***
***                                                                          ***
*** Check /xldata or /tweaks Debug to get the correct Node IDs. Ensure you   ***
*** are using node ID's and not indices from the node list.                  ***
***                                                                          ***
********************************************************************************
********************************************************************************
]]




--------------------------------------------------------------------------------
-- About this script
--------------------------------------------------------------------------------
--[[
SNDv1 Helper Wrappers for SNDv2 Compatibility
Version: 1.0.0
Project URL: https://github.com/Clover-Stuff/SNDv1Functions

This file contains various SND helper functions used in scripts.

Some functions were reused from the `vac_functions.lua` repository by WigglyMuffin:
https://github.com/WigglyMuffin/SNDScripts/blob/main/vac_functions.lua

These reused functions were added to fill gaps, as both projects worked on similar utilities.

Contributors:
- Nonu: IsPlayerCasting(), IsPlayerAvailable(), GetCharacterCondition(), GetPlayerRawX/Y/ZPos(), GetZoneID(), LogInfo/Debug/Verbose, IsPlayerDead()
- Friendly: Merged versions of GetCharacterCondition() and added GetFlagZone()
- Clover-Stuff: GetCharacterName(), GetCharacterCondition(), GetDistanceToTarget(), GetNodeText(), GetTargetName(), IsAddonReady(), IsAddonVisible(), IsInZone(), IsMoving(), IsNodeVisible()

Feel free to expand this script further! Please keep contributor names with any new additions.
]]



--------------------------------------------------------------------------------
-- Dependencies
--------------------------------------------------------------------------------
import("System.Numerics")


--------------------------------------------------------------------------------
-- Functions
--------------------------------------------------------------------------------
--- Sends a /echo command with the given text.
-- @param text string The text to echo.
function Echo(text)
	yield("/echo " .. tostring(text))
end

--- Lowercase alias for Echo().
-- @param text string The text to echo.
function echo(text)
	Echo(text)
end

--- Waits for the specified number of seconds without freezing execution.
--
-- This is a personal utility function (not part of SND1) added for timing consistency.
-- It repeatedly yields a very short wait command, which may spin off many states,
-- potentially causing overhead compared to native wait functions. In the process, it
-- may spam the /xllog console with many wait entries.
--
-- Use this if you need more consistent timing but be aware of the possible performance impact.
--
-- @param seconds number The duration to wait.
function WaitFor(seconds)
    local startTime = os.clock()
    while os.clock() - startTime < seconds do
        yield("/wait 0.000001")
    end
end

--- Checks if an addon is ready.
-- @param name string The name of the addon.
-- @return boolean True if the addon is ready.
function IsAddonReady(name)
    return Addons.GetAddon(name).Ready
end

--- Checks if an addon is visible.
-- @param name string The name of the addon.
-- @return boolean True if the addon exists.
function IsAddonVisible(name)
    return Addons.GetAddon(name).Exists
end

--- Returns the visibility of a node within an addon.
-- @param addonName string The name of the addon.
-- @param ... any Node path arguments.
-- @return boolean True if the node is visible.
function IsNodeVisible(addonName, ...)
  if (IsAddonReady(addonName)) then
    local node = Addons.GetAddon(addonName):GetNode(...)
    return node.IsVisible
  else
    return false
  end
end

--- Gets the text from a node in the specified addon.
-- @param addonName string The name of the addon.
-- @param ... any Node path arguments.
-- @return string The text of the node or empty string if unavailable.
-- @warning This version uses true Node IDs. Old calls may return nil!
--- GetNodeText(addonName, ...)
--
-- Example usage:
-- GetNodeText("_ToDoList", 1, 7001, 2, 2)
--
-- @param addonName string The name of the addon.
-- @param ... any Node path arguments.
-- @return string The text of the node or an empty string if unavailable.
-- @warning
-- GetNodeText is no longer the same as it was in v1. Any uses of GetNodeText without adjusting
-- the node ID's to be the correct values will return the wrong text (or nil).
-- It used to return text based on the ID's in the node list, but it has shifted to using
-- the actual Node ID, same as the old GetNodeVisible.
-- To get the correct Node ID, look for sequences with # symbols in xldata or use tweaks Debug.
function GetNodeText(addonName, ...)
  if (IsAddonReady(addonName)) then
    local node = Addons.GetAddon(addonName):GetNode(...)
    return tostring(node.Text)
  else
    return ""
  end
end

--- Returns the current character's name.
-- @return string The player's name.
function GetCharacterName()
	return Entity.Player.Name
end

--- GetCharacterCondition(index, expected)
--
-- Player or self conditions service wrapper, used to check your conditions.
-- - If only `index` is provided, returns the value of `Svc.Condition[index]`.
-- - If both `index` and `expected` are provided, returns true if `Svc.Condition[index] == expected`.
-- - If neither is provided, returns the entire `Svc.Condition` table.
-- @param index number|nil The condition index (optional).
-- @param expected any Optional value to compare against.
-- @return any|boolean The condition value, result of the comparison, or entire table.
function GetCharacterCondition(index, expected)
    if index and expected ~= nil then
        return Svc.Condition[index] == expected
    elseif index then
        return Svc.Condition[index]
    else
        return Svc.Condition
    end
end

--- Checks if the player is in the given zone ID.
-- @param i number The zone ID.
-- @return boolean True if in zone.
function IsInZone(i)
	return Svc.ClientState.TerritoryType == i
end

--- Returns the current target's name.
-- @return string The name of the target or empty string if none.
function GetTargetName()
  if (Entity.Target) then
    return Entity.Target.Name
  else
    return ""
  end
end

--- Returns the distance between the player and their current target.
-- @return number Distance in game units.
function GetDistanceToTarget()
  return Vector3.Distance(Entity.Player.Position, Entity.Target.Position)
end

--- IsPlayerAvailable()
--
-- Player.Available wrapper.
-- Use to check if the player is available (e.g., not in cutscenes or loading screens).
-- @return boolean True if the player is available.
function IsPlayerAvailable()
    return Player.Available
end

--- Checks if the player is currently casting a spell.
-- @return boolean True if casting.
function IsPlayerCasting()
    return Player.Entity and Player.Entity.IsCasting
end

--- Checks if the player is currently moving.
-- @return boolean True if moving.
function IsMoving()
	return Player.IsMoving
end

--- Gets the player's raw X coordinate.
-- @return number X position.
function GetPlayerRawXPos()
    return Svc.ClientState.LocalPlayer.Position.X
end 

--- Gets the player's raw Y coordinate.
-- @return number Y position.
function GetPlayerRawYPos() 
    return Svc.ClientState.LocalPlayer.Position.Y
end 

--- Gets the player's raw Z coordinate.
-- @return number Z position.
function GetPlayerRawZPos() 
    return Svc.ClientState.LocalPlayer.Position.Z
end 

--- Gets the current zone ID.
-- @return number TerritoryType ID.
function GetZoneID() 
    return Svc.ClientState.TerritoryType 
end

--- Logs an informational message to Dalamud.
-- @param msg string The message.
function LogInfo(msg)
    Dalamud.Log(msg)
end

--- Logs a debug message to Dalamud.
-- @param msg string The message.
function LogDebug(msg)
    Dalamud.LogDebug(msg)
end

--- Logs a verbose message to Dalamud.
-- @param msg string The message.
function LogVerbose(msg)
    Dalamud.LogVerbose(msg)
end

--- Checks if the player is dead (condition 2).
-- @return boolean True if dead.
function IsPlayerDead()
    return GetCharacterCondition(2)
end

--- Returns the territory ID of the current map flag.
-- @return number The flag's territory ID.
function GetFlagZone()
    return Instances.Map.Flag.TerritoryId
end

