" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

Plug 'kana/vim-surround'
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ryanoasis/vim-devicons'
Plug 'airblade/vim-gitgutter'
Plug 'ctrlpvim/ctrlp.vim' " fuzzy find files
Plug 'scrooloose/nerdcommenter'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'christoomey/vim-tmux-navigator'
Plug 'morhetz/gruvbox'
Plug 'HerringtonDarkholme/yats.vim' " TS Syntax
Plug 'bfrg/vim-cpp-modern'
Plug 'preservim/nerdtree'
Plug 'lervag/vimtex'
Plug 'rhysd/vim-grammarous'
Plug 'luochen1990/rainbow'
Plug 'neoclide/coc-snippets'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'mhinz/vim-startify'

" Initialize plugin system
call plug#end()

autocmd VimEnter * :call system("xdotool key ctrl+F2 ctrl+equal ctrl+equal ctrl+equal")
autocmd VimLeave * :call system("xdotool key ctrl+F2")

" NERDTREE config
nnoremap <C-n> :NERDTreeToggle<CR>
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"
let g:NERDTreeIgnore = ['^node_modules$', '\.o$', '\.d$','\~$']
let g:NERDTreeMinimalUI = 1

au BufRead,BufNewFile *.ludi set filetype=ludi
" Initialize plugin system

set nohlsearch
set nu rnu
set relativenumber
set cursorline
set cindent
set tabstop=2
set shiftwidth=2
set hidden
set updatetime=300
set shortmess+=c
set signcolumn=yes
set noshowmode
set pumheight=10
set mouse=a

let g:startify_padding_left = 10
let g:startify_custom_header = startify#pad([
	\ '                               __                ',
	\ '  ___      __    ___   __  __ /\_\    ___ ___    ',
	\ '/'' _ `\  /''__`\ / __`\/\ \/\ \\/\ \ /'' __` __`\',
	\ '/\ \/\ \/\  __//\ \L\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ',
	\ '\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\',
	\ ' \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/',
	\ '',
	\ ])
    let g:startify_commands = [
        \ {'f': ['Fuzzy find files', 'CtrlP']},
        \ ]

    let g:startify_lists = [
          \ { 'type': 'files',     'header': ['   MRU']            },
          \ { 'type': 'sessions',  'header': ['   Sessions']       },
          \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
          \ { 'type': 'commands',  'header': ['   Commands']       },
          \ ]


" Ctrlp config
let g:ctrlp_max_files = 0
let g:ctrlp_max_depth = 6
let g:ctrlp_show_hidden = 1
let g:ctrlp_use_caching = 1
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_custom_ignore = {
	\ 'dir':  '\v[\/](\.git|\.vim|\.cache|\.mozilla|\.npm|\.local|node_modules|discord|apps)$',
	\ 'file': '\v\.(exe|so|dll)$',
	\ }

colorscheme gruvbox
hi WinSeparator guifg=#606060

syntax enable

" GrammarousCheck config
command! GrammarousCheckFr GrammarousCheck --lang=fr

let g:grammarous#jar_url = 'https://www.languagetool.org/download/LanguageTool-5.9.zip'
let g:grammarous#hooks = {}
function! g:grammarous#hooks.on_check(errs) abort
    nmap <buffer><C-n> <Plug>(grammarous-move-to-next-error)
    nmap <buffer><C-p> <Plug>(grammarous-move-to-previous-error)
    nmap <buffer><C-f> <Plug>(grammarous-fixit)
    nmap <buffer><C-a> <Plug>(grammarous-fixall)
    nmap <buffer><C-i> <Plug>(grammarous-move-to-info-window)
    nmap <buffer><C-d> <Plug>(grammarous-disable-rule)
endfunction

function! g:grammarous#hooks.on_reset(errs) abort
    nunmap <buffer><C-n>
    nunmap <buffer><C-p>
    nunmap <buffer><C-f>
    nunmap <buffer><C-a>
    nunmap <buffer><C-i>
    nunmap <buffer><C-d>
endfunction

command! WebdevIndent call SetSpaces()

function! SetSpaces()
  set expandtab
  set shiftwidth=4
  set softtabstop=4
  set autoindent
  set smartindent
endfunction

" lualine config
lua << END

require ('lualine').setup {
  options = { 
    theme  = 'gruvbox',
    section_separators = { left = '', right = '' },
    component_separators = { left = '', right = '' }
  }
}
  
require('lualine').setup() 

END
