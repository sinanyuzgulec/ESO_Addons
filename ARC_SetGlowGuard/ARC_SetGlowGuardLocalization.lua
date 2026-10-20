-- ARC_SetGlowGuardLocalization.lua
-- Localization for ARC_SetGlowGuard (Default: English, Additional: Türkçe)
-- Author: @arcsinan

ARC_SetGlowGuard = ARC_SetGlowGuard or {}
local ASGG = ARC_SetGlowGuard

ASGG.L = {}

--------------------------------------------------------------------------------
-- English (Default)
--------------------------------------------------------------------------------
ASGG.L["en"] = {
    PANEL_TITLE                 = "|c00D4FFARC_SetGlowGuard|r - Set Glow & Equipment Tracker",
    HDR_GENERAL                 = "|c00D4FFGeneral Settings|r",

    OPT_LANGUAGE                = "Language / Dil",
    OPT_LANGUAGE_TT             = "Select addon display and notification language. Default is English.",
    LANG_EN                     = "English",
    LANG_TR                     = "Türkçe",

    OPT_ENABLE                  = "Enable ARC_SetGlowGuard",
    OPT_ENABLE_TT               = "Toggles glowing set highlights on equipment and inventory.",
    OPT_AUTO_CHAR               = "Show Character Sheet with Inventory ('I')",
    OPT_AUTO_CHAR_TT            = "When pressing 'I' to open your bag, automatically attaches the Character equipment panel to the left side of your screen. All worn sets and matching backpack items glow in matching colors simultaneously!",
    OPT_HIGHLIGHT_EQUIP         = "Highlight Equipment Slots",
    OPT_HIGHLIGHT_EQUIP_TT      = "Equipped items belonging to the same set will glow with identical colors on your Character sheet.",
    OPT_HIGHLIGHT_BAG           = "Highlight Backpack Items",
    OPT_HIGHLIGHT_BAG_TT        = "Items in your bag that match your currently equipped sets glow with the exact same set color, making accidentally unequipped items instantly noticeable.",
    OPT_ROW_BAR                 = "Show Left Accent Bar in Inventory Rows",
    OPT_ROW_BAR_TT              = "Draws a sleek colored vertical accent stripe on the left border of inventory rows matching equipped sets.",
    OPT_INCOMPLETE_ALERT        = "Show Incomplete Set Alert (e.g. 4/5)",
    OPT_INCOMPLETE_ALERT_TT     = "Displays a clear piece count indicator on slots when an equipped set is missing pieces (e.g. 4/5 or 1/2) so you never miss an unequipped item.",
    OPT_GLOW_INTENSITY          = "Glow Intensity",
    OPT_GLOW_INTENSITY_TT       = "Adjust how bright and vivid the glow highlights appear.",
    OPT_GLOW_STYLE              = "Glow Style",
    OPT_GLOW_STYLE_TT           = "Select the visual texture style used for glowing borders.",

    HDR_CUSTOM_COLORS           = "|c00D4FFCustom Set Colors|r",
    DESC_CUSTOM_COLORS          = "Customize the distinct glow color assigned to each equipped set, mythic items, and incomplete alerts:",
    COLOR_SET_1                 = "Set 1 Color (Primary)",
    COLOR_SET_2                 = "Set 2 Color (Secondary)",
    COLOR_SET_3                 = "Set 3 Color (Tertiary)",
    COLOR_SET_4                 = "Set 4 Color (Quaternary)",
    COLOR_SET_5                 = "Set 5 Color (Quinary)",
    COLOR_SET_6                 = "Set 6 Color (Senary)",
    COLOR_MYTHIC                = "Mythic Item Glow Color",
    COLOR_WARNING               = "Incomplete Set Alert Color",
    BTN_RESET_COLORS            = "Reset Colors to Default",
    BTN_RESET_COLORS_TT         = "Restores all set and indicator colors back to their default palette.",

    HDR_DONATE                  = "|cFFD700Support Developer (@arcsinan)|r",
    DESC_DONATE                 = "Enjoying |c00D4FFARC_SetGlowGuard|r? No more accidentally lost set pieces or broken 5-piece bonuses!\nIf you would like to support ongoing development, you can send an in-game gold donation directly to |c00E676@arcsinan|r (|cFFD700PC/EU Megaserver only|r).",
    BTN_DONATE_5K               = "|cFFD700Send 5,000 Gold to @arcsinan|r",
    BTN_DONATE_5K_TT            = "Opens in-game mail addressed to @arcsinan with 5,000 gold pre-attached.",
    BTN_DONATE_25K              = "|cFFD700Send 25,000 Gold to @arcsinan|r",
    BTN_DONATE_25K_TT           = "Opens in-game mail addressed to @arcsinan with 25,000 gold pre-attached.",
    BTN_DONATE_100K             = "|cFFD700Send 100,000 Gold to @arcsinan|r",
    BTN_DONATE_100K_TT          = "Opens in-game mail addressed to @arcsinan with 100,000 gold pre-attached.",
    BTN_DONATE_CUSTOM           = "Open Mail to @arcsinan (Custom Amount)",
    BTN_DONATE_CUSTOM_TT        = "Opens in-game mail addressed to @arcsinan so you can enter any gold amount you wish.",

    CHAT_REFRESHED              = "|c00D4FF[ARC_SetGlowGuard]|r Refreshed! Detected active sets: %d",
    CHAT_SET_COMPLETE           = "|c00E676(Complete: %d/%d)|r",
    CHAT_SET_INCOMPLETE         = "|cFF1744(Incomplete: %d/%d)|r",
    CHAT_SERVER_WARNING         = "|cFF1744[ARC_SetGlowGuard]|r Notice: @arcsinan is exclusively on |c00E676PC/EU Megaserver|r! (Current server: %s). Mails sent from other servers cannot be received.",
    MAIL_BODY_DEFAULT           = "Thank you @arcsinan for creating ARC_SetGlowGuard! Here is some gold to support your ESO addon development.",
}

--------------------------------------------------------------------------------
-- Turkish (Türkçe)
--------------------------------------------------------------------------------
ASGG.L["tr"] = {
    PANEL_TITLE                 = "|c00D4FFARC_SetGlowGuard|r - Set Parlama & Ekipman Takipçisi",
    HDR_GENERAL                 = "|c00D4FFGenel Ayarlar|r",

    OPT_LANGUAGE                = "Dil / Language",
    OPT_LANGUAGE_TT             = "Eklenti arayüzü ve bildirim dilini seçin (Varsayılan: İngilizce).",
    LANG_EN                     = "English",
    LANG_TR                     = "Türkçe",

    OPT_ENABLE                  = "ARC_SetGlowGuard'ı Etkinleştir",
    OPT_ENABLE_TT               = "Ekipman ve çanta üzerindeki parlayan set vurgularını açar/kapatır.",
    OPT_AUTO_CHAR               = "Envanter ('I') ile Karakter Ekipman Panelini Göster",
    OPT_AUTO_CHAR_TT            = "'I' tuşuna bastığınızda Karakter Ekipman panelini ekranın soluna ekler. Böylece giyili set parçaları ile çantanızdaki eşleşen eşyalar aynı anda parlar!",
    OPT_HIGHLIGHT_EQUIP         = "Ekipman Slotlarını Parlat",
    OPT_HIGHLIGHT_EQUIP_TT      = "Karakter panelinde aynı sete ait giyili eşyalar ortak renklerle parlar.",
    OPT_HIGHLIGHT_BAG           = "Çantadaki Eşleşen Parçaları Parlat",
    OPT_HIGHLIGHT_BAG_TT        = "Çantanızda bulunan ve giydiğiniz setlerle eşleşen eşyalar aynı renkte parlar, yanlışlıkla çıkarılan parçalar anında fark edilir.",
    OPT_ROW_BAR                 = "Envanter Satırlarında Sol Kenar Çizgisi Göster",
    OPT_ROW_BAR_TT              = "Giyili setlerle eşleşen envanter satırlarının sol kenarında renkli şerit çizer.",
    OPT_INCOMPLETE_ALERT        = "Eksik Set Uyarısı Göster (örn. 4/5)",
    OPT_INCOMPLETE_ALERT_TT     = "Giyili bir setin parçaları eksik olduğunda slot üzerinde parça sayısı göstergesi (örn. 4/5 veya 1/2) görüntüler.",
    OPT_GLOW_INTENSITY          = "Parlama Şiddeti",
    OPT_GLOW_INTENSITY_TT       = "Parlama vurgularının parlaklığını ve canlılığını ayarlar.",
    OPT_GLOW_STYLE              = "Parlama Stili",
    OPT_GLOW_STYLE_TT           = "Parlama kenarlıkları için kullanılacak görsel dokuyu seçin.",

    HDR_CUSTOM_COLORS           = "|c00D4FFÖzel Set Renkleri|r",
    DESC_CUSTOM_COLORS          = "Giyilen her set, mythic eşyalar ve eksik set uyarıları için atanan parlama renklerini özelleştirin:",
    COLOR_SET_1                 = "Set 1 Rengi (Birincil)",
    COLOR_SET_2                 = "Set 2 Rengi (İkincil)",
    COLOR_SET_3                 = "Set 3 Rengi (Üçüncül)",
    COLOR_SET_4                 = "Set 4 Rengi (Dördüncül)",
    COLOR_SET_5                 = "Set 5 Rengi (Beşincil)",
    COLOR_SET_6                 = "Set 6 Rengi (Altıncıl)",
    COLOR_MYTHIC                = "Mythic Eşya Parlama Rengi",
    COLOR_WARNING               = "Eksik Set Uyarı Rengi",
    BTN_RESET_COLORS            = "Renkleri Varsayılana Sıfırla",
    BTN_RESET_COLORS_TT         = "Tüm set ve gösterge renklerini varsayılan renk paletine geri döndürür.",

    HDR_DONATE                  = "|cFFD700Geliştiriciyi Destekle (@arcsinan)|r",
    DESC_DONATE                 = "ARC_SetGlowGuard'dan memnun musunuz? Yanlışlıkla set parçası kaybetmeye veya bozulan bonuslara son!\nGeliştirmeyi desteklemek isterseniz doğrudan |c00E676@arcsinan|r hesabına oyun içi altın bağışı gönderebilirsiniz (|cFFD700Yalnızca PC/EU Megaserver|r).",
    BTN_DONATE_5K               = "|cFFD700@arcsinan'a 5.000 Altın Gönder|r",
    BTN_DONATE_5K_TT            = "Alıcısı @arcsinan olarak ayarlanmış ve 5.000 altın eklenmiş oyun içi posta penceresini açar.",
    BTN_DONATE_25K              = "|cFFD700@arcsinan'a 25.000 Altın Gönder|r",
    BTN_DONATE_25K_TT           = "Alıcısı @arcsinan olarak ayarlanmış ve 25.000 altın eklenmiş oyun içi posta penceresini açar.",
    BTN_DONATE_100K             = "|cFFD700@arcsinan'a 100.000 Altın Gönder|r",
    BTN_DONATE_100K_TT          = "Alıcısı @arcsinan olarak ayarlanmış ve 100.000 altın eklenmiş oyun içi posta penceresini açar.",
    BTN_DONATE_CUSTOM           = "@arcsinan'a Posta Aç (Özel Tutar)",
    BTN_DONATE_CUSTOM_TT        = "İstediğiniz miktarda altın gönderebilmeniz için alıcısı @arcsinan olan posta penceresini açar.",

    CHAT_REFRESHED              = "|c00D4FF[ARC_SetGlowGuard]|r Yenilendi! Algılanan aktif set sayısı: %d",
    CHAT_SET_COMPLETE           = "|c00E676(Tam: %d/%d)|r",
    CHAT_SET_INCOMPLETE         = "|cFF1744(Eksik: %d/%d)|r",
    CHAT_SERVER_WARNING         = "|cFF1744[ARC_SetGlowGuard]|r Dikkat: @arcsinan yalnızca |c00E676PC/EU Megaserver|r üzerindedir! (Bulunduğunuz sunucu: %s). Gönderilecek postalar başka bir oyuncuya gidebilir veya teslim edilmeyebilir.",
    MAIL_BODY_DEFAULT           = "ARC_SetGlowGuard için teşekkürler @arcsinan! Eklenti geliştirmelerini desteklemek için biraz altın gönderiyorum.",
}

--------------------------------------------------------------------------------
-- String Resolver Function
--------------------------------------------------------------------------------
function ASGG.GetString(key)
    local lang = (ASGG.vars and ASGG.vars.language) or "en"
    local dict = ASGG.L[lang] or ASGG.L["en"]
    if dict and dict[key] then
        return dict[key]
    end
    if ASGG.L["en"] and ASGG.L["en"][key] then
        return ASGG.L["en"][key]
    end
    return key or ""
end
