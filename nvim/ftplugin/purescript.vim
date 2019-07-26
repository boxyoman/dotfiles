let g:psc_ide_syntastic_mode = 1
let g:psc_ide_import_on_completion = v:false

nm <buffer> <silent> <localleader>L :Plist<CR>
nm <buffer> <silent> <localleader>l :Pload!<CR>
nm <buffer> <silent> <localleader>r :Prebuild!<CR>
nm <buffer> <silent> <localleader>f :PaddClause<CR>
nm <buffer> <silent> <localleader>T :PaddType<CR>
nm <buffer> <silent> <localleader>a :Papply<CR>
nm <buffer> <silent> <localleader>A :Papply!<CR>
nm <buffer> <silent> <localleader>c :Pcase<CR>
nm <buffer> <silent> <localleader>C :Pcase!<CR>
nm <buffer> <silent> <localleader>i :Pimport<CR>
nm <buffer> <silent> <localleader>qa :PaddImportQualifications<CR>
nm <buffer> <silent> <localleader>g :Pgoto<CR>
nm <buffer> <silent> <localleader>p :Pursuit<CR>
nm <buffer> <silent> <localleader>t :Ptype<CR>

setlocal spell
