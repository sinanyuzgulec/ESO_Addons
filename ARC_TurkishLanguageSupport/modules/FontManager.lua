-- modules/FontManager.lua
-- Turkish Font & UTF-8 Character Replacement Manager for ARC_TurkishLanguageSupport
-- Author: @arcsinan

ARC_TLS = ARC_TLS or {}
local TLS = ARC_TLS
TLS.FontManager = TLS.FontManager or {}

local REGULAR_FONT = "ARC_TurkishLanguageSupport/fonts/TurkishFont-Regular.ttf"
local BOLD_FONT    = "ARC_TurkishLanguageSupport/fonts/TurkishFont-Bold.ttf"

local TARGET_REGULAR_FONTS = {
    "ZoFontGame",
    "ZoFontGameMedium",
    "ZoFontGameLarge",
    "ZoFontChat",
    "ZoFontConversationControl",
    "ZoFontSubtitles",
    "ZoFontTooltipSubtitle",
    "ZoFontAlert",
    "ZoFontKeybindStripDescription",
    "ZoFontEdit",
}

local TARGET_BOLD_FONTS = {
    "ZoFontGameBold",
    "ZoFontHeader",
    "ZoFontHeader2",
    "ZoFontHeader3",
    "ZoFontHeader4",
    "ZoFontWinH1",
    "ZoFontWinH2",
    "ZoFontWinH3",
    "ZoFontWinH4",
    "ZoFontWinH5",
    "ZoFontConversationControl_Bold",
    "ZoFontTooltipTitle",
    "ZoFontCallout",
    "ZoFontCallout2",
}

function TLS.FontManager.RegisterMedia()
    local LMP = LibMediaProvider
    if LMP then
        LMP:Register("font", "Turkish Regular (ARC)", REGULAR_FONT)
        LMP:Register("font", "Turkish Bold (ARC)", BOLD_FONT)
    end
end

local function SafeSetFont(fontObjName, fontPath)
    local fontObj = _G[fontObjName]
    if fontObj and fontObj.GetFontInfo and fontObj.SetFont then
        local _, size, style = fontObj:GetFontInfo()
        if size and size > 0 then
            local styleStr = (style and style ~= "") and ("|" .. style) or ""
            fontObj:SetFont(string.format("%s|%d%s", fontPath, size, styleStr))
        end
    end
end

function TLS.FontManager.Apply()
    if not (TLS.vars and TLS.vars.enableFontReplacement) then return end

    -- Register with LibMediaProvider if present
    TLS.FontManager.RegisterMedia()

    -- Apply regular unicode fonts
    for _, fontName in ipairs(TARGET_REGULAR_FONTS) do
        SafeSetFont(fontName, REGULAR_FONT)
    end

    -- Apply bold unicode fonts
    for _, fontName in ipairs(TARGET_BOLD_FONTS) do
        SafeSetFont(fontName, BOLD_FONT)
    end
end
