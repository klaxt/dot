" -----------------------------------------------------------------------------
" PLUGINS! - 'https://github.com/gmarik/vundle'

set nocompatible			" be iMproved
filetype off			 " required!

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" My Bundles here:
Plugin 'http://github.com/scrooloose/nerdtree.git'
Plugin 'http://github.com/Townk/vim-autoclose.git'
" Bundle 'http://github.com/jaxbot/brolink.vim.git'
Plugin 'http://github.com/tpope/vim-vinegar.git'
Plugin 'http://github.com/tpope/vim-rails.git'
" Bundle 'http://github.com/drmingdrmer/xptemplate.git'

call vundle#end()
filetype plugin indent on	" required!
" -----------------------------------------------------------------------------

" editor settings
set number
set tabstop=2
set shiftwidth=2

" general settings
" -----------------------------------------------------------------------------
" white space chars
" set listchars=tab:▸\ ,eol:¬
set listchars=tab:>-,eol:¶

" -----------------------------------------------------------------------------
" fix escape codes for COLORS!
if has("terminfo")
	let &t_Co=8
	let &t_Sf="\e[3%p1%dm"
	let &t_Sb="\e[4%p1%dm"
else
	let &t_Co=8
	let &t_Sf="\e[3%dm"
	let &t_Sb="\e[4%dm"
endif

" color scheme :colo
if !has("gui_running")
	"colorscheme candycode
	colorscheme elflord
end
if has("gui_running")
	colorscheme macvim	" macvim == win
	set guioptions-=T	" no toolbar
	set cursorline		" show the cursor line
end

" -----------------------------------------------------------------------------
" searching
set incsearch				" incremental search
set ignorecase				" search ignoring case
set hlsearch				" highlight the search
set showmatch				" show matching bracket
set diffopt=filler,iwhite	" ignore all whitespace and sync

" -----------------------------------------------------------------------------
" spelling...
if v:version >= 700
	setlocal spell spelllang=en
	nmap <LocalLeader>ss :set spell!<CR>
endif
set nospell					" spell check explodes code default off

" -----------------------------------------------------------------------------
" backup options
set backup
set backupdir=~/.vim/.backup
set viminfo=%100,'100,/100,h,\"500,:100,n~/.viminfo
set history=200

" other
let NERDTreeQuitOnOpen = 0

" -----------------------------------------------------------------------------
" Key Bindings - :help key-notation
"map <Esc>s :w<CR>
"map <C-s> :w<CR>
"vmap <C-s> <esc>:w<CR>gv

noremap <C-S> :update<CR>
vnoremap <C-S> <C-C>:update<CR>
inoremap <C-S> <C-O>:update<CR>





nnoremap <C-h> gT
nnoremap <C-l> gt

nnoremap <S-h> h
nnoremap <S-j> j
nnoremap <S-k> k
nnoremap <S-l> l

" save alt-# keys
let c='0'
while c <= '9'
	exec "set <A-".c.">=\e".c
	exec "imap \e".c." <A-".c.">"
	let c = nr2char(1+char2nr(c))
endw
set timeout ttimeoutlen=50

map t1 1gt
map t2 2gt
map t3 3gt
map t4 4gt
map t5 5gt
map t6 6gt
map t7 7gt
map t8 8gt
map t9 9gt

map ta :tabp<CR>
map td :tabn<CR>
map tw :tabnew<CR>
map ts :tabc<CR>

" map ww :w<CR>

nnoremap <A-1> 1gt
nnoremap <A-2> 2gt
nnoremap <A-3> 3gt
nnoremap <A-4> 4gt
nnoremap <A-5> 5gt
nnoremap <A-6> 6gt
nnoremap <A-7> 7gt
nnoremap <A-8> 8gt
nnoremap <A-9> 9gt

" resize to 1.5 or 2/3 - http://vim.wikia.com/wiki/Resize_splits_more_quickly
nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>

" clear highlight - http://stackoverflow.com/a/657484/1174618
map <F3> :let @/ = ""<CR>

" toggle showing tabs (see listchars)
map <C-l> :set list!<CR>

" NerdTree
map <Leader>d :let NERDTreeQuitOnOpen = 0<CR>
map <Leader>D :let NERDTreeQuitOnOpen = 1<CR>
map <C-N> :NERDTreeToggle<CR>

" iaabrev </ </
" ab S self
" iab rbang #!/usr/bin/env ruby

" http://writequit.org/blog/?p=195

" ---------------------------------------------------------------------------
" first the disabled features due to security concerns
set modelines=0							" no modelines [http://www.guninski.com/vim1.html]
let g:secure_modelines_verbose=0		" securemodelines vimscript
let g:secure_modelines_modelines = 15	" 15 available modelines
" ---------------------------------------------------------------------------

syntax on
set ruler				" show the line number on the bar
set more				" use more prompt
set autoread			" watch for file changes
set number				" line numbers
set hidden
set noautowrite			" don't automagically write on :next
set lazyredraw			" don't redraw when don't have to
set showmode
set showcmd
set nocompatible		" vim, not vi
set autoindent smartindent	" auto/smart indent
set smarttab			" tab and backspace are smart
set scrolloff=5			" keep at least 5 lines above/below
set sidescrolloff=5		" keep at least 5 lines left/right
set backspace=indent,eol,start
set showfulltag			" show full completion tags
set noerrorbells		" no error bells please
set linebreak
set cmdheight=2			" command line two lines high
set undolevels=1000		" 1000 undos
set updatecount=100		" switch every 100 chars
set complete=.,w,b,u,U,t,i,d	" do lots of scanning on tab completion
set ttyfast				" we have a fast terminal
filetype on				" Enable filetype detection
filetype indent on		" Enable filetype-specific indenting
filetype plugin on		" Enable filetype-specific plugins
compiler ruby			" Enable compiler support for ruby
set wildmode=longest:full
set wildignore+=*.o,*~,.lo	" ignore object files
set wildmenu				" menu has tab completion
let maplocalleader=','		" all my macros start with ,

set dictionary=/usr/share/dict/words " more words!

" taglist.vim settings
let Tlist_Use_Right_Window=1
let Tlist_Auto_Open=0
let Tlist_Enable_Fold_Column=0
let Tlist_Compact_Format=0
let Tlist_WinWidth=28
let Tlist_Exit_OnlyWindow=1
let Tlist_File_Fold_Auto_Close = 1

" Settings for :TOhtml
let html_number_lines=1
let html_use_css=1
let use_xhtml=1

" ---------------------------------------------------------------------------
" status line
set laststatus=2
if has('statusline')
	function! SetStatusLineStyle()
		let &stl="%f %y "			.
				\"%([%R%M]%)"			 .
				\"%#StatusLineNC#%{&ff=='unix'?'':&ff.'\ format'}%*" .
				\"%{'$'[!&list]}"		.
				\"%{'~'[&pm=='']}"		.
				\"%="				.
				\"#%n %l/%L,%c%V "		.
				\""
	endfunc
	call SetStatusLineStyle()

	if has('title')
		set titlestring=%t%(\ [%R%M]%)
	endif

endif


" ---------------------------------------------------------------------------
" mouse stuffs
"set mouse=a			 " mouse support in all modes
set mousehide		" hide the mouse when typing
" this makes the mouse paste a block of text without formatting it
" (good for code)
"map <MouseMiddle> <esc>"*p

"set viminfo='100,f1

" ---------------------------------------------------------------------------
" some useful mappings
" Y yanks from cursor to $
map Y y$
" for yankring to work with previous mapping:
function! YRRunAfterMaps()
	nnoremap Y :<C-U>YRYankCount 'y$'<CR>
endfunction
" toggle list mode
nmap <LocalLeader>tl :set list!<cr>
" toggle paste mode
nmap <LocalLeader>pp :set paste!<cr>
" change directory to that of current file
nmap <LocalLeader>cd :cd%:p:h<cr>
" change local directory to that of current file
nmap <LocalLeader>lcd :lcd%:p:h<cr>
" correct type-o's on exit
nmap q: :q
" save and build
nmap <LocalLeader>wm :w<cr>:make<cr>
" open all folds
nmap <LocalLeader>fo :%foldopen!<cr>
" close all folds
nmap <LocalLeader>fc :%foldclose!<cr>
" ,tt will toggle taglist on and off
nmap <LocalLeader>tt :Tlist<cr>
" ,nn will toggle NERDTree on and off
nmap <LocalLeader>nn :NERDTreeToggle<cr>
" When I'm pretty sure that the first suggestion is correct
map <LocalLeader>r 1z=

" If I forgot to sudo vim a file, do that with :w!!
cmap w!! %!sudo tee > /dev/null %
" ruby helpers
iab rbang #!/usr/bin/env ruby
iab idef def initialize


" Shortcut to rapidly toggle `set list` with \l
nmap <leader>l :set list!<CR>

" ---------------------------------------------------------------------------
" setup for the visual environment
if $TERM =~ '^xterm'
	set t_Co=256
elseif $TERM =~ '^screen-bce'
	set t_Co=256		" just guessing
elseif $TERM =~ '^rxvt'
	set t_Co=88
elseif $TERM =~ '^linux'
	set t_Co=8
else
	set t_Co=16
endif

" ---------------------------------------------------------------------------
" tabs
" (LocalLeader is ",")
"map <LocalLeader>tc :tabnew %<cr>	" create a new tab
"map <LocalLeader>td :tabclose<cr>	" close a tab
"map <LocalLeader>tn :tabnext<cr>	" next tab
"map <LocalLeader>tp :tabprev<cr>	" previous tab
"map <LocalLeader>tm :tabmove		" move a tab to a new location

" ---------------------------------------------------------------------------
" auto load extensions for different file types
if has('autocmd')
	filetype plugin indent on
	syntax on

	autocmd BufReadPost *
		\ if line("'\"") > 0|
		\	 if line("'\"") <= line("$")|
		\		exe("norm '\"")|
		\	 else|
		\		exe "norm $"|
		\	 endif|
		\ endif

	" improve legibility
	au BufRead quickfix setlocal nobuflisted wrap number

	" improved formatting for markdown
	" http://plasticboy.com/markdown-vim-mode/
	autocmd BufRead *.mkd set ai formatoptions=tcroqn2 comments=n:>
	autocmd BufRead ~/.blog/entries/* set ai formatoptions=tcroqn2 comments=n:>
endif

" ~/.vimrc (configuration file for vim only)
" skeletons
function! SKEL_spec()
	0r /usr/share/vim/current/skeletons/skeleton.spec
	language time en_US
	if $USER != ''
		let login = $USER
	elseif $LOGNAME != ''
		let login = $LOGNAME
	else
		let login = 'unknown'
	endif
	let newline = stridx(login, "\n")
	if newline != -1
		let login = strpart(login, 0, newline)
	endif
	if $HOSTNAME != ''
		let hostname = $HOSTNAME
	else
		let hostname = system('hostname -f')
		if v:shell_error
			let hostname = 'localhost'
		endif
	endif
	let newline = stridx(hostname, "\n")
	if newline != -1
		let hostname = strpart(hostname, 0, newline)
	endif
	exe "%s/specRPM_CREATION_DATE/" . strftime("%a\ %b\ %d\ %Y") . "/ge"
	exe "%s/specRPM_CREATION_AUTHOR_MAIL/" . login . "@" . hostname . "/ge"
	exe "%s/specRPM_CREATION_NAME/" . expand("%:t:r") . "/ge"
	setf spec
endfunction
autocmd BufNewFile	*.spec	call SKEL_spec()
" filetypes
filetype plugin on
filetype indent on
" ~/.vimrc ends here


