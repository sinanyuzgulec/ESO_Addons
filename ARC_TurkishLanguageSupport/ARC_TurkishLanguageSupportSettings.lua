-- ARC_TurkishLanguageSupportSettings.lua
-- LibAddonMenu-2.0 Settings Panel for ARC_TurkishLanguageSupport
-- Author: @arcsinan

ARC_TLS = ARC_TLS or {}
local TLS = ARC_TLS

function TLS.InitSettings()
    local LAM = LibAddonMenu2
    if not LAM then return end

    local panelData = {
        type = "panel",
        name = "ARC_TurkishLanguageSupport",
        displayName = "|c00D4FFARC_TurkishLanguageSupport|r - Türkçe Dil Desteği",
        author = "|c00E676@arcsinan|r",
        version = TLS.version or "1.0.0",
        donation = function() TLS.DonateGold(5000) end,
        registerForRefresh = true,
        registerForDefaults = true,
    }

    local optionsData = {
        {
            type = "header",
            name = "|c00D4FFGenel Ayarlar & Modüller|r",
        },
        {
            type = "description",
            text = "Elder Scrolls Online için modern, güncel ve performans dostu Türkçe dil ve font desteği. İstediğiniz modülleri bağımsız olarak açıp kapatabilirsiniz.",
            width = "full",
        },
        {
            type = "checkbox",
            name = "Türkçe Font & UTF-8 Karakter Desteği",
            tooltip = "Türkçe özel karakterlerin (ç, ğ, ı, İ, ö, ş, ü) oyunda bozulmadan veya kare/soru işareti olmadan kusursuz görünmesini sağlar.",
            getFunc = function() return TLS.vars.enableFontReplacement end,
            setFunc = function(value)
                TLS.vars.enableFontReplacement = value
            end,
            width = "full",
            default = TLS.defaults.enableFontReplacement,
        },
        {
            type = "checkbox",
            name = "Arayüz & Menü Çevirileri (UI)",
            tooltip = "Envanter, Karakter, Nitelikler (Can, Büyü, Dayanıklılık), Ayarlar ve Ana Menü butonlarını Türkçeleştirir.",
            getFunc = function() return TLS.vars.enableUI end,
            setFunc = function(value)
                TLS.vars.enableUI = value
                if value and TLS.UIStrings then TLS.UIStrings.Apply() end
            end,
            width = "full",
            default = TLS.defaults.enableUI,
        },
        {
            type = "checkbox",
            name = "Beceriler & Sınıflar (Skills)",
            tooltip = "Beceri kategorileri, silah/zırh/lonca beceri hatları ve mekanik açıklamalarını Türkçeleştirir.",
            getFunc = function() return TLS.vars.enableSkills end,
            setFunc = function(value)
                TLS.vars.enableSkills = value
                if value and TLS.Skills then TLS.Skills.Apply() end
            end,
            width = "full",
            default = TLS.defaults.enableSkills,
        },
        {
            type = "checkbox",
            name = "Eşya Nitelikleri & Setler (Items & Traits)",
            tooltip = "Silah, zırh ve takı özellikleri (Bilenmiş, Sağlam, Kutsal vb.) ve set bonusu başlıklarını Türkçeleştirir.",
            getFunc = function() return TLS.vars.enableItems end,
            setFunc = function(value)
                TLS.vars.enableItems = value
                if value and TLS.ItemsAndSets then TLS.ItemsAndSets.Apply() end
            end,
            width = "full",
            default = TLS.defaults.enableItems,
        },
        {
            type = "checkbox",
            name = "Görevler & Günlük (Quests & Journal)",
            tooltip = "Görev günlüğü kategorileri, butonları ve veri tabanındaki görev başlıklarını Türkçeleştirir.",
            getFunc = function() return TLS.vars.enableQuests end,
            setFunc = function(value)
                TLS.vars.enableQuests = value
                if value and TLS.Quests then TLS.Quests.Apply() end
            end,
            width = "full",
            default = TLS.defaults.enableQuests,
        },
        {
            type = "checkbox",
            name = "Diyaloglar & Etkileşimler (Dialogues & Chatter)",
            tooltip = "Dünyadaki etkileşim yazıları (Konuş, Aç, Yağmala vb.) ve NPC sohbet metinlerini Türkçeleştirir.",
            getFunc = function() return TLS.vars.enableDialogues end,
            setFunc = function(value)
                TLS.vars.enableDialogues = value
                if value and TLS.Dialogues then TLS.Dialogues.Apply() end
            end,
            width = "full",
            default = TLS.defaults.enableDialogues,
        },
        {
            type = "button",
            name = "|c00D4FFArayüzü Yenile (/reloadui)|r",
            tooltip = "Tüm dil ve font ayarlarının tam olarak yenilenmesi için oyun arayüzünü baştan yükler.",
            func = function() ReloadUI() end,
            width = "full",
        },

        ------------------------------------------------------------------------
        -- Developer Support (@arcsinan)
        ------------------------------------------------------------------------
        {
            type = "header",
            name = "|cFFD700Geliştiriciyi Destekle (@arcsinan)|r",
        },
        {
            type = "description",
            text = "ARC_TurkishLanguageSupport projesini ve Türkçe çevirilerin genişletilmesini desteklemek isterseniz doğrudan |c00E676@arcsinan|r hesabına oyun içi altın bağışı gönderebilirsiniz (|cFFD700Yalnızca PC/EU Megaserver|r).",
            width = "full",
        },
        {
            type = "button",
            name = "|cFFD7005.000 Altın Gönder|r",
            tooltip = "@arcsinan hesabına 5.000 altın bağış postası açar.",
            func = function() TLS.DonateGold(5000) end,
            width = "half",
        },
        {
            type = "button",
            name = "|cFFD70025.000 Altın Gönder|r",
            tooltip = "@arcsinan hesabına 25.000 altın bağış postası açar.",
            func = function() TLS.DonateGold(25000) end,
            width = "half",
        },
        {
            type = "button",
            name = "|cFFD700100.000 Altın Gönder|r",
            tooltip = "@arcsinan hesabına 100.000 altın bağış postası açar.",
            func = function() TLS.DonateGold(100000) end,
            width = "half",
        },
        {
            type = "button",
            name = "Özel Tutar Gönder",
            tooltip = "İstediğiniz miktarda altın gönderebilmeniz için posta penceresini açar.",
            func = function() TLS.DonateGold(0) end,
            width = "half",
        },
    }

    TLS.settingsPanel = LAM:RegisterAddonPanel("ARC_TLS_OptionsPanel", panelData)
    LAM:RegisterOptionControls("ARC_TLS_OptionsPanel", optionsData)
end
