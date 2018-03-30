if !exists("g:potion_command")
    let g:potion_command = "potion"
endif

function! potion#running#PotionCompileAndRun()
    silent !clear
    execute "!" . g:potion_command . " " . bufname('%')
endfunction

function! potion#running#PotionShowBytecode()
    "Get Bytecode
    let bytecode = system(g:potion_command . " -c -V " . bufname("%"))

    "Open a split

    let nr = bufwinnr("__POTION_BYTECODE__") 
    if(nr < 0)
	vsplit __POTION_BYTECODE__
    else
	exe nr . "wincmd w"
    endif
    normal! ggdG
    setlocal filetype=potionbytecode
    setlocal buftype=nofile

    "put bytecode there
    call append(0, split(bytecode, '\v\n'))
endfunction

