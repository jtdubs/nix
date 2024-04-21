{ config, ... }:
let
  palette = config.colorScheme.palette;
in
{
  xdg.configFile."nvim/lua/theme.lua".text = ''
    local colors = {
      nix1  = '#${palette.night1}',
      nix3  = '#${palette.night3}',
      nix5  = '#${palette.snow1}',
      nix6  = '#${palette.snow2}',
      nix7  = '#${palette.frost0}',
      nix8  = '#${palette.frost1}',
      nix13 = '#${palette.auroraYellow}',
    }
    return {
      normal = {
        a = { fg = colors.nix1, bg = colors.nix8, gui = 'bold' },
        b = { fg = colors.nix5, bg = colors.nix1 },
        c = { fg = colors.nix5, bg = colors.nix3 },
      },
      insert = { a = { fg = colors.nix1, bg = colors.nix6, gui = 'bold' } },
      visual = { a = { fg = colors.nix1, bg = colors.nix7, gui = 'bold' } },
      replace = { a = { fg = colors.nix1, bg = colors.nix13, gui = 'bold' } },
      inactive = {
        a = { fg = colors.nix1, bg = colors.nix8, gui = 'bold' },
        b = { fg = colors.nix5, bg = colors.nix1 },
        c = { fg = colors.nix5, bg = colors.nix1 },
      },
    }
  '';
  xdg.configFile."nvim/colors/nix.vim".text = ''
    if version > 580
      hi clear
      if exists("syntax_on")
        syntax reset
      endif
    endif

    let g:colors_name = "nix"
    let s:nix_vim_version="0.19.0"
    set background=dark

    let s:nix0_gui = "#${palette.night0}"
    let s:nix1_gui = "#${palette.night1}"
    let s:nix2_gui = "#${palette.night2}"
    let s:nix3_gui = "#${palette.night3}"
    let s:nix3_gui_bright = "#${palette.frost0}"
    let s:nix4_gui = "#${palette.snow0}"
    let s:nix5_gui = "#${palette.snow1}"
    let s:nix6_gui = "#${palette.snow2}"
    let s:nix7_gui = "#${palette.frost0}"
    let s:nix8_gui = "#${palette.frost1}"
    let s:nix9_gui = "#${palette.frost2}"
    let s:nix10_gui = "#${palette.frost3}"
    let s:nix11_gui = "#${palette.auroraRed}"
    let s:nix12_gui = "#${palette.auroraOrange}"
    let s:nix13_gui = "#${palette.auroraYellow}"
    let s:nix14_gui = "#${palette.auroraGreen}"
    let s:nix15_gui = "#${palette.auroraPurple}"

    let s:nix1_term = "0"
    let s:nix3_term = "8"
    let s:nix5_term = "7"
    let s:nix6_term = "15"
    let s:nix7_term = "14"
    let s:nix8_term = "6"
    let s:nix9_term = "4"
    let s:nix10_term = "12"
    let s:nix11_term = "1"
    let s:nix12_term = "11"
    let s:nix13_term = "3"
    let s:nix14_term = "2"
    let s:nix15_term = "5"

    let s:nix3_gui_brightened = [
      \ s:nix3_gui,
      \ "#4e586d",
      \ "#505b70",
      \ "#525d73",
      \ "#556076",
      \ "#576279",
      \ "#59647c",
      \ "#5b677f",
      \ "#5d6982",
      \ "#5f6c85",
      \ "#616e88",
      \ "#63718b",
      \ "#66738e",
      \ "#687591",
      \ "#6a7894",
      \ "#6d7a96",
      \ "#6f7d98",
      \ "#72809a",
      \ "#75829c",
      \ "#78859e",
      \ "#7b88a1",
    \ ]

    let g:nix_bold = get(g:, "nix_bold", 1)
    let s:bold = (g:nix_bold == 0) ? "" : "bold,"

    let g:nix_underline = get(g:, "nix_underline", 1)
    let s:underline = (g:nix_underline == 0) ? "NONE," : "underline,"

    let g:nix_italic = get(g:, "nix_italic", (has("gui_running") || $TERM_ITALICS == "true"))
    let s:italic = (g:nix_italic == 0) ? "" : "italic,"

    let g:nix_italic_comments = get(g:, "nix_italic_comments", 0)
    let s:italicize_comments = (g:nix_italic_comments == 0) ? "" : get(s:, "italic")

    let g:nix_uniform_status_lines = get(g:, "nix_uniform_status_lines", 0)

    let g:nix_bold_vertical_split_line = get(g:, "nix_bold_vertical_split_line", 0)
    if exists("g:nix_comment_brightness")
      echohl WarningMsg
      echomsg 'nix: warning: Variable g:nix_comment_brightness has been deprecated and will be removed in version 1.0.0!' .
                       \' The comment color brightness has been increased by 10% by default.' .
                       \' Please see https://github.com/nixtheme/vim/issues/145 for more details.'
      echohl None
      let g:nix_comment_brightness = 10
    endif
    let g:nix_cursor_line_number_background = get(g:, "nix_cursor_line_number_background", 0)
    let g:nix_uniform_diff_background = get(g:, "nix_uniform_diff_background", 0)

    function! s:hi(group, guifg, guibg, ctermfg, ctermbg, attr, guisp)
      let cmd = ""
      if a:guifg != ""
        let cmd = cmd . " guifg=" . a:guifg
      endif
      if a:guibg != ""
        let cmd = cmd . " guibg=" . a:guibg
      endif
      if a:ctermfg != ""
        let cmd = cmd . " ctermfg=" . a:ctermfg
      endif
      if a:ctermbg != ""
        let cmd = cmd . " ctermbg=" . a:ctermbg
      endif
      if a:attr != ""
        let cmd = cmd . " gui=" . a:attr . " cterm=" . substitute(a:attr, "undercurl", s:underline, "")
      endif
      if a:guisp != ""
        let cmd = cmd . " guisp=" . a:guisp
      endif
      if cmd != ""
        exec "hi " . a:group . cmd
      endif
    endfunction

    "+---------------+
    "+ UI Components +
    "+---------------+
    "+--- Attributes ---+
    call s:hi("Bold", "", "", "", "", s:bold, "")
    call s:hi("Italic", "", "", "", "", s:italic, "")
    call s:hi("Underline", "", "", "", "", s:underline, "")

    "+--- Editor ---+
    call s:hi("ColorColumn", "", s:nix1_gui, "NONE", s:nix1_term, "", "")
    call s:hi("Cursor", s:nix0_gui, s:nix4_gui, "", "NONE", "", "")
    call s:hi("CursorLine", "", s:nix1_gui, "NONE", s:nix1_term, "NONE", "")
    call s:hi("Error", s:nix4_gui, s:nix11_gui, "", s:nix11_term, "", "")
    call s:hi("iCursor", s:nix0_gui, s:nix4_gui, "", "NONE", "", "")
    call s:hi("LineNr", s:nix3_gui, "NONE", s:nix3_term, "NONE", "", "")
    call s:hi("MatchParen", s:nix8_gui, s:nix3_gui, s:nix8_term, s:nix3_term, "", "")
    call s:hi("NonText", s:nix2_gui, "", s:nix3_term, "", "", "")
    call s:hi("Normal", s:nix4_gui, s:nix0_gui, "NONE", "NONE", "", "")
    call s:hi("Pmenu", s:nix4_gui, s:nix2_gui, "NONE", s:nix1_term, "NONE", "")
    call s:hi("PmenuSbar", s:nix4_gui, s:nix2_gui, "NONE", s:nix1_term, "", "")
    call s:hi("PmenuSel", s:nix8_gui, s:nix3_gui, s:nix8_term, s:nix3_term, "", "")
    call s:hi("PmenuThumb", s:nix8_gui, s:nix3_gui, "NONE", s:nix3_term, "", "")
    call s:hi("SpecialKey", s:nix3_gui, "", s:nix3_term, "", "", "")
    call s:hi("SpellBad", s:nix11_gui, s:nix0_gui, s:nix11_term, "NONE", "undercurl", s:nix11_gui)
    call s:hi("SpellCap", s:nix13_gui, s:nix0_gui, s:nix13_term, "NONE", "undercurl", s:nix13_gui)
    call s:hi("SpellLocal", s:nix5_gui, s:nix0_gui, s:nix5_term, "NONE", "undercurl", s:nix5_gui)
    call s:hi("SpellRare", s:nix6_gui, s:nix0_gui, s:nix6_term, "NONE", "undercurl", s:nix6_gui)
    call s:hi("Visual", "", s:nix2_gui, "", s:nix1_term, "", "")
    call s:hi("VisualNOS", "", s:nix2_gui, "", s:nix1_term, "", "")

    "+- Vim 8 Terminal Colors -+
    if has('terminal')
      let g:terminal_ansi_colors = [s:nix1_gui, s:nix11_gui, s:nix14_gui, s:nix13_gui, s:nix9_gui, s:nix15_gui, s:nix8_gui, s:nix5_gui, s:nix3_gui, s:nix11_gui, s:nix14_gui, s:nix13_gui, s:nix9_gui, s:nix15_gui, s:nix7_gui, s:nix6_gui]
    endif

    if has('nvim')
      "+- Neovim Terminal Colors -+
      let g:terminal_color_0 = s:nix1_gui
      let g:terminal_color_1 = s:nix11_gui
      let g:terminal_color_2 = s:nix14_gui
      let g:terminal_color_3 = s:nix13_gui
      let g:terminal_color_4 = s:nix9_gui
      let g:terminal_color_5 = s:nix15_gui
      let g:terminal_color_6 = s:nix8_gui
      let g:terminal_color_7 = s:nix5_gui
      let g:terminal_color_8 = s:nix3_gui
      let g:terminal_color_9 = s:nix11_gui
      let g:terminal_color_10 = s:nix14_gui
      let g:terminal_color_11 = s:nix13_gui
      let g:terminal_color_12 = s:nix9_gui
      let g:terminal_color_13 = s:nix15_gui
      let g:terminal_color_14 = s:nix7_gui
      let g:terminal_color_15 = s:nix6_gui

      "+- Neovim Support -+
      call s:hi("healthError", s:nix11_gui, s:nix1_gui, s:nix11_term, s:nix1_term, "", "")
      call s:hi("healthSuccess", s:nix14_gui, s:nix1_gui, s:nix14_term, s:nix1_term, "", "")
      call s:hi("healthWarning", s:nix13_gui, s:nix1_gui, s:nix13_term, s:nix1_term, "", "")
      call s:hi("TermCursorNC", "", s:nix1_gui, "", s:nix1_term, "", "")

      "+- Neovim Diagnostics API -+
      call s:hi("DiagnosticWarn", s:nix13_gui, "", s:nix13_term, "", "", "")
      call s:hi("DiagnosticError" , s:nix11_gui, "", s:nix11_term, "", "", "")
      call s:hi("DiagnosticInfo" , s:nix8_gui, "", s:nix8_term, "", "", "")
      call s:hi("DiagnosticHint" , s:nix10_gui, "", s:nix10_term, "", "", "")
      call s:hi("DiagnosticUnderlineWarn" , s:nix13_gui, "", s:nix13_term, "", "undercurl", "")
      call s:hi("DiagnosticUnderlineError" , s:nix11_gui, "", s:nix11_term, "", "undercurl", "")
      call s:hi("DiagnosticUnderlineInfo" , s:nix8_gui, "", s:nix8_term, "", "undercurl", "")
      call s:hi("DiagnosticUnderlineHint" , s:nix10_gui, "", s:nix10_term, "", "undercurl", "")

      "+- Neovim DocumentHighlight -+
      call s:hi("LspReferenceText", "", s:nix3_gui, "", s:nix3_term, "", "")
      call s:hi("LspReferenceRead", "", s:nix3_gui, "", s:nix3_term, "", "")
      call s:hi("LspReferenceWrite", "", s:nix3_gui, "", s:nix3_term, "", "")

      "+- Neovim LspSignatureHelp -+
      call s:hi("LspSignatureActiveParameter", s:nix8_gui, "", s:nix8_term, "", s:underline, "")
    endif

    "+--- Gutter ---+
    call s:hi("CursorColumn", "", s:nix1_gui, "NONE", s:nix1_term, "", "")
    if g:nix_cursor_line_number_background == 0
      call s:hi("CursorLineNr", s:nix4_gui, "", "NONE", "", "NONE", "")
    else
      call s:hi("CursorLineNr", s:nix4_gui, s:nix1_gui, "NONE", s:nix1_term, "NONE", "")
    endif
    call s:hi("Folded", s:nix3_gui, s:nix1_gui, s:nix3_term, s:nix1_term, s:bold, "")
    call s:hi("FoldColumn", s:nix3_gui, s:nix0_gui, s:nix3_term, "NONE", "", "")
    call s:hi("SignColumn", s:nix1_gui, s:nix0_gui, s:nix1_term, "NONE", "", "")

    "+--- Navigation ---+
    call s:hi("Directory", s:nix8_gui, "", s:nix8_term, "NONE", "", "")

    "+--- Prompt/Status ---+
    call s:hi("EndOfBuffer", s:nix1_gui, "", s:nix1_term, "NONE", "", "")
    call s:hi("ErrorMsg", s:nix4_gui, s:nix11_gui, "NONE", s:nix11_term, "", "")
    call s:hi("ModeMsg", s:nix4_gui, "", "", "", "", "")
    call s:hi("MoreMsg", s:nix8_gui, "", s:nix8_term, "", "", "")
    call s:hi("Question", s:nix4_gui, "", "NONE", "", "", "")
    if g:nix_uniform_status_lines == 0
      call s:hi("StatusLine", s:nix8_gui, s:nix3_gui, s:nix8_term, s:nix3_term, "NONE", "")
      call s:hi("StatusLineNC", s:nix4_gui, s:nix1_gui, "NONE", s:nix1_term, "NONE", "")
      call s:hi("StatusLineTerm", s:nix8_gui, s:nix3_gui, s:nix8_term, s:nix3_term, "NONE", "")
      call s:hi("StatusLineTermNC", s:nix4_gui, s:nix1_gui, "NONE", s:nix1_term, "NONE", "")
    else
      call s:hi("StatusLine", s:nix8_gui, s:nix3_gui, s:nix8_term, s:nix3_term, "NONE", "")
      call s:hi("StatusLineNC", s:nix4_gui, s:nix3_gui, "NONE", s:nix3_term, "NONE", "")
      call s:hi("StatusLineTerm", s:nix8_gui, s:nix3_gui, s:nix8_term, s:nix3_term, "NONE", "")
      call s:hi("StatusLineTermNC", s:nix4_gui, s:nix3_gui, "NONE", s:nix3_term, "NONE", "")
    endif
    call s:hi("WarningMsg", s:nix0_gui, s:nix13_gui, s:nix1_term, s:nix13_term, "", "")
    call s:hi("WildMenu", s:nix8_gui, s:nix1_gui, s:nix8_term, s:nix1_term, "", "")

    "+--- Search ---+
    call s:hi("IncSearch", s:nix6_gui, s:nix10_gui, s:nix6_term, s:nix10_term, s:underline, "")
    call s:hi("Search", s:nix1_gui, s:nix8_gui, s:nix1_term, s:nix8_term, "NONE", "")

    "+--- Tabs ---+
    call s:hi("TabLine", s:nix4_gui, s:nix1_gui, "NONE", s:nix1_term, "NONE", "")
    call s:hi("TabLineFill", s:nix4_gui, s:nix1_gui, "NONE", s:nix1_term, "NONE", "")
    call s:hi("TabLineSel", s:nix8_gui, s:nix3_gui, s:nix8_term, s:nix3_term, "NONE", "")

    "+--- Window ---+
    call s:hi("Title", s:nix4_gui, "", "NONE", "", "NONE", "")

    if g:nix_bold_vertical_split_line == 0
      call s:hi("VertSplit", s:nix2_gui, s:nix0_gui, s:nix3_term, "NONE", "NONE", "")
    else
      call s:hi("VertSplit", s:nix2_gui, s:nix1_gui, s:nix3_term, s:nix1_term, "NONE", "")
    endif

    "+----------------------+
    "+ Language Base Groups +
    "+----------------------+
    call s:hi("Boolean", s:nix9_gui, "", s:nix9_term, "", "", "")
    call s:hi("Character", s:nix14_gui, "", s:nix14_term, "", "", "")
    call s:hi("Comment", s:nix3_gui_bright, "", s:nix3_term, "", s:italicize_comments, "")
    call s:hi("Conceal", "", "NONE", "", "NONE", "", "")
    call s:hi("Conditional", s:nix9_gui, "", s:nix9_term, "", "", "")
    call s:hi("Constant", s:nix4_gui, "", "NONE", "", "", "")
    call s:hi("Decorator", s:nix12_gui, "", s:nix12_term, "", "", "")
    call s:hi("Define", s:nix9_gui, "", s:nix9_term, "", "", "")
    call s:hi("Delimiter", s:nix6_gui, "", s:nix6_term, "", "", "")
    call s:hi("Exception", s:nix9_gui, "", s:nix9_term, "", "", "")
    call s:hi("Float", s:nix15_gui, "", s:nix15_term, "", "", "")
    call s:hi("Function", s:nix8_gui, "", s:nix8_term, "", "", "")
    call s:hi("Identifier", s:nix4_gui, "", "NONE", "", "NONE", "")
    call s:hi("Include", s:nix9_gui, "", s:nix9_term, "", "", "")
    call s:hi("Keyword", s:nix9_gui, "", s:nix9_term, "", "", "")
    call s:hi("Label", s:nix9_gui, "", s:nix9_term, "", "", "")
    call s:hi("Number", s:nix15_gui, "", s:nix15_term, "", "", "")
    call s:hi("Operator", s:nix9_gui, "", s:nix9_term, "", "NONE", "")
    call s:hi("PreProc", s:nix9_gui, "", s:nix9_term, "", "NONE", "")
    call s:hi("Repeat", s:nix9_gui, "", s:nix9_term, "", "", "")
    call s:hi("Special", s:nix4_gui, "", "NONE", "", "", "")
    call s:hi("SpecialChar", s:nix13_gui, "", s:nix13_term, "", "", "")
    call s:hi("SpecialComment", s:nix8_gui, "", s:nix8_term, "", s:italicize_comments, "")
    call s:hi("Statement", s:nix9_gui, "", s:nix9_term, "", "", "")
    call s:hi("StorageClass", s:nix9_gui, "", s:nix9_term, "", "", "")
    call s:hi("String", s:nix14_gui, "", s:nix14_term, "", "", "")
    call s:hi("Structure", s:nix9_gui, "", s:nix9_term, "", "", "")
    call s:hi("Tag", s:nix4_gui, "", "", "", "", "")
    call s:hi("Todo", s:nix13_gui, "NONE", s:nix13_term, "NONE", "", "")
    call s:hi("Type", s:nix9_gui, "", s:nix9_term, "", "NONE", "")
    call s:hi("Typedef", s:nix9_gui, "", s:nix9_term, "", "", "")
    hi! link Annotation Decorator
    hi! link Macro Define
    hi! link PreCondit PreProc
    hi! link Variable Identifier

    "+-----------+
    "+ Languages +
    "+-----------+
    call s:hi("asciidocAttributeEntry", s:nix10_gui, "", s:nix10_term, "", "", "")
    call s:hi("asciidocAttributeList", s:nix10_gui, "", s:nix10_term, "", "", "")
    call s:hi("asciidocAttributeRef", s:nix10_gui, "", s:nix10_term, "", "", "")
    call s:hi("asciidocHLabel", s:nix9_gui, "", s:nix9_term, "", "", "")
    call s:hi("asciidocListingBlock", s:nix7_gui, "", s:nix7_term, "", "", "")
    call s:hi("asciidocMacroAttributes", s:nix8_gui, "", s:nix8_term, "", "", "")
    call s:hi("asciidocOneLineTitle", s:nix8_gui, "", s:nix8_term, "", "", "")
    call s:hi("asciidocPassthroughBlock", s:nix9_gui, "", s:nix9_term, "", "", "")
    call s:hi("asciidocQuotedMonospaced", s:nix7_gui, "", s:nix7_term, "", "", "")
    call s:hi("asciidocTriplePlusPassthrough", s:nix7_gui, "", s:nix7_term, "", "", "")
    hi! link asciidocAdmonition Keyword
    hi! link asciidocAttributeRef markdownH1
    hi! link asciidocBackslash Keyword
    hi! link asciidocMacro Keyword
    hi! link asciidocQuotedBold Bold
    hi! link asciidocQuotedEmphasized Italic
    hi! link asciidocQuotedMonospaced2 asciidocQuotedMonospaced
    hi! link asciidocQuotedUnconstrainedBold asciidocQuotedBold
    hi! link asciidocQuotedUnconstrainedEmphasized asciidocQuotedEmphasized
    hi! link asciidocURL markdownLinkText

    call s:hi("awkCharClass", s:nix7_gui, "", s:nix7_term, "", "", "")
    call s:hi("awkPatterns", s:nix9_gui, "", s:nix9_term, "", s:bold, "")
    hi! link awkArrayElement Identifier
    hi! link awkBoolLogic Keyword
    hi! link awkBrktRegExp SpecialChar
    hi! link awkComma Delimiter
    hi! link awkExpression Keyword
    hi! link awkFieldVars Identifier
    hi! link awkLineSkip Keyword
    hi! link awkOperator Operator
    hi! link awkRegExp SpecialChar
    hi! link awkSearch Keyword
    hi! link awkSemicolon Delimiter
    hi! link awkSpecialCharacter SpecialChar
    hi! link awkSpecialPrintf SpecialChar
    hi! link awkVariables Identifier

    call s:hi("cIncluded", s:nix7_gui, "", s:nix7_term, "", "", "")
    hi! link cOperator Operator
    hi! link cPreCondit PreCondit
    hi! link cConstant Type

    call s:hi("cmakeGeneratorExpression", s:nix10_gui, "", s:nix10_term, "", "", "")

    hi! link csPreCondit PreCondit
    hi! link csType Type
    hi! link csXmlTag SpecialComment

    call s:hi("cssAttributeSelector", s:nix7_gui, "", s:nix7_term, "", "", "")
    call s:hi("cssDefinition", s:nix7_gui, "", s:nix7_term, "", "NONE", "")
    call s:hi("cssIdentifier", s:nix7_gui, "", s:nix7_term, "", s:underline, "")
    call s:hi("cssStringQ", s:nix7_gui, "", s:nix7_term, "", "", "")
    hi! link cssAttr Keyword
    hi! link cssBraces Delimiter
    hi! link cssClassName cssDefinition
    hi! link cssColor Number
    hi! link cssProp cssDefinition
    hi! link cssPseudoClass cssDefinition
    hi! link cssPseudoClassId cssPseudoClass
    hi! link cssVendor Keyword

    call s:hi("dosiniHeader", s:nix8_gui, "", s:nix8_term, "", "", "")
    hi! link dosiniLabel Type

    call s:hi("dtBooleanKey", s:nix7_gui, "", s:nix7_term, "", "", "")
    call s:hi("dtExecKey", s:nix7_gui, "", s:nix7_term, "", "", "")
    call s:hi("dtLocaleKey", s:nix7_gui, "", s:nix7_term, "", "", "")
    call s:hi("dtNumericKey", s:nix7_gui, "", s:nix7_term, "", "", "")
    call s:hi("dtTypeKey", s:nix7_gui, "", s:nix7_term, "", "", "")
    hi! link dtDelim Delimiter
    hi! link dtLocaleValue Keyword
    hi! link dtTypeValue Keyword

    if g:nix_uniform_diff_background == 0
      call s:hi("DiffAdd", s:nix14_gui, s:nix0_gui, s:nix14_term, "NONE", "inverse", "")
      call s:hi("DiffChange", s:nix13_gui, s:nix0_gui, s:nix13_term, "NONE", "inverse", "")
      call s:hi("DiffDelete", s:nix11_gui, s:nix0_gui, s:nix11_term, "NONE", "inverse", "")
      call s:hi("DiffText", s:nix9_gui, s:nix0_gui, s:nix9_term, "NONE", "inverse", "")
    else
      call s:hi("DiffAdd", s:nix14_gui, s:nix1_gui, s:nix14_term, s:nix1_term, "", "")
      call s:hi("DiffChange", s:nix13_gui, s:nix1_gui, s:nix13_term, s:nix1_term, "", "")
      call s:hi("DiffDelete", s:nix11_gui, s:nix1_gui, s:nix11_term, s:nix1_term, "", "")
      call s:hi("DiffText", s:nix9_gui, s:nix1_gui, s:nix9_term, s:nix1_term, "", "")
    endif
    " Legacy groups for official git.vim and diff.vim syntax
    hi! link diffAdded DiffAdd
    hi! link diffChanged DiffChange
    hi! link diffRemoved DiffDelete

    call s:hi("elixirModuleDeclaration", s:nix7_gui, "", s:nix7_term, "", "", "")
    call s:hi("elixirAlias", s:nix7_gui, "", s:nix7_term, "", "", "")
    call s:hi("elixirAtom", s:nix6_gui, "", s:nix6_term, "", s:bold, "")

    call s:hi("gitconfigVariable", s:nix7_gui, "", s:nix7_term, "", "", "")

    call s:hi("goBuiltins", s:nix7_gui, "", s:nix7_term, "", "", "")
    hi! link goConstants Keyword

    " fatih/vim-go
    call s:hi("gomodVersion", s:nix7_gui, "", s:nix7_term, "", "", "")
    call s:hi("gomodGoVersion", s:nix8_gui, "", s:nix8_term, "", "", "")

    call s:hi("helpBar", s:nix3_gui, "", s:nix3_term, "", "", "")
    call s:hi("helpHyperTextJump", s:nix8_gui, "", s:nix8_term, "", s:underline, "")

    call s:hi("htmlArg", s:nix7_gui, "", s:nix7_term, "", "", "")
    call s:hi("htmlLink", s:nix4_gui, "", "", "", "NONE", "NONE")
    hi! link htmlBold Bold
    hi! link htmlEndTag htmlTag
    hi! link htmlItalic Italic
    hi! link htmlH1 markdownH1
    hi! link htmlH2 markdownH1
    hi! link htmlH3 markdownH1
    hi! link htmlH4 markdownH1
    hi! link htmlH5 markdownH1
    hi! link htmlH6 markdownH1
    hi! link htmlSpecialChar SpecialChar
    hi! link htmlTag Keyword
    hi! link htmlTagN htmlTag

    call s:hi("javaDocTags", s:nix7_gui, "", s:nix7_term, "", "", "")
    hi! link javaCommentTitle Comment
    hi! link javaScriptBraces Delimiter
    hi! link javaScriptIdentifier Keyword
    hi! link javaScriptNumber Number

    call s:hi("jsonKeyword", s:nix7_gui, "", s:nix7_term, "", "", "")

    call s:hi("lessClass", s:nix7_gui, "", s:nix7_term, "", "", "")
    hi! link lessAmpersand Keyword
    hi! link lessCssAttribute Delimiter
    hi! link lessFunction Function
    hi! link cssSelectorOp Keyword

    hi! link lispAtomBarSymbol SpecialChar
    hi! link lispAtomList SpecialChar
    hi! link lispAtomMark Keyword
    hi! link lispBarSymbol SpecialChar
    hi! link lispFunc Function

    hi! link luaFunc Function

    call s:hi("markdownBlockquote", s:nix7_gui, "", s:nix7_term, "", "", "")
    call s:hi("markdownCode", s:nix7_gui, "", s:nix7_term, "", "", "")
    call s:hi("markdownCodeDelimiter", s:nix7_gui, "", s:nix7_term, "", "", "")
    call s:hi("markdownFootnote", s:nix7_gui, "", s:nix7_term, "", "", "")
    call s:hi("markdownId", s:nix7_gui, "", s:nix7_term, "", "", "")
    call s:hi("markdownIdDeclaration", s:nix7_gui, "", s:nix7_term, "", "", "")
    call s:hi("markdownH1", s:nix8_gui, "", s:nix8_term, "", "", "")
    call s:hi("markdownLinkText", s:nix8_gui, "", s:nix8_term, "", "", "")
    call s:hi("markdownUrl", s:nix4_gui, "", "NONE", "", "NONE", "")
    hi! link markdownBold Bold
    hi! link markdownBoldDelimiter Keyword
    hi! link markdownFootnoteDefinition markdownFootnote
    hi! link markdownH2 markdownH1
    hi! link markdownH3 markdownH1
    hi! link markdownH4 markdownH1
    hi! link markdownH5 markdownH1
    hi! link markdownH6 markdownH1
    hi! link markdownIdDelimiter Keyword
    hi! link markdownItalic Italic
    hi! link markdownItalicDelimiter Keyword
    hi! link markdownLinkDelimiter Keyword
    hi! link markdownLinkTextDelimiter Keyword
    hi! link markdownListMarker Keyword
    hi! link markdownRule Keyword
    hi! link markdownHeadingDelimiter Keyword

    call s:hi("perlPackageDecl", s:nix7_gui, "", s:nix7_term, "", "", "")

    call s:hi("phpClasses", s:nix7_gui, "", s:nix7_term, "", "", "")
    call s:hi("phpDocTags", s:nix7_gui, "", s:nix7_term, "", "", "")
    hi! link phpDocCustomTags phpDocTags
    hi! link phpMemberSelector Keyword

    call s:hi("podCmdText", s:nix7_gui, "", s:nix7_term, "", "", "")
    call s:hi("podVerbatimLine", s:nix4_gui, "", "NONE", "", "", "")
    hi! link podFormat Keyword

    hi! link pythonBuiltin Type
    hi! link pythonEscape SpecialChar

    call s:hi("rubyConstant", s:nix7_gui, "", s:nix7_term, "", "", "")
    call s:hi("rubySymbol", s:nix6_gui, "", s:nix6_term, "", s:bold, "")
    hi! link rubyAttribute Identifier
    hi! link rubyBlockParameterList Operator
    hi! link rubyInterpolationDelimiter Keyword
    hi! link rubyKeywordAsMethod Function
    hi! link rubyLocalVariableOrMethod Function
    hi! link rubyPseudoVariable Keyword
    hi! link rubyRegexp SpecialChar

    call s:hi("rustAttribute", s:nix10_gui, "", s:nix10_term, "", "", "")
    call s:hi("rustEnum", s:nix7_gui, "", s:nix7_term, "", s:bold, "")
    call s:hi("rustMacro", s:nix8_gui, "", s:nix8_term, "", s:bold, "")
    call s:hi("rustModPath", s:nix7_gui, "", s:nix7_term, "", "", "")
    call s:hi("rustPanic", s:nix9_gui, "", s:nix9_term, "", s:bold, "")
    call s:hi("rustTrait", s:nix7_gui, "", s:nix7_term, "", s:italic, "")
    hi! link rustCommentLineDoc Comment
    hi! link rustDerive rustAttribute
    hi! link rustEnumVariant rustEnum
    hi! link rustEscape SpecialChar
    hi! link rustQuestionMark Keyword

    call s:hi("sassClass", s:nix7_gui, "", s:nix7_term, "", "", "")
    call s:hi("sassId", s:nix7_gui, "", s:nix7_term, "", s:underline, "")
    hi! link sassAmpersand Keyword
    hi! link sassClassChar Delimiter
    hi! link sassControl Keyword
    hi! link sassControlLine Keyword
    hi! link sassExtend Keyword
    hi! link sassFor Keyword
    hi! link sassFunctionDecl Keyword
    hi! link sassFunctionName Function
    hi! link sassidChar sassId
    hi! link sassInclude SpecialChar
    hi! link sassMixinName Function
    hi! link sassMixing SpecialChar
    hi! link sassReturn Keyword

    hi! link shCmdParenRegion Delimiter
    hi! link shCmdSubRegion Delimiter
    hi! link shDerefSimple Identifier
    hi! link shDerefVar Identifier

    hi! link sqlKeyword Keyword
    hi! link sqlSpecial Keyword

    call s:hi("vimAugroup", s:nix7_gui, "", s:nix7_term, "", "", "")
    call s:hi("vimMapRhs", s:nix7_gui, "", s:nix7_term, "", "", "")
    call s:hi("vimNotation", s:nix7_gui, "", s:nix7_term, "", "", "")
    hi! link vimFunc Function
    hi! link vimFunction Function
    hi! link vimUserFunc Function

    call s:hi("xmlAttrib", s:nix7_gui, "", s:nix7_term, "", "", "")
    call s:hi("xmlCdataStart", s:nix3_gui_bright, "", s:nix3_term, "", s:bold, "")
    call s:hi("xmlNamespace", s:nix7_gui, "", s:nix7_term, "", "", "")
    hi! link xmlAttribPunct Delimiter
    hi! link xmlCdata Comment
    hi! link xmlCdataCdata xmlCdataStart
    hi! link xmlCdataEnd xmlCdataStart
    hi! link xmlEndTag xmlTagName
    hi! link xmlProcessingDelim Keyword
    hi! link xmlTagName Keyword

    call s:hi("yamlBlockMappingKey", s:nix7_gui, "", s:nix7_term, "", "", "")
    hi! link yamlBool Keyword
    hi! link yamlDocumentStart Keyword

    "+----------------+
    "+ Plugin Support +
    "+----------------+
    "+--- UI ---+
    " ALE
    " > w0rp/ale
    call s:hi("ALEWarningSign", s:nix13_gui, "", s:nix13_term, "", "", "")
    call s:hi("ALEErrorSign" , s:nix11_gui, "", s:nix11_term, "", "", "")
    call s:hi("ALEWarning" , s:nix13_gui, "", s:nix13_term, "", "undercurl", "")
    call s:hi("ALEError" , s:nix11_gui, "", s:nix11_term, "", "undercurl", "")

    " Coc
    " > neoclide/coc.vim
    call s:hi("CocWarningHighlight" , s:nix13_gui, "", s:nix13_term, "", "undercurl", "")
    call s:hi("CocErrorHighlight" , s:nix11_gui, "", s:nix11_term, "", "undercurl", "")
    call s:hi("CocWarningSign", s:nix13_gui, "", s:nix13_term, "", "", "")
    call s:hi("CocErrorSign" , s:nix11_gui, "", s:nix11_term, "", "", "")
    call s:hi("CocInfoSign" , s:nix8_gui, "", s:nix8_term, "", "", "")
    call s:hi("CocHintSign" , s:nix10_gui, "", s:nix10_term, "", "", "")

    if has('nvim')
      " Neovim LSP
      " > neovim/nvim-lspconfig
      call s:hi("LspCodeLens", s:nix3_gui_bright, "", s:nix3_term, "", "", "")
      if has("nvim-0.5")
        call s:hi("LspDiagnosticsDefaultWarning", s:nix13_gui, "", s:nix13_term, "", "", "")
        call s:hi("LspDiagnosticsDefaultError" , s:nix11_gui, "", s:nix11_term, "", "", "")
        call s:hi("LspDiagnosticsDefaultInformation" , s:nix8_gui, "", s:nix8_term, "", "", "")
        call s:hi("LspDiagnosticsDefaultHint" , s:nix10_gui, "", s:nix10_term, "", "", "")
        call s:hi("LspDiagnosticsUnderlineWarning" , s:nix13_gui, "", s:nix13_term, "", "undercurl", "")
        call s:hi("LspDiagnosticsUnderlineError" , s:nix11_gui, "", s:nix11_term, "", "undercurl", "")
        call s:hi("LspDiagnosticsUnderlineInformation" , s:nix8_gui, "", s:nix8_term, "", "undercurl", "")
        call s:hi("LspDiagnosticsUnderlineHint" , s:nix10_gui, "", s:nix10_term, "", "undercurl", "")
      endif

      " Gitsigns
      " > lewis6991/gitsigns.nvim
      hi! link GitSignsCurrentLineBlame Comment
    endif

    " GitGutter
    " > airblade/vim-gitgutter
    call s:hi("GitGutterAdd", s:nix14_gui, "", s:nix14_term, "", "", "")
    call s:hi("GitGutterChange", s:nix13_gui, "", s:nix13_term, "", "", "")
    call s:hi("GitGutterChangeDelete", s:nix11_gui, "", s:nix11_term, "", "", "")
    call s:hi("GitGutterDelete", s:nix11_gui, "", s:nix11_term, "", "", "")

    " Signify
    " > mhinz/vim-signify
    call s:hi("SignifySignAdd", s:nix14_gui, "", s:nix14_term, "", "", "")
    call s:hi("SignifySignChange", s:nix13_gui, "", s:nix13_term, "", "", "")
    call s:hi("SignifySignChangeDelete", s:nix11_gui, "", s:nix11_term, "", "", "")
    call s:hi("SignifySignDelete", s:nix11_gui, "", s:nix11_term, "", "", "")

    " Sneak
    " > justinmk/vim-sneak
    hi! link Sneak Search

    " fugitive.vim
    " > tpope/vim-fugitive
    call s:hi("gitcommitDiscardedFile", s:nix11_gui, "", s:nix11_term, "", "", "")
    call s:hi("gitcommitUntrackedFile", s:nix11_gui, "", s:nix11_term, "", "", "")
    call s:hi("gitcommitSelectedFile", s:nix14_gui, "", s:nix14_term, "", "", "")

    " davidhalter/jedi-vim
    call s:hi("jediFunction", s:nix4_gui, s:nix3_gui, "", s:nix3_term, "", "")
    call s:hi("jediFat", s:nix8_gui, s:nix3_gui, s:nix8_term, s:nix3_term, s:underline.s:bold, "")

    " NERDTree
    " > scrooloose/nerdtree
    call s:hi("NERDTreeExecFile", s:nix7_gui, "", s:nix7_term, "", "", "")
    hi! link NERDTreeDirSlash Keyword
    hi! link NERDTreeHelp Comment

    " CtrlP
    " > ctrlpvim/ctrlp.vim
    hi! link CtrlPMatch Keyword
    hi! link CtrlPBufferHid Normal

    " vim-clap
    " > liuchengxu/vim-clap
    call s:hi("ClapDir", s:nix4_gui, "", "", "", "", "")
    call s:hi("ClapDisplay", s:nix4_gui, s:nix1_gui, "", s:nix1_term, "", "")
    call s:hi("ClapFile", s:nix4_gui, "", "", "NONE", "", "")
    call s:hi("ClapMatches", s:nix8_gui, "", s:nix8_term, "", "", "")
    call s:hi("ClapNoMatchesFound", s:nix13_gui, "", s:nix13_term, "", "", "")
    call s:hi("ClapSelected", s:nix7_gui, "", s:nix7_term, "", s:bold, "")
    call s:hi("ClapSelectedSign", s:nix9_gui, "", s:nix9_term, "", "", "")
    let s:clap_matches = [
            \ [s:nix8_gui,  s:nix8_term] ,
            \ [s:nix9_gui,  s:nix9_term] ,
            \ [s:nix10_gui, s:nix10_term] ,
            \ ]
    for s:nix_clap_match_i in range(1,12)
      let clap_match_color = s:clap_matches[s:nix_clap_match_i % len(s:clap_matches) - 1]
      call s:hi("ClapMatches" . s:nix_clap_match_i, clap_match_color[0], "", clap_match_color[1], "", "", "")
      call s:hi("ClapFuzzyMatches" . s:nix_clap_match_i, clap_match_color[0], "", clap_match_color[1], "", "", "")
    endfor
    unlet s:nix_clap_match_i
    hi! link ClapCurrentSelection PmenuSel
    hi! link ClapCurrentSelectionSign ClapSelectedSign
    hi! link ClapInput Pmenu
    hi! link ClapPreview Pmenu
    hi! link ClapProviderAbout ClapDisplay
    hi! link ClapProviderColon Type
    hi! link ClapProviderId Type

    " vim-indent-guides
    " > nathanaelkane/vim-indent-guides
    call s:hi("IndentGuidesEven", "", s:nix1_gui, "", s:nix1_term, "", "")
    call s:hi("IndentGuidesOdd", "", s:nix2_gui, "", s:nix3_term, "", "")

    " vim-plug
    " > junegunn/vim-plug
    call s:hi("plugDeleted", s:nix11_gui, "", "", s:nix11_term, "", "")

    " vim-signature
    " > kshenoy/vim-signature
    call s:hi("SignatureMarkText", s:nix8_gui, "", s:nix8_term, "", "", "")

    " vim-startify
    " > mhinz/vim-startify
    call s:hi("StartifyFile", s:nix6_gui, "", s:nix6_term, "", "", "")
    call s:hi("StartifyFooter", s:nix7_gui, "", s:nix7_term, "", "", "")
    call s:hi("StartifyHeader", s:nix8_gui, "", s:nix8_term, "", "", "")
    call s:hi("StartifyNumber", s:nix7_gui, "", s:nix7_term, "", "", "")
    call s:hi("StartifyPath", s:nix8_gui, "", s:nix8_term, "", "", "")
    hi! link StartifyBracket Delimiter
    hi! link StartifySlash Normal
    hi! link StartifySpecial Comment

    "+--- Languages ---+
    " Haskell
    " > neovimhaskell/haskell-vim
    call s:hi("haskellPreProc", s:nix10_gui, "", s:nix10_term, "", "", "")
    call s:hi("haskellType", s:nix7_gui, "", s:nix7_term, "", "", "")
    hi! link haskellPragma haskellPreProc

    " JavaScript
    " > pangloss/vim-javascript
    call s:hi("jsGlobalNodeObjects", s:nix8_gui, "", s:nix8_term, "", s:italic, "")
    hi! link jsBrackets Delimiter
    hi! link jsFuncCall Function
    hi! link jsFuncParens Delimiter
    hi! link jsThis Keyword
    hi! link jsNoise Delimiter
    hi! link jsPrototype Keyword
    hi! link jsRegexpString SpecialChar

    " Pandoc
    " > vim-pandoc/vim-pandoc-syntax
    call s:hi("pandocDefinitionBlockTerm", s:nix7_gui, "", s:nix7_term, "", s:italic, "")
    call s:hi("pandocTableDelims", s:nix3_gui, "", s:nix3_term, "", "", "")
    hi! link pandocAtxHeader markdownH1
    hi! link pandocBlockQuote markdownBlockquote
    hi! link pandocCiteAnchor Operator
    hi! link pandocCiteKey pandocReferenceLabel
    hi! link pandocDefinitionBlockMark Operator
    hi! link pandocEmphasis markdownItalic
    hi! link pandocFootnoteID pandocReferenceLabel
    hi! link pandocFootnoteIDHead markdownLinkDelimiter
    hi! link pandocFootnoteIDTail pandocFootnoteIDHead
    hi! link pandocGridTableDelims pandocTableDelims
    hi! link pandocGridTableHeader pandocTableDelims
    hi! link pandocOperator Operator
    hi! link pandocPipeTableDelims pandocTableDelims
    hi! link pandocReferenceDefinition pandocReferenceLabel
    hi! link pandocReferenceLabel markdownLinkText
    hi! link pandocReferenceURL markdownUrl
    hi! link pandocSimpleTableHeader pandocAtxHeader
    hi! link pandocStrong markdownBold
    hi! link pandocTableHeaderWord pandocAtxHeader
    hi! link pandocUListItemBullet Operator

    if has('nvim')
      " tree-sitter
      " > nvim-treesitter/nvim-treesitter
      hi! link TSAnnotation Annotation
      hi! link TSConstBuiltin Constant
      hi! link TSConstructor Function
      hi! link TSEmphasis Italic
      hi! link TSFuncBuiltin Function
      hi! link TSFuncMacro Function
      hi! link TSStringRegex SpecialChar
      hi! link TSStrong Bold
      hi! link TSStructure Structure
      hi! link TSTagDelimiter TSTag
      hi! link TSUnderline Underline
      hi! link TSVariable Variable
      hi! link TSVariableBuiltin Keyword
    endif

    " TypeScript
    " > HerringtonDarkholme/yats.vim
    call s:hi("typescriptBOMWindowMethod", s:nix8_gui, "", s:nix8_term, "", s:italic, "")
    call s:hi("typescriptClassName", s:nix7_gui, "", s:nix7_term, "", "", "")
    call s:hi("typescriptDecorator", s:nix12_gui, "", s:nix12_term, "", "", "")
    call s:hi("typescriptInterfaceName", s:nix7_gui, "", s:nix7_term, "", s:bold, "")
    call s:hi("typescriptRegexpString", s:nix13_gui, "", s:nix13_term, "", "", "")
    " TypeScript JSX
     call s:hi("tsxAttrib", s:nix7_gui, "", s:nix7_term, "", "", "")
    hi! link typescriptOperator Operator
    hi! link typescriptBinaryOp Operator
    hi! link typescriptAssign Operator
    hi! link typescriptMember Identifier
    hi! link typescriptDOMStorageMethod Identifier
    hi! link typescriptArrowFuncArg Identifier
    hi! link typescriptGlobal typescriptClassName
    hi! link typescriptBOMWindowProp Function
    hi! link typescriptArrowFuncDef Function
    hi! link typescriptAliasDeclaration Function
    hi! link typescriptPredefinedType Type
    hi! link typescriptTypeReference typescriptClassName
    hi! link typescriptTypeAnnotation Structure
    hi! link typescriptDocNamedParamType SpecialComment
    hi! link typescriptDocNotation Keyword
    hi! link typescriptDocTags Keyword
    hi! link typescriptImport Keyword
    hi! link typescriptExport Keyword
    hi! link typescriptTry Keyword
    hi! link typescriptVariable Keyword
    hi! link typescriptBraces Normal
    hi! link typescriptObjectLabel Normal
    hi! link typescriptCall Normal
    hi! link typescriptClassHeritage typescriptClassName
    hi! link typescriptFuncTypeArrow Structure
    hi! link typescriptMemberOptionality Structure
    hi! link typescriptNodeGlobal typescriptGlobal
    hi! link typescriptTypeBrackets Structure
    hi! link tsxEqual Operator
    hi! link tsxIntrinsicTagName htmlTag
    hi! link tsxTagName tsxIntrinsicTagName

    " Markdown
    " > plasticboy/vim-markdown
    call s:hi("mkdCode", s:nix7_gui, "", s:nix7_term, "", "", "")
    call s:hi("mkdFootnote", s:nix8_gui, "", s:nix8_term, "", "", "")
    call s:hi("mkdRule", s:nix10_gui, "", s:nix10_term, "", "", "")
    call s:hi("mkdLineBreak", s:nix9_gui, "", s:nix9_term, "", "", "")
    hi! link mkdBold Bold
    hi! link mkdItalic Italic
    hi! link mkdString Keyword
    hi! link mkdCodeStart mkdCode
    hi! link mkdCodeEnd mkdCode
    hi! link mkdBlockquote Comment
    hi! link mkdListItem Keyword
    hi! link mkdListItemLine Normal
    hi! link mkdFootnotes mkdFootnote
    hi! link mkdLink markdownLinkText
    hi! link mkdURL markdownUrl
    hi! link mkdInlineURL mkdURL
    hi! link mkdID Identifier
    hi! link mkdLinkDef mkdLink
    hi! link mkdLinkDefTarget mkdURL
    hi! link mkdLinkTitle mkdInlineURL
    hi! link mkdDelimiter Keyword

    " PHP
    " > StanAngeloff/php.vim
    call s:hi("phpClass", s:nix7_gui, "", s:nix7_term, "", "", "")
    call s:hi("phpClassImplements", s:nix7_gui, "", s:nix7_term, "", s:bold, "")
    hi! link phpClassExtends phpClass
    hi! link phpFunction Function
    hi! link phpMethod Function
    hi! link phpUseClass phpClass

    " Vimwiki
    " > vimwiki/vimwiki
    if !exists("g:vimwiki_hl_headers") || g:vimwiki_hl_headers == 0
      for s:i in range(1,6)
        call s:hi("VimwikiHeader".s:i, s:nix8_gui, "", s:nix8_term, "", s:bold, "")
      endfor
    else
      let s:vimwiki_hcolor_guifg = [s:nix7_gui, s:nix8_gui, s:nix9_gui, s:nix10_gui, s:nix14_gui, s:nix15_gui]
      let s:vimwiki_hcolor_ctermfg = [s:nix7_term, s:nix8_term, s:nix9_term, s:nix10_term, s:nix14_term, s:nix15_term]
      for s:i in range(1,6)
        call s:hi("VimwikiHeader".s:i, s:vimwiki_hcolor_guifg[s:i-1] , "", s:vimwiki_hcolor_ctermfg[s:i-1], "", s:bold, "")
      endfor
    endif
    call s:hi("VimwikiLink", s:nix8_gui, "", s:nix8_term, "", s:underline, "")
    hi! link VimwikiHeaderChar markdownHeadingDelimiter
    hi! link VimwikiHR Keyword
    hi! link VimwikiList markdownListMarker

    " YAML
    " > stephpy/vim-yaml
    call s:hi("yamlKey", s:nix7_gui, "", s:nix7_term, "", "", "")

    "+------------+
    "+ Public API +
    "+------------+
    "+--- Functions ---+

    function! NixPalette() abort
      let ret = {}
      for color in range(16)
        execute 'let ret["nix'.color.'"] = s:nix'.color.'_gui'
      endfor
      let ret["nix3_bright"] = s:nix3_gui_bright
      return ret
    endfunction
  '';
}
