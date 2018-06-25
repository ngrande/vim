colorscheme Tomorrow-Night

filetype indent plugin on
syntax enable

" set leader key
" german keyboard -> ä is easy to reach and should not be mapped for anything
" other because it is a weird letter
let mapleader="ä"

" indentation and formatting
"set autoindent
set number
set tabstop=4
set shiftwidth=4
set softtabstop=4
set noexpandtab
set list
set listchars=tab:>-,trail:.,space:·

" highlight current cursor line
" set cursorline
" highlight column of cursor
" set cursorcolumn

" stuff...
set wrap
set showcmd
set foldmethod=syntax
" open file unfoleded
set foldlevelstart=20
" activate mouse support
set mouse=a

" search
set incsearch
set hlsearch
" generally ignore case when searching
set ignorecase
" switch to case sensitive search when using a upper case letter
set smartcase

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" airline
" always show status line
set laststatus=2
let g:airline#extensions#tabline#enabled=1
"let g:airline#extensions#hunks#enabled=0
let g:airline#extensions#branch#enabled=1
let g:airline#extensions#syntastic#enabled=1
let g:airline#extensions#syntastic#error_symbol= 'E:'
let g:airline#extensions#syntastic#stl_format_err = '%E{[%e(#%fe)]}'
let g:airline#extensions#syntastic#warning_symbol = 'W:'
let g:airline#extensions#syntastic#stl_format_err = '%W{[%w(#%fw)]}'
let g:airline_theme='powerlineish'
let g:airline_powerline_fonts = 1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""
" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_check_on_open = 1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
" pylint settings
let g:syntastic_python_pylint_post_args="--disable=broad-except,import-error,line-too-long,logging-format-interpolation,bad-whitespace,mixed-indentation,invalid-name,missing-docstring,bad-continuation"
""""""""""""""""""""""""""""""""""""


" powerline with pthon3
let g:powerline_pycmd="py3"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" YouCompleteMe settings
" YouCompleteMe is in AUR and compiled with python2 ... so
let g:ycm_server_python_interpreter="python2"
let g:ycm_python_binary_path="python3"
let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""
" command line completion
set wildmenu
set wildmode=list:longest,full
set wildignore=.git,*.pyc,*.o,*.a,*.swp
"""""""""""""""""""""""""""""""""""



""""""""""""""""""""""""""""""""""
" spell checking
if version >= 700
	set spl=en spell
	" spellcheck by default off
	"set nospell
	set nospell
endif
""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""
" some special key mappings etc.
" switch # and * for searching
nnoremap # *``
nnoremap * #``
" toggle NERDTree
nnoremap T <ESC><ESC>:NERDTreeToggle<CR>
" press <F2> to jump to end of file and add vim modeline - genius!
nnoremap <F2> Go<CR><ESC>dd0ovim: tabstop=4 shiftwidth=4 noexpandtab<ESC>äcc

" YCM FixIt
nnoremap <Leader>f :YcmCompleter FixIt<CR>

nnoremap <C-Up> <C-W><Up>
nnoremap <C-Down> <C-W><Down>
nnoremap <C-Right> <C-W><Right>
nnoremap <C-Left> <C-W><Left>
""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""
" WORKAROUNDS
"""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup Gui
	autocmd!
	" special keys should only be very subtle (colorized)
	autocmd BufEnter,BufRead,BufNewFile,ColorScheme * highlight SpecialKey ctermfg=8
	autocmd BufEnter,BufRead,BufNewFile,ColorScheme * highlight CursorLineNr ctermfg=black ctermbg=lightgreen
	" detect .c files as cpp because we compile everything as cpp source
	autocmd BufNewFile,BufRead *.c set filetype=cpp
augroup END
"""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""


augroup SaveCursor
	autocmd!
	autocmd BufReadPost * call setpos(".", getpos("'\""))
augroup END

augroup PythonCustom
	autocmd!
	" (syntax) highlight for keyword 'self'
	autocmd FileType python syn match pythonStatement "\(\W\|^\)\@<=self\([\.,)]\)\@="
augroup END

augroup Templates
	autocmd!
	autocmd BufNewFile *.cpp	0r ~/.vim/my_templates/template.cxx
	autocmd BufNewFile *.cxx	0r ~/.vim/my_templates/template.cxx
	autocmd BufNewFile *.h		0r ~/.vim/my_templates/template.h
	autocmd BufNewFile *.py		0r ~/.vim/my_templates/template.py
augroup END
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
