-- modules/UIStrings.lua
-- Core User Interface, Menus, Attributes & Keybindings Turkish Translations
-- Author: @arcsinan

ARC_TLS = ARC_TLS or {}
local TLS = ARC_TLS
TLS.UIStrings = TLS.UIStrings or {}

-- Map of ESO String Constant IDs to Turkish Translations
local UI_OVERRIDES = {
    -- Main Menu & Navigation
    SI_MAIN_MENU_CHARACTER                  = "Karakter",
    SI_MAIN_MENU_INVENTORY                  = "Envanter",
    SI_MAIN_MENU_SKILLS                     = "Beceriler",
    SI_MAIN_MENU_CHAMPION                   = "Şampiyon Puanları",
    SI_MAIN_MENU_JOURNAL                    = "Görev Günlüğü",
    SI_MAIN_MENU_MAP                        = "Harita",
    SI_MAIN_MENU_GROUP                      = "Grup & Aktivite Bulucu",
    SI_MAIN_MENU_GUILDS                     = "Loncalar",
    SI_MAIN_MENU_FRIENDS                    = "Arkadaşlar",
    SI_MAIN_MENU_NOTIFICATIONS              = "Bildirimler",
    SI_MAIN_MENU_MAIL                       = "Posta Kutusu",
    SI_MAIN_MENU_HELP                       = "Yardım",
    SI_MAIN_MENU_SETTINGS                   = "Ayarlar",
    SI_MAIN_MENU_CROWN_STORE                = "Crown Mağazası",
    SI_MAIN_MENU_CROWN_CRATES               = "Crown Sandıkları",

    -- Character Attributes & Core Stats
    SI_ATTRIBUTES_HEALTH                    = "Can",
    SI_ATTRIBUTES_MAGICKA                   = "Büyü Gücü",
    SI_ATTRIBUTES_STAMINA                   = "Dayanıklılık",
    SI_STATS_ATTRIBUTES                     = "Nitelikler",
    SI_EXPERIENCE_LEVEL_LABEL               = "Seviye",
    SI_EXPERIENCE_CHAMPION_RANK_LABEL       = "Şampiyon Seviyesi",
    SI_STATS_ARMOR_RATING                   = "Fiziksel Direnç (Zırh)",
    SI_STATS_SPELL_RESIST                   = "Büyü Direnci",
    SI_STATS_WEAPON_POWER                   = "Silah Hasarı",
    SI_STATS_SPELL_POWER                    = "Büyü Hasarı",
    SI_STATS_CRITICAL_CHANCE                = "Kritik Vuruş Şansı",
    SI_STATS_SPELL_CRITICAL                 = "Büyü Kritiği",
    SI_STATS_HEALTH_REGEN                   = "Can Yenilenmesi",
    SI_STATS_MAGICKA_REGEN                  = "Büyü Yenilenmesi",
    SI_STATS_STAMINA_REGEN                  = "Dayanıklılık Yenilenmesi",

    -- Inventory & Bags
    SI_INVENTORY_MODE_INVENTORY             = "Çanta",
    SI_INVENTORY_MODE_CRAFT_BAG             = "Zanaat Çantası",
    SI_INVENTORY_MODE_BANK                  = "Banka",
    SI_INVENTORY_BANK_SPACE                 = "Banka Alanı",
    SI_INVENTORY_BACKPACK_SPACE             = "Çanta Alanı",
    SI_ITEM_ACTION_USE                      = "Kullan",
    SI_ITEM_ACTION_EQUIP                    = "Kuşan",
    SI_ITEM_ACTION_UNEQUIP                  = "Çıkar",
    SI_ITEM_ACTION_LOCK                     = "Kilitle",
    SI_ITEM_ACTION_UNLOCK                   = "Kilidi Aç",
    SI_ITEM_ACTION_DESTROY                  = "Yok Et",
    SI_ITEM_ACTION_SPLIT_STACK              = "Yığını Böl",
    SI_ITEM_ACTION_MARK_AS_JUNK             = "Çöp Olarak İşaretle",
    SI_ITEM_ACTION_UNMARK_AS_JUNK           = "Çöp İşaretini Kaldır",

    -- Equipment Slots
    SI_EQUIP_SLOT_HEAD                      = "Başlık",
    SI_EQUIP_SLOT_CHEST                     = "Göğüslük",
    SI_EQUIP_SLOT_SHOULDERS                 = "Omuzluk",
    SI_EQUIP_SLOT_WAIST                     = "Kemer",
    SI_EQUIP_SLOT_LEGS                      = "Pantolon",
    SI_EQUIP_SLOT_FEET                      = "Çizme",
    SI_EQUIP_SLOT_HAND                      = "Eldiven",
    SI_EQUIP_SLOT_NECK                      = "Kolye",
    SI_EQUIP_SLOT_RING1                     = "Yüzük 1",
    SI_EQUIP_SLOT_RING2                     = "Yüzük 2",
    SI_EQUIP_SLOT_MAIN_HAND                 = "Birincil Silah",
    SI_EQUIP_SLOT_OFF_HAND                  = "İkincil Silah / Kalkan",
    SI_EQUIP_SLOT_BACKUP_MAIN               = "Yedek Birincil Silah",
    SI_EQUIP_SLOT_BACKUP_OFF                = "Yedek İkincil Silah",
    SI_EQUIP_SLOT_COSTUME                   = "Kostüm",

    -- Item Qualities
    SI_ITEMQUALITY1                         = "Hurda (Trash)",
    SI_ITEMQUALITY2                         = "Normal",
    SI_ITEMQUALITY3                         = "İyi (Fine)",
    SI_ITEMQUALITY4                         = "Üstün (Superior)",
    SI_ITEMQUALITY5                         = "Epik (Epic)",
    SI_ITEMQUALITY6                         = "Efsanevi (Legendary)",

    -- Common Interaction & Dialog Buttons
    SI_YES                                  = "Evet",
    SI_NO                                   = "Hayır",
    SI_OK                                   = "Tamam",
    SI_CANCEL                               = "İptal",
    SI_ACCEPT                               = "Kabul Et",
    SI_DECLINE                              = "Reddet",
    SI_CLOSE                                = "Kapat",
    SI_BACK                                 = "Geri",
    SI_SAVE                                 = "Kaydet",
    SI_RESET                                = "Sıfırla",
    SI_SEARCH                               = "Ara...",
    SI_FILTER                               = "Filtrele",
    SI_SEARCH_FILTER_ALL                    = "Tümü",
    SI_SUBMIT                               = "Gönder",
    SI_CONFIRM                              = "Onayla",

    -- Keybindings & Actions
    SI_BINDING_NAME_TOGGLE_INVENTORY        = "Envanteri Aç/Kapat",
    SI_BINDING_NAME_TOGGLE_CHARACTER        = "Karakter Panelini Aç/Kapat",
    SI_BINDING_NAME_TOGGLE_SKILLS           = "Beceriler Panelini Aç/Kapat",
    SI_BINDING_NAME_TOGGLE_MAP              = "Haritayı Aç/Kapat",
    SI_BINDING_NAME_TOGGLE_JOURNAL          = "Görev Günlüğünü Aç/Kapat",
    SI_BINDING_NAME_TOGGLE_GAME_MENU        = "Oyun Menüsü (ESC)",
    SI_BINDING_NAME_INTERACT                = "Etkileşime Geç",
    SI_BINDING_NAME_PRIMARY_ATTACK          = "Birincil Saldırı",
    SI_BINDING_NAME_SECONDARY_ATTACK        = "Blok / İkincil Saldırı",
    SI_BINDING_NAME_JUMP                    = "Zıpla",
    SI_BINDING_NAME_SPRINT                  = "Depar / Koş",
    SI_BINDING_NAME_ROLL_DODGE              = "Kaçınma / Takla",
    SI_BINDING_NAME_SHEATHE_WEAPON          = "Silahı Kınına Koy",
}

function TLS.UIStrings.Apply()
    if not (TLS.vars and TLS.vars.enableUI) then return end

    for stringIdConst, translation in pairs(UI_OVERRIDES) do
        local id = _G[stringIdConst] or stringIdConst
        if id and SafeAddString then
            SafeAddString(id, translation, 1)
        end
    end
end
