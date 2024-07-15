local M = {}

local make_highlights = function(c)
  -- The list of higlights and comments were originally taken from https://github.com/folke/tokyonight.nvim and then modified.
  local highlights = {
    Comment = { fg = c.grey },               -- any comment
    ColorColumn = { bg = c.grey_bg1 },       -- used for the columns set with 'colorcolumn'
    Conceal = { fg = c.white }, -- placeholder characters substituted for concealed text (see 'conceallevel')
    Cursor = { reverse = true },             -- character under the cursor
    lCursor = { link = 'Cursor' },           -- the character under the cursor when |language-mapping| is used (see 'guicursor')
    CursorIM = { link = 'Cursor' },          -- like Cursor, but used when in IME mode |CursorIM|
    CursorColumn = { link = 'ColorColumn' }, -- Screen-column at the cursor, when 'cursorcolumn' is set.
    CursorLine = { link = 'CursorColumn' },  -- Screen-line at the cursor, when 'cursorline' is set.  Low-priority if foreground (ctermfg OR guifg) is not set.
    Directory = { fg = c.blue1 },            -- directory names (and other special names in listings)
    DiffAdd = { bg = c.green2 },             -- diff mode: Added line |diff.txt|
    DiffChange = { bg = c.yellow2 },         -- diff mode: Changed line |diff.txt|
    DiffDelete = { bg = c.red2 },            -- d:f mode: Deleted line |diff.txt|
    DiffText = { bg = c.orange },            -- diff mode: Changed text within a changed line |diff.txt|
    EndOfBuffer = { link = 'Normal' },       -- filler lines (~) after the end of the buffer.  By default, this is highlighted like |hl-NonText|.
    -- TermCursor  = {}, -- cursor in a focused terminal
    -- TermCursorNC= {}, -- cursor in an unfocused terminal
    ErrorMsg = { fg = c.red1, bg = c.black1 },                     -- error messages on the command line
    VertSplit = { fg = c.grey },                                   -- the column separating vertically split windows
    WinSeparator = { fg = c.grey },                                -- the column separating vertically split windows
    Folded = { bg = c.grey_bg2 },                                  -- line used for closed folds
    FoldColumn = { bg = c.grey_bg2 },                              -- 'foldcolumn'
    SignColumn = { bg = c.black3 },                                -- column where |signs| are displayed
    SignColumnSB = { fg = c.violet },                              -- column where |signs| are displayed
    Substitute = { bg = c.yellow2 },                               -- |:substitute| replacement text highlighting
    LineNr = { fg = c.grey, bg = c.black3 },                       -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
    CursorLineNr = { fg = c.yellow1, bg = c.black3, bold = true }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
    MatchParen = { bg = c.yellow1, bold = true },                  -- The character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
    ModeMsg = { link = 'Normal' },                                 -- 'showmode' message (e.g., "-- INSERT -- ")
    MsgArea = { link = 'Normal' },                                 -- Area for messages and cmdline
    MsgSeparator = { link = 'LineNr' },                            -- Separator for scrolled messages, `msgsep` flag of 'display'
    MoreMsg = { fg = c.green2 },                                   -- |more-prompt|
    NonText = { fg = c.grey },                                     -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
    Normal = { fg = c.white, bg = c.black3 },                      -- normal text
    NormalNC = { link = 'Normal' },                                -- normal text in non-current windows
    NormalSB = { link = 'Normal' },                                -- normal text in sidebar
    NormalFloat = { fg = c.white, bg = c.grey_bg1 },                             -- Normal text in floating windows.
    FloatBorder = { fg = c.grey },
    FloatTitle = { link = 'Title' },
    Pmenu = { fg = c.white, bg = c.grey_bg1 },                  -- Popup menu: normal item. menu
    PmenuSel = { fg = c.green2, bg = c.grey_bg2, bold = true }, -- Popup menu: selected item.
    PmenuSbar = { bg = c.grey_bg2 },                            -- Popup menu: scrollbar.
    PmenuThumb = { bg = c.white },                              -- Popup menu: Thumb of the scrollbar.
    Question = { link = 'MoreMsg' },                            -- |hit-enter| prompt and yes/no questions
    QuickFixLine = { bold = true },                             -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
    Search = { bg = c.violet },                                 -- Last search pattern highlighting (see 'hlsearch').  Also used for similar items that need to stand out.
    IncSearch = { link = 'Search' },                            -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
    CurSearch = {},
    SpecialKey = { fg = c.grey },                               -- Unprintable characters: text displayed differently from what it really is.  But not 'listchars' whitespace. |hl-Whitespace|
    SpellBad = { sp = c.white, undercurl = true },              -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
    SpellCap = { link = 'SpellBad' },                           -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
    SpellLocal = { link = 'SpellBad' },                         -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
    SpellRare = { link = 'SpellBad' },                          -- Word that is recognized by the spellchecker as one that is hardly ever used.  |spell| Combined with the highlighting used otherwise.
    StatusLine = { fg = c.white, bg = c.black2 },               -- status line of current window
    StatusLineNC = { fg = c.grey, bg = c.black2 },          -- status lines of not-current windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
    TabLine = { fg = c.white, bg = c.black4 },                  -- tab pages line, not active tab page label
    TabLineFill = { fg = c.green2, bg = c.black4 },             -- tab pages line, where there are no labels
    TabLineSel = { fg = c.green2, bold = true },                -- tab pages line, active tab page label
    Title = { fg = c.green2, bold = true },                     -- titles for output from ":set all", ":autocmd" etc.
    Visual = { bg = c.violet },                                 -- Visual mode selection
    VisualNOS = { link = 'Visual' },                            -- Visual mode selection when vim is "Not Owning the Selection".
    WarningMsg = { bg = c.yellow1 },                            -- warning messages
    Whitespace = { link = 'Normal' },                           -- "nbsp", "space", "tab" and "trail" in 'listchars'
    WildMenu = { link = 'PmenuSel' },                           -- current match in 'wildmenu' completion

    -- These groups are not listed as default vim groups,
    -- but they are defacto standard group names for syntax highlighting.
    -- commented out groups should chain up to their "preferred" group by
    -- default,
    -- Uncomment and edit if you want more specific syntax highlighting.

    Constant = { fg = c.red1 },                -- (preferred) any constant
    String = { fg = c.green1, italic = true }, --   a string constant: "this is a string"
    Character = { link = 'String' },           --  a character constant: 'c', '\n'
    -- Number        = {}, --   a number constant: 234, 0xff
    -- Boolean       = {}, --  a boolean constant: TRUE, false
    -- Float         = {}, --    a floating point constant: 2.3e10

    Identifier = { fg = c.yellow2, italic = true }, -- (preferred) any variable name
    Function = { fg = c.green1, bold = true },      -- function name (also: methods for classes)

    Statement = { fg = c.blue1 },                   -- (preferred) any statement
    -- Conditional   = {}, --  if, then, else, endif, switch, etc.
    -- Repeat        = {}, --   for, do, while, etc.
    -- Label         = {}, --    case, default, etc.
    Operator = { fg = c.blue3 }, -- "sizeof", "+", "*", etc.
    Keyword = { fg = c.blue3 },  --  any other keyword
    -- Exception     = {}, --  try, catch, throw

    PreProc = { fg = c.blue1 }, -- (preferred) generic Preprocessor
    -- Include       = {}, --  preprocessor #include
    -- Define        = {}, --   preprocessor #define
    -- Macro         = {}, --    same as Define
    -- PreCondit     = {}, --  preprocessor #if, #else, #endif, etc.

    Type = { fg = c.green2 }, -- (preferred) int, long, char, etc.
    -- StorageClass  = {}, -- static, register, volatile, etc.
    -- Structure     = {}, --  struct, union, enum, etc.
    -- Typedef       = {}, --  A typedef

    Special = { fg = c.yellow1 }, -- (preferred) any special symbol
    -- SpecialChar   = {}, --  special character in a constant
    -- Tag           = {}, --    you can use CTRL-] on this
    -- Delimiter     = {}, --  character that needs attention
    -- SpecialComment= {}, -- special things inside a comment
    Debug = { bg = c.red2 },                         --    debugging statements

    Underlined = { fg = c.blue1, underline = true }, -- (preferred) text that stands out, HTML links
    Bold = { bold = true },
    Italic = { italic = true },

    -- ("Ignore", below, may be invisible...)
    -- Ignore = {}, -- (preferred) left blank, hidden  |hl-Ignore|

    Error = { fg = c.red1 },   -- (preferred) any erroneous construct
    Todo = { fg = c.yellow1 }, -- (preferred) anything that needs extra attention; mostly the keywords TODO FIXME and XXX

    qfLineNr = { fg = c.blue2 },
    qfFileName = { fg = c.blue1 },

    -- htmlH1 = {},
    -- htmlH2 = {},

    -- mkdHeading = {},
    -- mkdCode = {},
    -- mkdCodeDelimiter = {},
    -- mkdCodeStart = {},
    -- mkdCodeEnd = {},
    -- mkdLink = {},

    -- markdownHeadingDelimiter = {},
    -- markdownCode = {},
    -- markdownCodeBlock = {},
    -- markdownH1 = {},
    -- markdownH2 = {},
    -- markdownLinkText = {},

    -- ['helpCommand'] = {},

    -- debugPC = {}, -- used for highlighting the current line in terminal-debug
    debugBreakpoint = { fg = c.red2 }, -- used for breakpoint colors in terminal-debug

    -- These groups are for the native LSP client. Some other LSP clients may
    -- use these groups, or use their own. Consult your LSP client's
    -- documentation.
    LspReferenceText = { fg = c.blue1 },                       -- used for highlighting "text" references
    LspReferenceRead = { link = 'LspReferenceText' },          -- used for highlighting "read" references
    LspReferenceWrite = { link = 'LspReferenceText' },         -- used for highlighting "write" references

    DiagnosticError = { fg = c.red1 },                         -- Used as the base highlight group. Other Diagnostic highlights link to this by default
    DiagnosticWarn = { fg = c.orange },                        -- Used as the base highlight group. Other Diagnostic highlights link to this by default
    DiagnosticInfo = { fg = c.blue1 },                         -- Used as the base highlight group. Other Diagnostic highlights link to this by default
    DiagnosticHint = { fg = c.white },                         -- Used as the base highlight group. Other Diagnostic highlights link to this by default
    DiagnosticUnnecessary = { fg = c.grey },                   -- Used as the base highlight group. Other Diagnostic highlights link to this by default

    DiagnosticVirtualTextError = { link = 'DiagnosticError' }, -- Used for "Error" diagnostic virtual text
    DiagnosticVirtualTextWarn = { link = 'DiagnosticWarn' },   -- Used for "Warning" diagnostic virtual text
    DiagnosticVirtualTextInfo = { link = 'DiagnosticInfo' },   -- Used for "Information" diagnostic virtual text
    DiagnosticVirtualTextHint = { link = 'DiagnosticHint' },   -- Used for "Hint" diagnostic virtual text

    DiagnosticUnderlineError = { sp = c.red1, undercurl = true },   -- Used to underline "Error" diagnostics
    DiagnosticUnderlineWarn = { sp = c.orange, undercurl = true },     -- Used to underline "Warning" diagnostics
    DiagnosticUnderlineInfo = { sp = c.blue1, undercurl = true },     -- Used to underline "Information" diagnostics
    DiagnosticUnderlineHint = { sp = c.white, undercurl = true },     -- Used to underline "Hint" diagnostics

    LspSignatureActiveParameter = { bg = c.green2, bold = true },
    LspCodeLens = { fg = c.grey, bg = c.yellow2 },
    LspInlayHint = {},

    DapStoppedLine = { bg = c.blue1 }, -- Used for "Warning" diagnostic virtual text

    -- These groups are for the Neovim tree-sitter highlights.
    -- As of writing, tree-sitter support is a WIP, group names may change.

    --- Misc
    ['@comment'] = { link = 'Comment' },
    ["@comment.documentation"] = {},
    ['@comment.error'] = { fg = c.red1, bold = true },  -- error-type comments (e.g. `ERROR`, `FIXME`, `DEPRECATED`)
    ['@comment.warning'] = { fg = c.yellow1, bold = true},  -- warning-type comments (e.g. `WARNING`, `FIX`, `HACK`)
    ['@comment.todo'] = { fg = c.yellow1, bold = true },  -- todo-type comments (e.g. `TODO`, `WIP`)
    ['@comment.note'] = { fg = c.blue2, bold = true },  -- note-type comments (e.g. `NOTE`, `INFO`, `XXX`)

    ['@operator'] = { link = 'Operator' }, -- For any operator: `+`, but also `->` and `*` in C.

    --- Punctuation
    ['@punctuation.delimiter'] = { link = 'Special' }, -- For delimiters ie: `.`
    ['@punctuation.bracket'] = { link = 'Special' },   -- For brackets and parens.
    ['@punctuation.special'] = { link = 'Special' },   -- For special punctutation that does not fall in the catagories before.
    ['@punctuation.special.markdown'] = { link = 'Special' },

    --- Literals
    ['@string'] = { link = 'String' },
    ['@string.documentation'] = { link = 'Comment' },
    ['@string.regex'] = { link = 'Special' },  -- For regexes.
    ['@string.escape'] = { link = 'Special' }, -- For escape characters within a string.
    ['@string.special'] = { link = 'Special' },  -- For regexes.

    ['@character'] = { link = 'String' },
    ['@character.special'] = { link = 'Special' },

    ['@boolean'] = { link = 'Boolean'},
    ['@number'] = { link = 'Number' },

    --- Functions
    ['@constructor'] = { fg = c.green2, bold = true },  -- For constructor calls and definitions: `= { }` in Lua, and Java constructors.
    ['@parameter'] = { fg = c.yellow1, italic = true }, -- For parameters of a function.
    ['@parameter.builtin'] = { link = '@parameter' },   -- For builtin parameters of a function, e.g. "..." or Smali's p[1-99]
    ['@function.builtin'] = { link = '@function' },

    --- Keywords
    ['@keyword'] = { fg = c.blue3 }, -- For keywords that don't fall in previous categories.
    ["@keyword.coroutine"] = { link = '@keyword'}, -- For keywords related to coroutines.
    ['@keyword.function'] = { link = '@keyword' }, -- For keywords used to define a function.

    ['@label'] = { link = 'Statement' },           -- For labels: `label:` in C and `:label:` in Lua.

    --- Types
    ['@type'] = { fg = c.green1 },
    ['@type.builtin'] = { link = '@type' },
    ['@type.definition'] = { link = 'Variable' },
    ['@field'] = { link = 'Identifier', italic = true }, -- For fields.
    ['@attribute'] = { link = '@variable' },
    ['@property'] = { link = '@field' },

    --- Identifiers
    ['@variable'] = { fg = c.white },           -- Any variable name that does not have another highlight.
    ['@variable.builtin'] = { fg = c.yellow1 }, -- Variable names that are defined by the languages, like `this` or `self`.
    ['@variable.parameter'] = { link = '@parameter' },
    ['@variable.parameter.builtin'] = { link = '@parameter.builtin' },
    ['@variable.member'] = { link = '@field' },

    ['@constant'] = { link = 'Constant' }, -- constant identifiers
    ['@constant.builtin'] = { link = 'Constant' }, -- built-in constant values
    ['@constant.macro'] = { link = 'Macro' }, -- constants defined by the preprocessor

    ['@module'] = { link = '@namespace' },
    ['@module.builtin'] = { link = '@namespace' },

    -- Markup
    ['@markup.strong'] = { bold = true },  -- bold text
    ['@markup.italic'] = { italic = true },  -- italic text
    ['@markup.strikethrough'] = { strikethrough = true },  -- struck-through text
    ['@markup.underline'] = { underline = true },  -- underlined text (only for literal underline markup!)

    ['@markup.heading'] = { fg = c.green1, bold = true },
    ['@markup.heading.1'] = { fg = c.green1, bold = true },
    ['@markup.heading.2'] = { fg = c.yellow2, bold = true },
    ['@markup.heading.3'] = { fg = c.green2, bold = true },
    ['@markup.heading.4'] = { fg = c.yellow1, bold = true },
    ['@markup.heading.5'] = { fg = c.orange, bold = true },
    ['@markup.heading.6'] = { fg = c.red1, bold = true },

    ['@markup.quote'] = { fg = c.yellow1 },  -- block quotes
    ['@markup.math'] = { fg = c.blue2 },  -- math environments (e.g. `$ ... $` in LaTeX)

    ['@markup.link'] = { link = 'Link'},  -- text references, footnotes, citations, etc.
    ['@markup.link.label'] = { fg = c.blue2 },  -- link, reference descriptions
    ['@markup.link.url'] = {fg = c.blue1, underline = true },  -- URL-style links

    ['@markup.raw'] = { fg = c.green1 },  -- literal or verbatim text (e.g. inline code)
    ['@markup.raw.block'] = { fg = c.green1 },  -- literal or verbatim text as a stand-alone block
                           -- (use priority 90 for blocks with injections)

    ['@markup.list'] = { fg = c.green2, bold = true },  -- list markers
    ['@markup.list.checked'] = { fg = c.green2, bold = true },  -- checked todo-style list markers
    ['@markup.list.unchecked'] = { fg = c.yellow1, bold = true },  -- unchecked todo-style list markers
    --- Text
    -- ["@text.literal.markdown"] = {},
    ['@text.literal.markdown_inline'] = {},
    ['@text.reference'] = { fg = c.blue1, underline = true },

    -- TODO: test
    ['@text.todo'] = { link = 'Todo' },            -- For brackets and parens.
    ['@text.todo.unchecked'] = { fg = c.yellow2 }, -- For brackets and parens.
    ['@text.todo.checked'] = { fg = c.green1 },    -- For brackets and parens.
    ['@text.warning'] = { bg = c.yellow2 },
    ['@text.danger'] = { bg = c.red2 },

    ['@text.diff.add'] = { bg = c.green2 },
    ['@text.diff.delete'] = { bg = c.red2 },

    ['@namespace'] = { fg = c.blue3 },

    -- tsx
    ['@tag.tsx'] = {},
    ['@constructor.tsx'] = {},
    ['@tag.delimiter.tsx'] = {},

    -- LSP Semantic Token Groups
    ['@lsp.type.boolean'] = { link = '@boolean' },
    ['@lsp.type.builtinType'] = { link = '@type.builtin' },
    ['@lsp.type.comment'] = { link = '@comment' },
    ['@lsp.type.decorator'] = { link = '@attribute' },
    ['@lsp.type.deriveHelper'] = { link = '@attribute' },
    ['@lsp.type.enum'] = { link = '@type' },
    ['@lsp.type.enumMember'] = { link = '@constant' },
    ['@lsp.type.escapeSequence'] = { link = '@string.escape' },
    ['@lsp.type.formatSpecifier'] = { link = '@punctuation.special' },
    ['@lsp.type.generic'] = { link = '@variable' },
    ['@lsp.type.interface'] = { link = 'Type' },
    ['@lsp.type.keyword'] = { link = '@keyword' },
    ['@lsp.type.lifetime'] = { link = '@storageclass' },
    ['@lsp.type.namespace'] = { link = '@namespace' },
    ['@lsp.type.number'] = { link = '@number' },
    ['@lsp.type.operator'] = { link = '@operator' },
    ['@lsp.type.parameter'] = { link = '@parameter' },
    ['@lsp.type.property'] = { link = '@property' },
    ['@lsp.type.selfKeyword'] = { link = '@variable.builtin' },
    ['@lsp.type.selfTypeKeyword'] = { link = '@variable.builtin' },
    ['@lsp.type.string'] = { link = '@string' },
    ['@lsp.type.typeAlias'] = { link = '@type.definition' },
    ['@lsp.type.typeParameter'] = { link = '@lsp.type.generic' },
    ['@lsp.type.unresolvedReference'] = { fg = c.red2, undercurl = true },
    ['@lsp.type.variable'] = { link = '@variable' }, -- use treesitter styles for regular variables
    ['@lsp.typemod.class.defaultLibrary'] = { link = '@type.builtin' },
    ['@lsp.typemod.enum.defaultLibrary'] = { link = '@type.builtin' },
    ['@lsp.typemod.enumMember.defaultLibrary'] = { link = '@constant.builtin' },
    ['@lsp.typemod.function.defaultLibrary'] = { link = '@function.builtin' },
    ['@lsp.typemod.keyword.async'] = { link = '@keyword.coroutine' },
    ['@lsp.typemod.keyword.injected'] = { link = '@keyword' },
    ['@lsp.typemod.macro.defaultLibrary'] = { link = '@function.builtin' },
    ['@lsp.typemod.method.defaultLibrary'] = { link = '@function.builtin' },
    ['@lsp.typemod.operator.injected'] = { link = '@operator' },
    ['@lsp.typemod.string.injected'] = { link = '@string' },
    ['@lsp.typemod.struct.defaultLibrary'] = { link = '@type.builtin' },
    ['@lsp.typemod.type.defaultLibrary'] = { link = '@type.builtin' },
    ['@lsp.typemod.typeAlias.defaultLibrary'] = { link = 'Type' },
    ['@lsp.typemod.variable.callable'] = { link = '@function' },
    ['@lsp.typemod.variable.defaultLibrary'] = { link = '@variable.builtin' },
    ['@lsp.typemod.variable.injected'] = { link = '@variable' },
    ['@lsp.typemod.variable.static'] = { link = '@constant' },
    -- NOTE: maybe add these with distinct highlights?
    -- ["@lsp.typemod.variable.globalScope"] (global variables)

    -- Markdown
    ['@text.title.1.markdown'] = { fg = c.green1, bold = true },
    ['@text.title.2.markdown'] = { fg = c.yellow2, bold = true },
    ['@text.title.3.markdown'] = { fg = c.green2, bold = true },
    ['@text.title.4.markdown'] = { fg = c.yellow1, bold = true },
    ['@text.title.5.markdown'] = { fg = c.orange, bold = true },
    ['@text.title.6.markdown'] = { fg = c.red1, bold = true },

    RainbowRed = { fg = c.red1 },
    RainbowYellow = { fg = c.yellow1 },
    RainbowBlue = { fg = c.blue1 },
    RainbowOrange = { fg = c.orange },
    RainbowGreen = { fg = c.green1 },
    RainbowViolet = { fg = c.violet },
    RainbowCyan = { fg = c.blue3 },

    -- rainbow-delimiters
    RainbowDelimiterRed = { link = 'RainbowRed' },
    RainbowDelimiterOrange = { link = 'RainbowOrange' },
    RainbowDelimiterYellow = { link = 'RainbowYellow' },
    RainbowDelimiterGreen = { link = 'RainbowGreen' },
    RainbowDelimiterBlue = { link = 'RainbowBlue' },
    RainbowDelimiterViolet = { link = 'RainbowViolet' },
    RainbowDelimiterCyan = { link = 'RainbowCyan' },

    -- diff
    diffAdded = { bg = c.green2 },
    diffRemoved = { bg = c.red1 },
    diffChanged = { bg = c.yellow1 },
    diffOldFile = { link = 'diffRemoved' },
    diffNewFile = { link = 'diffAdded' },
    diffFile = {},
    diffLine = {},
    diffIndexLine = {},

    -- Neogit
    NeogitBranch = { fg = c.green1, bold = true },
    NeogitRemote = { fg = c.green2, bold = true },

    NeogitHunkHeader = { fg = c.blue1, bold = true },
    NeogitDiffAdd = { fg = c.white, bg = c.green1 },
    NeogitDiffDelete = { fg = c.white, bg = c.red1 },
    NeogitDiffContext = { bg = c.black3 },
    NeogitDiffHeader = { bg = c.blue3 },

    NeogitHunkHeaderHighlight = { fg = c.blue1, bg = c.grey_bg2 },
    NeogitDiffContextHighlight = { link = 'NeogitDiffContext' },
    NeogitDiffAddHighlight = { link = 'NeogitDiffAdd' },
    NeogitDiffDeleteHighlight = { link = 'NeogitDiffDelete' },
    NeogitDiffHeaderHighlight = { link = 'NeogitDiffHeader' },

    NeogitCursorLine = { bg = c.grey_bg2 },

    -- ChatGPT.nvim
    ChatGPTQuestion = { fg = c.green1 },
    ChatGPTWelcome = { fg = c.green2 },

    -- GitSigns
    GitSignsAdd = { fg = c.green1 },     -- diff mode: Added line |diff.txt|
    GitSignsChange = { fg = c.yellow1 }, -- diff mode: Changed line |diff.txt|
    GitSignsDelete = { fg = c.red1 },    -- diff mode: Deleted line |diff.txt|

    -- Telescope
    TelescopeBorder = { fg = c.grey },
    TelescopeSelection = { link = 'CursorLine' },
    TelescopeMatching = { fg = c.green2 },

    -- Cmp
    CmpDocumentation = {},
    CmpDocumentationBorder = { fg = c.grey },
    CmpGhostText = { fg = c.grey },

    CmpItemAbbr = { fg = c.white },
    CmpItemAbbrDeprecated = { link = 'CmpItemAbbr' },
    CmpItemAbbrMatch = { fg = c.green2 },
    CmpItemAbbrMatchFuzzy = { link = 'CmpItemAbbrMatch' },

    CmpItemMenu = { fg = c.blue1 },

    CmpItemKindDefault = { fg = c.yellow1 },

    CmpItemKindKeyword = { link = '@keyword' },

    CmpItemKindVariable = { link = '@variable' },
    CmpItemKindConstant = { link = '@constant' },
    CmpItemKindReference = { link = '@variable' },
    CmpItemKindValue = { link = '@number' },
    CmpItemKindCopilot = { fg = c.blue2 },

    CmpItemKindFunction = { link = '@function' },
    CmpItemKindMethod = { link = '@funcion' },
    CmpItemKindConstructor = { link = '@constructor' },
    CmpItemKindText = { fg = c.yellow1 },

    CmpItemKindClass = { link = 'Type' },
    CmpItemKindInterface = { link = 'Type' },
    CmpItemKindStruct = { link = 'Type' },
    CmpItemKindEvent = { link = 'Type' },
    CmpItemKindEnum = { link = 'Type' },
    CmpItemKindUnit = { link = 'PreProc' },
    CmpItemKindModule = { link = 'PreProc' },

    CmpItemKindProperty = { link = '@property' },
    CmpItemKindField = { link = '@field' },
    CmpItemKindTypeParameter = { link = '@parameter' },
    CmpItemKindEnumMember = { link = 'Type' },
    CmpItemKindOperator = { link = '@operator' },
    CmpItemKindSnippet = { fg = c.blue1 },

    -- Noice

    -- Indent-blank line
    IblIndent = { fg = c.grey_bg1 },
    IblScope = { link = 'Comment' },
    Hlargs = {},
  }

  if not vim.diagnostic then
    local severity_map = {
      Error = 'Error',
      Warn = 'Warning',
      Info = 'Information',
      Hint = 'Hint',
    }
    local types = { 'Default', 'VirtualText', 'Underline' }
    for _, type in ipairs(types) do
      for snew, sold in pairs(severity_map) do
        highlights['LspDiagnostics' .. type .. sold] = {
          link = 'Diagnostic' .. (type == 'Default' and '' or type) .. snew,
        }
      end
    end
  end
  return highlights
end

local unwrapOptions = function(options)
  if type(options.fg) == 'table' then
    options.fg = options.fg.fg
  end
  if type(options.sp) == 'table' then
    options.sp = options.sp.fg
  end
  if type(options.bg) == 'table' then
    options.bg = options.bg.bg
  end
  return options
end

local apply_highlights = function(highlights)
  vim.cmd.highlight 'clear'
  for group, options in pairs(highlights) do
    if not vim.tbl_isempty(options) then
      options = unwrapOptions(options)
      vim.api.nvim_set_hl(0, group, options)
    end
  end
end

M.apply_colors = function(colors)
  if vim.g.colors_name then
    vim.cmd.highlight 'clear'
  end
  vim.o.termguicolors = true
  vim.g.colors_name = 'meadow'

  local highlights = make_highlights(colors)
  apply_highlights(highlights)
end

return M
