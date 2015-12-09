set t_Co=256
set encoding=utf-8

"NeoBundle Scripts-----------------------------
if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif

  " Required:
  set runtimepath+=/home/mathias/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('/home/mathias/.vim/bundle'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" Add or remove your Bundles here:
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'tomasr/molokai'

" Required:
call neobundle#end()

" Required:
filetype plugin indent on         " Turn on file type detection.

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
"End NeoBundle Scripts-------------------------

syntax enable                     " Turn on syntax highlighting.

set showcmd                       " Display incomplete commands.
set showmode                      " Display the mode you're in.

set backspace=indent,eol,start    " Intuitive backspacing.

set hidden                        " Handle multiple buffers better.

set wildmenu                      " Enhanced command line completion.
set wildmode=list:longest         " Complete files like a shell.

set ignorecase                    " Case-insensitive searching.
set smartcase                     " But case-sensitive if expression contains a capital letter.

set number                        " Show line numbers.
set ruler                         " Show cursor position.

set incsearch                     " Highlight matches as you type.

set nowrap                        " Turn on line wrapping.
set scrolloff=3                   " Show 3 lines of context around the cursor.

set title                         " Set the terminal's title
set laststatus=2                  " Show the status line all the time

set visualbell                    " No beeping.
set noerrorbells                  " No beeping.

set nobackup                      " Don't make a backup before overwriting a file.
set nowritebackup                 " And again.
set noswapfile                    " And again. 
set directory=$HOME/.vim/tmp//,.  " Keep swap files in one location

set smartindent
set autoindent
set foldenable                    "Enable code folding
set mousehide                     "Hide mouse when typeing

" UNCOMMENT TO USE
set tabstop=2                     " How many columns a tab counts for
set softtabstop=2                 " How many columns vim uses for Tab in insert mode
set shiftwidth=2                  " How many columns text is indented with reindent operators << and >>
set expandtab                     " Use spaces instead of tabs

" Show tabs as --
set list
set listchars=tab:\-\-

autocmd FileType coffee setlocal shiftwidth=4 tabstop=4 softtabstop=4 noexpandtab
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" Colors
let g:solarized_termcolors=256
colorscheme molokai
set background=dark                " Tell vim that the background is dark
hi Normal ctermbg=NONE             " Use same background as terminal

" Git plugin
autocmd BufReadPost fugitive://* set bufhidden=delete
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

