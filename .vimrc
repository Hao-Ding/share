" uncompatible with vi
set nocompatible

" highlight the syntax
if has("syntax")
    syntax on
endif
colorscheme ron

" detect file type
filetype on
filetype plugin on
filetype plugin indent on

" if using a dark background within the editing area and syntax highlighting, 
" turn on this option as well
set background=dark

" jump to the last position when reopening a file
if has("autocmd")
    au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif 
endif

" indent in the same way as the its former line
set autoindent

" smart indent
set smartindent

" length of tab = 4
set tabstop=4

" length of soft tab = 4
set softtabstop=4

" length of auto indent = 4
set shiftwidth=4

" use the auto indent style of c language
set cindent

" show the matched parenthesis
set showmatch

" enable to move the head or the end of one line to another
set whichwrap=b,s,<,>,[,]

" show the number of lines
set number

" set command history to 100
set history=100

"" --status line setting--
" show the status line of the last window all the time
set laststatus=2

" set the location of the cursor
set ruler

"" --command line setting--
" show the command you input
set showcmd 
" show the current mode of vim
set showmode

"" --find setting--
" show finding results on-time
set incsearch
" highlight the results
set hlsearch

"" --fold setting--
" use syntax highlight to define fold
set foldmethod=syntax
" do not auto fold when start vim
set foldlevel=100
" set the length
set foldcolumn=3


" no need for backup files
set nobackup 

" make mouse available anywhere inside of the buffer
set mouse=a
set selection=exclusive
set selectmode=mouse,key


"" --define function SetTitle, insert the headers automatically--
autocmd BufNewFile *.c,*.py,*.cpp,*.sh,*.java exec ":call SetTitle()"
func SetTitle() 
	if &filetype == 'sh'
		call append(0, "#!/bin/bash") 
		call append(1, "# Author: Hao Ding") 
		call append(2, "# Created Time: ".strftime("%c")) 
		call append(3, "")
	elseif &filetype == 'cpp'
	    call append(0, "/********************************************************") 
	    call append(1, " * Author		: Hao Ding") 
	    call append(2, " * Email		: dinghao_nwpu@hotmail.com") 
	    call append(3, " * Created Time	: ".strftime("%c"))  
	    call append(4, " * Filename		: ".expand("%")) 
	    call append(5, " * Description	: ") 
	    call append(6, " * ******************************************************/") 
	    call append(7, "#include<iostream>")
	    call append(8, "#include<string>")
	    call append(9, "#include<cstdlib>")
	    call append(10, "using namespace std;")
		call append(11, "")
	    call append(12, "int main(){")
	    call append(13, "")
	    call append(14, "    return 0;")
	    call append(15, "}")
	elseif &filetype == 'c'
	    call append(0, "/********************************************************") 
	    call append(1, " * Author		: Hao Ding") 
	    call append(2, " * Email		: dinghao_nwpu@hotmail.com") 
	    call append(3, " * Created Time	: ".strftime("%c"))  
	    call append(4, " * Filename		: ".expand("%")) 
	    call append(5, " * Description	: ") 
	    call append(6, " * ******************************************************/") 
	    call append(7, "#include<stdio.h>")
	    call append(8, "#include<stdlib.h>")
	    call append(9, "#include<string.h>")
	    call append(10, "") 
	    call append(11, "int main(){")
	    call append(12, "")
	    call append(13, "    return 0;")
	    call append(14, "}")
	elseif &filetype == 'python'
	    call append(0, "\#!/usr/bin/env python") 
	    call append(1, "# Author: Hao Ding") 
	    call append(2, "# Created Time: ".strftime("%c")) 
	    call append(3, "") 
	else
	    call append(0, "/********************************************************") 
	    call append(1, " * Author		: Hao Ding") 
	    call append(2, " * Email		: dinghao_nwpu@hotmail.com") 
	    call append(3, " * Created Time	: ".strftime("%c"))  
	    call append(4, " * Filename		: ".expand("%")) 
	    call append(5, " * Description	: ") 
	    call append(6, " * ******************************************************/") 
	endif
	normal G
endfunc
