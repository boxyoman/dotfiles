" Disable haskell-vim omnifunc
let g:haskellmode_completion_ghc = 0
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc


" GHC-mod
" nnoremap <buffer> <LocalLeader>d :GhcModSigCodegen<cr>
" nnoremap <buffer> <LocalLeader>c :GhcModSplitFunCase<cr>
" nnoremap <buffer> <LocalLeader>t :GhcModType<cr>
" nnoremap <buffer> <LocalLeader><space> :GhcModTypeClear<cr>
" hi ghcmodType ctermbg=blue
" let g:ghcmod_type_highlight = 'ghcmodType'

" Intero-neovim
autocmd! BufWritePost *.hs InteroReload
nnoremap <buffer> <LocalLeader>u :InteroUses<CR>
nnoremap <buffer> <LocalLeader>gd :InteroGoToDef<CR>
nnoremap <buffer> <LocalLeader>I :InteroTypeInsert<CR>
nnoremap <buffer> <LocalLeader>i :InteroInfo<CR>
nnoremap <buffer> <LocalLeader>T :InteroType<CR>
nnoremap <buffer> <LocalLeader>t :InteroGenericType<CR>
nnoremap <buffer> <LocalLeader>e :InteroEval<CR>

nnoremap <buffer> <LocalLeader>io :InteroOpen<CR>
nnoremap <buffer> <LocalLeader>ik :InteroKill<CR>
nnoremap <buffer> <LocalLeader>ic :InteroHide<CR>
nnoremap <buffer> <LocalLeader>il :InteroLoadCurrentModule<CR>

" NeovimHaskell
let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`


" necoghc
let g:necoghc_enable_detailed_browse = 1
