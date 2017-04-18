
autocmd FileType fsharp set et ts=4 sw=4
let g:elm_setup_keybindings = 0
let g:elm_format_autosave = 1

if !exists('g:deoplete#omni#functions')
  let g:deoplete#omni#functions = {}
endif
if !exists('g:deoplete#omni_patterns')
  let g:deoplete#omni_patterns = {}
endif
if !exists('g:deoplete#omni#sources')
  let g:deoplete#omni#sources = {}
  let g:deoplete#omni#sources._ = ['file', 'ultisnips']
endif

let g:deoplete#omni#functions.elm = ['elm#Complete']
let g:deoplete#omni_patterns.elm = '\.'
let g:deoplete#omni#sources.elm = ['omni'] + g:deoplete#omni#sources._
