""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Filename: .vimrc
" Sections:
"   -> Vuldle
"   -> General
"   -> VIM UI
"   -> Colors and Fonts
"   -> Files and backups
"   -> Text, tab and indent related
"   -> Plugin Specific
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> Vuldle                                                               
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Automatically setup Vundle on first run

if !isdirectory(expand("~/.vim/bundle/vundle"))
    call system("git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle")
endif

set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle

call vundle#rc()
Bundle 'gmarik/vundle'
Bundle 'nanotech/jellybeans.vim'
Bundle 'tomasr/molokai'
Bundle 'tpope/vim-fugitive'
Bundle 'bling/vim-airline'
Bundle 'junegunn/vim-easy-align'
Bundle 'scrooloose/nerdtree'

" Automatically install bundles on first run
if !isdirectory(expand("~/.vim/bundle/vim-airline"))
    execute 'silent BundleInstall'
    execute 'silent q'
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> General                                                               
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

filetype plugin indent on   " detect file type and load indents and plugins

set history=500
set autoread                " auto reload buffer when file modified externally

"when forgetting to sudo
cmap w!! w !sudo tee > /dev/null %

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> VIM UI                                                               
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set laststatus=2
set noshowmode

" Turn off auto comment
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Turn on the WiLd menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc

" Always show current position
set ruler

" Height of the command bar
set cmdheight=1

" A buffer becomes hidden when it is abandoned
set hid
" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases 
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
"set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500
set number                  " show line numbers


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> Color and Fonts                                                              
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set t_Co=256                " enable 256-color mode
syntax on                   " turn on syntax highlighting
colorscheme molokai      	" syntax highlighting colour

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set clipboard=unnamed       " yank and paste using system clipboard
set encoding=utf-8          " default character encoding
set hidden                  " do not unload buffers that get hidden
set noswapfile              " do not use a swap file for buffers
set nowritebackup           " do not make backup before overwriting file

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nowrap                  " do not wrap text
set scrolloff=3             " keep minimal number of lines above/below cursor
set showcmd                 " show command line at bottom of screen
set sidescroll=3            " scroll sideways 3 characters at a time
set splitright              " open vertical split right of current window
set wildmenu                " tab auto-complete for commands

set backspace=2             " make backspace behave normally
set expandtab               " insert tabs as spaces
set shiftwidth=4            " number of spaces for auto indent and line shift
set cindent                 " syntax-aware auto indent
set smarttab                " <BS> deletes a shiftwidth worth of space
set softtabstop=4           " number of spaces pressing <Tab> counts for
set tabstop=4               " number of spaces a <Tab> in the file counts for

" In Makefiles DO NOT use spaces instead of tabs
autocmd FileType make setlocal noexpandtab

" Preserve indentation while pasting text from the OS X clipboard
noremap <leader>p :set paste<CR>:put *<CR>:set nopaste<CR>


" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close
set viminfo^=%

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> Plugin specific
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

map <Leader>a <Plug>(EasyAlign)
map <Leader>n :NERDTreeToggle<CR>

let g:airline#extensions#whitespace#enabled = 0
let g:airline_powerline_fonts = 1
