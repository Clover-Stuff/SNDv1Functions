# SNDv1 Helper Wrappers for SNDv2 Compatibility

This project provides wrappers for certain SND (SomethingNeedDoing) v1 functions that were removed or changed in SNDv2. It aims to ease migration for personal scripts and serve as practical examples for transitioning between versions.

While there is a similar utility by Friendly (WigglyMuffin) that covers many related functions, it includes additional features beyond just the core SND v1 helpers. This project offers a lean, focused set of functions that only cover the original SND v1 helpers for simpler import and use.

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
   - Example: `D:/Users/Clover/Documents/snd_lua_imports`
   - If using backslashes (`\`), either escape them like `D:\\Users\\Clover\\Documents\\snd_lua_imports`  
     or replace them with forward slashes, as I did in my example.
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
- [Faye](https://github.com/OhKannaDuh/Ferret/tree/master)

---

## Additional Resources

- [Original vac_functions.lua repository by WigglyMuffin](https://github.com/WigglyMuffin/SNDScripts/blob/main/vac_functions.lua), which may be updated with functions I have not included in the future since they’re working on similar utilities.




---

## ✅ Supported Functions

| Function                | Status   | Contributor   | Notes                              |
|------------------------|----------|---------------|------------------------------------|
| `GetCharacterName()`   | ✅Done  | [Clover-Stuff](https://github.com/Clover-Stuff)  |                                    |
| `GetCharacterCondition()` | ✅Done  | [Nonu](https://github.com/Nonunon), [Friendly](https://github.com/WigglyMuffin), [Clover-Stuff](https://github.com/Clover-Stuff) |                                    |
| `GetDistanceToTarget()`| ✅Done  | [Clover-Stuff](https://github.com/Clover-Stuff)  |                                    |
| `GetNodeText()`        | ✅Done  | [Clover-Stuff](https://github.com/Clover-Stuff)  | `@warning` about updated node IDs  |
| `GetTargetName()`      | ✅Done  | [Clover-Stuff](https://github.com/Clover-Stuff)  |                                    |
| `IsAddonReady()`       | ✅Done  | [Clover-Stuff](https://github.com/Clover-Stuff)  |                                    |
| `IsAddonVisible()`     | ✅Done  | [Clover-Stuff](https://github.com/Clover-Stuff)  |                                    |
| `IsInZone()`           | ✅Done  | [Clover-Stuff](https://github.com/Clover-Stuff)  |                                    |
| `IsMoving()`           | ✅Done  | [Clover-Stuff](https://github.com/Clover-Stuff)  |                                    |
| `IsNodeVisible()`      | ✅Done  | [Clover-Stuff](https://github.com/Clover-Stuff)  |                                    |
| `IsPlayerCasting()`    | ✅Done  | [Nonu](https://github.com/Nonunon)          |                                    |
| `IsPlayerAvailable()`  | ✅Done  | [Nonu](https://github.com/Nonunon)          |                                    |
| `IsPlayerDead()`       | ✅Done  | [Nonu](https://github.com/Nonunon)          |                                    |
| `GetPlayerRawXPos()`   | ✅Done  | [Nonu](https://github.com/Nonunon)          |                                    |
| `GetPlayerRawYPos()`   | ✅Done  | [Nonu](https://github.com/Nonunon)          |                                    |
| `GetPlayerRawZPos()`   | ✅Done  | [Nonu](https://github.com/Nonunon)          |                                    |
| `GetZoneID()`          | ✅Done  | [Nonu](https://github.com/Nonunon)          |                                    |
| `LogInfo()`            | ✅Done  | [Nonu](https://github.com/Nonunon)          |                                    |
| `LogDebug()`           | ✅Done  | [Nonu](https://github.com/Nonunon)          |                                    |
| `LogVerbose()`         | ✅Done  | [Nonu](https://github.com/Nonunon)          |                                    |
| `GetFlagZone()`        | ✅Done  | [Friendly](https://github.com/WigglyMuffin)       |                                    |

## Pending Functions
Thanks to [Faye](https://github.com/OhKannaDuh/Ferret/tree/master) for the list of functions!
| Function | Status | Contributor | Notes |
|----------|--------|-------------|-------|
| `ADContentHasPath()` | ❌Incomplete | — | — |
| `ADGetConfig()` | ❌Incomplete | — | — |
| `ADIsLooping()` | ❌Incomplete | — | — |
| `ADIsNavigating()` | ❌Incomplete | — | — |
| `ADIsStopped()` | ❌Incomplete | — | — |
| `ADListConfig()` | ❌Incomplete | — | — |
| `ADRun()` | ❌Incomplete | — | — |
| `ADSetConfig()` | ❌Incomplete | — | — |
| `ADStart()` | ❌Incomplete | — | — |
| `ADStop()` | ❌Incomplete | — | — |
| `ARAbortAllTasks()` | ❌Incomplete | — | — |
| `ARAnyWaitingToBeProcessed()` | ❌Incomplete | — | — |
| `ARAreAnyRetainersAvailableForCurrentChara()` | ❌Incomplete | — | — |
| `ARCanAutoLogin()` | ❌Incomplete | — | — |
| `ARDisableAllFunctions()` | ❌Incomplete | — | — |
| `ARDiscardGetItemsToDiscard()` | ❌Incomplete | — | — |
| `AREnableMultiMode()` | ❌Incomplete | — | — |
| `AREnqueueHET()` | ❌Incomplete | — | — |
| `AREnqueueInitiation()` | ❌Incomplete | — | — |
| `ARFinishCharacterPostProcess()` | ❌Incomplete | — | — |
| `ARGetCharacterCIDs()` | ❌Incomplete | — | — |
| `ARGetCharacterData()` | ❌Incomplete | — | — |
| `ARGetClosestRetainerVentureSecondsRemaining()` | ❌Incomplete | — | — |
| `ARGetEnabledRetainers()` | ❌Incomplete | — | — |
| `ARGetGCInfo()` | ❌Incomplete | — | — |
| `ARGetInventoryFreeSlotCount()` | ❌Incomplete | — | — |
| `ARGetMultiModeEnabled()` | ❌Incomplete | — | — |
| `ARGetOptionRetainerSense()` | ❌Incomplete | — | — |
| `ARGetOptionRetainerSenseThreshold()` | ❌Incomplete | — | — |
| `ARGetRegisteredCharacters()` | ❌Incomplete | — | — |
| `ARGetRegisteredEnabledCharacters()` | ❌Incomplete | — | — |
| `ARGetRegisteredEnabledRetainers()` | ❌Incomplete | — | — |
| `ARGetRegisteredRetainers()` | ❌Incomplete | — | — |
| `ARIsBusy()` | ❌Incomplete | — | — |
| `ARRelog()` | ❌Incomplete | — | — |
| `ARRetainersWaitingToBeProcessed()` | ❌Incomplete | — | — |
| `ARSetMultiModeEnabled()` | ❌Incomplete | — | — |
| `ARSetOptionRetainerSense()` | ❌Incomplete | — | — |
| `ARSetOptionRetainerSenseThreshold()` | ❌Incomplete | — | — |
| `ARSetSuppressed()` | ❌Incomplete | — | — |
| `ARSubsWaitingToBeProcessed()` | ❌Incomplete | — | — |
| `ATAddItemToCraftList()` | ❌Incomplete | — | — |
| `ATAddNewCraftList()` | ❌Incomplete | — | — |
| `ATCurrentCharacter()` | ❌Incomplete | — | — |
| `ATDisableBackgroundFilter()` | ❌Incomplete | — | — |
| `ATDisableCraftList()` | ❌Incomplete | — | — |
| `ATDisableUiFilter()` | ❌Incomplete | — | — |
| `ATEnableBackgroundFilter()` | ❌Incomplete | — | — |
| `ATEnableCraftList()` | ❌Incomplete | — | — |
| `ATEnableUiFilter()` | ❌Incomplete | — | — |
| `ATGetCharacterItems()` | ❌Incomplete | — | — |
| `ATGetCharacterItemsByType()` | ❌Incomplete | — | — |
| `ATGetCharactersOwnedByActive()` | ❌Incomplete | — | — |
| `ATGetCraftItems()` | ❌Incomplete | — | — |
| `ATGetCraftLists()` | ❌Incomplete | — | — |
| `ATGetFilterItems()` | ❌Incomplete | — | — |
| `ATGetRetrievalItems()` | ❌Incomplete | — | — |
| `ATGetSearchFilters()` | ❌Incomplete | — | — |
| `ATInventoryCountByType()` | ❌Incomplete | — | — |
| `ATInventoryCountByTypes()` | ❌Incomplete | — | — |
| `ATIsInitialized()` | ❌Incomplete | — | — |
| `ATItemCount()` | ❌Incomplete | — | — |
| `ATItemCountHQ()` | ❌Incomplete | — | — |
| `ATItemCountOwned()` | ❌Incomplete | — | — |
| `ATRemoveItemFromCraftList()` | ❌Incomplete | — | — |
| `ATToggleBackgroundFilter()` | ❌Incomplete | — | — |
| `ATToggleCraftList()` | ❌Incomplete | — | — |
| `ATToggleUiFilter()` | ❌Incomplete | — | — |
| `ArtisanCraftItem()` | ❌Incomplete | — | — |
| `ArtisanGetEnduranceStatus()` | ❌Incomplete | — | — |
| `ArtisanGetStopRequest()` | ❌Incomplete | — | — |
| `ArtisanIsListPaused()` | ❌Incomplete | — | — |
| `ArtisanIsListRunning()` | ❌Incomplete | — | — |
| `ArtisanSetEnduranceStatus()` | ❌Incomplete | — | — |
| `ArtisanSetListPause()` | ❌Incomplete | — | — |
| `ArtisanSetStopRequest()` | ❌Incomplete | — | — |
| `BMAddTransientStrategy()` | ❌Incomplete | — | — |
| `BMAddTransientStrategyTargetEnemyOID()` | ❌Incomplete | — | — |
| `BMClearActive()` | ❌Incomplete | — | — |
| `BMCreate()` | ❌Incomplete | — | — |
| `BMDelete()` | ❌Incomplete | — | — |
| `BMGet()` | ❌Incomplete | — | — |
| `BMGetActive()` | ❌Incomplete | — | — |
| `BMGetForceDisabled()` | ❌Incomplete | — | — |
| `BMSetActive()` | ❌Incomplete | — | — |
| `BMSetForceDisabled()` | ❌Incomplete | — | — |
| `CanExtractMateria()` | ❌Incomplete | — | — |
| `ClearFocusTarget()` | ❌Incomplete | — | — |
| `ClearTarget()` | ❌Incomplete | — | — |
| `CrashTheGame()` | ❌Incomplete | — | — |
| `DeleteAllAutoHookAnonymousPresets()` | ❌Incomplete | — | — |
| `DeletedSelectedAutoHookPreset()` | ❌Incomplete | — | — |
| `DeliverooIsTurnInRunning()` | ❌Incomplete | — | — |
| `DistanceBetween()` | ❌Incomplete | — | — |
| `DoesObjectExist()` | ❌Incomplete | — | — |
| `DropboxGetItemQuantity()` | ❌Incomplete | — | — |
| `DropboxIsBusy()` | ❌Incomplete | — | — |
| `DropboxSetItemQuantity()` | ❌Incomplete | — | — |
| `DropboxStart()` | ❌Incomplete | — | — |
| `DropboxStop()` | ❌Incomplete | — | — |
| `Equals()` | ❌Incomplete | — | — |
| `ExecuteAction()` | ❌Incomplete | — | — |
| `ExecuteGeneralAction()` | ❌Incomplete | — | — |
| `FocusTargetHasStatus()` | ❌Incomplete | — | — |
| `GetAcceptedQuests()` | ❌Incomplete | — | — |
| `GetAccursedHoardRawX()` | ❌Incomplete | — | — |
| `GetAccursedHoardRawY()` | ❌Incomplete | — | — |
| `GetAccursedHoardRawZ()` | ❌Incomplete | — | — |
| `GetActionStackCount()` | ❌Incomplete | — | — |
| `GetActiveFates()` | ❌Incomplete | — | — |
| `GetActiveMacroName()` | ❌Incomplete | — | — |
| `GetActiveMiniMapGatheringMarker()` | ❌Incomplete | — | — |
| `GetActiveWeatherID()` | ❌Incomplete | — | — |
| `GetAddersGCRank()` | ❌Incomplete | — | — |
| `GetAetheryteList()` | ❌Incomplete | — | — |
| `GetAetheryteName()` | ❌Incomplete | — | — |
| `GetAetheryteRawPos()` | ❌Incomplete | — | — |
| `GetAetherytesInZone()` | ❌Incomplete | — | — |
| `GetBronzeChestLocations()` | ❌Incomplete | — | — |
| `GetBuddyTimeRemaining()` | ❌Incomplete | — | — |
| `GetClassJobId()` | ❌Incomplete | — | Returns the current class/job ID (type: Job)  |
| `GetClicks()` | ❌Incomplete | — | — |
| `GetClipboard()` | ❌Incomplete | — | — |
| `GetCondition()` | ❌Incomplete | — | — |
| `GetContentTimeLeft()` | ❌Incomplete | — | — |
| `GetCp()` | ❌Incomplete | — | — |
| `GetCurrentBait()` | ❌Incomplete | — | — |
| `GetCurrentEorzeaHour()` | ❌Incomplete | — | Returns the current in-game hour (type: integer) |
| `GetCurrentEorzeaMinute()` | ❌Incomplete | — | Returns the current in-game minute (type: integer) |
| `GetCurrentEorzeaSecond()` | ❌Incomplete | — | Returns the current in-game second (type: integer) |
| `GetCurrentEorzeaTimestamp()` | ❌Incomplete | — | — |
| `GetCurrentOceanFishingMission1Goal()` | ❌Incomplete | — | — |
| `GetCurrentOceanFishingMission1Name()` | ❌Incomplete | — | — |
| `GetCurrentOceanFishingMission1Progress()` | ❌Incomplete | — | — |
| `GetCurrentOceanFishingMission1Type()` | ❌Incomplete | — | — |
| `GetCurrentOceanFishingMission2Goal()` | ❌Incomplete | — | — |
| `GetCurrentOceanFishingMission2Name()` | ❌Incomplete | — | — |
| `GetCurrentOceanFishingMission2Progress()` | ❌Incomplete | — | — |
| `GetCurrentOceanFishingMission2Type()` | ❌Incomplete | — | — |
| `GetCurrentOceanFishingMission3Goal()` | ❌Incomplete | — | — |
| `GetCurrentOceanFishingMission3Name()` | ❌Incomplete | — | — |
| `GetCurrentOceanFishingMission3Progress()` | ❌Incomplete | — | — |
| `GetCurrentOceanFishingMission3Type()` | ❌Incomplete | — | — |
| `GetCurrentOceanFishingPoints()` | ❌Incomplete | — | — |
| `GetCurrentOceanFishingRoute()` | ❌Incomplete | — | — |
| `GetCurrentOceanFishingScore()` | ❌Incomplete | — | — |
| `GetCurrentOceanFishingStatus()` | ❌Incomplete | — | — |
| `GetCurrentOceanFishingTimeOfDay()` | ❌Incomplete | — | — |
| `GetCurrentOceanFishingTimeOffset()` | ❌Incomplete | — | — |
| `GetCurrentOceanFishingTotalScore()` | ❌Incomplete | — | — |
| `GetCurrentOceanFishingWeatherID()` | ❌Incomplete | — | — |
| `GetCurrentOceanFishingZone()` | ❌Incomplete | — | — |
| `GetCurrentOceanFishingZoneTimeLeft()` | ❌Incomplete | — | — |
| `GetCurrentWorld()` | ❌Incomplete | — | — |
| `GetDDPassageProgress()` | ❌Incomplete | — | — |
| `GetDiademAetherGaugeBarCount()` | ❌Incomplete | — | — |
| `GetDistanceToFocusTarget()` | ❌Incomplete | — | — |
| `GetDistanceToObject()` | ❌Incomplete | — | — |
| `GetDistanceToPartyMember()` | ❌Incomplete | — | — |
| `GetDistanceToPoint()` | ❌Incomplete | — | — |
| `GetDurability()` | ❌Incomplete | — | — |
| `GetFCGrandCompany()` | ❌Incomplete | — | — |
| `GetFCOnlineMembers()` | ❌Incomplete | — | — |
| `GetFCRank()` | ❌Incomplete | — | — |
| `GetFCTotalMembers()` | ❌Incomplete | — | — |
| `GetFateChain()` | ❌Incomplete | — | — |
| `GetFateDuration()` | ❌Incomplete | — | — |
| `GetFateEventItem()` | ❌Incomplete | — | — |
| `GetFateHandInCount()` | ❌Incomplete | — | — |
| `GetFateIconId()` | ❌Incomplete | — | — |
| `GetFateIsBonus()` | ❌Incomplete | — | — |
| `GetFateLevel()` | ❌Incomplete | — | — |
| `GetFateLocationX()` | ❌Incomplete | — | — |
| `GetFateLocationY()` | ❌Incomplete | — | — |
| `GetFateLocationZ()` | ❌Incomplete | — | — |
| `GetFateMaxLevel()` | ❌Incomplete | — | — |
| `GetFateName()` | ❌Incomplete | — | — |
| `GetFateProgress()` | ❌Incomplete | — | — |
| `GetFateRadius()` | ❌Incomplete | — | — |
| `GetFateStartTimeEpoch()` | ❌Incomplete | — | — |
| `GetFateState()` | ❌Incomplete | — | — |
| `GetFlagXCoord()` | ❌Incomplete | — | — |
| `GetFlagYCoord()` | ❌Incomplete | — | — |
| `GetFlamesGCRank()` | ❌Incomplete | — | — |
| `GetFocusTargetActionID()` | ❌Incomplete | — | — |
| `GetFocusTargetFateID()` | ❌Incomplete | — | — |
| `GetFocusTargetHP()` | ❌Incomplete | — | — |
| `GetFocusTargetHPP()` | ❌Incomplete | — | — |
| `GetFocusTargetMaxHP()` | ❌Incomplete | — | — |
| `GetFocusTargetName()` | ❌Incomplete | — | — |
| `GetFocusTargetRawXPos()` | ❌Incomplete | — | — |
| `GetFocusTargetRawYPos()` | ❌Incomplete | — | — |
| `GetFocusTargetRawZPos()` | ❌Incomplete | — | — |
| `GetFocusTargetRotation()` | ❌Incomplete | — | — |
| `GetFreeSlotsInContainer()` | ❌Incomplete | — | — |
| `GetGil()` | ❌Incomplete | — | — |
| `GetGoldChestLocations()` | ❌Incomplete | — | — |
| `GetGp()` | ❌Incomplete | — | — |
| `GetHP()` | ❌Incomplete | — | — |
| `GetHashCode()` | ❌Incomplete | — | — |
| `GetHomeWorld()` | ❌Incomplete | — | — |
| `GetInventoryFreeSlotCount()` | ❌Incomplete | — | — |
| `GetItemCount()` | ❌Incomplete | — | — |
| `GetItemCountInContainer()` | ❌Incomplete | — | — |
| `GetItemCountInSlot()` | ❌Incomplete | — | — |
| `GetItemIdInSlot()` | ❌Incomplete | — | — |
| `GetItemIdsInContainer()` | ❌Incomplete | — | — |
| `GetItemName()` | ❌Incomplete | — | — |
| `GetJobExp()` | ❌Incomplete | — | — |
| `GetLevel()` | ❌Incomplete | — | — |
| `GetLimitBreakBarCount()` | ❌Incomplete | — | — |
| `GetLimitBreakBarValue()` | ❌Incomplete | — | — |
| `GetLimitBreakCurrentValue()` | ❌Incomplete | — | — |
| `GetMP()` | ❌Incomplete | — | — |
| `GetMaelstromGCRank()` | ❌Incomplete | — | — |
| `GetMaxCp()` | ❌Incomplete | — | — |
| `GetMaxDurability()` | ❌Incomplete | — | — |
| `GetMaxGp()` | ❌Incomplete | — | — |
| `GetMaxHP()` | ❌Incomplete | — | — |
| `GetMaxMP()` | ❌Incomplete | — | — |
| `GetMaxProgress()` | ❌Incomplete | — | — |
| `GetMaxQuality()` | ❌Incomplete | — | — |
| `GetMimicChestLocations()` | ❌Incomplete | — | — |
| `GetMonsterNoteRankInfo()` | ❌Incomplete | — | — |
| `GetNearbyObjectNames()` | ❌Incomplete | — | — |
| `GetNearestFate()` | ❌Incomplete | — | — |
| `GetNodeListCount()` | ❌Incomplete | — | — |
| `GetObjectActionID()` | ❌Incomplete | — | — |
| `GetObjectDataID()` | ❌Incomplete | — | — |
| `GetObjectFateID()` | ❌Incomplete | — | — |
| `GetObjectHP()` | ❌Incomplete | — | — |
| `GetObjectHPP()` | ❌Incomplete | — | — |
| `GetObjectHitboxRadius()` | ❌Incomplete | — | — |
| `GetObjectHuntRank()` | ❌Incomplete | — | — |
| `GetObjectMaxHP()` | ❌Incomplete | — | — |
| `GetObjectRawXPos()` | ❌Incomplete | — | — |
| `GetObjectRawYPos()` | ❌Incomplete | — | — |
| `GetObjectRawZPos()` | ❌Incomplete | — | — |
| `GetObjectRotation()` | ❌Incomplete | — | — |
| `GetPartyLeadIndex()` | ❌Incomplete | — | — |
| `GetPartyMemberActionID()` | ❌Incomplete | — | — |
| `GetPartyMemberHP()` | ❌Incomplete | — | — |
| `GetPartyMemberHPP()` | ❌Incomplete | — | — |
| `GetPartyMemberMaxHP()` | ❌Incomplete | — | — |
| `GetPartyMemberName()` | ❌Incomplete | — | — |
| `GetPartyMemberRawXPos()` | ❌Incomplete | — | — |
| `GetPartyMemberRawYPos()` | ❌Incomplete | — | — |
| `GetPartyMemberRawZPos()` | ❌Incomplete | — | — |
| `GetPartyMemberRotation()` | ❌Incomplete | — | — |
| `GetPartyMemberWorldId()` | ❌Incomplete | — | — |
| `GetPartyMemberWorldName()` | ❌Incomplete | — | — |
| `GetPassageLocation()` | ❌Incomplete | — | — |
| `GetPenaltyRemainingInMinutes()` | ❌Incomplete | — | — |
| `GetPercentHQ()` | ❌Incomplete | — | — |
| `GetPlayerAccountId()` | ❌Incomplete | — | — |
| `GetPlayerContentId()` | ❌Incomplete | — | — |
| `GetPlayerGC()` | ❌Incomplete | — | — |
| `GetPluginVersion()` | ❌Incomplete | — | — |
| `GetProgress()` | ❌Incomplete | — | — |
| `GetProgressIncrease()` | ❌Incomplete | — | — |
| `GetQuality()` | ❌Incomplete | — | — |
| `GetQualityIncrease()` | ❌Incomplete | — | — |
| `GetQuestAlliedSociety()` | ❌Incomplete | — | — |
| `GetQuestIDByName()` | ❌Incomplete | — | — |
| `GetQuestSequence()` | ❌Incomplete | — | — |
| `GetRealRecastTime()` | ❌Incomplete | — | — |
| `GetRealRecastTimeElapsed()` | ❌Incomplete | — | — |
| `GetRealSpellCooldown()` | ❌Incomplete | — | — |
| `GetRecastTime()` | ❌Incomplete | — | — |
| `GetRecastTimeElapsed()` | ❌Incomplete | — | — |
| `GetRequestedAchievementProgress()` | ❌Incomplete | — | — |
| `GetSNDProperty()` | ❌Incomplete | — | — |
| `GetSelectIconStringText()` | ❌Incomplete | — | — |
| `GetSelectStringText()` | ❌Incomplete | — | — |
| `GetShieldPercentage()` | ❌Incomplete | — | — |
| `GetSilverChestLocations()` | ❌Incomplete | — | — |
| `GetSpellCooldown()` | ❌Incomplete | — | — |
| `GetSpellCooldownInt()` | ❌Incomplete | — | — |
| `GetStatusSourceID()` | ❌Incomplete | — | — |
| `GetStatusStackCount()` | ❌Incomplete | — | — |
| `GetStatusTimeRemaining()` | ❌Incomplete | — | — |
| `GetStep()` | ❌Incomplete | — | — |
| `GetTargetActionID()` | ❌Incomplete | — | — |
| `GetTargetFateID()` | ❌Incomplete | — | — |
| `GetTargetHP()` | ❌Incomplete | — | — |
| `GetTargetHPP()` | ❌Incomplete | — | — |
| `GetTargetHitboxRadius()` | ❌Incomplete | — | — |
| `GetTargetHuntRank()` | ❌Incomplete | — | — |
| `GetTargetMaxHP()` | ❌Incomplete | — | — |
| `GetTargetObjectKind()` | ❌Incomplete | — | — |
| `GetTargetRawXPos()` | ❌Incomplete | — | — |
| `GetTargetRawYPos()` | ❌Incomplete | — | — |
| `GetTargetRawZPos()` | ❌Incomplete | — | — |
| `GetTargetRotation()` | ❌Incomplete | — | — |
| `GetTargetSubKind()` | ❌Incomplete | — | — |
| `GetTargetWorldId()` | ❌Incomplete | — | — |
| `GetTargetWorldName()` | ❌Incomplete | — | — |
| `GetToastNodeText()` | ❌Incomplete | — | — |
| `GetTradeableWhiteItemIDs()` | ❌Incomplete | — | — |
| `GetTrapLocations()` | ❌Incomplete | — | — |
| `GetType()` | ❌Incomplete | — | — |
| `GetWeeklyBingoOrderDataData()` | ❌Incomplete | — | — |
| `GetWeeklyBingoOrderDataKey()` | ❌Incomplete | — | — |
| `GetWeeklyBingoOrderDataText()` | ❌Incomplete | — | — |
| `GetWeeklyBingoOrderDataType()` | ❌Incomplete | — | — |
| `GetWeeklyBingoTaskStatus()` | ❌Incomplete | — | — |
| `GetZoneInstance()` | ❌Incomplete | — | — |
| `GetZoneName()` | ❌Incomplete | — | — |
| `HasCondition()` | ❌Incomplete | — | — |
| `HasFlightUnlocked()` | ❌Incomplete | — | — |
| `HasMaxProgress()` | ❌Incomplete | — | — |
| `HasMaxQuality()` | ❌Incomplete | — | — |
| `HasPlugin()` | ❌Incomplete | — | — |
| `HasStats()` | ❌Incomplete | — | — |
| `HasStatus()` | ❌Incomplete | — | — |
| `HasStatusId()` | ❌Incomplete | — | — |
| `HasTarget()` | ❌Incomplete | — | — |
| `HasWeeklyBingoJournal()` | ❌Incomplete | — | — |
| `InSanctuary()` | ❌Incomplete | — | — |
| `InternalGetMacroText()` | ❌Incomplete | — | — |
| `IsAchievementComplete()` | ❌Incomplete | — | — |
| `IsAetheryteUnlocked()` | ❌Incomplete | — | — |
| `IsCollectable()` | ❌Incomplete | — | — |
| `IsCrafting()` | ❌Incomplete | — | — |
| `IsFocusTargetCasting()` | ❌Incomplete | — | — |
| `IsFriendOnline()` | ❌Incomplete | — | — |
| `IsInFate()` | ❌Incomplete | — | — |
| `IsLeveAccepted()` | ❌Incomplete | — | — |
| `IsLevelSynced()` | ❌Incomplete | — | — |
| `IsLocalPlayerNull()` | ❌Incomplete | — | — |
| `IsMacroRunningOrQueued()` | ❌Incomplete | — | — |
| `IsNotCrafting()` | ❌Incomplete | — | — |
| `IsObjectCasting()` | ❌Incomplete | — | — |
| `IsObjectInCombat()` | ❌Incomplete | — | — |
| `IsObjectMounted()` | ❌Incomplete | — | — |
| `IsPartyMemberCasting()` | ❌Incomplete | — | — |
| `IsPartyMemberInCombat()` | ❌Incomplete | — | — |
| `IsPartyMemberMounted()` | ❌Incomplete | — | — |
| `IsPauseLoopSet()` | ❌Incomplete | — | — |
| `IsPlayerOccupied()` | ❌Incomplete | — | — |
| `IsQuestAccepted()` | ❌Incomplete | — | — |
| `IsQuestComplete()` | ❌Incomplete | — | — |
| `IsStopLoopSet()` | ❌Incomplete | — | — |
| `IsTargetCasting()` | ❌Incomplete | — | — |
| `IsTargetInCombat()` | ❌Incomplete | — | — |
| `IsTargetMounted()` | ❌Incomplete | — | — |
| `IsVislandRouteRunning()` | ❌Incomplete | — | — |
| `IsWeeklyBingoExpired()` | ❌Incomplete | — | — |
| `LeaveDuty()` | ❌Incomplete | — | — |
| `LifestreamAbort()` | ❌Incomplete | — | — |
| `LifestreamAethernetTeleport()` | ❌Incomplete | — | — |
| `LifestreamExecuteCommand()` | ❌Incomplete | — | — |
| `LifestreamIsBusy()` | ❌Incomplete | — | — |
| `LifestreamTeleport()` | ❌Incomplete | — | — |
| `LifestreamTeleportToApartment()` | ❌Incomplete | — | — |
| `LifestreamTeleportToFC()` | ❌Incomplete | — | — |
| `LifestreamTeleportToHome()` | ❌Incomplete | — | — |
| `ListAllFunctions()` | ❌Incomplete | — | — |
| `MoveItemToContainer()` | ❌Incomplete | — | — |
| `NavBuildProgress()` | ❌Incomplete | — | — |
| `NavIsAutoLoad()` | ❌Incomplete | — | — |
| `NavIsReady()` | ❌Incomplete | — | — |
| `NavPathfind()` | ❌Incomplete | — | — |
| `NavRebuild()` | ❌Incomplete | — | — |
| `NavReload()` | ❌Incomplete | — | — |
| `NavSetAutoLoad()` | ❌Incomplete | — | — |
| `NeedsRepair()` | ❌Incomplete | — | — |
| `ObjectHasStatus()` | ❌Incomplete | — | — |
| `OceanFishingIsSpectralActive()` | ❌Incomplete | — | — |
| `OpenRegularDuty()` | ❌Incomplete | — | — |
| `OpenRouletteDuty()` | ❌Incomplete | — | — |
| `PandoraGetFeatureConfigEnabled()` | ❌Incomplete | — | — |
| `PandoraGetFeatureEnabled()` | ❌Incomplete | — | — |
| `PandoraPauseFeature()` | ❌Incomplete | — | — |
| `PandoraSetFeatureConfigState()` | ❌Incomplete | — | — |
| `PandoraSetFeatureState()` | ❌Incomplete | — | — |
| `PartyMemberHasStatus()` | ❌Incomplete | — | — |
| `PathGetAlignCamera()` | ❌Incomplete | — | — |
| `PathGetMovementAllowed()` | ❌Incomplete | — | — |
| `PathGetTolerance()` | ❌Incomplete | — | — |
| `PathIsRunning()` | ❌Incomplete | — | — |
| `PathMoveTo()` | ❌Incomplete | — | — |
| `PathNumWaypoints()` | ❌Incomplete | — | — |
| `PathSetAlignCamera()` | ❌Incomplete | — | — |
| `PathSetMovementAllowed()` | ❌Incomplete | — | — |
| `PathSetTolerance()` | ❌Incomplete | — | — |
| `PathStop()` | ❌Incomplete | — | — |
| `PathfindAndMoveTo()` | ❌Incomplete | — | — |
| `PathfindInProgress()` | ❌Incomplete | — | — |
| `PauseYesAlready()` | ❌Incomplete | — | — |
| `QueryMeshNearestPointX()` | ❌Incomplete | — | — |
| `QueryMeshNearestPointY()` | ❌Incomplete | — | — |
| `QueryMeshNearestPointZ()` | ❌Incomplete | — | — |
| `QueryMeshPointOnFloorX()` | ❌Incomplete | — | — |
| `QueryMeshPointOnFloorY()` | ❌Incomplete | — | — |
| `QueryMeshPointOnFloorZ()` | ❌Incomplete | — | — |
| `QuestionableAddQuestPriority()` | ❌Incomplete | — | — |
| `QuestionableClearQuestPriority()` | ❌Incomplete | — | — |
| `QuestionableExportQuestPriority()` | ❌Incomplete | — | — |
| `QuestionableGetCurrentQuestId()` | ❌Incomplete | — | — |
| `QuestionableGetCurrentStepData()` | ❌Incomplete | — | — |
| `QuestionableImportQuestPriority()` | ❌Incomplete | — | — |
| `QuestionableInsertQuestPriority()` | ❌Incomplete | — | — |
| `QuestionableIsQuestLocked()` | ❌Incomplete | — | — |
| `QuestionableIsRunning()` | ❌Incomplete | — | — |
| `RSRAddBlacklistNameID()` | ❌Incomplete | — | — |
| `RSRAddPriorityNameID()` | ❌Incomplete | — | — |
| `RSRChangeOperatingMode()` | ❌Incomplete | — | — |
| `RSRRemoveBlacklistNameID()` | ❌Incomplete | — | — |
| `RSRRemovePriorityNameID()` | ❌Incomplete | — | — |
| `RSRTriggerSpecialState()` | ❌Incomplete | — | — |
| `RequestAchievementProgress()` | ❌Incomplete | — | — |
| `RestoreYesAlready()` | ❌Incomplete | — | — |
| `SelectDuty()` | ❌Incomplete | — | — |
| `SetAddersGCRank()` | ❌Incomplete | — | — |
| `SetAutoHookAutoGigSize()` | ❌Incomplete | — | — |
| `SetAutoHookAutoGigSpeed()` | ❌Incomplete | — | — |
| `SetAutoHookAutoGigState()` | ❌Incomplete | — | — |
| `SetAutoHookPreset()` | ❌Incomplete | — | — |
| `SetAutoHookState()` | ❌Incomplete | — | — |
| `SetClipboard()` | ❌Incomplete | — | — |
| `SetDFExplorerMode()` | ❌Incomplete | — | — |
| `SetDFJoinInProgress()` | ❌Incomplete | — | — |
| `SetDFLanguageD()` | ❌Incomplete | — | — |
| `SetDFLanguageE()` | ❌Incomplete | — | — |
| `SetDFLanguageF()` | ❌Incomplete | — | — |
| `SetDFLanguageJ()` | ❌Incomplete | — | — |
| `SetDFLevelSync()` | ❌Incomplete | — | — |
| `SetDFLimitedLeveling()` | ❌Incomplete | — | — |
| `SetDFMinILvl()` | ❌Incomplete | — | — |
| `SetDFSilenceEcho()` | ❌Incomplete | — | — |
| `SetDFUnrestricted()` | ❌Incomplete | — | — |
| `SetFlamesGCRank()` | ❌Incomplete | — | — |
| `SetMaelstromGCRank()` | ❌Incomplete | — | — |
| `SetMapFlag()` | ❌Incomplete | — | — |
| `SetNodeText()` | ❌Incomplete | — | — |
| `SetSNDProperty()` | ❌Incomplete | — | — |
| `TargetClosestEnemy()` | ❌Incomplete | — | — |
| `TargetClosestFateEnemy()` | ❌Incomplete | — | — |
| `TargetHasStatus()` | ❌Incomplete | — | — |
| `TeleportToGCTown()` | ❌Incomplete | — | — |
| `TerritorySupportsMounting()` | ❌Incomplete | — | — |
| `ToString()` | ❌Incomplete | — | — |
| `UseAutoHookAnonymousPreset()` | ❌Incomplete | — | — |
| `VislandIsRoutePaused()` | ❌Incomplete | — | — |
| `VislandSetRoutePaused()` | ❌Incomplete | — | — |
| `VislandStartRoute()` | ❌Incomplete | — | — |
| `VislandStopRoute()` | ❌Incomplete | — | — |
| `WeeklyBingoNumPlacedStickers()` | ❌Incomplete | — | — |
| `WeeklyBingoNumSecondChancePoints()` | ❌Incomplete | — | — |
