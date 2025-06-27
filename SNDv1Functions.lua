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
*** * GetNodeText Node ID's changed *                                        ***
***  GetNodeText no longer works like v1 — it uses actual Node IDs,          ***
***  not node list indices. Without adjusting your calls, it will            ***
***  return nil or incorrect text!                                           ***
***  Check /xldata or /tweaks Debug to get the correct Node IDs. Ensure you  ***
***  are using node ID's and not indices from the node list.                 ***
***                                                                          ***
********************************************************************************
********************************************************************************
]]




--------------------------------------------------------------------------------
-- About this script
--------------------------------------------------------------------------------
--[[
SNDv1 Helper Wrappers for SNDv2 Compatibility
Version: 1.2.0
Project URL: https://github.com/Clover-Stuff/SNDv1Functions

This file contains various SND helper functions used in scripts.

Some functions were reused from the `vac_functions.lua` repository by WigglyMuffin, maintained by Friendly:
https://github.com/WigglyMuffin/SNDScripts/blob/main/vac_functions.lua

These reused functions were added to fill gaps, as both projects worked on similar utilities.

Contributors:
- Nonu: IsPlayerCasting(), IsPlayerAvailable(), GetCharacterCondition(), GetPlayerRawX/Y/ZPos(), GetZoneID(), LogInfo/Debug/Verbose, IsPlayerDead()
- Friendly: Merged versions of GetCharacterCondition() and added GetFlagZone()
- Clover-Stuff: GetCharacterName(), GetCharacterCondition(), GetDistanceToTarget(), GetNodeText(), GetTargetName(), IsAddonReady(), IsAddonVisible(), IsInZone(), IsMoving(), IsNodeVisible(), HasPlugin(), PathStop(), PathfindAndMoveTo(), PathfindInProgress(), PathIsRunning(), IsAetheryteUnlocked()
- DhogGPT: HasFlightUnlocked()

Feel free to expand this script further! Please keep contributor names with any new additions.
]]



--------------------------------------------------------------------------------
-- Dependencies
--------------------------------------------------------------------------------
local Vector3 = import("System.Numerics").Vector3


--------------------------------------------------------------------------------
-- Variables
--------------------------------------------------------------------------------
local vnavmeshMissingInfo = "WARNING! vnavmesh is not installed! You can install it through this repo: https://puni.sh/api/repository/veyn"


--------------------------------------------------------------------------------
-- Functions
--------------------------------------------------------------------------------
-- Sends a /echo command with the given text.
---@param text string The text to echo.
function Echo(text)
	yield("/echo " .. tostring(text))
end

--------------------------------------------------------------------------------
-- Lowercase alias for Echo().
---@param text string The text to echo.
function echo(text)
	Echo(text)
end

--------------------------------------------------------------------------------
-- Waits for the specified number of seconds without freezing execution.
--
-- This is a personal utility function (not part of SND1) added for timing consistency.
-- It repeatedly yields a very short wait command, which may spin off many states,
-- potentially causing overhead compared to native wait functions. In the process, it
-- may spam the /xllog console with many wait entries.
--
-- Use this if you need more consistent timing similar to SND1, but be aware of the
-- possible performance impact.
--
---@param seconds number The duration to wait.
function WaitFor(seconds)
    local startTime = os.clock()
    while os.clock() - startTime < seconds do
        yield("/wait 0.000001")
    end
end

--------------------------------------------------------------------------------
-- Checks if a value can be converted (coerced) to a number.
--
-- This is a utility function (not part of SND1) to help verify whether a
-- value (string or otherwise) can be safely converted to a numeric type.
--
-- Useful for input validation before performing numeric operations.
--
---@param v any Value to check for number coercion
---@return boolean True if the value can be converted to a number, false otherwise
function IsCoercibleNumber(v)
  return tonumber(v) ~= nil
end

--------------------------------------------------------------------------------
-- Validates whether three given coordinates are all valid numbers or coercible to numbers.
--
-- This is a utility function (not part of SND1) intended to ensure X, Y, and Z 
-- values are valid before using them in functions that require numeric coordinates.
--
---@param x any X coordinate to check (number or string convertible to number)
---@param y any Y coordinate to check (number or string convertible to number)
---@param z any Z coordinate to check (number or string convertible to number)
---@return boolean True if all coordinates are valid numbers (or coercible), false otherwise
function AreValidCoordinates(x, y, z)
  return IsCoercibleNumber(x) and IsCoercibleNumber(y) and IsCoercibleNumber(z)
end

--------------------------------------------------------------------------------
-- Checks if an addon is ready.
---@param name string The name of the addon.
---@return boolean True if the addon is ready and visible.
function IsAddonReady(name)
  local a = Addons.GetAddon(name)
  return a and a.Exists and a.Ready
end

--------------------------------------------------------------------------------
-- Checks if an addon is visible.
-- 
-- This is essentially the same thing as IsAddonReady anyways.
---@param name string The name of the addon.
---@return boolean True if the addon is ready and visible.
function IsAddonVisible(name)
    return IsAddonReady(name)
end

--------------------------------------------------------------------------------
-- Returns the visibility of a node within an addon.
---@param addonName string The name of the addon.
---@param ... any Node path arguments.
---@return boolean True if the node is visible.
function IsNodeVisible(addonName, ...)
  if (IsAddonReady(addonName)) then
    local node = Addons.GetAddon(addonName):GetNode(...)
    return node.IsVisible
  else
    return false
  end
end

--------------------------------------------------------------------------------
-- Gets the text from a node in the specified addon.
--
-- Note: This function's behavior changed in SNDv2.
-- It now requires actual Node IDs instead of node list indices.
-- Calls using old indices may return nil or incorrect text.
--
-- To find correct Node IDs, check sequences with '#' in `/xldata` or `/tweaks Debug`.
--
---@param addonName string The name of the addon.
---@param ... any Node path arguments.
---@return string The text of the node, or empty string if unavailable.
function GetNodeText(addonName, ...)
  if (IsAddonReady(addonName)) then
    local node = Addons.GetAddon(addonName):GetNode(...)
    return tostring(node.Text)
  else
    return ""
  end
end

--------------------------------------------------------------------------------
-- Returns the current character's name.
---@return string The player's name.
function GetCharacterName()
	return Entity.Player.Name
end

--------------------------------------------------------------------------------
-- Player or self conditions service wrapper, used to check your conditions.
-- - If only `index` is provided, returns the value of `Svc.Condition[index]`.
-- - If both `index` and `expected` are provided, returns true if `Svc.Condition[index] == expected`.
-- - If neither is provided, returns the entire `Svc.Condition` table.
---@param index number|nil The condition index (optional).
---@param expected any Optional value to compare against.
---@return any|boolean The condition value, result of the comparison, or entire table.
function GetCharacterCondition(index, expected)
    if index and expected ~= nil then
        return Svc.Condition[index] == expected
    elseif index then
        return Svc.Condition[index]
    else
        return Svc.Condition
    end
end

--------------------------------------------------------------------------------
-- Checks if the player is in the given zone ID.
---@param i number The zone ID.
---@return boolean True if in zone.
function IsInZone(i)
	return Svc.ClientState.TerritoryType == i
end

--------------------------------------------------------------------------------
-- Gets the current zone ID.
---@return number TerritoryType ID.
function GetZoneID() 
    return Svc.ClientState.TerritoryType 
end

--------------------------------------------------------------------------------
-- Returns the current target's name.
---@return string The name of the target or empty string if none.
function GetTargetName()
  if (Entity.Target) then
    return Entity.Target.Name
  else
    return ""
  end
end

--------------------------------------------------------------------------------
-- Returns the distance between the player and their current target.
---@return number Distance in game units.
function GetDistanceToTarget()
  if (Entity.Target) then
    return Vector3.Distance(Entity.Player.Position, Entity.Target.Position)
  else
    return -1
  end
end

--------------------------------------------------------------------------------
-- Player.Available wrapper.
-- Use to check if the player is available (e.g., not in cutscenes or loading screens).
---@return boolean True if the player is available.
function IsPlayerAvailable()
    return Player.Available
end

--------------------------------------------------------------------------------
-- Checks if the player is currently casting a spell.
---@return boolean True if casting.
function IsPlayerCasting()
    return Player.Entity and Player.Entity.IsCasting
end

--------------------------------------------------------------------------------
-- Checks if the player is currently moving.
---@return boolean True if moving.
function IsMoving()
	return Player.IsMoving
end

--------------------------------------------------------------------------------
-- Gets the player's raw X coordinate.
---@return number X position.
function GetPlayerRawXPos()
    return Svc.ClientState.LocalPlayer.Position.X
end 

--------------------------------------------------------------------------------
-- Gets the player's raw Y coordinate.
---@return number Y position.
function GetPlayerRawYPos() 
    return Svc.ClientState.LocalPlayer.Position.Y
end 

--------------------------------------------------------------------------------
-- Gets the player's raw Z coordinate.
---@return number Z position.
function GetPlayerRawZPos() 
    return Svc.ClientState.LocalPlayer.Position.Z
end 

--------------------------------------------------------------------------------
-- Logs an informational message to Dalamud.
---@param msg string The message.
function LogInfo(msg)
    Dalamud.Log(msg)
end

--------------------------------------------------------------------------------
-- Logs a debug message to Dalamud.
---@param msg string The message.
function LogDebug(msg)
    Dalamud.LogDebug(msg)
end

--------------------------------------------------------------------------------
-- Logs a verbose message to Dalamud.
---@param msg string The message.
function LogVerbose(msg)
    Dalamud.LogVerbose(msg)
end

--------------------------------------------------------------------------------
-- Checks if the player is dead (condition 2).
---@return boolean True if dead.
function IsPlayerDead()
    return GetCharacterCondition(2)
end

--------------------------------------------------------------------------------
-- Returns the territory ID of the current map flag.
---@return number The flag's territory ID.
function GetFlagZone()
    return Instances.Map.Flag.TerritoryId
end

--------------------------------------------------------------------------------
-- Checks if a specified plugin by name is currently installed and available.
--
---@param pluginName string The exact name of the plugin to check.
---@return boolean True if the plugin is installed, false otherwise.
function HasPlugin(pluginName)
  return IPC.IsInstalled(pluginName)
end

--------------------------------------------------------------------------------
-- Immediately cancels current pathfinding or movement if it is in progress.
function PathStop()
  if not HasPlugin("vnavmesh") then
    echo(vnavmeshMissingInfo)
    error(vnavmeshMissingInfo)
    return
  end
  
  IPC.vnavmesh.Stop()
end

--------------------------------------------------------------------------------
-- Starts pathfinding and moves the player to specified coordinates using vnavmesh.
--
-- This function requires the "vnavmesh" plugin to be installed. It validates the
-- input coordinates and attempts to move the player either flying or on ground.
--
---@param X number|string X coordinate to move to (numbers or coercible strings accepted).
---@param Y number|string Y coordinate to move to (numbers or coercible strings accepted).
---@param Z number|string Z coordinate to move to (numbers or coercible strings accepted).
---@param fly boolean|nil Optional. If true, pathfinding will fly; defaults to false (ground movement).
function PathfindAndMoveTo(X, Y, Z, fly)
  if not HasPlugin("vnavmesh") then
    echo(vnavmeshMissingInfo)
    error(vnavmeshMissingInfo)
    return
  end
  
  if not AreValidCoordinates(X, Y, Z) then
    error("Invalid coordinates passed to PathfindAndMoveTo")
    return
  end

  fly = (type(fly) == "boolean") and fly or false
  local dest = Vector3(X, Y, Z)
  IPC.vnavmesh.PathfindAndMoveTo(dest, fly)
end

--------------------------------------------------------------------------------
-- Checks if vnavmesh is currently pathfinding (calculating route to destination).
--
-- Returns true only if actively pathfinding, not just moving along a precomputed path.
--
---@return boolean True if pathfinding is in progress, false otherwise.
function PathfindInProgress()
  if not HasPlugin("vnavmesh") then
    echo(vnavmeshMissingInfo)
    return false
  end
  
  return IPC.vnavmesh.PathfindInProgress()
end

--------------------------------------------------------------------------------
-- Checks if vnavmesh is actively running along a path.
--
-- Returns true if currently moving along a path (not necessarily pathfinding).
--
---@return boolean True if currently moving along a path, false otherwise.
function PathIsRunning()
  if not HasPlugin("vnavmesh") then
    echo(vnavmeshMissingInfo)
    return false
  end
  
  return IPC.vnavmesh.IsRunning()
end

--------------------------------------------------------------------------------
-- Checks whether a given aetheryte (teleport location) is unlocked.
--
-- Queries the Telepo instance for unlock status of an aetheryte by its ID.
--
---@param aetheryteId integer The ID of the aetheryte to check.
---@return boolean True if the aetheryte is unlocked, false otherwise.
function IsAetheryteUnlocked(aetheryteId)
  return Instances.Telepo:IsAetheryteUnlocked(aetheryteId)
end

--------------------------------------------------------------------------------
--- Checks if the player has flight unlocked.
--- @return boolean True if the player can fly, false otherwise.
function HasFlightUnlocked()
    return Player.CanFly
end