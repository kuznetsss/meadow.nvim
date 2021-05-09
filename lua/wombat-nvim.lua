local wombat = {}

wombat.COLOR_SATURATION = 75
wombat.COLOR_VALUE = 75

local to_int = function(f)
    return math.floor(f + 0.5)
end

-- Hue should be in [0, 360]
-- Saturation and value should be in [0, 100]
wombat.hsv_to_rgb = function(hsv)
    local hue = hsv[1]
    local saturation = hsv[2] / 100
    local value = hsv[3] * 255 / 100

    local c = value * saturation
    local h = hue / 60
    local x = c * (1 - math.abs(math.fmod(h, 2) - 1))

    local result = {0, 0, 0}
    if h >= 0 and h <= 1 then
        result = {c, x, 0}
    elseif h > 1 and h <= 2 then
        result = {x, c, 0}
    elseif h > 2 and h <= 3 then
        result = { 0, c, x}
    elseif h > 3 and h <= 4 then
        result = {0, x, c}
    elseif h > 4 and h <= 5 then
        result = {x, 0, c}
    elseif h > 5 and h <= 6 then
        result = {c, 0, x}
    end
    local m = value - c
    for i = 1, #result do
        result[i] = to_int(result[i] + m)
    end
    return result
end

wombat.rgb_to_hex = function(rgb)
    local string_to_format = '#'
    for _, v in ipairs(rgb) do
        if v < 16 then
            string_to_format = string_to_format .. '0'
        end
        string_to_format = string_to_format .. '%x'
    end
    return string.format(string_to_format, rgb[1], rgb[2], rgb[3])
end

wombat.ColorType = { fg = 1, bg = 2 }

wombat.hsv_to_rgb_hex = function(hsv, type)
    if not hsv then
        return nil
    end
    type = type or wombat.ColorType.fg
    local color_value
    if type == wombat.ColorType.fg then
        color_value = hsv.value_fg
    elseif type == wombat.ColorType.bg then
        color_value = hsv.value_bg
    else
        assert(false, 'Wrong type value ' .. type)
    end
    local rgb = wombat.hsv_to_rgb({hsv.hue, hsv.saturation, color_value})
    return wombat.rgb_to_hex(rgb)
end

wombat.Colors = {
    Black = { {0, 0, 3}, {0, 0, 14}, {0, 0, 19}, {0, 0, 22} },
    GreyBg = { {0, 0, 26}, {0, 0, 34} },
    Grey =  { {0, 0, 55} },
    White = { {0, 0} },

    Blue = { {202}, {195}, {178} },
    Green = { {115}, {87} },
    Red = { {0}, {12} },
    Violet = { {280} },
    Yellow = { {65}, {46} },
    Orange = { {35} },
    Pink = { {326} },
}

wombat.StaticColors = { Black = true, GreyBg = true }

local function preprocess_colors()
    for name, colors in pairs(wombat.Colors) do
        for _, hsv in pairs(colors) do
            if wombat.StaticColors[name] then
                hsv.hue = hsv[1]
                hsv.saturation = hsv[2]
                hsv.value_fg = hsv[3]
                hsv.value_bg = hsv[3]
            else
                hsv.hue = hsv[1]
                hsv.saturation = hsv[2] or wombat.COLOR_SATURATION
                hsv.value_fg = hsv[3] and
                    hsv[3] * wombat.COLOR_VALUE / 100 or
                    wombat.COLOR_VALUE
                hsv.value_bg = hsv[3] or wombat.COLOR_VALUE / 2
            end
        end
    end
end
preprocess_colors()

local c = wombat.Colors

wombat.NvimColors = {
    ColorColumn = { bg = c.Black[3] },
    Conceal = { fg = c.White[1], bg = c.GreyBg[2] },
    Cursor = { opt = 'reverse' },
    lCursor = { link = 'Cursor' },
    CursorIM = { link = 'Cursor' },
    CursorColumn = { bg = c.Black[4] },
    -- Link is commented out because of the bug in LspSaga
    -- https://github.com/glepnir/lspsaga.nvim/issues/197
    CursorLine = { bg = c.Black[4] }, --link = 'CursorColumn' },
    Directory = { fg = c.Blue[1] },

    DiffAdd = { fg = c.Green[2] },
    DiffChange = { fg = c.Yellow[1] },
    DiffDelete = { fg = c.Red[2] },
    DiffText = { fg = c.Yellow[1] },
    diffAdded = { link = 'DiffAdd' },
    diffChanged = { link = 'DiffChange' },
    diffRemoved = { link = 'DiffDelete' },

    EndOfBuffer = { bg = c.Black[1] },
    ErrorMsg = { fg = c.Red[1], bg = c.Black[1] },
    Folded = { bg = c.GreyBg[2] },
    FoldColumn = { bg = c.GreyBg[2] },
    LineNr = { fg = c.Grey[1], bg = c.Black[1] },
    CursorLineNr = { fg = c.Yellow[1], opt = 'bold' },
    MatchParen	= { bg = c.Yellow[1], opt = 'bold' },
    ModeMsg = { link = 'Normal' },
    MsgArea	= { link = 'Normal' },
    MsgSeparator = { bg = c.GreyBg[1] },
    MoreMsg	= { fg = c.Green[2] },
    NonText	= { fg = c.Grey[1] },
    Normal = { fg = c.White[1], bg = c.Black[2] },
    NormalFloat	= { fg = c.White[1], bg = c.GreyBg[1] },
    NormalNC = { link = 'Normal' },
    Pmenu = { fg = c.White[1], bg = c.GreyBg[1] },
    PmenuSel = { fg = c.Green[2], bg = c.GreyBg[2], opt = 'bold' },
    PmenuSbar = { bg = c.GreyBg[2] },
    PmenuThumb = { bg = c.White[1] },
    Question = { link = 'MoreMsg' },
    Search = { bg = c.Violet[1] },
    IncSearch = { link = 'Search' },
    QuickFixLine = { opt = 'bold' },
    SignColumn = { bg = c.Black[3] },
    SpecialKey = { fg = c.Grey[1] },
    SpellBad = { bg = c.Red[2], opt = 'underline'},
    SpellCap = { link = 'SpellBad' },
    SpellLocal = { link = 'SpellBad' },
    SpellRare = { link = 'SpellBad' },
    StatusLine = { fg = c.White[1], bg = c.Black[1] },
    StatusLineNC = { fg = c.GreyBg[1], bg = c.Black[1] },
    Substitute = { link = 'Search' },
    TabLine = { fg = c.Green[2], bg = c.GreyBg[1] },
    TabLineFill = { fg = c.Green[2], bg = c.Black[3]},
    TabLineSel = { opt = 'bold' },
    TermCursor = { link = 'Cursor' },
    TermCursorNC = { link = 'Cursor' },
    VertSplit = { fg = c.Black[1], bg = c.Black[1] },
    Visual = { bg = c.Violet[1] },
    VisualNOS = { link = 'Visual' },
    WarningMsg = { bg = c.Yellow[1] },
    Whitespace = { fg = c.Blue[3], bg = c.GreyBg[2] },
    WildMenu = { link = 'PmenuSel' },


    Debug = { bg = c.Red[2] },
    debugBreakpoint = { fg = c.Red[2] },

    Boolean = { fg = c.Red[2] },
    Number = { fg = c.Red[2] },
    Float = { link = 'Number' },
    String = { fg = c.Green[1], opt = 'italic' },
    Character = { link = 'String' },
    Constant = { fg = c.Red[1] },

    TSVariable = { fg = c.White[1] },
    TSNamespace = { fg = c.Yellow[1] },
    Function = { fg = c.Green[1], opt = 'bold' },
    Identifier = { fg = c.Yellow[2], opt = 'italic' },
    --TSField = {}, -- Identifier
    --TSParameter = {}, -- Identifier
    -- TSProperty = {}. -- Identifier
    Type = { fg = c.Green[2] },
    TSAnnotation = { fg = c.Yellow[1] },
    TSParameterReference = {fg = c.Green[2], opt = 'italic' },

    --TSPunctBracket = {}, -- Delimiter
    Delimiter = { fg = c.Yellow[2] },
    Special = { fg = c.Yellow[1] },
    --TSStringEscape = {}, -- SpecialChar
    SpecialChar = { fg = c.Orange[1] },
    Operator = { fg = c.Blue[3] },

    Keyword = { fg = c.Blue[3] },
    Include = { fg = c.Blue[1] },
    Conditional = { fg = c.Blue[3] },
    PreCondit = { fg = c.Blue[3] },
    Repeat = { fg = c.Blue[3] }, -- loops related
    Define = { fg = c.Blue[1] },
    Macro = { fg = c.Blue[1] },
    Statement = { fg = c.Blue[1] },
    PreProc = { fg = c.Red[2] },
    Typedef = { fg = c.Blue[2] },

    TSURI = { fg = c.Blue[1], opt = 'underline' },
    Exception = { fg = c.Yellow[1] },
    Error = { fg = c.Red[1] },
    StorageClass = { fg = c.Yellow[1] },
    Tag = { fg = c.Orange[1] },
    Label = { fg = c.Orange[1] },
    Structure = { fg = c.Green[1] },
    Title = { fg = c.Green[2], opt = 'bold' },

    Comment = { fg = c.Grey[1] },
    SpecialComment = { fg = c.Grey[1] },
    Todo = { fg = c.Yellow[1] },
    Ignore = { fg = c.Grey[1] },
    Underlined = { fg = c.Blue[1], opt = 'underline' },

    LspDiagnosticsDefaultError = { fg = c.Red[2] },
    LspDiagnosticsDefaultWarning = { fg = c.Orange[1] },
    LspDiagnosticsDefaultInformation = { fg = c.Blue[1] },
    LspDiagnosticsDefaultHint = { fg = c.Blue[2] },

    LspDiagnosticsUnderlineError = { style = 'undercurl' },
    LspDiagnosticsUnderlineWarning = { style = 'undercurl' },
    LspDiagnosticsUnderlineInformation = { style = 'undercurl' },
    LspDiagnosticsUnderlineHint = { style = 'undercurl' }

}

wombat.IndentBlankLineColors = {
    IndentBlanklineChar = { fg = c.Grey[1], opt = 'nocombine' },
    IndentBlanklineSpaceChar = { link = 'IndentBlanklineChar' },
    IndentBlanklineSpaceCharBlankline = { link = 'IndentBlanklineChar' }
}

wombat.SignifyColors = {
    SignifySignAdd = { fg = c.Green[1], bg = c.Black[3], opt = 'bold' },
    SignifySignDelete = { fg = c.Red[1], bg = c.Black[3], opt = 'bold' },
    SignifySignChange = { fg = c.Yellow[1], bg = c.Black[3], opt = 'bold' },
    SignifyLineAdd = { link = 'SignifySignAdd' },
    SignifyLineChange = { link = 'SignifyLineChange' },
    SignifyLineChangeDelete   = { link = 'SignifyLineChange' },
    SignifyLineDelete = { link = 'SignifySignDelete' },
    SignifyLineDeleteFirstLine = { link = 'SignifySignDelete' },
    SignifySignChangeDelete = { link = 'SignifyLineChange' },
    SignifySignDeleteFirstLine = { link = 'SignifySignDelete' }
}

wombat.LspSagaColors = {
    LspSagaFinderSelection = { fg = c.Green[2], bg = c.GreyBg[1], opt = 'bold' },
    LspFloatWinNormal = { bg = c.Black[3] },
    LspFloatWinBorder = { fg = c.Grey[1], bg = c.Black[3] },
    LspSagaLspFinderBorder = { link = 'LspFloatWinBorder' },
    LspSagaBorderTitle = { link = 'Title' },
    TargetWord = { fg = c.Yellow[1], opt = 'bold' },
    ReferencesCount = { fg = c.Red[2] },
    DefinitionCount = { link = 'ReferencesCount' },
    TargetFileName = { fg = c.White[1] },
    DefinitionIcon = { fg = c.Yellow[1] },
    ReferencesIcon = { link = 'DefinitionIcon' },
    ProviderTruncateLine = { link = 'LspFloatWinBorder' },
    SagaShadow = { bg = c.Black[1] },
    DiagnosticTruncateLine = { link = 'ProviderTruncateLine' },
    LspSagaDiagnosticBorder = { link = 'LspFloatWinBorder' },
    LspSagaDiagnosticTruncateLine = { link = 'LspFloatWinBorder' },
    LspSagaDiagnosticHeader = { fg = c.Yellow[2] },
    DefinitionPreviewTitle = { link = 'Title' },
    LspSagaShTruncateLine = { link = 'ProviderTruncateLine' },
    LspSagaDocTruncateLine = { link = 'ProviderTruncateLine' },
    LineDiagTuncateLine = { link = 'ProviderTruncateLine' },
    LspSagaCodeActionTitle = { link = 'Title' },
    LspSagaCodeActionTruncateLine = { link = 'ProviderTruncateLine' },
    LspSagaCodeActionContent = { fg = c.White[1] },
    LspSagaRenamePromptPrefix = { fg = c.Green[1] },
    LspSagaRenameBorder = { link = 'LspFloatWinBorder' },
    LspSagaHoverBorder = { link = 'LspFloatWinBorder' },
    LspSagaSignatureHelpBorder = { link = 'LspFloatWinBorder' },
    LspSagaCodeActionBorder = { link = 'LspFloatWinBorder' },
    LspSagaAutoPreview = { link = 'LspFloatWinBorder' },
    LspSagaDefPreviewBorder = { link = 'LspFloatWinBorder' },
    LspLinesDiagBorder = { link = 'LspFloatWinBorder' }
}

wombat.TelescopeColors = {
    TelescopeSelection = {}, -- selected item
    TelescopeSelectionCaret = {}, -- selection caret
    TelescopeMultiSelection = {}, -- multisections
    TelescopeNormal = {}, -- floating windows created by telescope.

    -- Border highlight groups.
    TelescopeBorder = {},
    TelescopePromptBorder = {},
    TelescopeResultsBorder = {},
    TelescopePreviewBorder = {},

    -- Used for highlighting characters that you match.
    TelescopeMatching = {},

    -- Used for the prompt prefix
    TelescopePromptPrefix = {}
}

function wombat.apply_colors(colors)
    for group, options in pairs(colors) do
        local cmd = ''
        if options.link then
            cmd = 'hi! link ' .. group .. ' ' .. options.link
        else
            local fg =
                wombat.hsv_to_rgb_hex(options.fg, wombat.ColorType.fg) or 'none'
            local bg =
                wombat.hsv_to_rgb_hex(options.bg, wombat.ColorType.bg) or 'none'
            local opt = options.opt or 'none'
            cmd = 'hi! ' .. group ..
                ' guifg= ' .. fg ..
                ' guibg=' .. bg ..
                ' gui=' .. opt
        end
        vim.cmd(cmd)
    end
end

function wombat.setup()
    vim.api.nvim_command('highlight clear')
    if vim.fn.exists('syntax_on') then
        vim.api.nvim_command('syntax reset')
    end
    vim.o.background = 'dark'
    vim.o.termguicolors = true
    vim.g.colors_name = 'wombat-nvim'

    wombat.apply_colors(wombat.NvimColors)
    wombat.apply_colors(wombat.IndentBlankLineColors)
    wombat.apply_colors(wombat.SignifyColors)
    wombat.apply_colors(wombat.LspSagaColors)
end

return wombat
