" enric612 gvimrc basat amb el gvimrc de danirod
"
" Autor original : 
"			Dani Rodríguez <danirod@outlook.com>
" Autor actual (modificacions posteriors) : 
"			Enric Climent <enric@ecliment.ovh>


" Desactivar barra de eines
set guioptions-=T

" Seleccionant Font

if has("win32") || has("win64")
	"Intentem sempre posar Monaco (amb powerline) 
	"si no consolas. Monaco amb power line esta disponible
	" al meu repositori : 
	" <https://github.com/enric612/Linux-X-for-PowerLine.git>
	set guifont=Monaco_For_Powerline:h11,Consolas:h11
elseif has("gui_gtk2")
	"Mateix cas, primer Monaco
	set guifont=Monaco\ For\ Powerline\ 14,Ubuntu\ Mono\ 13,DejaVu\ Sans\ Mono\ 10
elseif has("gui_macvim")
	"Estos no se com esta la cosa de fonts, ho deixe igual
	set linespace=1
	set guifont=Menlo:h16
endif
