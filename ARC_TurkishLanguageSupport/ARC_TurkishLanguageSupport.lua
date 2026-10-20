-- ARC_TurkishLanguageSupport.lua
-- Core Initialization and Lifecycle Management for ARC_TurkishLanguageSupport
-- Author: @arcsinan
-- Version: 1.0.0

ARC_TLS = ARC_TLS or {}
local TLS = ARC_TLS

TLS.name = "ARC_TurkishLanguageSupport"
TLS.version = "1.0.0"
TLS.author = "@arcsinan"

-- Default settings
TLS.defaults = {
    enabled = true,
    enableFontReplacement = true,
    enableUI = true,
    enableSkills = true,
    enableItems = true,
    enableQuests = true,
    enableDialogues = true,
}

--------------------------------------------------------------------------------
-- Gold Donation to @arcsinan (PC/EU Megaserver)
--------------------------------------------------------------------------------

function TLS.DonateGold(amount)
    local world = (GetWorldName and GetWorldName()) or ""
    if world ~= "" and not string.find(string.lower(world), "eu") then
        d("|cFF1744[ARC_TLS]|r Dikkat: @arcsinan yalnızca |c00E676PC/EU Megaserver|r üzerindedir! (Bulunduğunuz sunucu: " .. tostring(world) .. "). Gönderilecek postalar başka bir oyuncuya gidebilir veya teslim edilmeyebilir.")
    end

    local goldAmount = tonumber(amount) or 5000

    SCENE_MANAGER:Show("mailSend")
    zo_callLater(function()
        if ZO_MailSendToField then
            ZO_MailSendToField:SetText("@arcsinan")
        end
        if ZO_MailSendSubjectField then
            ZO_MailSendSubjectField:SetText("ARC_TurkishLanguageSupport Donation")
        end
        if ZO_MailSendBodyField then
            ZO_MailSendBodyField:SetText("ARC_TurkishLanguageSupport eklentisi ve Türkçe çeviriler için teşekkürler @arcsinan! Projeyi desteklemek için biraz altın gönderiyorum.")
            ZO_MailSendBodyField:TakeFocus()
        end
        if goldAmount > 0 and QueueMoneyAttachment then
            QueueMoneyAttachment(goldAmount)
            if ZO_MailSendSendCurrency and ZO_MailSendSendCurrency.OnBeginInput then
                ZO_MailSendSendCurrency:OnBeginInput()
            end
        end
    end, 250)
end

--------------------------------------------------------------------------------
-- Module Applier
--------------------------------------------------------------------------------

function TLS.ApplyAllModules()
    if not (TLS.vars and TLS.vars.enabled) then return end

    -- 1. Font Manager
    if TLS.FontManager and TLS.FontManager.Apply then
        TLS.FontManager.Apply()
    end

    -- 2. UI Strings & Menus
    if TLS.UIStrings and TLS.UIStrings.Apply then
        TLS.UIStrings.Apply()
    end

    -- 3. Skills & Abilities
    if TLS.Skills and TLS.Skills.Apply then
        TLS.Skills.Apply()
    end

    -- 4. Items & Set Bonus Formatting
    if TLS.ItemsAndSets and TLS.ItemsAndSets.Apply then
        TLS.ItemsAndSets.Apply()
    end

    -- 5. Quests & Tracker Hooks
    if TLS.Quests and TLS.Quests.Apply then
        TLS.Quests.Apply()
    end

    -- 6. Dialogues & Interactions
    if TLS.Dialogues and TLS.Dialogues.Apply then
        TLS.Dialogues.Apply()
    end
end

--------------------------------------------------------------------------------
-- Slash Commands (/tls or /turkce)
--------------------------------------------------------------------------------

SLASH_COMMANDS["/tls"] = function(args)
    local cmd = string.lower(string.gsub(args or "", "^%s*(.-)%s*$", "%1"))
    if cmd == "settings" or cmd == "menu" or cmd == "ayar" then
        if LibAddonMenu2 and LibAddonMenu2.OpenToPanel and TLS.settingsPanel then
            LibAddonMenu2:OpenToPanel(TLS.settingsPanel)
        end
    elseif cmd == "reload" then
        ReloadUI()
    else
        d("|c00D4FF[ARC_TurkishLanguageSupport]|r Aktif (v" .. tostring(TLS.version) .. ")")
        d("  - Font & Karakter Desteği : " .. (TLS.vars.enableFontReplacement and "|c00E676Açık|r" or "|cFF1744Kapalı|r"))
        d("  - Arayüz & Menü Çevirisi  : " .. (TLS.vars.enableUI and "|c00E676Açık|r" or "|cFF1744Kapalı|r"))
        d("  - Beceriler & Sınıflar   : " .. (TLS.vars.enableSkills and "|c00E676Açık|r" or "|cFF1744Kapalı|r"))
        d("  - Eşya & Nitelikler      : " .. (TLS.vars.enableItems and "|c00E676Açık|r" or "|cFF1744Kapalı|r"))
        d("  - Görevler & Günlük      : " .. (TLS.vars.enableQuests and "|c00E676Açık|r" or "|cFF1744Kapalı|r"))
        d("  - Diyaloglar             : " .. (TLS.vars.enableDialogues and "|c00E676Açık|r" or "|cFF1744Kapalı|r"))
        d("  Ayarlar menüsü için: |cFFD700/tls menu|r")
    end
end
SLASH_COMMANDS["/turkce"] = SLASH_COMMANDS["/tls"]

--------------------------------------------------------------------------------
-- Event Handlers
--------------------------------------------------------------------------------

local function OnPlayerActivated(eventCode)
    EVENT_MANAGER:UnregisterForEvent(TLS.name .. "_Activated", EVENT_PLAYER_ACTIVATED)
    -- Re-apply fonts once the scene and chat windows are completely loaded
    if TLS.FontManager and TLS.FontManager.Apply then
        zo_callLater(function() TLS.FontManager.Apply() end, 100)
    end
end

local function OnAddOnLoaded(eventCode, addOnName)
    if addOnName ~= TLS.name then return end

    EVENT_MANAGER:UnregisterForEvent(TLS.name, EVENT_ADD_ON_LOADED)

    TLS.vars = ZO_SavedVars:NewAccountWide("ARC_TurkishLanguageSupport_SavedVariables", 1, nil, TLS.defaults)

    -- Initialize LAM settings panel
    if TLS.InitSettings then
        TLS.InitSettings()
    end

    -- Apply all active translation modules
    TLS.ApplyAllModules()

    EVENT_MANAGER:RegisterForEvent(TLS.name .. "_Activated", EVENT_PLAYER_ACTIVATED, OnPlayerActivated)

    if IsPlayerActivated and IsPlayerActivated() then
        zo_callLater(function() TLS.ApplyAllModules() end, 200)
    end
end

-- EVENT_ADD_ON_LOADED (crucial: double underscore)
EVENT_MANAGER:RegisterForEvent(TLS.name, EVENT_ADD_ON_LOADED, OnAddOnLoaded)
