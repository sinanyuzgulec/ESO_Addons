-- modules/ItemsAndSets.lua
-- Equipment Traits, Item Types, and Set Bonus Formatting Turkish Translations
-- Author: @arcsinan

ARC_TLS = ARC_TLS or {}
local TLS = ARC_TLS
TLS.ItemsAndSets = TLS.ItemsAndSets or {}

local ITEM_OVERRIDES = {
    -- Set Formatting
    SI_ITEM_FORMAT_STR_SET_NAME             = "Set: %s (%d/%d parça)",
    SI_ITEM_FORMAT_STR_SET_BONUS            = "(%d parça) %s",
    SI_ITEM_FORMAT_STR_SET_BONUS_INACTIVE   = "|c808080(%d parça) %s|r",

    -- Weapon Traits
    SI_ITEM_TRAIT_TYPE0                     = "Özelliksiz (None)",
    SI_ITEM_TRAIT_TYPE1                     = "Güçlendirilmiş (Powered)",
    SI_ITEM_TRAIT_TYPE2                     = "Yüklü (Charged)",
    SI_ITEM_TRAIT_TYPE3                     = "Hassas (Precise)",
    SI_ITEM_TRAIT_TYPE4                     = "Aşılanmış (Infused)",
    SI_ITEM_TRAIT_TYPE5                     = "Savunan (Defending)",
    SI_ITEM_TRAIT_TYPE6                     = "Eğitim (Training)",
    SI_ITEM_TRAIT_TYPE7                     = "Bilenmiş / Keskin (Sharpened)",
    SI_ITEM_TRAIT_TYPE8                     = "Kararlı (Decisive)",
    SI_ITEM_TRAIT_TYPE25                    = "Nirn İşlemeli (Nirnhoned)",

    -- Armor Traits
    SI_ITEM_TRAIT_TYPE11                    = "Sağlam (Sturdy)",
    SI_ITEM_TRAIT_TYPE12                    = "Delinmez (Impenetrable)",
    SI_ITEM_TRAIT_TYPE13                    = "Takviyeli (Reinforced)",
    SI_ITEM_TRAIT_TYPE14                    = "Tam Oturan (Well-fitted)",
    SI_ITEM_TRAIT_TYPE15                    = "Eğitim (Training)",
    SI_ITEM_TRAIT_TYPE16                    = "Aşılanmış (Infused)",
    SI_ITEM_TRAIT_TYPE17                    = "Zenginlik (Prosperous)",
    SI_ITEM_TRAIT_TYPE18                    = "Kutsal / İlahi (Divines)",
    SI_ITEM_TRAIT_TYPE26                    = "Nirn İşlemeli (Nirnhoned)",

    -- Jewelry Traits
    SI_ITEM_TRAIT_TYPE21                    = "Kana Susamış (Bloodthirsty)",
    SI_ITEM_TRAIT_TYPE22                    = "Ahenk (Harmony)",
    SI_ITEM_TRAIT_TYPE23                    = "Hızlı (Swift)",
    SI_ITEM_TRAIT_TYPE24                    = "Üçlü (Triune)",
    SI_ITEM_TRAIT_TYPE27                    = "Koruyucu (Protective)",
    SI_ITEM_TRAIT_TYPE28                    = "Gizemli (Arcane)",
    SI_ITEM_TRAIT_TYPE29                    = "Zinde (Robust)",
    SI_ITEM_TRAIT_TYPE30                    = "Sağlıklı (Healthy)",

    -- Common Item Categories
    SI_ITEMTYPE1                            = "Silah",
    SI_ITEMTYPE2                            = "Zırh",
    SI_ITEMTYPE4                            = "Yiyecek",
    SI_ITEMTYPE5                            = "İçecek",
    SI_ITEMTYPE7                            = "İksir (Potion)",
    SI_ITEMTYPE8                            = "Zehir (Poison)",
    SI_ITEMTYPE19                           = "Ruh Taşı (Soul Gem)",
    SI_ITEMTYPE29                           = "Yemek / Eşya Tarifi (Recipe)",
    SI_ITEMTYPE56                           = "Hazine Haritası",
    SI_ITEMTYPE60                           = "Usta Siparişi (Master Writ)",
}

function TLS.ItemsAndSets.Apply()
    if not (TLS.vars and TLS.vars.enableItems) then return end

    for stringIdConst, translation in pairs(ITEM_OVERRIDES) do
        local id = _G[stringIdConst] or stringIdConst
        if id and SafeAddString then
            SafeAddString(id, translation, 1)
        end
    end
end
