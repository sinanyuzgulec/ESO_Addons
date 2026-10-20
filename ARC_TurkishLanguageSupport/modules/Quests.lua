-- modules/Quests.lua
-- Quest Journal, Tracker, Categories, and Dynamic Objective Translation Hooks
-- Author: @arcsinan

ARC_TLS = ARC_TLS or {}
local TLS = ARC_TLS
TLS.Quests = TLS.Quests or {}

local QUEST_OVERRIDES = {
    -- Quest Categories & Types
    SI_JOURNAL_QUEST_TYPE_MAIN_STORY        = "Ana Hikaye Görevi",
    SI_JOURNAL_QUEST_TYPE_GUILD             = "Lonca Görevi",
    SI_JOURNAL_QUEST_TYPE_CRAFTING          = "Zanaat Siparişi (Writ)",
    SI_JOURNAL_QUEST_TYPE_DUNGEON           = "Zindan Görevi",
    SI_JOURNAL_QUEST_TYPE_RAID              = "Trial (Baskın) Görevi",
    SI_JOURNAL_QUEST_TYPE_AVA               = "Cyrodiil İttifak Savaşı Görevi",
    SI_JOURNAL_QUEST_TYPE_HOLIDAY_EVENT     = "Etkinlik Görevi",
    SI_JOURNAL_QUEST_TYPE_PROLOGUE          = "Ön Bölüm (Prologue) Görevi",

    -- Quest Actions & Journal
    SI_QUEST_JOURNAL_TITLE                  = "Görev Günlüğü",
    SI_QUEST_COMPLETE                       = "Görev Tamamlandı!",
    SI_QUEST_ABANDON                        = "Görevi Terk Et",
    SI_QUEST_SHARE                          = "Görevi Paylaş",
    SI_QUEST_SHOW_ON_MAP                    = "Haritada Göster",
    SI_QUEST_TRACKER_HEADER                 = "Görev Takipçisi",
    SI_QUEST_OPTIONAL_STEPS                 = "İsteğe Bağlı Adımlar",
    SI_QUEST_HINT_STEPS                     = "İpuçları",
    SI_QUEST_ABANDON_CONFIRM                = "Bu görevi gerçekten bırakmak istiyor musunuz?",
}

-- Quest database: [Original EN Title] = { title = "TR Başlık", ... }
TLS.Quests.database = {
    -- Main Story / Intro
    ["Soul Shriven in Coldharbour"] = {
        title = "Coldharbour'da Mahkum Ruh",
    },
    ["The Harborage"] = {
        title = "Sığınak (The Harborage)",
    },
    ["Chasing Shadows"] = {
        title = "Gölgelerin Peşinde",
    },
    ["Castle of the Worm"] = {
        title = "Solucan Kalesi",
    },
    ["The Tharn Speaks"] = {
        title = "Tharn Konuşuyor",
    },
    ["Halls of Torment"] = {
        title = "Eziyet Salonları",
    },
    ["Valley of Blades"] = {
        title = "Kılıçlar Vadisi",
    },
    ["Shadow of Sancre Tor"] = {
        title = "Sancre Tor'un Gölgesi",
    },
    ["Council of the Five Companions"] = {
        title = "Beş Yoldaş Meclisi",
    },
    ["God of Schemes"] = {
        title = "Entrikalar Tanrısı",
    },
}

function TLS.Quests.HookQuestAPI()
    if TLS.Quests._hooked then return end
    TLS.Quests._hooked = true

    if GetJournalQuestInfo then
        local orig_GetJournalQuestInfo = GetJournalQuestInfo
        GetJournalQuestInfo = function(questIndex)
            local questName, bgText, activeStepText, activeStepType, activeStepTrackerOverrideText, completed, tracked, questLevel, pushed, questType, instanceDisplayType = orig_GetJournalQuestInfo(questIndex)
            if TLS.vars and TLS.vars.enableQuests and questName then
                local data = TLS.Quests.database[questName]
                if data and data.title then
                    questName = data.title
                end
            end
            return questName, bgText, activeStepText, activeStepType, activeStepTrackerOverrideText, completed, tracked, questLevel, pushed, questType, instanceDisplayType
        end
    end
end

function TLS.Quests.Apply()
    if not (TLS.vars and TLS.vars.enableQuests) then return end

    for stringIdConst, translation in pairs(QUEST_OVERRIDES) do
        local id = _G[stringIdConst] or stringIdConst
        if id and SafeAddString then
            SafeAddString(id, translation, 1)
        end
    end

    TLS.Quests.HookQuestAPI()
end
