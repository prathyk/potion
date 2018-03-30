if !exists("g:potion_command")
    let g:potion_command = "potion"
endif

let maplocalleader=','
nnoremap <buffer> <localleader>r :call potion#running#PotionCompileAndRun()<cr>
nnoremap <buffer> <localleader>b :call potion#running#PotionShowBytecode()<cr>
