set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction


" Based on partially on .vimrc file from http://www.stripey.com/vim/vimrc.html

" set hidden hides buffers instead of closing them. This means you can have
" unwritten changes to a file and open a new file using :e without being 
" forced to commit a write or undo your changes to the first file. Also,
" undo buffers and marks are preservede while the buffer is open.
set hidden

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Set default color scheme to matrix
colorscheme mustang

" if this is gvim, turn off toolbar by default
:set guioptions-=T

" First things first, let's clear out any existing autocommands shall we?
autocmd!

" Now, let's turn off vi compatibility
set nocompatible

" Now setting a command line history of 50 lines
set history=50

" And showing the cursor positionat all times
set ruler

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

" enable mouse
" set mouse=a
set mouse=a

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

" Tell vim to treat .nss files as if they were C# (.cs) files in terms of
" Syntax highlighting
augroup filetype
	au! BufRead,BufNewFile *.nss	set filetype=cs
augroup END

" Let's show the best match so far as we type
set incsearch
set nohlsearch

" --------


" Keystrokes -- Moving around

" page down with <Space> and page up with -
noremap <Space> <PageDown>
noremap - <PageUp>

" Maps for alt-comma to act as Esc (ie. mode switching)
imap <A-,> <Esc>

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
" nmap <C-V> "+gP
nmap <C-V> "*p
imap <C-V> <C-O>"*p
vmap <C-C> "+y


" --------
"  Enabling C-Tab and S-C-Tab for moving back and forth tabs, C-T for new tab
" :nmap <C-S-tab> :tabprevious<CR>
" :nmap <C-tab> :tabnext<CR>
" :map <C-S-tab> :tabprevious<CR>
" :map <C-tab> :tabnext<CR>
" :imap <C-S-tab> <Esc>:tabprevious<CR>i
" :imap <C-tab> <Esc>:tabnext<CR>i
" :nmap <C-t> :tabnew<CR>
" :imap <C-t> <Esc>:tabnew<CR>



" -------- Gvim font settings
set gfn=Consolas:h9:cANSI

" GVIM Window settings
if has("gui_running")
    set lines=40
    set columns=84
endif
