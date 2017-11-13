" All system-wide defaults are set in $VIMRUNTIME/archlinux.vim (usually just
" /usr/share/vim/vimfiles/archlinux.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vimrc), since archlinux.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing archlinux.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages.
runtime! archlinux.vim


colorscheme Tomorrow-Night

filetype on
filetype plugin on 
filetype indent plugin on
syntax enable

" dont know what this does...
"set grepprg=grep\ -nH\ $*

" set leader key
let mapleader="ä"

" indentation and formatting
set autoindent
set number
set tabstop=4
set shiftwidth=4
set softtabstop=4
set noexpandtab
set smartcase
set list
set listchars=tab:>-,trail:.,space:·

" recognize our modelines
set modeline

" stuff...
"set visualbell
set nowrap
set showcmd
"set foldmethod=marker
" activate mouse support
set mouse=a

" search
set incsearch
set hlsearch

" buffers
"set nohidden

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" airline
set laststatus=2
let g:airline#extensions#tabline#enabled=1
"let g:airline#extensions#hunks#enabled=0
let g:airline#extensions#branch#enabled=1
let g:airline#extensions#syntastic#enabled=1
let g:airline#extensions#syntastic#error_symbol= 'E:'
let g:airline#extensions#syntastic#stl_format_err = '%E{[%e(#%fe)]}'
let g:airline#extensions#syntastic#warning_symbol = 'W:'
let g:airline#extensions#syntastic#stl_format_err = '%W{[%w(#%fw)]}'
"let g:airline_theme='badwolf'
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
let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""
" command line completion
set wildmenu
set wildmode=list:longest,full
set wildignore=.git,*.pyc
"""""""""""""""""""""""""""""""""""


highlight MatchParen ctermbg=4

""""""""""""""""""""""""""""""""""
" spell checking
if version >= 700
	set spl=en spell
	" spellcheck by default off
	set nospell
endif
""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""
" some special key mappings etc.

" prevent * from jumping
nnoremap * *``
" prevent # from jumping
nnoremap # #``
" press <F2> to jump to end of file and add vim modeline - genius!
map <F2> Govim: tabstop=4 shiftwidth=4 noexpandtab<ESC>äcc
""""""""""""""""""""""""""""""""""

" special keys should only be very subtle (colorized)
highlight SpecialKey ctermfg=8

augroup SaveCursor
	autocmd!
	autocmd BufReadPost * call setpos(".", getpos("'\""))
augroup END

augroup PythonCustom
	autocmd!
	" (syntax) highlight for keyword 'self'
	autocmd FileType python syn match pythonStatement "\(\W\|^\)\@<=self\([\.,)]\)\@="
augroup END
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
