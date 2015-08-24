" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install bundles
"let path = '~/some/path/here'
"call vundle#rc(path)

" ===== START VUNDLE BUNDLES =======
" let Vundle manage Vundle, required
Bundle 'gmarik/Vundle.vim'

Bundle 'altercation/vim-colors-solarized'



" ===== END VUNDLE BUNDLES =========
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line



" Based on partially on .vimrc file from http://www.stripey.com/vim/vimrc.html


" set hidden hides buffers instead of closing them. This means you can have
" unwritten changes to a file and open a new file using :e without being 
" forced to commit a write or undo your changes to the first file. Also,
" undo buffers and marks are preservede while the buffer is open.
set hidden

" set ms-windows behavior, see :help :behave to see exactly what this does
behave mswin

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Set default color scheme, as per http://ethanschoonover.com/solarized/vim-colors-solarized
" use set background=dark or set background=light to swap between solarized modes
syntax enable
set background=dark
colorscheme solarized

" if this is gvim, turn off toolbar by default
:set guioptions-=T

" First things first, let's clear out any existing autocommands shall we?
autocmd!

" Set vim's current working directory to the directory of the file you're
" opening.
autocmd BufEnter * lcd %:p:h

" Now, let's turn off vi compatibility
set nocompatible

" Now setting a command line history of 50 lines
set history=50

" And showing the cursor positionat all times
set ruler

" Highlight current line
set cursorline

" Highlight current column
" set cursorcolumn

" ignore case in search, display line numbers, display current mode and
" partially typed commands in status line
set showmode
set showcmd
set ignorecase
set number

" We don't need Vim to write a backup file; there are better ways to backup
" than to rely on Vim
set nobackup
set noswapfile

" set pastetoggle to F2 so that when it's on and you paste, Vim doesn't
" apply autoindenting and other crap which you don't need when pasting
set pastetoggle=<F2>

" enable mouse, to disable, set mouse to -a instead of a
" set mouse=a
:set mouse=a

" turn on syntax highlighting
if has('syntax')
  set t_Co=256
  syntax on
endif

" briefly flash the matching brace/parenthesis/bracket when you type 
" a closing or opening brace/parenthesis/bracket. Awesome? Awesome.
set showmatch

" Let's also make sure rainbow highlighting is turned on for Lisp
let g:lisp_rainbow = 1

" speaking of brief flashes, how about we get rid of those annoying
" beeps and replace them with brief screen flashes when a command doesn't work.
set vb t_vb=

" command-line completion <Tab> (ie. filenames, help topics, option names)
" lists available options and completes the longest common part, then
" further <Tab>s will cycle through possibilities
set wildmode=list:longest,full

" displays status line that shows name of file currently being edited
" as well as whether or not it has been modified since opening.
set laststatus=2


" ---------
" GVIM Window settings
if has("gui_running")
    set lines=40
    set columns=84
endif


" ---------



" Tabs and formatting

" indents of 4 characters (NO SPACES), smart and auto-indent are on, 
" indents are copied down lines
" set nowrap " turn off line wrapping
set formatoptions=l " turn on word wrapping
set lbr " make sure word wrapping doesn't break in middle of words
set shiftwidth=4 " how much to auto-indent by
set ts=4 " sets tab stops to whatever for text input
"set expandtab " turn tab keypresses into spaces (set this or the one below, NOT BOTH)
set noexpandtab " leave tab keys as real tabs (either set this or the above)
set shiftround
set autoindent
set smartindent
set tabstop=4 " forces tabs to be 4 spaces


" the below settings are for python coding; autoindent, tabstop=4,
" softtabstop=4, expandtab and shiftwidth=4. This means vim will 
" autoindent, use indents which are 4 whitespace characters, indent and
" un-indent in 4 whitespace increments, expand tabs into spaces.
"set autoindent
"set tabstop=4
"set shiftwidth=4
"set softtabstop=4
"set expandtab

" Treat lines with quote mark as comments
set comments+=b:\"

" Enable filetype detection
filetype on

" So, since we need actual tab characters in make files, we probably 
" shouldn't expand them into space characters, right?
autocmd FileType make set noexpandtab shiftwidth=8

" Oh, and let's keep textwidth for all text files to 78 chars
autocmd FileType text setlocal textwidth=78

" This should set .X68 files as 68k assembly files for syntax purposes
let filetype_X68 = "asm68k"
let filetype_pal = "pascal" 

" Let's show the best match so far as we type
set incsearch

" --------


" Keystrokes -- Moving around

" Alternate mappings to escape so it's easier to get out of insert mode
" currently just using <Esc> and <C-[>

" page down with <Space> and page up with -
noremap <Space> <PageDown>
noremap - <PageUp>

" in normal mode F2 will save the file
" nmap <F2> :w<CR>
" in insert mode F2 will exit insert, save, enters insert again
" imap <F2> <ESC>:w<CR>i

" F2 now used for opening NERDTree and F3 for taglist
map <F2> :NERDTreeToggle<CR>
imap <F2> <C-o>:NERDTreeToggle<CR>
map <F3> :TlistToggle<CR>
imap <F3> <C-o>:TlistToggle<CR>

" Map alt-comma to Escape in insert mode
imap <A-,> <Esc>

" Turn off highlighting by double-tapping Escape
nnoremap <silent> <Esc><Esc> <Esc>:nohlsearch<CR><Esc>


" --------
" MiniBufExplorer keybindings,
" ctrl-arrows and ctrl-[h,j,k,l] will navigate between open buffers/tabs
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1 


" --------
" enabling plugins
filetype plugin on


" --------
" Enabling C-V for paste, C-C for copy in visual mode
nmap <C-V> "*p
imap <C-V> <ESC><C-V>i
vmap <C-C> "+y


" --------
"  Enabling C-Tab and S-C-Tab for moving back and forth tabs, C-T for new tab
:nmap <C-S-tab> :tabprevious<CR>
:nmap <C-tab> :tabnext<CR>
:map <C-S-tab> :tabprevious<CR>
:map <C-tab> :tabnext<CR>
:imap <C-S-tab> <Esc>:tabprevious<CR>i
:imap <C-tab> <Esc>:tabnext<CR>i
:nmap <C-t> :tabnew<CR>
:imap <C-t> <Esc>:tabnew<CR>



" TAGS -----------------------------------------------------------------
" Configure tags - add additional tags here or comment out not-used ones
set tags+=~/.vim/tags/cpp
set tags+=~/.vim/tags/sdl
set tags+=~/.vim/tags/qt4
set tags+=~/.vim/tags/sfml

" build tags of arbitrary project with Ctrl-F12 and F5
map <C-F12> :!ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
map <F5> :!ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

" Remember that C-X C-O invokes autocomplete IN INSERT MODE

" OmniCppComplete
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot = 1 " autocomplete after a dot (.)
let OmniCpp_MayCompleteArrow = 1 " autocomplete after arrow (->)
let OmniCpp_MayCompleteScope = 1 " autocomplete after scope (::)
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]

" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest,preview
