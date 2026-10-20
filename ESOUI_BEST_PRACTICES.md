# ESOUI & Minion Addon Development Best Practices

A developer reference guide for building high-performance, compliant, and maintainable addons for *The Elder Scrolls Online* (ESOUI & Minion ecosystem).

---

## 1. Manifest Files (.txt vs .addon)
* **Rule**: For PC keyboard UI addons, **NEVER use both `.addon` and `.txt` simultaneously**.
* **Standard**: Always use `<AddonName>.txt` as the sole manifest file.
* **Why**: The `.addon` extension is reserved for Gamepad / console UI specific overrides or internal multi-UI setups; keeping both causes conflicts in Minion and ESOUI indexing.

---

## 2. Dependency Management & Versioning (`>=`)
* **Rule**: Always specify the minimum required version for mandatory dependencies using the `>=` operator in `## DependsOn:`.
* **Example**:
  ```text
  ## DependsOn: LibAddonMenu-2.0>=43
  ```
  *(Check the dependency's own manifest `## AddOnVersion:` tag for the exact integer value).*
* **Why**:
  - If a user has an outdated library, ESO will not load the addon, preventing runtime errors and crashes.
  - Allows removing defensive runtime checks like `if not LAM then return end` from your code, because the game engine guarantees the dependency is loaded and up to date.
* **Description Requirement**: The `## Description:` tag in the manifest and the ESOUI download page must explicitly list required libraries.

---

## 3. High-Performance Event Filtering (`AddFilterForEvent`)
* **Problem**: Events like `EVENT_INVENTORY_SINGLE_SLOT_UPDATE` fire on **every single weapon charge tick** and **every durability loss** during combat. Checking `if bagId == BAG_WORN then` inside Lua creates massive performance degradation during combat.
* **Solution**: Use engine-level C filters via `EVENT_MANAGER:AddFilterForEvent`.
* **Example**:
  ```lua
  local function OnSlotUpdate(eventCode, bagId, slotId, isNewItem, itemSoundCategory, updateReason)
      ASGG.Refresh()
  end

  -- Filter for Worn Equipment
  EVENT_MANAGER:RegisterForEvent("MyAddon_SlotWorn", EVENT_INVENTORY_SINGLE_SLOT_UPDATE, OnSlotUpdate)
  EVENT_MANAGER:AddFilterForEvent("MyAddon_SlotWorn", EVENT_INVENTORY_SINGLE_SLOT_UPDATE, REGISTER_FILTER_BAG_ID, BAG_WORN)
  EVENT_MANAGER:AddFilterForEvent("MyAddon_SlotWorn", EVENT_INVENTORY_SINGLE_SLOT_UPDATE, REGISTER_FILTER_INVENTORY_UPDATE_REASON, INVENTORY_UPDATE_REASON_DEFAULT)

  -- Filter for Backpack Items
  EVENT_MANAGER:RegisterForEvent("MyAddon_SlotBag", EVENT_INVENTORY_SINGLE_SLOT_UPDATE, OnSlotUpdate)
  EVENT_MANAGER:AddFilterForEvent("MyAddon_SlotBag", EVENT_INVENTORY_SINGLE_SLOT_UPDATE, REGISTER_FILTER_BAG_ID, BAG_BACKPACK)
  EVENT_MANAGER:AddFilterForEvent("MyAddon_SlotBag", EVENT_INVENTORY_SINGLE_SLOT_UPDATE, REGISTER_FILTER_INVENTORY_UPDATE_REASON, INVENTORY_UPDATE_REASON_DEFAULT)
  ```
* Filtering by `INVENTORY_UPDATE_REASON_DEFAULT` ensures the event only fires when items are actually equipped, unequipped, or moved, completely ignoring charge drain and durability changes.

---

## 4. ItemLink Optimization
* **Problem**: Calling `GetItemLink(bagId, slotIndex)` constructs a new string in memory every time an inventory row is rendered or scrolled.
* **Solution**: ESO's `slotData` already caches `itemLink` in memory for most list entries.
* **Code Pattern**:
  ```lua
  local link = slotData.itemLink or (slotData.bagId and slotData.slotIndex and GetItemLink(slotData.bagId, slotData.slotIndex))
  ```

---

## 5. Server-Aware SavedVariables (EU / NA / PTS Isolation)
* **Problem**: Using `ZO_SavedVars:NewAccountWide("My_SV", 1, nil, defaults)` saves settings under a shared key, causing character/account data on EU to overwrite NA or PTS when switching servers.
* **Solution**: Pass `GetWorldName()` as the 3rd parameter (`namespace`):
  ```lua
  MyAddon.vars = ZO_SavedVars:NewAccountWide("MyAddon_SavedVariables", 1, GetWorldName(), MyAddon.defaults, nil, nil)
  ```
* This structures the saved variable file cleanly:
  ```lua
  MyAddon_SavedVariables = {
      ["@AccountName"] = {
          ["$AccountWide"] = {
              ["EU Megaserver"] = { ... },
              ["NA Megaserver"] = { ... },
              ["PTS"] = { ... },
          }
      }
  }
  ```

---

## 6. ESO Native Localization Architecture
* **Structure**:
  ```text
  localization/
  ├── en.lua
  └── tr.lua (or de.lua, fr.lua, etc.)
  ```
* **Pattern**:
  - In `localization/en.lua`, define default English strings using `ZO_CreateStringId` and `SafeAddString`:
    ```lua
    local strings = {
        SI_MYADDON_TITLE = "My Addon Title",
        SI_MYADDON_ENABLE = "Enable Addon",
    }
    for stringId, stringValue in pairs(strings) do
        ZO_CreateStringId(stringId, stringValue)
        SafeAddString(_G[stringId], stringValue, 1)
    end
    ```
  - In additional languages (e.g. `tr.lua`), override strings with higher priority:
    ```lua
    local strings = {
        SI_MYADDON_TITLE = "Eklenti Başlığı",
        SI_MYADDON_ENABLE = "Eklentiyi Etkinleştir",
    }
    for stringId, stringValue in pairs(strings) do
        SafeAddString(_G[stringId], stringValue, 2)
    end
    ```
  - In code and LAM panels, reference `GetString(SI_MYADDON_TITLE)`.
  - This allows community members to contribute new language files without touching core addon logic.

---

## 7. AI Disclosure & Credits
* ESOUI rules require disclosure in the addon description if AI assistance was utilized during development.
* Always maintain author credits and open-source licenses.

---

## 8. Naming & Author Standards (Monorepo Uniformity)
* **Author Field**: Always use the in-game account handle with the `@` prefix (`## Author: @arcsinan`) across all manifests (`.txt`), source code headers, and LibAddonMenu panels. Never omit the `@` symbol.
* **Addon Naming & Title Branding**:
  - Addon folder and manifest filename must use the repository prefix `ARC_` (e.g., `ARC_SetGlowGuard`, `ARC_CustomFonts`).
  - In manifest `## Title:`, use unified color branding: `|c00D4FFARC_AddonName|r - Subtitle`:
    ```text
    ## Title: |c00D4FFARC_SetGlowGuard|r - Set Glow & Equipment Tracker
    ## Title: |c00D4FFARC_CustomFonts|r - High-Quality Open-Source Fonts
    ```
  - In LibAddonMenu `displayName`, use the identical colored style: `|c00D4FFARC_CustomFonts|r`.
* **API Version Sync**:
  - Keep `## APIVersion:` aligned with the latest live and PTS updates (e.g., `101050 101051`).
* **ZeniMax Legal Terms**:
  - Include the standard Bethesda / ZeniMax legal disclaimer in manifest comments:
    ```text
    ; This Add-on is not created by, affiliated with or sponsored by ZeniMax Media Inc. or its affiliates.
    ; The Elder Scrolls® and related logos are registered trademarks or trademarks of ZeniMax Media Inc.
    ; in the United States and/or other countries. All rights reserved.
    ```
