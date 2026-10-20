-- modules/Skills.lua
-- Skills, Abilities, Skill Lines & Combat Mechanics Turkish Translations
-- Author: @arcsinan

ARC_TLS = ARC_TLS or {}
local TLS = ARC_TLS
TLS.Skills = TLS.Skills or {}

local SKILL_OVERRIDES = {
    -- Skill Categories
    SI_SKILLTYPE0                       = "Yok",
    SI_SKILLTYPE1                       = "Sınıf Becerileri",
    SI_SKILLTYPE2                       = "Silah Becerileri",
    SI_SKILLTYPE3                       = "Zırh Becerileri",
    SI_SKILLTYPE4                       = "Dünya Becerileri",
    SI_SKILLTYPE5                       = "Lonca Becerileri",
    SI_SKILLTYPE6                       = "İttifak Savaşı Becerileri",
    SI_SKILLTYPE7                       = "Irk Becerileri",
    SI_SKILLTYPE8                       = "Zanaat Becerileri",

    -- Core Skill Tooltip & Mechanis
    SI_SKILLS_POINTS_TO_SPEND           = "Kullanılabilir Beceri Puanı: %d",
    SI_SKILLS_ADVISE_ME                 = "Beceri Rehberi",
    SI_SKILLS_RESPEC_CONFIRM            = "Tüm beceri puanlarınızı sıfırlamak istiyor musunuz?",
    SI_ABILITY_ACTION_SLOT_FREE         = "Boş Beceri Yuvası",
    SI_ABILITY_TARGET_GROUND            = "Alan / Zemin",
    SI_ABILITY_TARGET_SELF              = "Kendisi",
    SI_ABILITY_TARGET_ENEMY             = "Düşman",
    SI_ABILITY_TARGET_ALLY              = "Dost / Müttefik",
    SI_ABILITY_TOOLTIP_RANGE            = "Menzil: %s",
    SI_ABILITY_TOOLTIP_RADIUS           = "Etki Alanı: %s",
    SI_ABILITY_TOOLTIP_DURATION         = "Süre: %s",
    SI_ABILITY_TOOLTIP_CAST_TIME        = "Kullanım Süresi: %s",
    SI_ABILITY_TOOLTIP_TARGET           = "Hedef: %s",
    SI_ABILITY_TOOLTIP_RESOURCE_COST    = "Maliyet: %s",
    SI_ABILITY_INSTANT_CAST             = "Anında",
    SI_ABILITY_CHANNEL_TIME             = "Kanal Süresi: %s",
}

-- Dictionary of Skill Line Names (EN -> TR)
TLS.Skills.skillLineNames = {
    -- Weapons
    ["Two Handed"]              = "Çift Elli Silahlar",
    ["One Hand and Shield"]     = "Tek El ve Kalkan",
    ["Dual Wield"]              = "Çift Silah",
    ["Bow"]                     = "Yay",
    ["Destruction Staff"]       = "Yıkım Asası",
    ["Restoration Staff"]       = "İyileştirme Asası",

    -- Armors
    ["Light Armor"]             = "Hafif Zırh",
    ["Medium Armor"]            = "Orta Zırh",
    ["Heavy Armor"]             = "Ağır Zırh",

    -- Guilds
    ["Fighters Guild"]          = "Savaşçılar Loncası",
    ["Mages Guild"]             = "Büyücüler Loncası",
    ["Undaunted"]               = "Gözüpekler Loncası",
    ["Psijic Order"]            = "Psijic Tarikatı",
    ["Thieves Guild"]           = "Hırsızlar Loncası",
    ["Dark Brotherhood"]        = "Karanlık Kardeşlik",

    -- World
    ["Soul Magic"]              = "Ruh Büyüsü",
    ["Vampire"]                 = "Vampir",
    ["Werewolf"]                = "Kurtadam",
    ["Legerdemain"]             = "El Çabukluğu / Hırsızlık",
    ["Scrying"]                 = "Kehanet / Kazı (Antika)",
    ["Excavation"]              = "Kazıbilim (Antika)",

    -- Crafting
    ["Blacksmithing"]           = "Demircilik",
    ["Clothing"]                = "Terzilik",
    ["Woodworking"]             = "Marangozluk",
    ["Alchemy"]                 = "Simyacılık",
    ["Enchanting"]              = "Efsunculuk",
    ["Provisioning"]            = "Aşçılık",
    ["Jewelry Crafting"]        = "Kuyumculuk",
}

function TLS.Skills.Apply()
    if not (TLS.vars and TLS.vars.enableSkills) then return end

    for stringIdConst, translation in pairs(SKILL_OVERRIDES) do
        local id = _G[stringIdConst] or stringIdConst
        if id and SafeAddString then
            SafeAddString(id, translation, 1)
        end
    end
end
