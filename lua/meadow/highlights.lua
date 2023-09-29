local M = {}

local make_highlights = function(c)
  -- The list of higlights and comments are taken from https://github.com/folke/tokyonight.nvim
  local highlights = {
    Comment = { fg = c.grey }, -- any comment
    ColorColumn = { bg = c.black3 }, -- used for the columns set with 'colorcolumn'
    Conceal = { fg = c.white, bg = c.grey_bg2 }, -- placeholder characters substituted for concealed text (see 'conceallevel')
    Cursor = { opt = 'reverse' }, -- character under the cursor
    lCursor = { link = 'Cursor' }, -- the character under the cursor when |language-mapping| is used (see 'guicursor')
    CursorIM = { link = 'Cursor' }, -- like Cursor, but used when in IME mode |CursorIM|
    CursorColumn = { bg = c.black4 }, -- Screen-column at the cursor, when 'cursorcolumn' is set.
    CursorLine = { link = 'CursorColumn' }, -- Screen-line at the cursor, when 'cursorline' is set.  Low-priority if foreground (ctermfg OR guifg) is not set.
    Directory = { fg = c.blue1 }, -- directory names (and other special names in listings)
    DiffAdd = { fg = c.green2 }, -- diff mode: Added line |diff.txt|
    DiffChange = { fg = c.yellow1 }, -- diff mode: Changed line |diff.txt|
    DiffDelete = { fg = c.red2 }, -- diff mode: Deleted line |diff.txt|
    DiffText = { fg = c.yellow1 }, -- diff mode: Changed text within a changed line |diff.txt|
    EndOfBuffer = { bg = c.black1 }, -- filler lines (~) after the end of the buffer.  By default, this is highlighted like |hl-NonText|.
    -- TermCursor  = {}, -- cursor in a focused terminal
    -- TermCursorNC= {}, -- cursor in an unfocused terminal
    ErrorMsg = { fg = c.red1, bg = c.black1 }, -- error messages on the command line
    VertSplit = { fg = c.black1, bg = c.black1 }, -- the column separating vertically split windows
    WinSeparator = {}, -- the column separating vertically split windows
    Folded = { bg = c.grey_bg2 }, -- line used for closed folds
    FoldColumn = { bg = c.grey_bg2 }, -- 'foldcolumn'
    SignColumn = { bg = c.black2 }, -- column where |signs| are displayed
    SignColumnSB = {}, -- column where |signs| are displayed
    Substitute = { link = 'Search' }, -- |:substitute| replacement text highlighting
    LineNr = { fg = c.grey, bg = c.black2 }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
    CursorLineNr = { fg = c.yellow1, bg = c.black4, opt = 'bold' }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
    MatchParen = { bg = c.yellow1, opt = 'bold' }, -- The character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
    ModeMsg = { link = 'Normal' }, -- 'showmode' message (e.g., "-- INSERT -- ")
    MsgArea = { link = 'Normal' }, -- Area for messages and cmdline
    -- MsgSeparator= {}, -- Separator for scrolled messages, `msgsep` flag of 'display'
    MoreMsg = { fg = c.green2 }, -- |more-prompt|
    NonText = { fg = c.grey }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
    Normal = { fg = c.white, bg = c.black2 }, -- normal text
    NormalNC = { link = 'Normal' }, -- normal text in non-current windows
    NormalSB = {}, -- normal text in sidebar
    NormalFloat = { fg = c.white, bg = c.grey_bg1 }, -- Normal text in floating windows.
    FloatBorder = {},
    FloatTitle = {},
    Pmenu = { fg = c.white, bg = c.grey_bg1 }, -- Popup menu: normal item.
    PmenuSel = { fg = c.green2, bg = c.grey_bg2, opt = 'bold' }, -- Popup menu: selected item.
    PmenuSbar = { bg = c.grey_bg2 }, -- Popup menu: scrollbar.
    PmenuThumb = { bg = c.white }, -- Popup menu: Thumb of the scrollbar.
    Question = { link = 'MoreMsg' }, -- |hit-enter| prompt and yes/no questions
    QuickFixLine = { opt = 'bold' }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
    Search = { bg = c.violet1 }, -- Last search pattern highlighting (see 'hlsearch').  Also used for similar items that need to stand out.
    IncSearch = { link = 'Search' }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
    CurSearch = {},
    SpecialKey = { fg = c.grey }, -- Unprintable characters: text displayed differently from what it really is.  But not 'listchars' whitespace. |hl-Whitespace|
    SpellBad = { opt = 'underline' }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
    SpellCap = { link = 'SpellBad' }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
    SpellLocal = { link = 'SpellBad' }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
    SpellRare = { link = 'SpellBad' }, -- Word that is recognized by the spellchecker as one that is hardly ever used.  |spell| Combined with the highlighting used otherwise.
    StatusLine = { fg = c.white, bg = c.black1 }, -- status line of current window
    StatusLineNC = { fg = c.grey_bg1, bg = c.black1 }, -- status lines of not-current windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
    TabLine = { fg = c.green2, bg = c.grey_bg1 }, -- tab pages line, not active tab page label
    TabLineFill = { fg = c.green2, bg = c.black3}, -- tab pages line, where there are no labels
    TabLineSel = { opt = 'bold' }, -- tab pages line, active tab page label
    Title = { fg = c.green2, opt = 'bold' }, -- titles for output from ":set all", ":autocmd" etc.
    Visual = { bg = c.violet1 }, -- Visual mode selection
    VisualNOS = { link = 'Visual' }, -- Visual mode selection when vim is "Not Owning the Selection".
    WarningMsg = { bg = c.yellow1 }, -- warning messages
    Whitespace = { fg = c.white, bg = c.orange1 }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
    WildMenu = { link = 'PmenuSel' }, -- current match in 'wildmenu' completion

    -- These groups are not listed as default vim groups,
    -- but they are defacto standard group names for syntax highlighting.
    -- commented out groups should chain up to their "preferred" group by
    -- default,
    -- Uncomment and edit if you want more specific syntax highlighting.

    Constant = { fg = c.red1 }, -- (preferred) any constant
    String = { fg = c.green1, opt = 'italic' }, --   a string constant: "this is a string"
    Character = { link = 'String' }, --  a character constant: 'c', '\n'
    -- Number        = {}, --   a number constant: 234, 0xff
    -- Boolean       = {}, --  a boolean constant: TRUE, false
    -- Float         = {}, --    a floating point constant: 2.3e10

    Identifier = { fg = c.yellow2, opt = 'italic' }, -- (preferred) any variable name
    Function = { fg = c.green1, opt = 'bold' }, -- function name (also: methods for classes)

    Statement = { fg = c.blue1 }, -- (preferred) any statement
    -- Conditional   = {}, --  if, then, else, endif, switch, etc.
    -- Repeat        = {}, --   for, do, while, etc.
    -- Label         = {}, --    case, default, etc.
    Operator = { fg = c.blue3 }, -- "sizeof", "+", "*", etc.
    Keyword = { fg = c.blue3 }, --  any other keyword
    -- Exception     = {}, --  try, catch, throw

    PreProc = { fg = c.red2 }, -- (preferred) generic Preprocessor
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
    Debug = { bg = c.red2 }, --    debugging statements

    Underlined = { fg = c.blue1, opt = 'underline' }, -- (preferred) text that stands out, HTML links
    Bold = {},
    Italic = {},

    -- ("Ignore", below, may be invisible...)
    -- Ignore = {}, -- (preferred) left blank, hidden  |hl-Ignore|

    Error = { fg = c.red1 }, -- (preferred) any erroneous construct
    Todo = { fg = c.yellow1 }, -- (preferred) anything that needs extra attention; mostly the keywords TODO FIXME and XXX

    qfLineNr = {},
    qfFileName = {},

    htmlH1 = {},
    htmlH2 = {},

    -- mkdHeading = {},
    -- mkdCode = {},
    mkdCodeDelimiter = {},
    mkdCodeStart = {},
    mkdCodeEnd = {},
    -- mkdLink = {},

    markdownHeadingDelimiter = {},
    markdownCode = {},
    markdownCodeBlock = {},
    markdownH1 = {},
    markdownH2 = {},
    markdownLinkText = {},

    ["helpCommand"] = {},

    debugPC = {}, -- used for highlighting the current line in terminal-debug
    debugBreakpoint = { fg = c.red2 }, -- used for breakpoint colors in terminal-debug

    -- These groups are for the native LSP client. Some other LSP clients may
    -- use these groups, or use their own. Consult your LSP client's
    -- documentation.
    LspReferenceText = {}, -- used for highlighting "text" references
    LspReferenceRead = {}, -- used for highlighting "read" references
    LspReferenceWrite = {}, -- used for highlighting "write" references

    DiagnosticError = { fg = c.red1 }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
    DiagnosticWarn = { fg = c.orange1 }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
    DiagnosticInfo = { fg = c.blue1 }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
    DiagnosticHint = { fg = c.blue2 }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
    DiagnosticUnnecessary = {}, -- Used as the base highlight group. Other Diagnostic highlights link to this by default

    DiagnosticVirtualTextError = {}, -- Used for "Error" diagnostic virtual text
    DiagnosticVirtualTextWarn = {}, -- Used for "Warning" diagnostic virtual text
    DiagnosticVirtualTextInfo = {}, -- Used for "Information" diagnostic virtual text
    DiagnosticVirtualTextHint = {}, -- Used for "Hint" diagnostic virtual text

    DiagnosticUnderlineError = { link = 'DiagnosticError' }, -- Used to underline "Error" diagnostics
    DiagnosticUnderlineWarn = { link = 'DiagnosticWarn' }, -- Used to underline "Warning" diagnostics
    DiagnosticUnderlineInfo = { link = 'DiagnosticInfo' }, -- Used to underline "Information" diagnostics
    DiagnosticUnderlineHint = { link = 'DiagnosticHint' }, -- Used to underline "Hint" diagnostics

    LspSignatureActiveParameter = {},
    LspCodeLens = {},
    LspInlayHint = {},

    LspInfoBorder = {},

    ALEErrorSign = {},
    ALEWarningSign = {},

    DapStoppedLine = {}, -- Used for "Warning" diagnostic virtual text

    -- These groups are for the Neovim tree-sitter highlights.
    -- As of writing, tree-sitter support is a WIP, group names may change.

    --- Misc
    -- TODO:
    -- ["@comment.documentation"] = {},
    ["@operator"] = {}, -- For any operator: `+`, but also `->` and `*` in C.

    --- Punctuation
    ["@punctuation.delimiter"] = {}, -- For delimiters ie: `.`
    ["@punctuation.bracket"] = {}, -- For brackets and parens.
    ["@punctuation.special"] = {}, -- For special punctutation that does not fall in the catagories before.
    ["@punctuation.special.markdown"] = {},

    --- Literals
    ["@string.documentation"] = {},
    ["@string.regex"] = {}, -- For regexes.
    ["@string.escape"] = {}, -- For escape characters within a string.

    --- Functions
    ["@constructor"] = {}, -- For constructor calls and definitions: `= { }` in Lua, and Java constructors.
    ["@parameter"] = {}, -- For parameters of a function.
    ["@parameter.builtin"] = {}, -- For builtin parameters of a function, e.g. "..." or Smali's p[1-99]

    --- Keywords
    ["@keyword"] = { fg = c.blue3 }, -- For keywords that don't fall in previous categories.
    -- TODO:
    -- ["@keyword.coroutine"] = {}, -- For keywords related to coroutines.
    ["@keyword.function"] = {}, -- For keywords used to define a fuction.

    ["@label"] = {}, -- For labels: `label:` in C and `:label:` in Lua.

    --- Types
    ["@type.builtin"] = {},
    ["@field"] = {}, -- For fields.
    ["@property"] = {},

    --- Identifiers
    ["@variable"] = {}, -- Any variable name that does not have another highlight.
    ["@variable.builtin"] = {}, -- Variable names that are defined by the languages, like `this` or `self`.

    --- Text
    -- ["@text.literal.markdown"] = {},
    ["@text.literal.markdown_inline"] = {},
    ["@text.reference"] = {},

    ["@text.todo.unchecked"] = {}, -- For brackets and parens.
    ["@text.todo.checked"] = {}, -- For brackets and parens.
    ["@text.warning"] = {},
    ["@text.danger"] = {},

    ["@text.diff.add"] = {},
    ["@text.diff.delete"] = {},

    ["@namespace"] = {},

    -- tsx
    ["@tag.tsx"] = {},
    ["@constructor.tsx"] = {},
    ["@tag.delimiter.tsx"] = {},

    -- LSP Semantic Token Groups
    ["@lsp.type.boolean"] = {},
    ["@lsp.type.builtinType"] = {},
    ["@lsp.type.comment"] = {},
    ["@lsp.type.decorator"] = {},
    ["@lsp.type.deriveHelper"] = {},
    ["@lsp.type.enum"] = {},
    ["@lsp.type.enumMember"] = {},
    ["@lsp.type.escapeSequence"] = {},
    ["@lsp.type.formatSpecifier"] = {},
    ["@lsp.type.generic"] = {},
    ["@lsp.type.interface"] = {},
    ["@lsp.type.keyword"] = {},
    ["@lsp.type.lifetime"] = {},
    ["@lsp.type.namespace"] = {},
    ["@lsp.type.number"] = {},
    ["@lsp.type.operator"] = {},
    ["@lsp.type.parameter"] = {},
    ["@lsp.type.property"] = {},
    ["@lsp.type.selfKeyword"] = {},
    ["@lsp.type.selfTypeKeyword"] = {},
    ["@lsp.type.string"] = {},
    ["@lsp.type.typeAlias"] = {},
    ["@lsp.type.unresolvedReference"] = {},
    ["@lsp.type.variable"] = {}, -- use treesitter styles for regular variables
    ["@lsp.typemod.class.defaultLibrary"] = {},
    ["@lsp.typemod.enum.defaultLibrary"] = {},
    ["@lsp.typemod.enumMember.defaultLibrary"] = {},
    ["@lsp.typemod.function.defaultLibrary"] = {},
    ["@lsp.typemod.keyword.async"] = {},
    ["@lsp.typemod.keyword.injected"] = {},
    ["@lsp.typemod.macro.defaultLibrary"] = {},
    ["@lsp.typemod.method.defaultLibrary"] = {},
    ["@lsp.typemod.operator.injected"] = {},
    ["@lsp.typemod.string.injected"] = {},
    ["@lsp.typemod.struct.defaultLibrary"] = {},
    ["@lsp.typemod.type.defaultLibrary"] = {},
    ["@lsp.typemod.typeAlias.defaultLibrary"] = {},
    ["@lsp.typemod.variable.callable"] = {},
    ["@lsp.typemod.variable.defaultLibrary"] = {},
    ["@lsp.typemod.variable.injected"] = {},
    ["@lsp.typemod.variable.static"] = {},
    -- NOTE: maybe add these with distinct highlights?
    -- ["@lsp.typemod.variable.globalScope"] (global variables)

    -- Markdown
    ["@text.title.1.markdown"] = {},
    ["@text.title.2.markdown"] = { fg = c.green2, opt = 'bold' },
    ["@text.title.3.markdown"] = {},
    ["@text.title.4.markdown"] = {},
    ["@text.title.5.markdown"] = {},
    ["@text.title.6.markdown"] = {},

    -- rainbow-delimiters
    RainbowDelimiterRed = {},
    RainbowDelimiterOrange = {},
    RainbowDelimiterYellow = {},
    RainbowDelimiterGreen = {},
    RainbowDelimiterBlue = {},
    RainbowDelimiterViolet = {},
    RainbowDelimiterCyan = {},

    -- LspTrouble
    TroubleText = {},
    TroubleCount = {},
    TroubleNormal = {},

    -- diff
    diffAdded = {},
    diffRemoved = {},
    diffChanged = {},
    diffOldFile = {},
    diffNewFile = {},
    diffFile = {},
    diffLine = {},
    diffIndexLine = {},

    -- Neogit
    NeogitBranch = {},
    NeogitRemote = {},
    NeogitHunkHeader = {},
    NeogitHunkHeaderHighlight = {},
    NeogitDiffContextHighlight = {},
    NeogitDiffDeleteHighlight = {},
    NeogitDiffAddHighlight = {},

    -- GitGutter
    GitGutterAdd = {}, -- diff mode: Added line |diff.txt|
    GitGutterChange = {}, -- diff mode: Changed line |diff.txt|
    GitGutterDelete = {}, -- diff mode: Deleted line |diff.txt|
    GitGutterAddLineNr = {},
    GitGutterChangeLineNr = {},
    GitGutterDeleteLineNr = {},

    -- GitSigns
    GitSignsAdd = {}, -- diff mode: Added line |diff.txt|
    GitSignsChange = {}, -- diff mode: Changed line |diff.txt|
    GitSignsDelete = {}, -- diff mode: Deleted line |diff.txt|

    -- Telescope
    TelescopeBorder = {},
    TelescopeNormal = {},

    -- NvimTree
    NvimTreeNormal = {},
    NvimTreeWinSeparator = {
      fg = options.styles.sidebars == "transparent" and c.border or c.bg_sidebar,
      bg = c.bg_sidebar,
    },
    NvimTreeNormalNC = {},
    NvimTreeRootFolder = {},
    NvimTreeGitDirty = {},
    NvimTreeGitNew = {},
    NvimTreeGitDeleted = {},
    NvimTreeOpenedFile = {},
    NvimTreeSpecialFile = {},
    NvimTreeIndentMarker = {},
    NvimTreeImageFile = {},
    NvimTreeSymlink = {},
    NvimTreeFolderIcon = {},
    -- NvimTreeFolderName= {},

    -- Alpha
    AlphaShortcut = {},
    AlphaHeader = {},
    AlphaHeaderLabel = {},
    AlphaFooter = {},
    AlphaButtons = {},

    -- WhichKey
    WhichKey = {},
    WhichKeyGroup = {},
    WhichKeyDesc = {},
    WhichKeySeperator = {},
    WhichKeySeparator = {},
    WhichKeyFloat = {},
    WhichKeyValue = {},

    -- NeoVim
    healthError = {},
    healthSuccess = {},
    healthWarning = {},

    -- Cmp
    CmpDocumentation = {},
    CmpDocumentationBorder = {},
    CmpGhostText = {},

    CmpItemAbbr = {},
    CmpItemAbbrDeprecated = {},
    CmpItemAbbrMatch = {},
    CmpItemAbbrMatchFuzzy = {},

    CmpItemMenu = {},

    CmpItemKindDefault = {},

    CmpItemKindKeyword = {},

    CmpItemKindVariable = {},
    CmpItemKindConstant = {},
    CmpItemKindReference = {},
    CmpItemKindValue = {},
    CmpItemKindCopilot = {},

    CmpItemKindFunction = {},
    CmpItemKindMethod = {},
    CmpItemKindConstructor = {},

    CmpItemKindClass = {},
    CmpItemKindInterface = {},
    CmpItemKindStruct = {},
    CmpItemKindEvent = {},
    CmpItemKindEnum = {},
    CmpItemKindUnit = {},

    CmpItemKindModule = {},

    CmpItemKindProperty = {},
    CmpItemKindField = {},
    CmpItemKindTypeParameter = {},
    CmpItemKindEnumMember = {},
    CmpItemKindOperator = {},
    CmpItemKindSnippet = {},

    -- Lazy
    LazyProgressDone = {},
    LazyProgressTodo = {},

    -- Noice
    NoiceCompletionItemKindDefault = {},

    NoiceCompletionItemKindKeyword = {},

    NoiceCompletionItemKindVariable = {},
    NoiceCompletionItemKindConstant = {},
    NoiceCompletionItemKindReference = {},
    NoiceCompletionItemKindValue = {},

    NoiceCompletionItemKindFunction = {},
    NoiceCompletionItemKindMethod = {},
    NoiceCompletionItemKindConstructor = {},

    NoiceCompletionItemKindClass = {},
    NoiceCompletionItemKindInterface = {},
    NoiceCompletionItemKindStruct = {},
    NoiceCompletionItemKindEvent = {},
    NoiceCompletionItemKindEnum = {},
    NoiceCompletionItemKindUnit = {},

    NoiceCompletionItemKindModule = {},

    NoiceCompletionItemKindProperty = {},
    NoiceCompletionItemKindField = {},
    NoiceCompletionItemKindTypeParameter = {},
    NoiceCompletionItemKindEnumMember = {},
    NoiceCompletionItemKindOperator = {},
    NoiceCompletionItemKindSnippet = {},

    TreesitterContext = {},
    Hlargs = {},
    -- TreesitterContext = {},
  }

  if not vim.diagnostic then
    local severity_map = {
      Error = "Error",
      Warn = "Warning",
      Info = "Information",
      Hint = "Hint",
    }
    local types = {"Default", "VirtualText", "Underline"}
    for _, type in ipairs(types) do
      for snew, sold in pairs(severity_map) do
        theme.highlights["LspDiagnostics" .. type .. sold] = {
          link = "Diagnostic" .. (type == "Default" and "" or type) .. snew,
        }
      end
    end
  end
  return highlights
end

local apply_highlights = function(highlights)
end

M.apply_colors = function(colors)
  local highlights = make_highlights(colors)
  apply_highlights(highlights)
end

return M
