local wombat = {}
wombat.Colors = {
    Black = {'#080808', '#242424', '#303030', '#32322f'},

    Grey = {'#444444', '#565656', '#c3c6ca'},

    White = '#e3e0d7',

    Blue = {'#4281A4', '#48A9A6', '#308dad'},
    Green = {'#B1C456', '#71bb3e'},
    Red = {'#ff5f55', '#e5786d'},
    Violet = '#d787ff',
    Yellow = {'#e1f426', '#f1d477', '#ffffd7' },
    Orange = '#E68D1C',

    DontKnow = '#00FFFB',

    None = 'none',

    --[[
    TermColor0 = '#222222',
    TermColor1 = '#880000',
    TermColor2 = '#008800',
    TermColor3 = '',
    TermColor4 = '',
    TermColor5 = '',
    TermColor6 = '',
    TermColor7 = '',
    TermColor8 = '',
    TermColor9 = '',
    TermColor10 = '',
    TermColor11 = '',
    TermColor12 = '',
    TermColor13 = '',
    TermColor14 = '',
    TermColor15 = '',
    ]]--
}

local c = wombat.Colors

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
    Cursor = { fg = c.None, bg = c.None, opt = 'reverse'},
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
    PreProc = { fg = c.Red[2] },
    Type = { fg = c.Green[2] },

    TSAnnotation = { fg = c.Yellow[3] },
    TSNamespace = { fg = c.Yellow[3] },
    Function = { fg = c.Green[1], opt = 'bold' },
    Identifier = { fg = c.Yellow[2] },
    --TSField = {}, -- Identifier
    --TSParameter = {}, -- Identifier
    TSParameterReference = {fg = c.Green[2], opt = 'italic' },
    TSVariable = { link = 'Normal' },

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

    TSURI = { fg = c.Blue[1], opt = 'underline' },
    Typedef = { fg = c.Blue[3] },
    Exception = { fg = c.Yellow[3] },
    Error = { fg = c.Red[1] },
    StorageClass = { fg = c.Yellow[3] },
    Tag = { fg = c.Orange },
    Label = { fg = c.Orange },
    Structure = { fg = c.Green[1] },
    Title = { fg = c.Green[2], opt = 'bold' },

    Comment = { fg = c.Grey[3] },
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
            local fg = options.fg or c.None
            local bg = options.bg or c.None
            local opt = options.opt or c.None
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
