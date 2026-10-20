# ARC_TurkishLanguageSupport

A modern, high-performance, and modular Turkish language & Unicode font support addon for *The Elder Scrolls Online* (ESO), developed and maintained by **@arcsinan**.

---

## 🌟 Overview

Most older Turkish translation mods for ESO are abandoned, outdated, or cause UI script errors in recent chapters (Necrom, Gold Road / Update 44). Furthermore, ESO's default Latin-1 font atlas renders Turkish diacritics (`ç, ğ, ı, İ, ö, ş, ü`) as blank boxes or question marks.

**ARC_TurkishLanguageSupport** solves this by providing:
1. **Native Unicode Font Replacement**: Replaces core game fonts with high-legibility Unicode fonts supporting all Turkish characters crisply.
2. **Modular Architecture**: Separate modules for UI, Skills, Items, Quests, and Dialogues, allowing players to enable or disable individual sections via the in-game settings panel.
3. **Clean ESO API Integration**: Uses standard `SafeAddString` and non-intrusive hooks to guarantee zero performance impact and compatibility with Update 44.

---

## ✨ Features

- **Font & Character Support**:
  Bundles optimized Unicode TrueType fonts (`DejaVuSans`) ensuring every Turkish letter renders natively across all game resolutions. Compatible with `LibMediaProvider-1.0`.

- **User Interface & Menus (UIStrings)**:
  Translates the main menu, navigation bars, attributes (Health, Magicka, Stamina), character statistics, equipment slots, bag management, keybindings, and system dialogue buttons.

- **Skills & Abilities (Skills)**:
  Translates skill line categories, weapon/armor/guild skill lines, morph mechanics, cost descriptors, and range tooltips.

- **Items & Traits (ItemsAndSets)**:
  Translates weapon traits (Sharpened, Infused, Nirnhoned, etc.), armor traits (Sturdy, Divines, etc.), jewelry traits (Bloodthirsty, Arcane, etc.), item categories, and set bonus formatting.

- **Quest Journal & Tracker (Quests)**:
  Translates quest categories (Main Story, Guild, Dungeon, Trial, Crafting Writs) and dynamically translates recognized quest titles in your journal.

- **NPC Dialogues & Subtitles (Dialogues)**:
  Translates world interaction reticle prompts (*Talk, Open, Loot, Harvest, Steal, etc.*) and NPC dialogue speech bubbles.

- **LibAddonMenu-2.0 Configuration Panel**:
  Easily customize which modules are active. Includes a 1-click `/reloadui` button.

- **Slash Commands**:
  - `/tls` or `/turkce`: Displays active module status and translation diagnostics in chat.
  - `/tls menu` or `/tls settings`: Opens the LibAddonMenu settings panel.
  - `/tls reload`: Instantly reloads the user interface.

---

## 📥 Installation

### Method 1: Via Minion (Recommended)
1. Open **Minion**.
2. Select **The Elder Scrolls Online**.
3. Search for `ARC_TurkishLanguageSupport`.
4. Click **Install**.

### Method 2: Manual Installation
1. Download the latest `ARC_TurkishLanguageSupport.zip` release.
2. Extract the archive into your game's `AddOns` folder:
   - **Windows**: `%USERPROFILE%\Documents\Elder Scrolls Online\live\AddOns\`
   - **Linux / Steam Deck (Proton)**: `~/.steam/steam/steamapps/compatdata/306130/pfx/drive_c/users/steamuser/Documents/Elder Scrolls Online/live/AddOns/`
   - **macOS**: `~/Documents/Elder Scrolls Online/live/AddOns/`
3. Ensure the folder is named `ARC_TurkishLanguageSupport` inside `AddOns`.
4. In-game, enable the addon under `ESC -> Add-Ons` (or type `/reloadui` in chat).

---

## ⚙️ Optional Dependencies

- **[LibAddonMenu-2.0](https://www.esoui.com/downloads/info7-LibAddonMenu.html)** (For the in-game settings panel).
- **[LibMediaProvider-1.0](https://www.esoui.com/downloads/info334-LibMediaProvider-1.0.html)** (For font registration).

---

## 📄 License

Author: **@arcsinan** ([GitHub](https://github.com/sinanyuzgulec))  
Released under the [MIT License](https://opensource.org/licenses/MIT).
