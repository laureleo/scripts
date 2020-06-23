
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin management
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use vundle. Make sure you've installed it.
" git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" PLUGINS START ~~ 

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
" Code completion for many languages
Plugin 'Valloric/YouCompleteMe'
"Alt color scheme
Plugin 'morhetz/gruvbox'
" Tree folder structure
Plugin 'scrooloose/nerdtree'

" PLUGINS END   ~~

" After adding plugin, run :PluginInstall in VIM
call vundle#end()            " required
filetype plugin indent on    " required



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

"imap (Insertion mode)
"
" Faster mode switch. 
imap tn <ESC>

"nmap (Normal mode)
"take colemak into account for vim
"nmap 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn on the WiLd menu
set wildmenu

" Height of the command bar
set cmdheight=2

" A buffer becomes hidden when it is abandoned
set hid

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases 
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts and style
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable

set t_Co=256

colorscheme gruvbox
set background=dark

" Add numbering
set nu

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines


""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Control where new windows are opened
set splitbelow
set splitright

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
map <leader>ba :1,1000 bd!<cr>

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close
set viminfo^=%

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Autocompletion
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Integrate eclim with YouCompleteMe
let g:EclimCompletionMethod = 'omnifunc'

" Close preview window after completion 
let g:ycm_autoclose_preview_window_after_completion = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Add special mode for entering digits with homerow 
" In normal mode, press tab to enter vimlock. Press normal mode to exit
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nnoremap <C-I> :call VimLock(1)<CR>i
function! VimLock(enable)
  if a:enable
    inoremap a 1
    inoremap r 2
    inoremap s 3
    inoremap t 4
    inoremap o 5
    inoremap i 6
    inoremap e 7
    inoremap n 8
    inoremap d 9
    inoremap n 0
    inoremap <Esc> <Esc>:call VimLock(0)<CR>
  else
    iunmap a
    iunmap r
    iunmap s
    iunmap t
    iunmap d
    iunmap h
    iunmap n
    iunmap e
    iunmap i
    iunmap o
    iunmap <Esc>
  endif
endfunction


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Abbreviations
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
cabbr <expr> %% expand('%:p:h')
