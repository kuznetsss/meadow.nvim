local meadow = {}

meadow.options = nil

local convert_color = require'meadow.convert_color'

meadow.ColorType = { fg = 1, bg = 2 }

meadow.hsv_to_rgb_hex = function(hsv, type)
    if not hsv then
        return nil
    end
    type = type or meadow.ColorType.fg
    local color_value
    if type == meadow.ColorType.fg then
        color_value = hsv.value_fg
    elseif type == meadow.ColorType.bg then
        color_value = hsv.value_bg
    else
        assert(false, 'Wrong type value ' .. type)
    end
    return convert_color.hsv_to_rgb_hex({hsv.hue, hsv.saturation, color_value})
end

meadow.Colors = {
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

meadow.StaticColors = { Black = true, GreyBg = true }

local function preprocess_colors()
    for name, colors in pairs(meadow.Colors) do
        for _, hsv in pairs(colors) do
            if meadow.StaticColors[name] then
                hsv.hue = hsv[1]
                hsv.saturation = hsv[2]
                hsv.value_fg = hsv[3]
                hsv.value_bg = hsv[3]
            else
                hsv.hue = hsv[1]
                hsv.saturation = hsv[2] or meadow.options.color_saturation
                hsv.value_fg = hsv[3] and
                    hsv[3] * meadow.options.color_value / 100 or
                    meadow.options.color_value
                hsv.value_bg = hsv[3] or meadow.options.color_value / 2
            end
        end
    end
end

local c = meadow.Colors

meadow.NvimColors = {
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
    LineNr = { fg = c.Grey[1], bg = c.Black[2] },
    CursorLineNr = { fg = c.Yellow[1], bg = c.Black[4], opt = 'bold' },
    MatchParen = { bg = c.Yellow[1], opt = 'bold' },
    ModeMsg = { link = 'Normal' },
    MsgArea = { link = 'Normal' },
    MsgSeparator = { bg = c.GreyBg[1] },
    MoreMsg = { fg = c.Green[2] },
    NonText = { fg = c.Grey[1] },
    Normal = { fg = c.White[1], bg = c.Black[2] },
    NormalFloat = { fg = c.White[1], bg = c.GreyBg[1] },
    NormalNC = { link = 'Normal' },
    Pmenu = { fg = c.White[1], bg = c.GreyBg[1] },
    PmenuSel = { fg = c.Green[2], bg = c.GreyBg[2], opt = 'bold' },
    PmenuSbar = { bg = c.GreyBg[2] },
    PmenuThumb = { bg = c.White[1] },
    Question = { link = 'MoreMsg' },
    Search = { bg = c.Violet[1] },
    IncSearch = { link = 'Search' },
    QuickFixLine = { opt = 'bold' },
    SignColumn = { bg = c.Black[2] },
    SpecialKey = { fg = c.Grey[1] },
    SpellBad = { opt = 'underline' },
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
    Whitespace = { fg = c.White[1], bg = c.Orange[1] },
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


    DiagnosticError = { fg = c.Red[1] },
    DiagnosticWarn = { fg = c.Orange[1] },
    DiagnosticInfo = { fg = c.Blue[1] },
    DiagnosticHint = { fg = c.Blue[2] },

    DiagnosticSignError = { link = 'DiagnosticError' },
    DiagnosticSignWarn = { link = 'DiagnosticWarn' },
    DiagnosticSignInfo = { link = 'DiagnosticInfo' },
    DiagnosticSignHint = { link = 'DiagnosticHint' },

    DiagnosticUnderlineError = { link = 'DiagnosticError' },
    DiagnosticUnderlineWarn = { link = 'DiagnosticWarn' },
    DiagnosticUnderlineInfo = { link = 'DiagnosticInfo' },
    DiagnosticUnderlineHint = { link = 'DiagnosticHint' }
}

meadow.IndentBlankLineColors = {
    IndentBlanklineChar = { fg = c.Grey[1], opt = 'nocombine' },
    IndentBlanklineSpaceChar = { link = 'IndentBlanklineChar' },
    IndentBlanklineSpaceCharBlankline = { link = 'IndentBlanklineChar' }
}

meadow.SignifyColors = {
    SignifySignAdd = { fg = c.Green[1], opt = 'bold' },
    SignifySignDelete = { fg = c.Red[1], opt = 'bold' },
    SignifySignChange = { fg = c.Yellow[1], opt = 'bold' },
    SignifyLineAdd = { link = 'SignifySignAdd' },
    SignifyLineChange = { link = 'SignifyLineChange' },
    SignifyLineChangeDelete = { link = 'SignifyLineChange' },
    SignifyLineDelete = { link = 'SignifySignDelete' },
    SignifyLineDeleteFirstLine = { link = 'SignifySignDelete' },
    SignifySignChangeDelete = { link = 'SignifyLineChange' },
    SignifySignDeleteFirstLine = { link = 'SignifySignDelete' }
}

meadow.TelescopeColors = {
      -- selected item
    TelescopeSelection = { fg = c.Green[2], bg = c.GreyBg[1], opt = 'bold' },
     -- selection caret
    TelescopeSelectionCaret = { fg = c.Green[2], bg = c.GreyBg[1] },
    TelescopeMultiSelection = { link = 'TelescopeSelection' }, -- multisections
     -- floating windows created by telescope.
    TelescopeNormal = { fg = c.White[1], bg = c.Black[3] },

    -- Border highlight groups.
    TelescopeBorder = { fg = c.Grey[1], bg = c.Black[3] },
    TelescopePromptBorder = { link = 'TelescopeBorder' },
    TelescopeResultsBorder = { link = 'TelescopeBorder' },
    TelescopePreviewBorder = { link = 'TelescopeBorder' },

    -- Used for highlighting characters that you match.
    TelescopeMatching = { link = 'Search' },

    -- Used for the prompt prefix
    TelescopePromptPrefix = { fg = c.Green[2] }
}

function meadow.set_highlights(colors)
    for group, options in pairs(colors) do
        if options.link then
            vim.api.nvim_set_hl(0, group, {link = options.link})
        else
            local fg =
                meadow.hsv_to_rgb_hex(options.fg, meadow.ColorType.fg) or 'none'
            local bg =
                meadow.hsv_to_rgb_hex(options.bg, meadow.ColorType.bg) or 'none'
            if options.opt then
                vim.api.nvim_set_hl(0, group, {fg = fg, bg = bg, [options.opt] = true})
            else
                vim.api.nvim_set_hl(0, group, {fg = fg, bg = bg})
            end
        end
    end
end

function meadow.apply_colors(options)
    if not meadow.merge_options(options) then
        return
    end
    preprocess_colors()

    meadow.set_highlights(meadow.NvimColors)
    if meadow.options.indentblankline_colors then
        meadow.set_highlights(meadow.IndentBlankLineColors)
    end
    if meadow.options.telescope_colors then
        meadow.set_highlights(meadow.TelescopeColors)
    end
end

function meadow.set_brightness(new_value)
    meadow.apply_colors({color_value = new_value})
    meadow.log("brightness changed to " .. meadow.options.color_value)
end

function meadow.change_brightness(diff)
    local new_value = meadow.options.color_value + diff
    meadow.apply_colors({color_value = new_value})
    meadow.log("brightness changed to " .. meadow.options.color_value)
end

function meadow.set_contrast(new_value)
    meadow.apply_colors({color_saturation = new_value})
    meadow.log("contrast changed to " .. meadow.options.color_saturation)
end

function meadow.change_contrast(diff)
    local new_value = meadow.options.color_saturation + diff
    meadow.apply_colors({color_saturation = new_value})
    meadow.log("contrast changed to " .. meadow.options.color_saturation)
end

local function define_commands()
    vim.api.nvim_create_user_command(
        'MeadowChangeBrightness',
        function(params)
            require'meadow'.change_brightness(params.args)
        end,
        {nargs = 1}
    )
    vim.api.nvim_create_user_command(
        'MeadowSetBrightness',
        function(params)
            require'meadow'.set_brightness(params.args)
        end,
        {nargs = 1}
    )
    vim.api.nvim_create_user_command(
        'MeadowChangeContrast',
        function(params)
            require'meadow'.change_contrast(params.args)
        end,
        {nargs = 1}
    )
    vim.api.nvim_create_user_command(
        'MeadowSetConstrast',
        function(params)
            require'meadow'.set_contrast(params.args)
        end,
        {nargs = 1}
    )
end

function meadow.setup(options)
    if not meadow.options then
        meadow.options = vim.deepcopy(meadow.DEFAULT_OPTIONS)
    end
    if vim.fn.exists('syntax_on') then
        vim.api.nvim_command('syntax reset')
    end
    vim.o.background = 'dark'
    vim.o.termguicolors = true
    vim.g.colors_name = 'meadow-nvim'

    meadow.apply_colors(options)
    define_commands()
end

return meadow
