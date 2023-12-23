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

" Initialize plugin system
call plug#end()

autocmd VimEnter * :call system("xdotool key ctrl+F2 ctrl+equal ctrl+equal ctrl+equal")
autocmd VimLeave * :call system("xdotool key ctrl+F2")


" Initialize plugin system
nnoremap <C-n> :NERDTreeToggle<CR>
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"

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


let g:NERDTreeIgnore = ['^node_modules$', '\.o$', '\~$']

let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

colorscheme gruvbox

syntax enable

" GrammarousCheck config
command GrammarousCheckEn set spelllang=en-US | GrammarousCheck
command GrammarousCheckFr set spelllang=fr | GrammarousCheck

let g:grammarous#jar_url = 'https://www.languagetool.org/download/LanguageTool-5.9.zip'
"let g:grammarous#use_vim_spelllang = 1
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
