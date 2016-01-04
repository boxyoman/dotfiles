let s:uname = ""
if has("unix")
  let s:uname = substitute(system("uname"), '\n', '', '')
endif

if s:uname == "Darwin"
  let g:python_host_prog = '/usr/local/bin/python'
endif

" Change Leader
let mapleader = ","

" vim-plug, some plugin manager
call plug#begin('~/dotfiles/nvim/plugged/')

Plug 'SirVer/ultisnips'
Plug 'embear/vim-localvimrc'

" This program is Mac only
if s:uname == "Darwin"
  Plug 'rizzatti/dash.vim'
endif

Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'bling/vim-airline'
Plug 'ajh17/Spacegray.vim'
Plug 'nathanaelkane/vim-indent-guides'

Plug 'vim-scripts/vim-xdc-syntax'
Plug 'lervag/vim-latex', {'for': 'latex'}
Plug 'kballard/vim-swift'
Plug 'rust-lang/rust.vim'
Plug 'leafgarland/typescript-vim'
Plug 'pangloss/vim-javascript'
Plug 'dag/vim-fish'

Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
Plug 'kien/ctrlp.vim'
Plug 'vim-scripts/a.vim'

Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

Plug 'tpope/vim-obsession'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'simnalamburt/vim-mundo', {'on': 'GundoToggle'}

Plug 'Valloric/YouCompleteMe', {'do': './install.sh --clang-completer'}
Plug 'benekastah/neomake', {'do': 'npm -g jshint'}
Plug 'ternjs/tern_for_vim', {'do': 'npm install', 'for': 'javascript'}
Plug 'racer-rust/vim-racer', {'for': 'rust'}

" Can't seem to get this to work
if s:uname == "Linux"
  Plug 'critiqjo/lldb.nvim'
endif

Plug 'justinmk/vim-sneak'
Plug 'junegunn/vim-easy-align'
Plug 'dhruvasagar/vim-table-mode', {'on': 'TableModeEnable'}
Plug 'scrooloose/nerdcommenter'

call plug#end()

" Theme Stuff
colorscheme spacegray
let g:airline_theme='luna'
set t_Co=256
set laststatus=2
let g:airline_powerline_fonts = 1

" Indent-Guide 
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=black
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=236
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_exclude_filetypes = ['help', 'nerdtree']

" CTRlp
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'a'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.o,*/build/*,*/STL/*,*/target/*,*/Debug/*,*/node_modules/*,*/bower_components/*,*/sass/*,*/justinviews/*,*/img/*

" C++ highighting
let g:cpp_class_scope_highlight = 1

" Rust
let g:rust_recommended_style = 0

" Racer
let g:racer_cmd = "/Users/Jonny/.cargo/bin/racer"
if s:uname == "Darwin"
  let $RUST_SRC_PATH="/Users/Jonny/Developer/home/computer/rust/rust/src/"
endif

"YouCompleteMe
let g:ycm_confirm_extra_conf = 0
nnoremap yd :YcmCompleter GoTo<CR>
nnoremap ygt :YcmCompleter GetType<CR>
nnoremap ygp :YcmCompleter GetParent<CR>
nnoremap yc :YcmDiags<CR>
let g:Show_diagnostics_ui = 1 
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_add_preview_to_completeopt = 1

"Neomake
let g:neomake_javascript_enabled_makers = ['jshint']
autocmd! BufWritePost * Neomake

"UltiSnip
let g:UltiSnipsSnippetsDir    = '~/.nvim/UltiSnips'
let g:UltiSnipsExpandTrigger  = "<c-j>"
let g:UltiJumpForwardTrigger  = "<c-j>"
let g:UltiJumpBackwardTrigger = "<c-s-j>"

" NERDTree
nnoremap <leader>o :NERDTreeToggle<CR>

" Dash Search
if s:uname == "Darwin"
  nmap <silent> <s-k> <Plug>DashSearch
endif

" Easy Align
map ga <Plug>(EasyAlign)

" Gundo
nnoremap <leader>u :GundoToggle<CR>

" Local .vimrc
set exrc
set secure

" Tab
set shiftwidth=2
set tabstop=2
set softtabstop=2
set expandtab

" random settings
set encoding=utf-8
set spelllang=en_us
set showmode
set showcmd
set visualbell

set cursorline
set relativenumber
set number
set ruler

" undo setting
set undofile
set undodir=~/.nvim/undo
set undolevels=1000
set undoreload=10000
set hidden
au FocusLost * :wa
set winaltkeys=no

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Search stuff
set incsearch
set smartcase
set ignorecase
set gdefault
set hlsearch
set showmatch
nnoremap <leader><space> :noh<cr>

" long lines
set wrap
set textwidth=79
set formatoptions=tqcnw1
set colorcolumn=80

" Moving
nnoremap j gj
nnoremap k gk
inoremap jk <ESC>
nnoremap <c-e> 3<c-e>
nnoremap <c-y> 3<c-y>

" Quick Macro
nnoremap Q @q

" Sudo save
cmap w!! w !sudo /usr/bin/tee > /dev/null %

" Easy Copy and paste from clip board
nnoremap <leader>p "+p
nnoremap <leader>P "+P
nnoremap <leader>y "+y
nnoremap <leader>Y "+Y
vnoremap <leader>y "+y
vnoremap <leader>p "+p
nnoremap Y y$

" Window mappings
nnoremap <leader>w <C-w>n<C-w>L
nnoremap <leader><leader> <c-w><c-w>
nnoremap <c-w>n :vnew<cr>
nnoremap <leader>ev :vsplit $MYVIMRC<cr>

" some file specific stuff
au BufReadPost,BufRead *.md set filetype=markdown

" Invisable Characters
nnoremap <leader>l :set list!<CR>
set listchars=tab:▸\ ,eol:¬

"Invisible character colors 
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59

" Buffer Remapping
nnoremap <leader>bn :bn<cr>
nnoremap <leader>bp :bp<cr>

" Open new tab with terminal
nnoremap <leader>tnw <C-w>n<C-w>L:term<cr>
nnoremap <leader>tnt :tabnew<cr>:term<cr>

" terminal mode
tmap <leader><leader> <c-\><c-n><leader><leader>
tmap gt <c-\><c-n>gt

" C++ options
set cino=N-s
set cino+=g0



function! GetByte()
  let byte = line2byte( line( "." ) ) + col( "." ) - 1
  return byte
endfunction
" Get the current byte of the character under the cursor
" To be used with clang-replace
command GetByte echo GetByte()

" Open help vertially
autocmd FileType help wincmd L

" Reload vimrc upon save. 
augroup myvimrc
  au!
  au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END

