set t_Co=256
set encoding=utf-8

"NeoBundle Scripts-----------------------------
if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif

  " Required:
  set runtimepath+=$HOME/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('$HOME/.vim/bundle'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" Add or remove your Bundles here:
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'tomasr/molokai'
NeoBundle 'shougo/neocomplete'
NeoBundle 'shougo/vimshell'
NeoBundle 'ConradIrwin/vim-bracketed-paste'
NeoBundle 'scrooloose/nerdcommenter'

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
" set showmode                      " Display the mode you're in.

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
set background=dark               " Tell vim that the background is dark
hi Normal ctermbg=NONE            " Use same background as terminal

let mapleader = "\<Space>"

nnoremap <leader>ft Vatzf         " Shortcut to fold tags
"nnoremap <C-h> <C-w>h             " Movement in normal mode 
"nnoremap <C-j> <C-w>j
"nnoremap <C-k> <C-w>k
"nnoremap <C-l> <C-w>l

" Enter normal mode (must not contain any additional whitespace after)
inoremap jj <ESC> 

" Copy and paste to system clipboard
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P
nmap <C-y><C-y> "+yy

nnoremap <Leader>w :w<CR>
nnoremap <Leader>e :e .<CR>

" Substitute words under cursor
nnoremap <Leader>s :%s/\<<C-r><C-w>\>/

nmap <Leader>t :!npm test<cr>
nmap <Leader>r :!npm start<cr>

" Git plugin """"""""""
autocmd BufReadPost fugitive://* set bufhidden=delete
" set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
"End Git plugin """"""""""
"
"Neocomplete """"""""""""
" Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

"End Neocomplete"""""""""""

autocmd BufNewFile,BufReadPost *.md set filetype=markdown
autocmd bufwritepost .vimrc source $MYVIMRC

" ctrlp
let g:ctrlp_use_caching = 0
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor

  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
else
  let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
  let g:ctrlp_prompt_mappings = {
        \ 'AcceptSelection("e")': ['<space>', '<cr>', '<2-LeftMouse>'],
        \ }
endif

" powerline
python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup

