local wombat = {}

wombat.COLOR_VALUE = 75
wombat.COLOR_SATURATION = 60

local to_int = function(f)
    return math.floor(f + 0.5)
end

-- Hue should be in [0, 360]
-- Saturation and value should be in [0, 100]
wombat.hsv_to_rgb = function(hsv)
    local value = hsv[3] * 255 / 100
    local hue = hsv[1]
    local saturation = hsv[2] / 100

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

wombat.hsv_to_rgb_hex = function(hsv)
    if not hsv then
        return nil
    end
    if #hsv == 1 then
        table.insert(hsv, wombat.COLOR_SATURATION)
    end
    if #hsv == 2 then
        table.insert(hsv, wombat.COLOR_VALUE)
    end
    return wombat.rgb_to_hex(wombat.hsv_to_rgb(hsv))
end


wombat.ColorsHsv = {
    Black = { {0, 0, 3}, {0, 0, 14}, {0, 0, 19}, {0, 0, 24} },
    Grey =  { {0, 0, 26}, {0, 0, 34}, {0, 0, 44} },
    White = {0, 0, 75},

    Blue = { {202}, {178}, {195} },
    Green = { {101}, {90} },
    Red = { {3}, {5} },
    Violet = { 280},
    Yellow = { {65, }, {46, }, {60, } },
    Orange = { 34, },
    Pink = { 326, },

    DontKnow = { 179, 100, 100 },
}



local c = wombat.ColorsHsv

--[[
function wombat.set_terminal_colors()
    vim.g.terminal_color_0 = c.TermColor0
    vim.g.terminal_color_1 = c.TermColor1
    vim.g.terminal_color_2 = c.TermColor2
    vim.g.terminal_color_3 = c.TermColor3
    vim.g.terminal_color_4 = c.TermColor4
    vim.g.terminal_color_5 = c.TermColor5
    vim.g.terminal_color_6 = c.TermColor6
    vim.g.terminal_color_7 = c.TermColor7
    vim.g.terminal_color_8 = c.TermColor8
    vim.g.terminal_color_9 = c.TermColor9
    vim.g.terminal_color_10 = c.TermColor10
    vim.g.terminal_color_11 = c.TermColor11
    vim.g.terminal_color_12 = c.TermColor12
    vim.g.terminal_color_13 = c.TermColor13
    vim.g.terminal_color_14 = c.TermColor14
    vim.g.terminal_color_15 = c.TermColor15
end
]]--

wombat.nvim_colors = {
    ColorColumn = { bg = c.Black[3] },
    Conceal = { fg = c.White, bg = c.Grey[2] },
    Cursor = { opt = 'reverse' },
    lCursor = { link = 'Cursor' },
    CursorIM = { link = 'Cursor' },
    CursorColumn = { bg = c.Black[4] },
    CursorLine = { link = 'CursorColumn' },
    Directory = { fg = c.Blue[1] },
    DiffAdd = { fg = c.Green[1], opt = 'bold' },
    DiffChange = { fg = c.Yellow[1], opt = 'bold' },
    DiffDelete = { fg = c.Red[2], opt = 'bold' },
    DiffText = { fg = c.DontKnow, opt = 'bold' },
    EndOfBuffer = { bg = c.Black[1] },
    ErrorMsg = { fg = c.Red[1], bg = c.Black[1] },
    Folded = { bg = c.Grey[2] },
    FoldColumn = { bg = c.Grey[2] },
    LineNr = { fg = c.Grey[2], bg = c.Black[1] },
    CursorLineNr = { fg = c.Yellow[1], opt = 'bold' },
    MatchParen	= { bg = c.Grey[2], opt = 'bold' },
    ModeMsg = { },
    MsgArea	= { link = 'Normal' },
    MsgSeparator = { bg = c.Grey[1] },
    MoreMsg	= { fg = c.Green[2] },
    NonText	= { fg = c.Grey[2] },
    Normal = { fg = c.White, bg = c.Black[2] },
    NormalFloat	= { fg = c.White, bg = c.Grey[1] },
    NormalNC = { link = 'Normal' },
    Pmenu = { fg = c.Yellow[3], bg = c.Grey[1] },
    PmenuSel = { fg = c.Black[1], bg = c.Green[2] },
    PmenuSbar = { bg = c.Grey[2] },
    PmenuThumb = { bg = c.White },
    Question = { link = 'MoreMsg' },
    Search = { fg = c.Violet, bg = c.Grey[2] },
    IncSearch = { link = 'Search' },QuickFixLine = { opt = 'bold' },
    SignColumn = { bg = c.Black[3] },
    SpecialKey = { fg = c.Grey[3] },
    SpellBad = { bg = c.Red[2], opt = 'underline'},
    SpellCap = { link = 'SpellBad' },
    SpellLocal = {},
    SpellRare = {},
    StatusLine = { fg = c.White, bg = c.Black[1] },
    StatusLineNC = { fg = c.Grey[1], bg = c.Black[1] },
    Substitute = { link = 'Search' },
    TabLine = { fg = c.Green[2], bg = c.Grey[1] },
    TabLineFill = { fg = c.Green[2], bg = c.Black[3]},
    TabLineSel = { opt = 'bold' },
    TermCursor = { link = 'Cursor' },
    TermCursorNC = { link = 'Cursor' },
    VertSplit = { fg = c.Black[1], bg = c.Black[1] },
    Visual = { fg = c.Grey[2], bg = c.Green[1] },
    VisualNOS = { link = 'Visual' },
    WarningMsg = { bg = c.Yellow[1] },
    Whitespace = { fg = c.Blue[2], bg = c.Grey[2] },
    WildMenu = { link = 'PmenuSel' },


    Debug = {},
    debugBreakpoint = { fg = c.Red[2] },

    Boolean = { fg = c.Red[2] },
    Number = { fg = c.Red[2] },
    Float = { link = 'Number' },
    String = { fg = c.Green[1], opt = 'italic'},
    Character = { link = 'String' },
    Constant = { fg = c.Red[1] },

    TSVariable = { link = 'Normal' },
    TSNamespace = { fg = c.Red[1] },
    Function = { fg = c.Green[1], opt = 'bold' },
    Identifier = { fg = c.Yellow[2] },
    --TSField = {}, -- Identifier
    --TSParameter = {}, -- Identifier
    Type = { fg = c.Green[2] },
    TSAnnotation = { fg = c.Yellow[3] },
    TSParameterReference = {fg = c.Green[2], opt = 'italic' },

    --TSPunctBracket = {}, -- Delimiter
    --TSStringEscape = {}, -- SpecialChar
    Special = { fg = c.Yellow[3] },
    SpecialChar = { fg = c.Orange },
    Delimiter = { fg = c.Yellow[2] },
    Operator = { fg = c.Blue[2] },

    Keyword = { fg = c.Blue[2] },
    Include = { fg = c.Blue[1] },
    Conditional = { fg = c.Blue[2] },
    PreCondit = { fg = c.Blue[2] },
    Repeat = { fg = c.Blue[2] }, -- loops related
    Define = { fg = c.Blue[1] },
    Macro = { fg = c.Blue[1] },
    Statement = { fg = c.Blue[1] },
    PreProc = { fg = c.Red[2] },
    Typedef = { fg = c.Blue[3] },

    TSURI = { fg = c.Blue[1], opt = 'underline' },
    Exception = { fg = c.Yellow[3] },
    Error = { fg = c.Red[1] },
    StorageClass = { fg = c.Yellow[3] },
    Tag = { fg = c.Orange },
    Label = { fg = c.Orange },
    Structure = { fg = c.Green[1] },
    Title = { fg = c.Green[2], opt = 'bold' },

    Comment = { fg = c.Grey[2] },
    SpecialComment = { fg = c.Grey[1] },
    Todo = { fg = c.Yellow[1] },
    Ignore = { fg = c.Grey[1] },
    Underlined = { opt = 'underline' },
}

wombat.TreeSitterColors = {
}

function wombat.apply_colors(colors)
    for group, options in pairs(colors) do
        local cmd = ''
        if options.link then
            cmd = 'hi! link ' .. group .. ' ' .. options.link
        else
            local fg = wombat.hsv_to_rgb_hex(options.fg) or 'none'
            local bg = wombat.hsv_to_rgb_hex(options.bg) or 'none'
            local opt = options.opt or 'none'
            cmd = 'hi ' .. group ..
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
    --wombat.set_terminal_colors()
    wombat.apply_colors(wombat.nvim_colors)
end

return wombat
