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

---

## Additional Resources

- [Original vac_functions.lua repository by WigglyMuffin](https://github.com/WigglyMuffin/SNDScripts/blob/main/vac_functions.lua), which may be updated with functions I have not included in the future since they’re working on similar utilities.




---

## ✅ Supported Functions

| Function                | Status   | Contributor   | Notes                              |
|------------------------|----------|---------------|------------------------------------|
| `GetCharacterName()`   | ✅ Done  | [Clover-Stuff](https://github.com/Clover-Stuff)  |                                    |
| `GetCharacterCondition()` | ✅ Done  | [Nonu](https://github.com/Nonunon), [Friendly](https://github.com/WigglyMuffin), [Clover-Stuff](https://github.com/Clover-Stuff) |                                    |
| `GetDistanceToTarget()`| ✅ Done  | [Clover-Stuff](https://github.com/Clover-Stuff)  |                                    |
| `GetNodeText()`        | ✅ Done  | [Clover-Stuff](https://github.com/Clover-Stuff)  | `@warning` about updated node IDs  |
| `GetTargetName()`      | ✅ Done  | [Clover-Stuff](https://github.com/Clover-Stuff)  |                                    |
| `IsAddonReady()`       | ✅ Done  | [Clover-Stuff](https://github.com/Clover-Stuff)  |                                    |
| `IsAddonVisible()`     | ✅ Done  | [Clover-Stuff](https://github.com/Clover-Stuff)  |                                    |
| `IsInZone()`           | ✅ Done  | [Clover-Stuff](https://github.com/Clover-Stuff)  |                                    |
| `IsMoving()`           | ✅ Done  | [Clover-Stuff](https://github.com/Clover-Stuff)  |                                    |
| `IsNodeVisible()`      | ✅ Done  | [Clover-Stuff](https://github.com/Clover-Stuff)  |                                    |
| `IsPlayerCasting()`    | ✅ Done  | [Nonu](https://github.com/Nonunon)          |                                    |
| `IsPlayerAvailable()`  | ✅ Done  | [Nonu](https://github.com/Nonunon)          |                                    |
| `IsPlayerDead()`       | ✅ Done  | [Nonu](https://github.com/Nonunon)          |                                    |
| `GetPlayerRawXPos()`   | ✅ Done  | [Nonu](https://github.com/Nonunon)          |                                    |
| `GetPlayerRawYPos()`   | ✅ Done  | [Nonu](https://github.com/Nonunon)          |                                    |
| `GetPlayerRawZPos()`   | ✅ Done  | [Nonu](https://github.com/Nonunon)          |                                    |
| `GetZoneID()`          | ✅ Done  | [Nonu](https://github.com/Nonunon)          |                                    |
| `LogInfo()`            | ✅ Done  | [Nonu](https://github.com/Nonunon)          |                                    |
| `LogDebug()`           | ✅ Done  | [Nonu](https://github.com/Nonunon)          |                                    |
| `LogVerbose()`         | ✅ Done  | [Nonu](https://github.com/Nonunon)          |                                    |
| `GetFlagZone()`        | ✅ Done  | [Friendly](https://github.com/WigglyMuffin)       |                                    |

## Pending Functions

| Function | Status | Contributor | Notes |
|----------|--------|-------------|-------|
| `ADContentHasPath()` | ❌ Not Done | — | — |
| `ADGetConfig()` | ❌ Not Done | — | — |
| `ADIsLooping()` | ❌ Not Done | — | — |
| `ADIsNavigating()` | ❌ Not Done | — | — |
| `ADIsStopped()` | ❌ Not Done | — | — |
| `ADListConfig()` | ❌ Not Done | — | — |
| `ADRun()` | ❌ Not Done | — | — |
| `ADSetConfig()` | ❌ Not Done | — | — |
| `ADStart()` | ❌ Not Done | — | — |
| `ADStop()` | ❌ Not Done | — | — |
| `ARAbortAllTasks()` | ❌ Not Done | — | — |
| `ARAnyWaitingToBeProcessed()` | ❌ Not Done | — | — |
| `ARAreAnyRetainersAvailableForCurrentChara()` | ❌ Not Done | — | — |
| `ARCanAutoLogin()` | ❌ Not Done | — | — |
| `ARDisableAllFunctions()` | ❌ Not Done | — | — |
| `ARDiscardGetItemsToDiscard()` | ❌ Not Done | — | — |
| `AREnableMultiMode()` | ❌ Not Done | — | — |
| `AREnqueueHET()` | ❌ Not Done | — | — |
| `AREnqueueInitiation()` | ❌ Not Done | — | — |
| `ARFinishCharacterPostProcess()` | ❌ Not Done | — | — |
| `ARGetCharacterCIDs()` | ❌ Not Done | — | — |
| `ARGetCharacterData()` | ❌ Not Done | — | — |
| `ARGetClosestRetainerVentureSecondsRemaining()` | ❌ Not Done | — | — |
| `ARGetEnabledRetainers()` | ❌ Not Done | — | — |
| `ARGetGCInfo()` | ❌ Not Done | — | — |
| `ARGetInventoryFreeSlotCount()` | ❌ Not Done | — | — |
| `ARGetMultiModeEnabled()` | ❌ Not Done | — | — |
| `ARGetOptionRetainerSense()` | ❌ Not Done | — | — |
| `ARGetOptionRetainerSenseThreshold()` | ❌ Not Done | — | — |
| `ARGetRegisteredCharacters()` | ❌ Not Done | — | — |
| `ARGetRegisteredEnabledCharacters()` | ❌ Not Done | — | — |
| `ARGetRegisteredEnabledRetainers()` | ❌ Not Done | — | — |
| `ARGetRegisteredRetainers()` | ❌ Not Done | — | — |
| `ARIsBusy()` | ❌ Not Done | — | — |
| `ARRelog()` | ❌ Not Done | — | — |
| `ARRetainersWaitingToBeProcessed()` | ❌ Not Done | — | — |
| `ARSetMultiModeEnabled()` | ❌ Not Done | — | — |
| `ARSetOptionRetainerSense()` | ❌ Not Done | — | — |
| `ARSetOptionRetainerSenseThreshold()` | ❌ Not Done | — | — |
| `ARSetSuppressed()` | ❌ Not Done | — | — |
| `ARSubsWaitingToBeProcessed()` | ❌ Not Done | — | — |
| `ATAddItemToCraftList()` | ❌ Not Done | — | — |
| `ATAddNewCraftList()` | ❌ Not Done | — | — |
| `ATCurrentCharacter()` | ❌ Not Done | — | — |
| `ATDisableBackgroundFilter()` | ❌ Not Done | — | — |
| `ATDisableCraftList()` | ❌ Not Done | — | — |
| `ATDisableUiFilter()` | ❌ Not Done | — | — |
| `ATEnableBackgroundFilter()` | ❌ Not Done | — | — |
| `ATEnableCraftList()` | ❌ Not Done | — | — |
| `ATEnableUiFilter()` | ❌ Not Done | — | — |
| `ATGetCharacterItems()` | ❌ Not Done | — | — |
| `ATGetCharacterItemsByType()` | ❌ Not Done | — | — |
| `ATGetCharactersOwnedByActive()` | ❌ Not Done | — | — |
| `ATGetCraftItems()` | ❌ Not Done | — | — |
| `ATGetCraftLists()` | ❌ Not Done | — | — |
| `ATGetFilterItems()` | ❌ Not Done | — | — |
| `ATGetRetrievalItems()` | ❌ Not Done | — | — |
| `ATGetSearchFilters()` | ❌ Not Done | — | — |
| `ATInventoryCountByType()` | ❌ Not Done | — | — |
| `ATInventoryCountByTypes()` | ❌ Not Done | — | — |
| `ATIsInitialized()` | ❌ Not Done | — | — |
| `ATItemCount()` | ❌ Not Done | — | — |
| `ATItemCountHQ()` | ❌ Not Done | — | — |
| `ATItemCountOwned()` | ❌ Not Done | — | — |
| `ATRemoveItemFromCraftList()` | ❌ Not Done | — | — |
| `ATToggleBackgroundFilter()` | ❌ Not Done | — | — |
| `ATToggleCraftList()` | ❌ Not Done | — | — |
| `ATToggleUiFilter()` | ❌ Not Done | — | — |
| `ArtisanCraftItem()` | ❌ Not Done | — | — |
| `ArtisanGetEnduranceStatus()` | ❌ Not Done | — | — |
| `ArtisanGetStopRequest()` | ❌ Not Done | — | — |
| `ArtisanIsListPaused()` | ❌ Not Done | — | — |
| `ArtisanIsListRunning()` | ❌ Not Done | — | — |
| `ArtisanSetEnduranceStatus()` | ❌ Not Done | — | — |
| `ArtisanSetListPause()` | ❌ Not Done | — | — |
| `ArtisanSetStopRequest()` | ❌ Not Done | — | — |
| `BMAddTransientStrategy()` | ❌ Not Done | — | — |
| `BMAddTransientStrategyTargetEnemyOID()` | ❌ Not Done | — | — |
| `BMClearActive()` | ❌ Not Done | — | — |
| `BMCreate()` | ❌ Not Done | — | — |
| `BMDelete()` | ❌ Not Done | — | — |
| `BMGet()` | ❌ Not Done | — | — |
| `BMGetActive()` | ❌ Not Done | — | — |
| `BMGetForceDisabled()` | ❌ Not Done | — | — |
| `BMSetActive()` | ❌ Not Done | — | — |
| `BMSetForceDisabled()` | ❌ Not Done | — | — |
| `CanExtractMateria()` | ❌ Not Done | — | — |
| `ClearFocusTarget()` | ❌ Not Done | — | — |
| `ClearTarget()` | ❌ Not Done | — | — |
| `CrashTheGame()` | ❌ Not Done | — | — |
| `DeleteAllAutoHookAnonymousPresets()` | ❌ Not Done | — | — |
| `DeletedSelectedAutoHookPreset()` | ❌ Not Done | — | — |
| `DeliverooIsTurnInRunning()` | ❌ Not Done | — | — |
| `DistanceBetween()` | ❌ Not Done | — | — |
| `DoesObjectExist()` | ❌ Not Done | — | — |
| `DropboxGetItemQuantity()` | ❌ Not Done | — | — |
| `DropboxIsBusy()` | ❌ Not Done | — | — |
| `DropboxSetItemQuantity()` | ❌ Not Done | — | — |
| `DropboxStart()` | ❌ Not Done | — | — |
| `DropboxStop()` | ❌ Not Done | — | — |
| `Equals()` | ❌ Not Done | — | — |
| `ExecuteAction()` | ❌ Not Done | — | — |
| `ExecuteGeneralAction()` | ❌ Not Done | — | — |
| `FocusTargetHasStatus()` | ❌ Not Done | — | — |
| `GetAcceptedQuests()` | ❌ Not Done | — | — |
| `GetAccursedHoardRawX()` | ❌ Not Done | — | — |
| `GetAccursedHoardRawY()` | ❌ Not Done | — | — |
| `GetAccursedHoardRawZ()` | ❌ Not Done | — | — |
| `GetActionStackCount()` | ❌ Not Done | — | — |
| `GetActiveFates()` | ❌ Not Done | — | — |
| `GetActiveMacroName()` | ❌ Not Done | — | — |
| `GetActiveMiniMapGatheringMarker()` | ❌ Not Done | — | — |
| `GetActiveWeatherID()` | ❌ Not Done | — | — |
| `GetAddersGCRank()` | ❌ Not Done | — | — |
| `GetAetheryteList()` | ❌ Not Done | — | — |
| `GetAetheryteName()` | ❌ Not Done | — | — |
| `GetAetheryteRawPos()` | ❌ Not Done | — | — |
| `GetAetherytesInZone()` | ❌ Not Done | — | — |
| `GetBronzeChestLocations()` | ❌ Not Done | — | — |
| `GetBuddyTimeRemaining()` | ❌ Not Done | — | — |
| `GetClassJobId()` | ❌ Not Done | — | Returns the current class/job ID (type: Job)  |
| `GetClicks()` | ❌ Not Done | — | — |
| `GetClipboard()` | ❌ Not Done | — | — |
| `GetCondition()` | ❌ Not Done | — | — |
| `GetContentTimeLeft()` | ❌ Not Done | — | — |
| `GetCp()` | ❌ Not Done | — | — |
| `GetCurrentBait()` | ❌ Not Done | — | — |
| `GetCurrentEorzeaHour()` | ❌ Not Done | — | Returns the current in-game hour (type: integer) |
| `GetCurrentEorzeaMinute()` | ❌ Not Done | — | Returns the current in-game minute (type: integer) |
| `GetCurrentEorzeaSecond()` | ❌ Not Done | — | Returns the current in-game second (type: integer) |
| `GetCurrentEorzeaTimestamp()` | ❌ Not Done | — | — |
| `GetCurrentOceanFishingMission1Goal()` | ❌ Not Done | — | — |
| `GetCurrentOceanFishingMission1Name()` | ❌ Not Done | — | — |
| `GetCurrentOceanFishingMission1Progress()` | ❌ Not Done | — | — |
| `GetCurrentOceanFishingMission1Type()` | ❌ Not Done | — | — |
| `GetCurrentOceanFishingMission2Goal()` | ❌ Not Done | — | — |
| `GetCurrentOceanFishingMission2Name()` | ❌ Not Done | — | — |
| `GetCurrentOceanFishingMission2Progress()` | ❌ Not Done | — | — |
| `GetCurrentOceanFishingMission2Type()` | ❌ Not Done | — | — |
| `GetCurrentOceanFishingMission3Goal()` | ❌ Not Done | — | — |
| `GetCurrentOceanFishingMission3Name()` | ❌ Not Done | — | — |
| `GetCurrentOceanFishingMission3Progress()` | ❌ Not Done | — | — |
| `GetCurrentOceanFishingMission3Type()` | ❌ Not Done | — | — |
| `GetCurrentOceanFishingPoints()` | ❌ Not Done | — | — |
| `GetCurrentOceanFishingRoute()` | ❌ Not Done | — | — |
| `GetCurrentOceanFishingScore()` | ❌ Not Done | — | — |
| `GetCurrentOceanFishingStatus()` | ❌ Not Done | — | — |
| `GetCurrentOceanFishingTimeOfDay()` | ❌ Not Done | — | — |
| `GetCurrentOceanFishingTimeOffset()` | ❌ Not Done | — | — |
| `GetCurrentOceanFishingTotalScore()` | ❌ Not Done | — | — |
| `GetCurrentOceanFishingWeatherID()` | ❌ Not Done | — | — |
| `GetCurrentOceanFishingZone()` | ❌ Not Done | — | — |
| `GetCurrentOceanFishingZoneTimeLeft()` | ❌ Not Done | — | — |
| `GetCurrentWorld()` | ❌ Not Done | — | — |
| `GetDDPassageProgress()` | ❌ Not Done | — | — |
| `GetDiademAetherGaugeBarCount()` | ❌ Not Done | — | — |
| `GetDistanceToFocusTarget()` | ❌ Not Done | — | — |
| `GetDistanceToObject()` | ❌ Not Done | — | — |
| `GetDistanceToPartyMember()` | ❌ Not Done | — | — |
| `GetDistanceToPoint()` | ❌ Not Done | — | — |
| `GetDurability()` | ❌ Not Done | — | — |
| `GetFCGrandCompany()` | ❌ Not Done | — | — |
| `GetFCOnlineMembers()` | ❌ Not Done | — | — |
| `GetFCRank()` | ❌ Not Done | — | — |
| `GetFCTotalMembers()` | ❌ Not Done | — | — |
| `GetFateChain()` | ❌ Not Done | — | — |
| `GetFateDuration()` | ❌ Not Done | — | — |
| `GetFateEventItem()` | ❌ Not Done | — | — |
| `GetFateHandInCount()` | ❌ Not Done | — | — |
| `GetFateIconId()` | ❌ Not Done | — | — |
| `GetFateIsBonus()` | ❌ Not Done | — | — |
| `GetFateLevel()` | ❌ Not Done | — | — |
| `GetFateLocationX()` | ❌ Not Done | — | — |
| `GetFateLocationY()` | ❌ Not Done | — | — |
| `GetFateLocationZ()` | ❌ Not Done | — | — |
| `GetFateMaxLevel()` | ❌ Not Done | — | — |
| `GetFateName()` | ❌ Not Done | — | — |
| `GetFateProgress()` | ❌ Not Done | — | — |
| `GetFateRadius()` | ❌ Not Done | — | — |
| `GetFateStartTimeEpoch()` | ❌ Not Done | — | — |
| `GetFateState()` | ❌ Not Done | — | — |
| `GetFlagXCoord()` | ❌ Not Done | — | — |
| `GetFlagYCoord()` | ❌ Not Done | — | — |
| `GetFlamesGCRank()` | ❌ Not Done | — | — |
| `GetFocusTargetActionID()` | ❌ Not Done | — | — |
| `GetFocusTargetFateID()` | ❌ Not Done | — | — |
| `GetFocusTargetHP()` | ❌ Not Done | — | — |
| `GetFocusTargetHPP()` | ❌ Not Done | — | — |
| `GetFocusTargetMaxHP()` | ❌ Not Done | — | — |
| `GetFocusTargetName()` | ❌ Not Done | — | — |
| `GetFocusTargetRawXPos()` | ❌ Not Done | — | — |
| `GetFocusTargetRawYPos()` | ❌ Not Done | — | — |
| `GetFocusTargetRawZPos()` | ❌ Not Done | — | — |
| `GetFocusTargetRotation()` | ❌ Not Done | — | — |
| `GetFreeSlotsInContainer()` | ❌ Not Done | — | — |
| `GetGil()` | ❌ Not Done | — | — |
| `GetGoldChestLocations()` | ❌ Not Done | — | — |
| `GetGp()` | ❌ Not Done | — | — |
| `GetHP()` | ❌ Not Done | — | — |
| `GetHashCode()` | ❌ Not Done | — | — |
| `GetHomeWorld()` | ❌ Not Done | — | — |
| `GetInventoryFreeSlotCount()` | ❌ Not Done | — | — |
| `GetItemCount()` | ❌ Not Done | — | — |
| `GetItemCountInContainer()` | ❌ Not Done | — | — |
| `GetItemCountInSlot()` | ❌ Not Done | — | — |
| `GetItemIdInSlot()` | ❌ Not Done | — | — |
| `GetItemIdsInContainer()` | ❌ Not Done | — | — |
| `GetItemName()` | ❌ Not Done | — | — |
| `GetJobExp()` | ❌ Not Done | — | — |
| `GetLevel()` | ❌ Not Done | — | — |
| `GetLimitBreakBarCount()` | ❌ Not Done | — | — |
| `GetLimitBreakBarValue()` | ❌ Not Done | — | — |
| `GetLimitBreakCurrentValue()` | ❌ Not Done | — | — |
| `GetMP()` | ❌ Not Done | — | — |
| `GetMaelstromGCRank()` | ❌ Not Done | — | — |
| `GetMaxCp()` | ❌ Not Done | — | — |
| `GetMaxDurability()` | ❌ Not Done | — | — |
| `GetMaxGp()` | ❌ Not Done | — | — |
| `GetMaxHP()` | ❌ Not Done | — | — |
| `GetMaxMP()` | ❌ Not Done | — | — |
| `GetMaxProgress()` | ❌ Not Done | — | — |
| `GetMaxQuality()` | ❌ Not Done | — | — |
| `GetMimicChestLocations()` | ❌ Not Done | — | — |
| `GetMonsterNoteRankInfo()` | ❌ Not Done | — | — |
| `GetNearbyObjectNames()` | ❌ Not Done | — | — |
| `GetNearestFate()` | ❌ Not Done | — | — |
| `GetNodeListCount()` | ❌ Not Done | — | — |
| `GetObjectActionID()` | ❌ Not Done | — | — |
| `GetObjectDataID()` | ❌ Not Done | — | — |
| `GetObjectFateID()` | ❌ Not Done | — | — |
| `GetObjectHP()` | ❌ Not Done | — | — |
| `GetObjectHPP()` | ❌ Not Done | — | — |
| `GetObjectHitboxRadius()` | ❌ Not Done | — | — |
| `GetObjectHuntRank()` | ❌ Not Done | — | — |
| `GetObjectMaxHP()` | ❌ Not Done | — | — |
| `GetObjectRawXPos()` | ❌ Not Done | — | — |
| `GetObjectRawYPos()` | ❌ Not Done | — | — |
| `GetObjectRawZPos()` | ❌ Not Done | — | — |
| `GetObjectRotation()` | ❌ Not Done | — | — |
| `GetPartyLeadIndex()` | ❌ Not Done | — | — |
| `GetPartyMemberActionID()` | ❌ Not Done | — | — |
| `GetPartyMemberHP()` | ❌ Not Done | — | — |
| `GetPartyMemberHPP()` | ❌ Not Done | — | — |
| `GetPartyMemberMaxHP()` | ❌ Not Done | — | — |
| `GetPartyMemberName()` | ❌ Not Done | — | — |
| `GetPartyMemberRawXPos()` | ❌ Not Done | — | — |
| `GetPartyMemberRawYPos()` | ❌ Not Done | — | — |
| `GetPartyMemberRawZPos()` | ❌ Not Done | — | — |
| `GetPartyMemberRotation()` | ❌ Not Done | — | — |
| `GetPartyMemberWorldId()` | ❌ Not Done | — | — |
| `GetPartyMemberWorldName()` | ❌ Not Done | — | — |
| `GetPassageLocation()` | ❌ Not Done | — | — |
| `GetPenaltyRemainingInMinutes()` | ❌ Not Done | — | — |
| `GetPercentHQ()` | ❌ Not Done | — | — |
| `GetPlayerAccountId()` | ❌ Not Done | — | — |
| `GetPlayerContentId()` | ❌ Not Done | — | — |
| `GetPlayerGC()` | ❌ Not Done | — | — |
| `GetPluginVersion()` | ❌ Not Done | — | — |
| `GetProgress()` | ❌ Not Done | — | — |
| `GetProgressIncrease()` | ❌ Not Done | — | — |
| `GetQuality()` | ❌ Not Done | — | — |
| `GetQualityIncrease()` | ❌ Not Done | — | — |
| `GetQuestAlliedSociety()` | ❌ Not Done | — | — |
| `GetQuestIDByName()` | ❌ Not Done | — | — |
| `GetQuestSequence()` | ❌ Not Done | — | — |
| `GetRealRecastTime()` | ❌ Not Done | — | — |
| `GetRealRecastTimeElapsed()` | ❌ Not Done | — | — |
| `GetRealSpellCooldown()` | ❌ Not Done | — | — |
| `GetRecastTime()` | ❌ Not Done | — | — |
| `GetRecastTimeElapsed()` | ❌ Not Done | — | — |
| `GetRequestedAchievementProgress()` | ❌ Not Done | — | — |
| `GetSNDProperty()` | ❌ Not Done | — | — |
| `GetSelectIconStringText()` | ❌ Not Done | — | — |
| `GetSelectStringText()` | ❌ Not Done | — | — |
| `GetShieldPercentage()` | ❌ Not Done | — | — |
| `GetSilverChestLocations()` | ❌ Not Done | — | — |
| `GetSpellCooldown()` | ❌ Not Done | — | — |
| `GetSpellCooldownInt()` | ❌ Not Done | — | — |
| `GetStatusSourceID()` | ❌ Not Done | — | — |
| `GetStatusStackCount()` | ❌ Not Done | — | — |
| `GetStatusTimeRemaining()` | ❌ Not Done | — | — |
| `GetStep()` | ❌ Not Done | — | — |
| `GetTargetActionID()` | ❌ Not Done | — | — |
| `GetTargetFateID()` | ❌ Not Done | — | — |
| `GetTargetHP()` | ❌ Not Done | — | — |
| `GetTargetHPP()` | ❌ Not Done | — | — |
| `GetTargetHitboxRadius()` | ❌ Not Done | — | — |
| `GetTargetHuntRank()` | ❌ Not Done | — | — |
| `GetTargetMaxHP()` | ❌ Not Done | — | — |
| `GetTargetObjectKind()` | ❌ Not Done | — | — |
| `GetTargetRawXPos()` | ❌ Not Done | — | — |
| `GetTargetRawYPos()` | ❌ Not Done | — | — |
| `GetTargetRawZPos()` | ❌ Not Done | — | — |
| `GetTargetRotation()` | ❌ Not Done | — | — |
| `GetTargetSubKind()` | ❌ Not Done | — | — |
| `GetTargetWorldId()` | ❌ Not Done | — | — |
| `GetTargetWorldName()` | ❌ Not Done | — | — |
| `GetToastNodeText()` | ❌ Not Done | — | — |
| `GetTradeableWhiteItemIDs()` | ❌ Not Done | — | — |
| `GetTrapLocations()` | ❌ Not Done | — | — |
| `GetType()` | ❌ Not Done | — | — |
| `GetWeeklyBingoOrderDataData()` | ❌ Not Done | — | — |
| `GetWeeklyBingoOrderDataKey()` | ❌ Not Done | — | — |
| `GetWeeklyBingoOrderDataText()` | ❌ Not Done | — | — |
| `GetWeeklyBingoOrderDataType()` | ❌ Not Done | — | — |
| `GetWeeklyBingoTaskStatus()` | ❌ Not Done | — | — |
| `GetZoneInstance()` | ❌ Not Done | — | — |
| `GetZoneName()` | ❌ Not Done | — | — |
| `HasCondition()` | ❌ Not Done | — | — |
| `HasFlightUnlocked()` | ❌ Not Done | — | — |
| `HasMaxProgress()` | ❌ Not Done | — | — |
| `HasMaxQuality()` | ❌ Not Done | — | — |
| `HasPlugin()` | ❌ Not Done | — | — |
| `HasStats()` | ❌ Not Done | — | — |
| `HasStatus()` | ❌ Not Done | — | — |
| `HasStatusId()` | ❌ Not Done | — | — |
| `HasTarget()` | ❌ Not Done | — | — |
| `HasWeeklyBingoJournal()` | ❌ Not Done | — | — |
| `InSanctuary()` | ❌ Not Done | — | — |
| `InternalGetMacroText()` | ❌ Not Done | — | — |
| `IsAchievementComplete()` | ❌ Not Done | — | — |
| `IsAetheryteUnlocked()` | ❌ Not Done | — | — |
| `IsCollectable()` | ❌ Not Done | — | — |
| `IsCrafting()` | ❌ Not Done | — | — |
| `IsFocusTargetCasting()` | ❌ Not Done | — | — |
| `IsFriendOnline()` | ❌ Not Done | — | — |
| `IsInFate()` | ❌ Not Done | — | — |
| `IsLeveAccepted()` | ❌ Not Done | — | — |
| `IsLevelSynced()` | ❌ Not Done | — | — |
| `IsLocalPlayerNull()` | ❌ Not Done | — | — |
| `IsMacroRunningOrQueued()` | ❌ Not Done | — | — |
| `IsNotCrafting()` | ❌ Not Done | — | — |
| `IsObjectCasting()` | ❌ Not Done | — | — |
| `IsObjectInCombat()` | ❌ Not Done | — | — |
| `IsObjectMounted()` | ❌ Not Done | — | — |
| `IsPartyMemberCasting()` | ❌ Not Done | — | — |
| `IsPartyMemberInCombat()` | ❌ Not Done | — | — |
| `IsPartyMemberMounted()` | ❌ Not Done | — | — |
| `IsPauseLoopSet()` | ❌ Not Done | — | — |
| `IsPlayerOccupied()` | ❌ Not Done | — | — |
| `IsQuestAccepted()` | ❌ Not Done | — | — |
| `IsQuestComplete()` | ❌ Not Done | — | — |
| `IsStopLoopSet()` | ❌ Not Done | — | — |
| `IsTargetCasting()` | ❌ Not Done | — | — |
| `IsTargetInCombat()` | ❌ Not Done | — | — |
| `IsTargetMounted()` | ❌ Not Done | — | — |
| `IsVislandRouteRunning()` | ❌ Not Done | — | — |
| `IsWeeklyBingoExpired()` | ❌ Not Done | — | — |
| `LeaveDuty()` | ❌ Not Done | — | — |
| `LifestreamAbort()` | ❌ Not Done | — | — |
| `LifestreamAethernetTeleport()` | ❌ Not Done | — | — |
| `LifestreamExecuteCommand()` | ❌ Not Done | — | — |
| `LifestreamIsBusy()` | ❌ Not Done | — | — |
| `LifestreamTeleport()` | ❌ Not Done | — | — |
| `LifestreamTeleportToApartment()` | ❌ Not Done | — | — |
| `LifestreamTeleportToFC()` | ❌ Not Done | — | — |
| `LifestreamTeleportToHome()` | ❌ Not Done | — | — |
| `ListAllFunctions()` | ❌ Not Done | — | — |
| `MoveItemToContainer()` | ❌ Not Done | — | — |
| `NavBuildProgress()` | ❌ Not Done | — | — |
| `NavIsAutoLoad()` | ❌ Not Done | — | — |
| `NavIsReady()` | ❌ Not Done | — | — |
| `NavPathfind()` | ❌ Not Done | — | — |
| `NavRebuild()` | ❌ Not Done | — | — |
| `NavReload()` | ❌ Not Done | — | — |
| `NavSetAutoLoad()` | ❌ Not Done | — | — |
| `NeedsRepair()` | ❌ Not Done | — | — |
| `ObjectHasStatus()` | ❌ Not Done | — | — |
| `OceanFishingIsSpectralActive()` | ❌ Not Done | — | — |
| `OpenRegularDuty()` | ❌ Not Done | — | — |
| `OpenRouletteDuty()` | ❌ Not Done | — | — |
| `PandoraGetFeatureConfigEnabled()` | ❌ Not Done | — | — |
| `PandoraGetFeatureEnabled()` | ❌ Not Done | — | — |
| `PandoraPauseFeature()` | ❌ Not Done | — | — |
| `PandoraSetFeatureConfigState()` | ❌ Not Done | — | — |
| `PandoraSetFeatureState()` | ❌ Not Done | — | — |
| `PartyMemberHasStatus()` | ❌ Not Done | — | — |
| `PathGetAlignCamera()` | ❌ Not Done | — | — |
| `PathGetMovementAllowed()` | ❌ Not Done | — | — |
| `PathGetTolerance()` | ❌ Not Done | — | — |
| `PathIsRunning()` | ❌ Not Done | — | — |
| `PathMoveTo()` | ❌ Not Done | — | — |
| `PathNumWaypoints()` | ❌ Not Done | — | — |
| `PathSetAlignCamera()` | ❌ Not Done | — | — |
| `PathSetMovementAllowed()` | ❌ Not Done | — | — |
| `PathSetTolerance()` | ❌ Not Done | — | — |
| `PathStop()` | ❌ Not Done | — | — |
| `PathfindAndMoveTo()` | ❌ Not Done | — | — |
| `PathfindInProgress()` | ❌ Not Done | — | — |
| `PauseYesAlready()` | ❌ Not Done | — | — |
| `QueryMeshNearestPointX()` | ❌ Not Done | — | — |
| `QueryMeshNearestPointY()` | ❌ Not Done | — | — |
| `QueryMeshNearestPointZ()` | ❌ Not Done | — | — |
| `QueryMeshPointOnFloorX()` | ❌ Not Done | — | — |
| `QueryMeshPointOnFloorY()` | ❌ Not Done | — | — |
| `QueryMeshPointOnFloorZ()` | ❌ Not Done | — | — |
| `QuestionableAddQuestPriority()` | ❌ Not Done | — | — |
| `QuestionableClearQuestPriority()` | ❌ Not Done | — | — |
| `QuestionableExportQuestPriority()` | ❌ Not Done | — | — |
| `QuestionableGetCurrentQuestId()` | ❌ Not Done | — | — |
| `QuestionableGetCurrentStepData()` | ❌ Not Done | — | — |
| `QuestionableImportQuestPriority()` | ❌ Not Done | — | — |
| `QuestionableInsertQuestPriority()` | ❌ Not Done | — | — |
| `QuestionableIsQuestLocked()` | ❌ Not Done | — | — |
| `QuestionableIsRunning()` | ❌ Not Done | — | — |
| `RSRAddBlacklistNameID()` | ❌ Not Done | — | — |
| `RSRAddPriorityNameID()` | ❌ Not Done | — | — |
| `RSRChangeOperatingMode()` | ❌ Not Done | — | — |
| `RSRRemoveBlacklistNameID()` | ❌ Not Done | — | — |
| `RSRRemovePriorityNameID()` | ❌ Not Done | — | — |
| `RSRTriggerSpecialState()` | ❌ Not Done | — | — |
| `RequestAchievementProgress()` | ❌ Not Done | — | — |
| `RestoreYesAlready()` | ❌ Not Done | — | — |
| `SelectDuty()` | ❌ Not Done | — | — |
| `SetAddersGCRank()` | ❌ Not Done | — | — |
| `SetAutoHookAutoGigSize()` | ❌ Not Done | — | — |
| `SetAutoHookAutoGigSpeed()` | ❌ Not Done | — | — |
| `SetAutoHookAutoGigState()` | ❌ Not Done | — | — |
| `SetAutoHookPreset()` | ❌ Not Done | — | — |
| `SetAutoHookState()` | ❌ Not Done | — | — |
| `SetClipboard()` | ❌ Not Done | — | — |
| `SetDFExplorerMode()` | ❌ Not Done | — | — |
| `SetDFJoinInProgress()` | ❌ Not Done | — | — |
| `SetDFLanguageD()` | ❌ Not Done | — | — |
| `SetDFLanguageE()` | ❌ Not Done | — | — |
| `SetDFLanguageF()` | ❌ Not Done | — | — |
| `SetDFLanguageJ()` | ❌ Not Done | — | — |
| `SetDFLevelSync()` | ❌ Not Done | — | — |
| `SetDFLimitedLeveling()` | ❌ Not Done | — | — |
| `SetDFMinILvl()` | ❌ Not Done | — | — |
| `SetDFSilenceEcho()` | ❌ Not Done | — | — |
| `SetDFUnrestricted()` | ❌ Not Done | — | — |
| `SetFlamesGCRank()` | ❌ Not Done | — | — |
| `SetMaelstromGCRank()` | ❌ Not Done | — | — |
| `SetMapFlag()` | ❌ Not Done | — | — |
| `SetNodeText()` | ❌ Not Done | — | — |
| `SetSNDProperty()` | ❌ Not Done | — | — |
| `TargetClosestEnemy()` | ❌ Not Done | — | — |
| `TargetClosestFateEnemy()` | ❌ Not Done | — | — |
| `TargetHasStatus()` | ❌ Not Done | — | — |
| `TeleportToGCTown()` | ❌ Not Done | — | — |
| `TerritorySupportsMounting()` | ❌ Not Done | — | — |
| `ToString()` | ❌ Not Done | — | — |
| `UseAutoHookAnonymousPreset()` | ❌ Not Done | — | — |
| `VislandIsRoutePaused()` | ❌ Not Done | — | — |
| `VislandSetRoutePaused()` | ❌ Not Done | — | — |
| `VislandStartRoute()` | ❌ Not Done | — | — |
| `VislandStopRoute()` | ❌ Not Done | — | — |
| `WeeklyBingoNumPlacedStickers()` | ❌ Not Done | — | — |
| `WeeklyBingoNumSecondChancePoints()` | ❌ Not Done | — | — |
