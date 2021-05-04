local wombat = {}
wombat.Colors  = {
    BlackDark = '#080808',
    Black = '#242424',
    BlackLight = '#303030',
    BlackMoreLight = '#32322f',

    GreyDark = '#554d4b',
    Grey = '#c3c6ca',

    White = '#e3e0d7',

    BlueLight = '',
    GreenLight = '#5FFF55',
    Green = '#589200',
    RedLight = '#ff5f55',
    Violet = '#d787ff',
    YellowLight = '#E1F426',
    Yellow = '#eae788',

    DontKnow = '#00FFFB',

    None = 'none',

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
}

local c = wombat.Colors

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

wombat.nvim_colors = {
    ColorColumn = { bg = c.BlackLight },
    Conceal = { fg = c.White, bg = c.Grey },
    Cursor = { fg = c.None, bg = c.None, opt = 'reverse'},
    lCursor = { link = 'Cursor' },
    CursorIM = { link = 'Cursor' },
    CursorColumn = { bg = c.BlackMoreLight },
    CursorLine = { link = 'CursorColumn' },
    Directory = { bg = c.DontKnow },
    DiffAdd = { bg = c.Green },
    DiffChange = { bg = c.YellowLight },
    DiffDelete = { bg = c.RedLight },
    DiffText = { bg = c.DontKnow },
    EndOfBuffer = { bg = c.BlackDark },
    ErrorMsg = { bg = c.Black, fg = c.RedLight },
    Normal = { fg = c.White, bg = c.Black },
    TermCursor = { link = 'Cursor' },
    TermCursorNC = { link = 'Cursor' },
    VertSplit = { fg = c.BlackDark, bg = c.BlackDark },
    Visual = { fg = c.Grey, bg = c.GreyDark },
    VisualNOS = { link = 'Visual' },
    Search = { fg = c.Violet, bg = c.BlackMoreLight }

    --[[
VertSplit	
Folded		
FoldColumn	
SignColumn	
IncSearch	
Substitute	
LineNr		
CursorLineNr	
MatchParen	
ModeMsg		
MsgArea		
MsgSeparator	
MoreMsg		
NonText		
Normal		
NormalFloat	
NormalNC	
Pmenu		
PmenuSel	
PmenuSbar	
PmenuThumb	
Question	
QuickFixLine	
Search		
SpecialKey	
SpellBad	
SpellCap	
SpellLocal	
SpellRare	
StatusLine	
StatusLineNC	
TabLine		
TabLineFill	
TabLineSel	
Title		
Visual		
VisualNOS	
WarningMsg	
Whitespace	
WildMenu	
]]--

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

function wombat.apply_colorscheme()
    vim.api.nvim_command('highlight clear')
    if vim.fn.exists('syntax_on') then
        vim.api.nvim_command('syntax reset')
    end
    vim.o.background = 'dark'
    vim.o.termguicolors = true
    vim.g.colors_name = 'wombat-nvim'
    wombat.set_terminal_colors()
    wombat.apply_colors(wombat.nvim_colors)
end

wombat.apply_colorscheme()

return wombat
