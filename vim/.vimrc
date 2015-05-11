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
NeoBundle 'Chiel92/vim-autoformat'
NeoBundle 'Rip-Rip/clang_complete'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'benmills/vimux'
NeoBundle 'bling/vim-airline'
NeoBundle 'ervandew/supertab'
NeoBundle 'octol/vim-cpp-enhanced-highlight'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'sigidagi/vim-cmake-project'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'vim-scripts/a.vim'
NeoBundle 'kana/vim-operator-user'
NeoBundle 'rhysd/vim-clang-format'
NeoBundle 'DoxygenToolkit.vim'

"NeoBundle 'christoomey/vim-tmux-navigator'

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
set background=light
let g:solarized_termcolors = 256
"let g:solarized_termtrans = 0
colorscheme solarized

let g:load_doxygen_syntax = 1
let g:doxygen_enhanced_color = 0

set expandtab         " turn tabs into spaces
set tabstop=4         " make tabs 4 wide
set shiftwidth=4      " make shifts 4 spaces
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
set backspace=2       " make backspace behave normaly

" CMake formatting and syntax highlighting
:autocmd BufRead,BufNewFile *.cmake,CMakeLists.txt,*.cmake.in runtime! indent/cmake.vim
:autocmd BufRead,BufNewFile *.cmake,CMakeLists.txt,*.cmake.in setf cmake
:autocmd BufRead,BufNewFile *.ctest,*.ctest.in setf cmake

let mapleader=","

" Easier navigation between splits
noremap <c-j> <c-w>j
noremap <c-k> <c-w>k
noremap <c-l> <c-w>l
noremap <c-h> <c-w>h

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
let g:airline_powerline_fonts=1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
let g:bufferline_echo = 0
au VimEnter * exec 'AirlineTheme light'

" clang_autocomplete configuration
" compile all sources as c++11 (just for example, use .clang_complete for
" setting version of the language per project)
let g:clang_user_options = '-std=c++11'
let g:clang_snippets = 1
let g:clang_snippets_engine = 'clang_complete'
"let g:clang_library_path = '/opt/local/libexec/llvm-3.5/lib/'
let g:clang_close_preview = 1
let g:clang_complete_copen = 1
" let g:clang_conceal_snippets = 1

set completeopt=menu,longest

" Autoformat
noremap <F3> :Autoformat<CR><CR>
let g:formatprg_cpp = "astyle"
let g:formatprg_args_cpp = system('cat ~/.astylerc | grep -v "^#.*" | grep -z')

" vim-clang-format
let g:clang_format#code_style = "file"
" map to <Leader>cf in C++ code
autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>
" if you install vim-operator-user
autocmd FileType c,cpp,objc map <buffer><Leader>x <Plug>(operator-clang-format)
" Toggle auto formatting:
nmap <Leader>C :ClangFormatAutoToggle<CR>

" C++11/14 syntax highlighting
let g:cpp_class_scope_highlight = 1
let g:cpp_experimental_template_highlight = 1

" Syntastic stuff
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_cpp_checkers = ['cppcheck']
let g:syntastic_c_checkers = ['cppcheck']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1

" DoxygenToolkit
"let g:DoxygenToolkit_compactOneLineDoc = "yes"
let g:DoxygenToolkit_commentType = "C++"
"let g:DoxygenToolkit_briefTag="\\brief "
let g:DoxygenToolkit_briefTag_pre="\\brief "
let g:DoxygenToolkit_paramTag_pre="\\param "
let g:DoxygenToolkit_returnTag="\\return "
"let g:DoxygenToolkit_blockHeader="--------------------------------------------------------------------------"
"let g:DoxygenToolkit_blockFooter="----------------------------------------------------------------------------"
let g:DoxygenToolkit_authorName="Toplica Tanasković"

noremap <F2> :CMakeOutput<CR>
noremap <F7> :CMakeBuild<CR>
noremap <F8> :CMakeClean<CR>
noremap <F9> :CMakeCompile<CR>

"let g:tmux_navigator_no_mappings = 1

"nnoremap <silent> {Left-mapping} :TmuxNavigateLeft<cr>
"nnoremap <silent> {Down-Mapping} :TmuxNavigateDown<cr>
"nnoremap <silent> {Up-Mapping} :TmuxNavigateUp<cr>
"nnoremap <silent> {Right-Mapping} :TmuxNavigateRight<cr>
"nnoremap <silent> {Previous-Mapping} :TmuxNavigatePrevious<cr>

