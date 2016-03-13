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
"NeoBundle 'christoomey/vim-tmux-navigator'
"NeoBundle 'sigidagi/vim-cmake-project'
NeoBundle 'Chiel92/vim-autoformat'
NeoBundle 'DoxygenToolkit.vim'
NeoBundle 'Rip-Rip/clang_complete'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'benmills/vimux'
NeoBundle 'edkolev/tmuxline.vim'
NeoBundle 'ervandew/supertab'
NeoBundle 'jalcine/cmake.vim'
NeoBundle 'kana/vim-operator-user'
NeoBundle 'klen/python-mode'
NeoBundle 'octol/vim-cpp-enhanced-highlight'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'rhysd/vim-clang-format'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'vim-airline/vim-airline'
NeoBundle 'vim-airline/vim-airline-themes'
NeoBundle 'vim-scripts/a.vim'

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
"set background=dark
let g:solarized_termcolors=256
let g:solarized_termtrans=1
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

" Clear search highlights
noremap <silent><Leader>/ :nohls<CR>

" Select all text in current buffer
map <Leader>a ggVG

" Indend the whole buffer
map <Leader>f gg=G

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
"au VimEnter * exec 'AirlineTheme light'

" clang_autocomplete configuration
" compile all sources as c++11 (just for example, use .clang_complete for
" setting version of the language per project)
let g:clang_user_options = '-std=c++14'
let g:clang_snippets = 1
let g:clang_snippets_engine = 'clang_complete'
let g:clang_library_path = '/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib'
"let g:clang_library_path = '/opt/local/libexec/llvm-3.7/lib/libclang.dylib'
"let g:clang_library_path = '/usr/lib/llvm-3.5/lib/'
let g:clang_close_preview = 1
let g:clang_complete_copen = 1
" let g:clang_conceal_snippets = 1

set completeopt=menu,longest

" Autoformat
" noremap <F3> :Autoformat<CR>
let g:formatters_c = ['astyle']
let g:formatters_cpp = ['astyle']
let g:formatdef_astyle = '"astyle --options=$HOME/.astylerc"'
"let g:formatprg_args_cpp = system('cat ~/.astylerc | grep -v "^#.*" | grep -z')

" vim-clang-format
let g:clang_format#code_style = "file"
" map to <Leader>cf in C++ code
" autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
" autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>
autocmd FileType c,cpp,objc nnoremap <buffer><F3> :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc vnoremap <buffer><F3> :ClangFormat<CR>

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
let g:DoxygenToolkit_briefTag_pre="\\brief "
let g:DoxygenToolkit_paramTag_pre="\\param "
let g:DoxygenToolkit_templateParamTag_pre="\\tparam "
let g:DoxygenToolkit_returnTag="\\return "
let g:DoxygenToolkit_throwTag_pre="\\throw "
let g:DoxygenToolkit_fileTag="\\file "
let g:DoxygenToolkit_authorTag="\\author "
let g:DoxygenToolkit_dateTag="\\date "
let g:DoxygenToolkit_versionTag="\\version "
let g:DoxygenToolkit_blockTag="\\name "
let g:DoxygenToolkit_classTag="\\class "

noremap <F4> :Dox<CR>

"let g:DoxygenToolkit_blockHeader="--------------------------------------------------------------------------"
"let g:DoxygenToolkit_blockFooter="----------------------------------------------------------------------------"
let g:DoxygenToolkit_authorName="Toplica Tanasković <toplicius@gmail.com>"

if exists('+colorcolumn')
    set colorcolumn=80
else
    au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

" Python-mode
" Activate rope
" Keys:
" K             Show python docs
" <Ctrl-Space>  Rope autocomplete
" <Ctrl-c>g     Rope goto definition
" <Ctrl-c>d     Rope show documentation
" <Ctrl-c>f     Rope find occurrences
" <Leader>b     Set, unset breakpoint (g:pymode_breakpoint enabled)
" [[            Jump on previous class or function (normal, visual, operator modes)
" ]]            Jump on next class or function (normal, visual, operator modes)
" [M            Jump on previous class or method (normal, visual, operator modes)
" ]M            Jump on next class or method (normal, visual, operator modes)
let g:pymode_rope = 1

" Documentation
 let g:pymode_doc = 1
 let g:pymode_doc_key = 'K'

" Linting
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"
let g:pymode_options_max_line_length = 120
"let g:pymode_lint_options = {'max-line-length': g:pymode_options_max_line_length}

" Auto check on save
let g:pymode_lint_write = 1

" Support virtualenv
let g:pymode_virtualenv = 1

" Enable breakpoints plugin
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_bind = '<leader>b'

" Syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" Don't autofold code
let g:pymode_folding = 0

"let g:tmux_navigator_no_mappings = 1

"nnoremap <silent> {Left-mapping} :TmuxNavigateLeft<cr>
"nnoremap <silent> {Down-Mapping} :TmuxNavigateDown<cr>
"nnoremap <silent> {Up-Mapping} :TmuxNavigateUp<cr>
"nnoremap <silent> {Right-Mapping} :TmuxNavigateRight<cr>
"nnoremap <silent> {Previous-Mapping} :TmuxNavigatePrevious<cr>

