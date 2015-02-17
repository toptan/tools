"NeoBundle Scripts-----------------------------
if has('vim_starting')  
  set nocompatible               " Be iMproved

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" Add or remove your Bundles here:
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'jeffreyiacono/vim-colors-wombat'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'bling/vim-airline'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'pangloss/vim-javascript'
" NeoBundle 'ervandew/supertab'
NeoBundle 'vim-scripts/a.vim'
NeoBundle 'Rip-Rip/clang_complete'
NeoBundle 'benmills/vimux'
NeoBundle 'sigidagi/vim-cmake-project'
"NeoBundle 'Ignotus/vim-cmake-project'

" Required:
call neobundle#end()

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck  
"End NeoBundle Scripts-------------------------

" Turn on syntax highlighting
syntax on
" Recognize file types for indentation and plugins
filetype plugin indent on
" Set colorscheme
set background=dark 
"colorscheme Tomorrow-Night-Bright 
let g:solarized_termcolors = 256
colorscheme solarized

set expandtab         " turn tabs into spaces
set tabstop=4         " make tabs 2 wide
set shiftwidth=4      " make shifts 2 spaces
set cursorline        " highlight cursorline
set nowrap            " stop text wrapping
set number            " show line numbers
set ignorecase        " ignore case in searches
set autoindent        " copy indent from current line
set copyindent        " copy structure of existing lines
set smarttab          " treat spaces like tabs
set title             " show file name in window
set nobackup          " no backup before write
set noswapfile        " no .swp madness

" CMake formatting and syntax highlighting
:autocmd BufRead,BufNewFile *.cmake,CMakeLists.txt,*.cmake.in runtime! indent/cmake.vim 
:autocmd BufRead,BufNewFile *.cmake,CMakeLists.txt,*.cmake.in setf cmake
:autocmd BufRead,BufNewFile *.ctest,*.ctest.in setf cmake

let mapleader=","

" Make extra whitespace visible
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.

" Use TAB to jump between matching things
" nnoremap <Tab> %

" Plugin configuration
" --------------------

set laststatus=2

" NERDTree configuration
nmap <silent> <F5> :NERDTreeToggle<CR>
nmap <silent> <C-n> :NERDTreeToggle<CR>
let g:NERDTreeWinSize = 40
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Airline symbols
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
let g:bufferline_echo = 0

" clang_autocomplete configuration
" compile all sources as c++11 (just for example, use .clang_complete for
" setting version of the language per project)
let g:clang_user_options = '-std=c++11'
let g:clang_snippets = 1
let g:clang_snippets_engine = 'clang_complete'
let g:clang_library_path = '/opt/local/libexec/llvm-3.5/lib/'
let g:clang_close_preview = 1
let g:clang_complete_copen = 1
" let g:clang_conceal_snippets = 1

set completeopt=menu,longest
