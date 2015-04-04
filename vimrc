" Vimrc 

" ===============================
" 1. Configuracion genèriques
" ==============================
set nocompatible "Desactivem compatibilitat amb vi
set history=1000 " Aumentem el tamany del historial


" ===============================
" Plugins del Vundle
" ===============================
" Inicialitzem Vundle
filetype off "Requisit de Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Autoadministració del Vundle per Vundle
Plugin 'gmarik/vundle.vim'

" Plugins
Plugin 'bling/vim-airline'      " Airline
Plugin 'scrooloose/nerdtree'	" NERDTree
Plugin 'tpope/vim-fugitive'	" Fugitive
Plugin 'majutsushi/tagbar'	" Tagbar
Plugin 'Valloric/YouCompleteMe'	" YouCompleteMe

" Suport per a llenguatges
Plugin 'tfnico/vim-gradle'	"Gradle

" Temes
Plugin 'endel/vim-github-colorscheme'		" Github
Plugin 'altercation/vim-colors-solarized'	" Solarized
Plugin 'benjaminwhite/Benokai'			" Benokai
Plugin 'cschlueter/vim-wombat'			" Wombat
Plugin 'chriskempson/vim-tomorrow-theme'	" Tomorrow Theme

" Finalitzem inicialització de plugins
call vundle#end()
filetype plugin indent on " Restore filetype

" ===============================
" 3. Configuració per a fitxers
" ===============================

set noswapfile
set nobackup

set autoindent
set expandtab
set shiftwidth=4
set softtabstop=4

set encoding=utf-8
set backspace=indent,eol,start


" =========================================
" 4. Configuracions especifiques de fitxers
" =========================================

autocmd FileType html,css,sass,scss,javascript,json,*.coffee
            \ setlocal shiftwidth=2 softtabstop=2

" ===============================
" 5. Colors i interfaç
" ===============================

if &t_Co > 2 || has("gui_running")
   syntax on
   set colorcolumn=80
endif

if &t_Co >= 256 || has("gui_running")
    color solarized
    set background=dark
endif

set showmode	
set laststatus=2
set wildmenu

set nowrap
set number
set relativenumber
set cursorline
set cursorcolumn
set showmatch

set ruler

colorscheme Tomorrow-Night-Eighties
let g:airline_powerline_fonts = 1

" ===============================
" 6. Mapetjos i funcions
" ===============================

let mapleader="," "Pa variar la coma de mapleader

" Navegació mes ràpida entre finestres
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Ctrl tab millor no?
map <C-TAB> :tabn<CR>
map <C-S-TAB> :tabp<CR>

" NERDTree map ===> ,nt per obrir/tancar
command NT NERDTree     " Legacy. Classy. I didn't know the power of maps yet.
nmap <Leader>nt :NERDTreeToggle<cr>
nmap <F8> :TagbarToggle<CR> 
:let g:NERDTreeWinSize=20
:let g:tagbar_width=20

" Per canviar entre nombres relatius i no relatius
function! ToggleRelativeNumber()
    if &relativenumber == 1
        set norelativenumber
        set number
    else
        set relativenumber
    endif
endfunction

nmap <F5> :call ToggleRelativeNumber()<CR>
imap <F5> <Esc>:call ToggleRelativeNumber()<CR>a

" Ordres en majuscules
if has("user_commands")
    command! -bang -nargs=? -complete=file E e<bang> <args>
    command! -bang -nargs=? -complete=file W w<bang> <args>
    command! -bang -nargs=? -complete=file Wq wq<bang> <args>
    command! -bang -nargs=? -complete=file WQ wq<bang> <args>
    command! -bang Wa wa<bang>
    command! -bang WA wa<bang>
    command! -bang Q q<bang>
    command! -bang QA qa<bang>
    command! -bang Qa qa<bang>
endif

