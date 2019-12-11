set nocompatible              " required
filetype off                  " required


" set the runtime path to include Vundle and initialize
set rtp+=/etc/vim/bundle/Vundle.vim/
call vundle#begin("/etc/vim/bundle")


" let Vundle manage Vundle, required
Plugin 'gmarik/vundle'

" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)
Plugin 'tweekmonster/braceless.vim' " python folding
Plugin 'hynek/vim-python-pep8-indent' " nice auto-indent
Plugin 'davidhalter/jedi-vim' " autocompletion and doc completion (K)
Plugin 'scrooloose/syntastic' " static python analysis with pylint (on save)
Plugin 'ervandew/supertab' " use tab for completion
Plugin 'nvie/vim-flake8' " static python analysis with flake8 (hit F7 key)
Plugin 'scrooloose/nerdtree' " browse files tree
Plugin 'tpope/vim-fugitive' " git
Plugin 'vim-airline/vim-airline' " status bar (needs special fonts)
Plugin 'vim-airline/vim-airline-themes' " bubblegum theme for status bar
Plugin 'Lokaltog/vim-distinguished' " soft color scheme
Plugin 'tomasr/molokai' " another color scheme

call vundle#end()            " required

" All Plugins added before the following line
filetype plugin indent on    " required
autocmd FileType python BracelessEnable -indent

" airline : 
" add this to env : export TERM='xterm-256color'
" requires powerline fonts
let g:airline_powerline_fonts = 1
set laststatus=2
au VimEnter * exec 'AirlineTheme bubblegum'
" enable syntastic integration
let g:airline#extensions#syntastic#enabled = 1

set encoding=utf-8

let python_highlight_all=1
syntax on

colorscheme molokai
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
set nu
set clipboard=unnamed
set colorcolumn=79 " highlight column 79
set number
set relativenumber
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent

let g:syntastic_c_include_dirs = ['/usr/include']
set mouse=a
