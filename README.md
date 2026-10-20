# ESO_Addons

A collection of quality-of-life (QoL) user interface addons and companion automation utilities for *The Elder Scrolls Online* (ESO), developed and maintained by **@arcsinan** ([GitHub](https://github.com/sinanyuzgulec)).

---

## 📦 Projects

### 1. [ARC_SetGlowGuard](./ARC_SetGlowGuard)
* **Category**: In-Game UI Addon
* **Compatibility**: Elder Scrolls Online (Update 44 / Gold Road ready, API `101050 101051`)
* **Preview**:
  <p align="center">
    <img src="./ARC_SetGlowGuard/screenshots/equipped_preview.png" alt="ARC_SetGlowGuard In-Game Equipment Preview" width="280" />
  </p>
* **Key Features**:
  - Automatically identifies all equipped armor, weapons, and jewelry sets.
  - Highlights worn sets with coordinated vibrant glow colors (Cyan, Amber, Neon Purple, Emerald, Coral, Orange, and special Mythic glow).
  - Automatically docks the Character equipment panel next to your backpack when pressing `I`.
  - Highlights matching unequipped set pieces in your backpack with the same color and a vertical row accent bar, preventing accidental unequip or set breakage.
  - Shows clear incomplete set alerts on gear slots (e.g., `4/5` or `1/2`).
  - Full localization in **English** (default) and **Turkish** (`Türkçe`).
  - Comprehensive in-game configuration menu via `LibAddonMenu-2.0`.

### 2. [ARC_TTC_PriceTable_python_workaround](./ARC_TTC_PriceTable_python_workaround)
* **Category**: External Automation Companion Tool (CLI & Daemon)
* **Target Platforms**: Linux (Steam Deck, Proton, Lutris), macOS, and Windows
* **Key Features**:
  - Automatically downloads and extracts official Tamriel Trade Centre (TTC) price table data (`PriceTableEU.lua` / `PriceTableNA.lua`).
  - Completely eliminates the need for the official Windows `.NET Client.exe` on Linux and macOS.
  - Zero third-party Python dependencies (built entirely on the Python 3 standard library).
  - Background daemon support via `systemd --user` (Linux), `launchd` (macOS), or Windows Task Scheduler.

---

## 📥 Installation

### ARC_SetGlowGuard (In-Game Addon)
- **Via Minion**: Search for `ARC_SetGlowGuard` in Minion and click **Install**.
- **Manual Installation**: Download the latest release `.zip` from GitHub and extract the `ARC_SetGlowGuard` folder into your game's `live/AddOns/` folder:
  - **Windows**: `%USERPROFILE%\Documents\Elder Scrolls Online\live\AddOns\`
  - **Linux / Steam Deck (Proton)**: `~/.steam/steam/steamapps/compatdata/306130/pfx/drive_c/users/steamuser/Documents/Elder Scrolls Online/live/AddOns/`
  - **macOS**: `~/Documents/Elder Scrolls Online/live/AddOns/`

### ARC_TTC_PriceTable_Sync (Automation Tool)
```bash
cd ARC_TTC_PriceTable_python_workaround

# Check detection status
python3 main.py --status

# Trigger an immediate price table update
python3 main.py --sync

# (Optional) Install automatic 12-hour background updater service on Linux
./setup_service.sh
```

---

## 📄 License

All projects in this repository are open source and licensed under the [MIT License](https://opensource.org/licenses/MIT).
