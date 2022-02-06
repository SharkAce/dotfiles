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

" Initialize plugin system
call plug#end()

set nohlsearch
set nu rnu
set relativenumber
set cursorline
set smarttab
set cindent
set tabstop=2
set shiftwidth=2
set expandtab
set hidden
set updatetime=300
set shortmess+=c
set signcolumn=yes
set noshowmode


nnoremap <C-m> :Lex! \| vertical resize -45

lua << END

require ('lualine').setup {
  options = { 
    theme  = 'gruvbox',
    section_separators = { left = '', right = '' },
    component_separators = { left = '', right = '' }
  }
}
  
require('lualine').setup() 

END

let g:NERDTreeIgnore = ['^node_modules$']

let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

colorscheme gruvbox
