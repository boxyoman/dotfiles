let s:uname = ""
if has("unix")
  let s:uname = substitute(system("uname"), '\n', '', '')
endif

" Change Leader
let mapleader = ","

lua require('config')

" tex
let g:tex_flavor = 'latex'



" FZF
" nnoremap <silent> <c-p> :FZF<CR>

set mouse=

" Supertab
" let g:SuperTabDefaultCompletionType = "<c-n>"

" Grepper
runtime plugin/grepper.vim
let g:grepper.quickfix = 0
let g:grepper.highlight = 1
nmap gs  <plug>(GrepperOperator)

" Theme Stuff
colorscheme PaperColor
set background=light
let g:airline_theme='papercolor'
set t_Co=256
set laststatus=2
let g:airline_powerline_fonts=0
let g:airline#extensions#tabline#enabled = 1
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_section_y = ''
let g:airline_section_z = '%l:%c'

" Ledger
let g:ledger_bin = 'hledger'

" Indent-Guide
let g:indent_guides_auto_colors = 0
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_exclude_filetypes = ['help', 'nerdtree']



" C++ highighting
let g:cpp_class_scope_highlight = 1

" Rust
let g:rust_recommended_style = 0



"Neomake
" let g:neomake_javascript_enabled_makers = ['eslint']
" let g:neomake_typescript_enabled_makers = ['tsc']
" autocmd! BufWritePost * Neomake

"UltiSnip
let g:UltiSnipsSnippetsDir    = '~/dotfiles/nvim/UltiSnips'
let g:UltiSnipsExpandTrigger  = "<c-j>"
let g:UltiJumpForwardTrigger  = "<c-j>"
let g:UltiJumpBackwardTrigger = "<c-s-j>"

" NERDTree
nnoremap <leader>o :NERDTreeToggle<CR>

" CamelCaseMotion
map <silent> gw <Plug>CamelCaseMotion_w
map <silent> gb <Plug>CamelCaseMotion_b
map <silent> ge <Plug>CamelCaseMotion_e
map <silent> gge <Plug>CamelCaseMotion_ge
omap <silent> igw <Plug>CamelCaseMotion_ib
xmap <silent> igw <Plug>CamelCaseMotion_ib
omap <silent> ige <Plug>CamelCaseMotion_ie
xmap <silent> ige <Plug>CamelCaseMotion_ie

" Gundo
nnoremap <leader>u :MundoToggle<CR>


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

" line numers and lines
set cursorline
set relativenumber
set number
set ruler

" undo setting
set undofile
set undolevels=1000
set undoreload=10000
set hidden
" au FocusLost * :wa
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
set inccommand=split
nnoremap <leader><space> :noh<cr>

" long lines
set wrap
set textwidth=80
set formatoptions=tqcnw1
set colorcolumn=81

" Moving
nnoremap j gj
nnoremap gj j
nnoremap k gk
nnoremap gk k
inoremap jk <ESC>
nnoremap <c-e> 4<c-e>
nnoremap <c-y> 4<c-y>

" Buffers
nnoremap <leader>bn :bn<cr>
nnoremap <leader>bp :bp<cr>

" Quick Macro
nnoremap Q @q

" Sudo save
cmap w!! w !sudo /usr/bin/tee > /dev/null %

" Easy Copy and paste from clip board
nnoremap <leader>p "+p
nnoremap <leader>P "+P
nnoremap <leader>y "+y
nnoremap <leader>Y "+y$
vnoremap <leader>y "+y
vnoremap <leader>p "+p
nnoremap Y y$

vnoremap <space>p "_dP

" Window mappings
nnoremap <leader>w <C-w>n<C-w>L
nnoremap <leader><leader> <c-w><c-w>
nnoremap <leader>. <c-w><c-h>
nnoremap <c-w>n :vnew<cr>
nnoremap <leader>ev :vsplit $MYVIMRC<cr>

" zig settings
let g:zig_fmt_autosave = 0

" some file specific stuff
au BufReadPost,BufRead *.md set filetype=markdown

" Invisable Characters
nnoremap <leader>l :set list!<CR>
set listchars=tab:▸\ ,eol:¬

"Invisible character colors
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59


" C++ options
set cino=N-s
set cino+=g0
set cino+=l1
set cino+=b0

" Open help vertially
autocmd FileType help wincmd L

" Bye bye trailing whitespace
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

