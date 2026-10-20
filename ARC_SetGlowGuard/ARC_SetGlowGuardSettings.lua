-- ARC_SetGlowGuardSettings.lua - LibAddonMenu-2.0 Settings Panel & Gold Donation for @arcsinan
-- Author: @arcsinan

ARC_SetGlowGuard = ARC_SetGlowGuard or {}
local ASGG = ARC_SetGlowGuard

function ASGG.InitSettings()
    local LAM = LibAddonMenu2
    if not LAM then return end

    local panelData = {
        type = "panel",
        name = "ARC_SetGlowGuard",
        displayName = "|c00D4FFARC_SetGlowGuard|r - Set Glow & Equipment Tracker",
        author = "|c00E676@arcsinan|r",
        version = ASGG.version or "1.0.0",
        donation = function() ASGG.DonateGold(5000) end,
        registerForRefresh = true,
        registerForDefaults = true,
    }

    local optionsData = {
        ------------------------------------------------------------------------
        -- General Settings
        ------------------------------------------------------------------------
        {
            type = "header",
            name = "|c00D4FFGeneral Settings|r",
        },
        {
            type = "checkbox",
            name = "Enable ARC_SetGlowGuard",
            tooltip = "Toggles glowing set highlights on equipment and inventory.",
            getFunc = function() return ASGG.vars.enabled end,
            setFunc = function(value)
                ASGG.vars.enabled = value
                ASGG.Refresh()
            end,
            width = "full",
            default = ASGG.defaults.enabled,
        },
        {
            type = "checkbox",
            name = "Show Character Sheet with Inventory ('I')",
            tooltip = "When pressing 'I' to open your bag, automatically attaches the Character equipment panel to the left side of your screen. All worn sets and matching backpack items glow in matching colors simultaneously!",
            getFunc = function() return ASGG.vars.autoShowCharacterOnInventory end,
            setFunc = function(value)
                ASGG.vars.autoShowCharacterOnInventory = value
                ASGG.UpdateInventoryAttachment()
            end,
            width = "full",
            default = ASGG.defaults.autoShowCharacterOnInventory,
        },
        {
            type = "checkbox",
            name = "Highlight Equipment Slots",
            tooltip = "Equipped items belonging to the same set will glow with identical colors on your Character sheet.",
            getFunc = function() return ASGG.vars.highlightEquipment end,
            setFunc = function(value)
                ASGG.vars.highlightEquipment = value
                ASGG.Refresh()
            end,
            width = "full",
            default = ASGG.defaults.highlightEquipment,
        },
        {
            type = "checkbox",
            name = "Highlight Backpack Items",
            tooltip = "Items in your bag that match your currently equipped sets glow with the exact same set color, making accidentally unequipped items instantly noticeable.",
            getFunc = function() return ASGG.vars.highlightBackpack end,
            setFunc = function(value)
                ASGG.vars.highlightBackpack = value
                ASGG.Refresh()
            end,
            width = "full",
            default = ASGG.defaults.highlightBackpack,
        },
        {
            type = "checkbox",
            name = "Show Left Accent Bar in Inventory Rows",
            tooltip = "Draws a sleek colored vertical accent stripe on the left border of inventory rows matching equipped sets.",
            getFunc = function() return ASGG.vars.showRowBar end,
            setFunc = function(value)
                ASGG.vars.showRowBar = value
                ASGG.Refresh()
            end,
            width = "full",
            default = ASGG.defaults.showRowBar,
        },
        {
            type = "checkbox",
            name = "Show Incomplete Set Alert (e.g. 4/5)",
            tooltip = "Displays a clear piece count indicator on slots when an equipped set is missing pieces (e.g. 4/5 or 1/2) so you never miss an unequipped item.",
            getFunc = function() return ASGG.vars.showIncompleteWarning end,
            setFunc = function(value)
                ASGG.vars.showIncompleteWarning = value
                ASGG.Refresh()
            end,
            width = "full",
            default = ASGG.defaults.showIncompleteWarning,
        },
        {
            type = "slider",
            name = "Glow Intensity",
            tooltip = "Adjust how bright and vivid the glow highlights appear.",
            min = 0.2,
            max = 1.0,
            step = 0.05,
            decimals = 2,
            getFunc = function() return ASGG.vars.glowIntensity end,
            setFunc = function(value)
                ASGG.vars.glowIntensity = value
                ASGG.Refresh()
            end,
            width = "full",
            default = ASGG.defaults.glowIntensity,
        },
        {
            type = "dropdown",
            name = "Glow Style",
            tooltip = "Choose the visual texture used for glowing highlights.",
            choices = { "Action Bar Glow", "Magical Soft Highlight", "Item Pulse" },
            choicesValues = {
                "EsoUI/Art/ActionBar/actionBar_mouseOver.dds",
                "EsoUI/Art/ActionBar/abilityHighlight_mage_med.dds",
                "EsoUI/Art/Miscellaneous/icon_highlight_pulse.dds"
            },
            getFunc = function() return ASGG.vars.glowTexture end,
            setFunc = function(value)
                ASGG.vars.glowTexture = value
                ASGG.Refresh()
            end,
            width = "full",
            default = ASGG.defaults.glowTexture,
        },

        ------------------------------------------------------------------------
        -- Set Color Customization
        ------------------------------------------------------------------------
        {
            type = "header",
            name = "|c00D4FFSet Colors & Palette|r",
        },
        {
            type = "colorpicker",
            name = "Set 1 Glow Color",
            tooltip = "Glow color for the primary equipped set.",
            getFunc = function()
                local c = ASGG.vars.colors[1]
                return c[1], c[2], c[3], c[4] or 1.0
            end,
            setFunc = function(r, g, b, a)
                ASGG.vars.colors[1] = { r, g, b, a or 1.0 }
                ASGG.Refresh()
            end,
            width = "half",
            default = ASGG.defaults.colors[1],
        },
        {
            type = "colorpicker",
            name = "Set 2 Glow Color",
            tooltip = "Glow color for the secondary equipped set.",
            getFunc = function()
                local c = ASGG.vars.colors[2]
                return c[1], c[2], c[3], c[4] or 1.0
            end,
            setFunc = function(r, g, b, a)
                ASGG.vars.colors[2] = { r, g, b, a or 1.0 }
                ASGG.Refresh()
            end,
            width = "half",
            default = ASGG.defaults.colors[2],
        },
        {
            type = "colorpicker",
            name = "Set 3 / Monster Set Glow Color",
            tooltip = "Glow color for the 3rd set (e.g. 2-piece Monster Set).",
            getFunc = function()
                local c = ASGG.vars.colors[3]
                return c[1], c[2], c[3], c[4] or 1.0
            end,
            setFunc = function(r, g, b, a)
                ASGG.vars.colors[3] = { r, g, b, a or 1.0 }
                ASGG.Refresh()
            end,
            width = "half",
            default = ASGG.defaults.colors[3],
        },
        {
            type = "colorpicker",
            name = "Set 4 Glow Color",
            tooltip = "Glow color for 4th equipped set (e.g. Arena weapons).",
            getFunc = function()
                local c = ASGG.vars.colors[4]
                return c[1], c[2], c[3], c[4] or 1.0
            end,
            setFunc = function(r, g, b, a)
                ASGG.vars.colors[4] = { r, g, b, a or 1.0 }
                ASGG.Refresh()
            end,
            width = "half",
            default = ASGG.defaults.colors[4],
        },
        {
            type = "colorpicker",
            name = "Mythic Item Glow Color",
            tooltip = "Glow color for equipped Mythic items.",
            getFunc = function()
                local c = ASGG.vars.colors.mythic
                return c[1], c[2], c[3], c[4] or 1.0
            end,
            setFunc = function(r, g, b, a)
                ASGG.vars.colors.mythic = { r, g, b, a or 1.0 }
                ASGG.Refresh()
            end,
            width = "half",
            default = ASGG.defaults.colors.mythic,
        },
        {
            type = "colorpicker",
            name = "Incomplete Set Alert Color",
            tooltip = "Color used for incomplete set warning labels (e.g. 4/5).",
            getFunc = function()
                local c = ASGG.vars.colors.warning
                return c[1], c[2], c[3], c[4] or 1.0
            end,
            setFunc = function(r, g, b, a)
                ASGG.vars.colors.warning = { r, g, b, a or 1.0 }
                ASGG.Refresh()
            end,
            width = "half",
            default = ASGG.defaults.colors.warning,
        },
        {
            type = "button",
            name = "Reset Colors to Default",
            tooltip = "Resets all glow colors back to standard high-contrast palette.",
            func = function()
                ASGG.vars.colors = ZO_DeepTableCopy(ASGG.defaults.colors)
                ASGG.Refresh()
            end,
            width = "half",
        },

        ------------------------------------------------------------------------
        -- Developer Support & Gold Donation (@arcsinan)
        ------------------------------------------------------------------------
        {
            type = "header",
            name = "|cFFD700Support Developer (@arcsinan)|r",
        },
        {
            type = "description",
            text = "Enjoying |c00D4FFARC_SetGlowGuard|r? No more accidentally lost set pieces or broken 5-piece bonuses!\nIf you would like to support ongoing development, you can send an in-game gold donation directly to |c00E676@arcsinan|r.",
            width = "full",
        },
        {
            type = "button",
            name = "|cFFD700Send 5,000 Gold to @arcsinan|r",
            tooltip = "Opens in-game mail addressed to @arcsinan with 5,000 gold pre-attached.",
            func = function() ASGG.DonateGold(5000) end,
            width = "half",
        },
        {
            type = "button",
            name = "|cFFD700Send 25,000 Gold to @arcsinan|r",
            tooltip = "Opens in-game mail addressed to @arcsinan with 25,000 gold pre-attached.",
            func = function() ASGG.DonateGold(25000) end,
            width = "half",
        },
        {
            type = "button",
            name = "|cFFD700Send 100,000 Gold to @arcsinan|r",
            tooltip = "Opens in-game mail addressed to @arcsinan with 100,000 gold pre-attached.",
            func = function() ASGG.DonateGold(100000) end,
            width = "half",
        },
        {
            type = "button",
            name = "Open Mail to @arcsinan (Custom Amount)",
            tooltip = "Opens in-game mail addressed to @arcsinan so you can enter any gold amount you wish.",
            func = function() ASGG.DonateGold(0) end,
            width = "half",
        },
    }

    ASGG.settingsPanel = LAM:RegisterAddonPanel("ARC_SetGlowGuard_OptionsPanel", panelData)
    LAM:RegisterOptionControls("ARC_SetGlowGuard_OptionsPanel", optionsData)
end
