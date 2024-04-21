set nocompatible
filetype off

"
" Set Colorscheme
"
set termguicolors
colorscheme nix


"
" Enable filetype plugins and syntax highlighting 
"
filetype plugin indent on

syntax enable
syntax on


"
" Switch leader to backslash
"
let mapleader='\'


"
" Set basic options
"
set backspace=indent,eol,start  " Backspace across line breaks, start-of-insert, etc.
set encoding=utf-8              " Default for new files is UTF-8
set expandtab                   " Tabs are evil
set conceallevel=2
set concealcursor=nc
set cursorline                  " Highlight current line
set cursorcolumn                " Highlight current column
set hidden                      " Allow background buffers to stay loaded
set hlsearch                    " Highlight matches
set ignorecase                  " Case insensitive-searech
set smartcase                   " ... unless UPPER_CASE chars are searched for
set incsearch                   " Search while typing
set laststatus=2                " Permanent statusline
set lazyredraw                  " Faster redraws
set lcs=tab:»·,trail:·          " Set chars to draw when visualizing special chars
set list                        " Show tabs and trailing whitespace
set modelines=0                 " ??
set nobackup                    " No backup files
set nowritebackup               " No backup files
set nowrap                      " No line wrapping
set number                      " Show line numbers
set relativenumber              " Use relative numbering
set shiftround                  " Always shift to a multiple of shiftwidth
set shiftwidth=4                " Default tabstop is 4
set softtabstop=4               " Seriously
set tabstop=4                   " Seriously
set shortmess=atIc              " Disable lots of annoying prompts
set sidescroll=1                " Allow horizontal scrolling one-char-at-a-time
set termguicolors               " Use terminal colors
set virtualedit=block           " Allow block editing to affect where there is no data
set visualbell                  " No audio bell
" set noshowmode
set ttyfast                     " We are on a fast tty, so redraw agressively
set showcmd                     " We are on a fast tty, so show partial commands
set mouse=a                     " Allow all mouse-based interactions
set signcolumn=yes              " Enable sign-column for hint/lint/etc. integration
set undodir=~/.vimdid           " Centralized undo repository
set undofile                    " Keep undo files there
set updatetime=300              " Faster disk writes


"
" Helper bindings
"
nnoremap <silent> <leader>cd :cd %:p:h<cr>
nnoremap <silent> <leader>tl :set invlist<cr>:set list?<cr>
nnoremap <silent> <leader>tn :set invnumber<cr>:set invrelativenumber<cr>
nnoremap <silent> <leader>tc :set invcursorline<cr>:set invcursorcolumn<cr>
nnoremap <silent> <leader>tw :set invwrap<cr>:set wrap?<cr>
nnoremap <silent> <leader>ve :e ~/.config/nvim/init.vim<cr>
nnoremap <silent> <leader>vs :source ~/.local/nvim/init.vim<cr>
nnoremap <silent> <Esc><Esc> :let @/=""<cr>
nnoremap Y y$


"
" When searching, keep matches centered in screen
"
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz


"
" Fix how vertical movement interacts with wrapping
"
nnoremap j gj
nnoremap k gk

"
" Lualine
"
lua << END
require('nvim-web-devicons').setup({
  color_icons = true;
  default = true;
  strict = true;
})
require('nvim-web-devicons').refresh()
require('lualine').setup({
  options = {
    icons_enabled = false,
    theme = 'nord',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
})
END


"
" FZF
"
let g:fzf_layout = { 'down': '~40%' }

let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Other mode completion
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler nonumber norelativenumber
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler number relativenumber

nnoremap <silent> <leader>fo :Files<CR>
nnoremap <silent> <tab> :Buffers<CR>
