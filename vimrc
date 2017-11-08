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

" If you prefer the old-style vim functionalty, add 'runtime! vimrc_example.vim'
" Or better yet, read /usr/share/vim/vim80/vimrc_example.vim or the vim manual
" and configure vim to your own liking!

" do not load defaults if ~/.vimrc is missing
"let skip_defaults_vim=1

"colorscheme ron
colorscheme torte

filetype on
filetype plugin on 
filetype indent plugin on
syntax enable

" dont know what this does...
set grepprg=grep\ -nH\ $*

" set leader key
let mapleader=","

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

" linux specific?! dont know what this does
let g:clipbrdDefaultReg = '+'

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
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
" do not check on file open - because it slows down everything (like reaaally
" slooooow)
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_check_on_w = 0
" pylint settings
let g:syntastic_python_pylint_post_args="--disable=broad-except,import-error,line-too-long,logging-format-interpolation"
""""""""""""""""""""""""""""""""""""

" powerline with pthon3
let g:powerline_pycmd="py3"

" autom. reload files that change on disk
set autoread

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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" autocmd
augroup vimrc
	autocmd!
	"·disable vim mouse support
	"autocmd BufEnter * set mouse =
	" restore cursor pos
	autocmd BufReadPost * call setpos(".", getpos("'\""))
	" colorscheme adjustments
	autocmd ColorScheme * highlight LineNr ctermfg=176
	autocmd ColorScheme * highlight LineNr ctermbg=16
	autocmd ColorScheme * highlight SpecialKey ctermfg=8
	autocmd ColorScheme * highlight Comment ctermfg=59
	autocmd ColorScheme * highlight Normal ctermfg=white
	autocmd ColorScheme * highlight String ctermfg=154
augroup END

augroup PythonCustom
	" (syntax) highlight for keyword 'self'
	autocmd FileType python syn match pythonStatement "\(\W\|^\)\@<=self\([\.,)]\)\@="
augroup END
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
