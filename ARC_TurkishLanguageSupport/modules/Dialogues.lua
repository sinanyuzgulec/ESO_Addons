-- modules/Dialogues.lua
-- NPC Conversations, Chatter Options, Subtitles & Interaction Prompts Turkish Translations
-- Author: @arcsinan

ARC_TLS = ARC_TLS or {}
local TLS = ARC_TLS
TLS.Dialogues = TLS.Dialogues or {}

local INTERACTION_OVERRIDES = {
    -- World Interaction Reticle Prompts
    SI_INTERACTION_TALK                     = "Konuş",
    SI_INTERACTION_LOOT                     = "Topla / Yağmala",
    SI_INTERACTION_OPEN                     = "Aç",
    SI_INTERACTION_USE                      = "Kullan",
    SI_INTERACTION_HARVEST                  = "Hasat Et",
    SI_INTERACTION_STEAL                    = "Çal (Hırsızlık)",
    SI_INTERACTION_STEAL_FROM               = "Gizlice Al",
    SI_INTERACTION_PICKPOCKET               = "Yankesicilik Yap",
    SI_INTERACTION_READ                     = "Oku",
    SI_INTERACTION_EXAMINE                  = "İncele",
    SI_INTERACTION_PRAY                     = "Dua Et / Adak Ver",
    SI_INTERACTION_FISH                     = "Balık Tut",
    SI_INTERACTION_DISARM                   = "Tuzağı Etkisiz Hale Getir",
    SI_INTERACTION_UNLOCK                   = "Kilidi Aç",
    SI_INTERACTION_ACTIVATE                 = "Etkinleştir",

    -- Conversation Window Controls
    SI_CHATTER_GOODBYE                      = "Görüşmek üzere. (Ayrıl)",
    SI_CHATTER_NEVERMIND                    = "Boşver.",
    SI_CHATTER_COMPLETE_QUEST               = "Görevi Tamamla",
}

-- Dialogue translation database: [English Dialogue/Subtitle] = "Türkçe Çeviri"
TLS.Dialogues.database = {
    -- Intro & Essential Greetings
    ["Greetings, traveler."] = "Selamlar, gezgin.",
    ["What brings you here?"] = "Seni buraya ne getirdi?",
    ["How can I help you today?"] = "Bugün sana nasıl yardımcı olabilirim?",
    ["Need something?"] = "Bir şeye mi ihtiyacın vardı?",
    ["Take a look at my wares."] = "Mallarıma bir göz at.",
    ["May the Divines protect you."] = "Kutsallar seni korusun.",
    ["Farewell."] = "Hoşça kal.",
}

function TLS.Dialogues.TranslateText(text)
    if not text or text == "" then return text end
    if TLS.Dialogues.database[text] then
        return TLS.Dialogues.database[text]
    end
    return text
end

local function OnConversationUpdated()
    if not (TLS.vars and TLS.vars.enableDialogues) then return end

    -- Translate main dialogue bubble text
    if ZO_InteractWindowTargetAreaBody and ZO_InteractWindowTargetAreaBody.GetText then
        local rawText = ZO_InteractWindowTargetAreaBody:GetText()
        if rawText and rawText ~= "" then
            local trText = TLS.Dialogues.TranslateText(rawText)
            if trText ~= rawText then
                ZO_InteractWindowTargetAreaBody:SetText(trText)
            end
        end
    end
end

function TLS.Dialogues.HookEvents()
    if TLS.Dialogues._hooked then return end
    TLS.Dialogues._hooked = true

    EVENT_MANAGER:RegisterForEvent("ARC_TLS_Conversation", EVENT_CONVERSATION_UPDATED, OnConversationUpdated)
end

function TLS.Dialogues.Apply()
    if not (TLS.vars and TLS.vars.enableDialogues) then return end

    for stringIdConst, translation in pairs(INTERACTION_OVERRIDES) do
        local id = _G[stringIdConst] or stringIdConst
        if id and SafeAddString then
            SafeAddString(id, translation, 1)
        end
    end

    TLS.Dialogues.HookEvents()
end
