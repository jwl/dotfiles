set nocompatible

" isolate neovim bundles and plugins from vim's
if has('nvim')
	let s:editor_root=expand("~/.nvim")
else
	let s:editor_root=expand("~/.vim")
endif


" Begin Vundle configuration, see: https://github.com/gmarik/Vundle.vim
" set the runtime path to include Vundle and initialize
filetype off " required for vundle. Turn it back on after vundle config is over
" set rtp+=s:editor_root . '/bundle/vundle/'
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" ===== START VUNDLE BUNDLES =======
" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'freeo/vim-kalisi'
Plugin 'croaky/vim-colors-github'
Plugin 'bling/vim-airline'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'jeetsukumaran/vim-buffergator'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-easytags'
Plugin 'nanotech/jellybeans.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'tpope/vim-surround'
Plugin 'rdnetto/YCM-Generator'
Plugin 'Raimondi/delimitMate'
Plugin 'mdlerch/vim-tungsten'
Plugin 'morhetz/gruvbox'
Plugin 'romainl/Apprentice'

" ===== END VUNDLE BUNDLES =========
call vundle#end()
filetype plugin indent on



" Based on partially on .vimrc file from http://www.stripey.com/vim/vimrc.html


" set hidden hides buffers instead of closing them. This means you can have
" unwritten changes to a file and open a new file using :e without being
" forced to commit a write or undo your changes to the first file. Also,
" undo buffers and marks are preservede while the buffer is open.
set hidden

:let mapleader = ","

" set ms-windows behavior, see :help :behave to see exactly what this does
behave mswin

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Set default color scheme
set t_Co=256
if has('gui_running')
	set background=dark
else
	set background=dark
endif
colorscheme kalisi

" if this is gvim, turn off toolbar by default
:set guioptions-=T

" First things first, let's clear out any existing autocommands shall we?
autocmd!

" Set vim's current working directory to the directory of the file you're
" opening.
autocmd BufEnter * lcd %:p:h


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
    set columns=80
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
autocmd FileType make set noexpandtab shiftwidth=4

" Oh, and let's keep textwidth for all text files to 78 chars
autocmd FileType text setlocal textwidth=80

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

" Change <C-e> and <C-y> from scrolling down/up 1 line to 3 lines, so we don't
" have to keep hitting it over and over as much
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" in normal mode F2 will save the file
" nmap <F2> :w<CR>
" in insert mode F2 will exit insert, save, enters insert again
" imap <F2> <ESC>:w<CR>i

" -----------------
" NERDTree settings
" F2 now used for opening NERDTree and F3 for taglist
map <F2> :NERDTreeToggle<CR>
imap <F2> <C-o>:NERDTreeToggle<CR>
map <F3> :TlistToggle<CR>
imap <F3> <C-o>:TlistToggle<CR>

let NERDTreeMinimalUI=1
let NERDTreeDirArrows=1
let g:NERDTreeWinSize=45

" End NERDTree settings
" -----------------



" Map alt-comma to Escape in insert mode
imap <A-,> <Esc>

" Turn off highlighting by double-tapping Escape
nnoremap <silent> <Esc><Esc> <Esc>:nohlsearch<CR><Esc>


" -----------------
" Vim-Airline settings
"  Enable displaying buffers at the top of the viewable area with airline
let g:airline#extensions#tabline#enabled = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

" Enable powerline symbols (ie. the little arrows)
let g:airline_powerline_fonts = 1

" End Vim-Airline settings
" -----------------


" -----------------
" CtrlP Settings
"
" Setup some default ignores
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn)|\_site)$',
  \ 'file': '\v\.(exe|so|dll|class|gif|png|jpg|jpeg)$',
\}

" Use the nearest .git directory as the cwd
" This makes a lot of sense if you are working on a project that is in version
" control. It also supports works with .svn, .hg, .bzr.
let g:ctrlp_working_path_mode = 'r'

" Use a leader instead of the actual named binding
nmap <leader>p :CtrlP<cr>

" Binding to clear CtrlP cache so that on next invocation of CtrlP it will
" rescan all directories. Useful if a new file has been added since the last
" time CtrlP was used
nmap <leader>rr :CtrlPClearAllCaches<cr>

" Easy bindings for its various modes
nmap <leader>bb :CtrlPBuffer<cr>
nmap <leader>bm :CtrlPMixed<cr>
nmap <leader>bs :CtrlPMRU<cr>

" End CtrlP settings
" -----------------


" -----------------
" Buffergator settings
"
" Use right side of screen
let g:buffergator_viewport_split_policy = 'R'

" I want my own keymappings
let g:buffergator_suppress_keymaps = 1

" for some reason, using BuffergatorMruCyclePrev and BuffergatorMruCycleNext
" leads to unusual behavior once more than a few (3?) tabs are open. Switching
" to :bnext and :bprev to see if that leads to more consistent behavior
" Go to previous buffer open
nmap <leader>jj :bprev<cr>
" Go to next buffer open
nmap <leader>kk :bnext<cr>
" View the entire list of buffers open
nmap <leader>bl :BuffergatorOpen<cr>
" <comma> then T for new tab
nmap <leader>T :enew<cr>
" Close the current buffer and move to the previous one. <comma> bq
nmap <leader>bq :bp <BAR> bd #<cr>

" End Buffergator settings
" -----------------

" --------
" MiniBufExplorer keybindings,
" ctrl-arrows and ctrl-[h,j,k,l] will navigate between open buffers/tabs
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1



" --------
"  enable system clipboard for vim, allowing copy/paste to and from the system
"  clipboard
set clipboard=unnamedplus

"---------


"---------
" Syntastic options
" Disable syntastic unless manually invoked for files that end in .html or
" .cpp
let g:syntastic_mode_map={ 'mode': 'active',
\ 'active_filetypes': [],
\ 'passive_filetypes': ['html', 'cpp', 'h'] }


"------- end Syntastic options




" --------
"  YouCompleteMe settings (vim auto-completion plugin)
"  references:
"  * http://www.alexeyshmalko.com/2014/youcompleteme-ultimate-autocomplete-plugin-for-vim/
"  * http://vimawesome.com/plugin/youcompleteme
"  * https://github.com/neovim/neovim/issues/1315
"  * https://github.com/Valloric/YouCompleteMe

" Auto-remove preview window after exiting insert mode
" (see: https://valloric.github.io/YouCompleteMe/)
let g:ycm_autoclose_preview_window_after_insertion = 1
" Alternate options: 
" auto-close after selecting a completion string
" g:ycm_autoclose_preview_window_after_completion = 1
" Don't open the preview window at all
" set completeopt-=preview   
" g:ycm_add_preview_to_completeopt = 0


" --------- End YouCompleteMe (YCM) options
