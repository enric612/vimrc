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

Plugin 'bling/vim-airline'              " Airline
Plugin 'scrooloose/nerdtree'	        " NERDTree
Plugin 'tpope/vim-fugitive'	        " Fugitive
Plugin 'majutsushi/tagbar'	        " Tagbar
Plugin 'jeetsukumaran/vim-buffergator'  "Buffergator 
                                        " Navegador de Buffers
                                        " Enter Obrir
                                        " <C-V> Obrir en split vertical
                                        " <C-S> Obrir en split horitzontal
                                        " <C-T> Obrir en nova pestanya
                                        "
" YCM Requereix compilar i es molest, per defecte el deixe deshabilitat
" pero si es necesari es pot habilitar i recompilar una vegada instal·lat

"Plugin 'Valloric/YouCompleteMe'	" YouCompleteMe
"Plugin 'SirVer/ultisnips'       " UltiSnipets
Plugin 'honza/vim-snippets'     "Vim Snippets

"NeoCompleteCache
Plugin 'Shougo/neocomplcache'
Plugin 'Shougo/neosnippet'
Plugin 'Shougo/neosnippet-snippets'

" NeoComplete
Plugin 'Shougo/neocomplete'


Plugin 'spf13/vim-autoclose'    " Autoclose
Plugin 'klen/python-mode'


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
set smartindent
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
    colorscheme Tomorrow-Night-Eighties
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
"map <C-TAB> :tabn<CR>
""map <C-S-TAB> :tabp<CR>

" Navegació per tabs com a Firefox
nmap <C-S-h> :tabprevious<CR>
nmap <C-l>   :tabnext<CR>
nmap <C-t>     :tabnew<CR>
imap <C-S-h> <Esc>:tabprevious<CR>i
imap <C-l>   <Esc>:tabnext<CR>i
imap <C-t>     <Esc>:tabnew<CR>


" NERDTree map ===> ,nt per obrir/tancar
command NT NERDTree     " Legacy. Classy. I didn't know the power of maps yet.
nmap <Leader>n :NERDTreeToggle<cr>
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

" Airline
let g:airline#extensions#tabline#enabled = 1
"YCM
"let g:ycm_autoclose_preview_window_after_completion=0
"nnoremap <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>

"Neocomplete
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#enable_auto_delimiter = 1
let g:neocomplete#max_list = 15
let g:neocomplete#force_overwrite_completefunc = 1

let g:neocomplete#sources#dictionary#dictionaries = {
                        \ 'default' : '',
                        \ 'vimshell' : $HOME.'/.vimshell_hist',
                        \ 'scheme' : $HOME.'/.gosh_completions'
                        \ }
if !exists('g:neocomplete#sources#omni#input_patterns')
                let g:neocomplete#sources#omni#input_patterns = {}
            endif
            let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
            let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
            let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
            let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
            let g:neocomplete#sources#omni#input_patterns.ruby = '[^. *\t]\.\h\w*\|\h\w*::'

let g:acp_enableAtStartup = 0
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_enable_auto_delimiter = 1
let g:neocomplcache_max_list = 15
let g:neocomplcache_force_overwrite_completefunc = 1 

" Enable omni completion.
            autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
            autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
            autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
            autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
            autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
            autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
            autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

            " Enable heavy omni completion.
            if !exists('g:neocomplcache_omni_patterns')
                let g:neocomplcache_omni_patterns = {}
            endif
            let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
            let g:neocomplcache_omni_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
            let g:neocomplcache_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
            let g:neocomplcache_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
            let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\h\w*\|\h\w*::'
            let g:neocomplcache_omni_patterns.go = '\h\w*\.\?'
