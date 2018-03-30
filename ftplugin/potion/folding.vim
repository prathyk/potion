setlocal foldmethod=expr
setlocal foldexpr=GetPotionFold(v:lnum)

function! IndentLevel(lnum)
    return indent(a:lnum) / &shiftwidth
endfunction

function! NextNonBlankLine(lnum)
    let nl = line('$')
    let current = a:lnum + 1

    while current <= nl
	if getline(current) =~? '\v\S'
	    return current
	endif
	let current += 1
    endwhile
    return -1
endfunction

function! GetPotionFold(lnum)
    if getline(a:lnum) =~? '\v^\s*$'
        return '-1'
    endif
    let thisIndent = IndentLevel(a:lnum)
    let nextIndent = IndentLevel(NextNonBlankLine(a:lnum))

    if thisIndent == nextIndent
	return thisIndent
    elseif thisIndent > nextIndent
	return thisIndent
    else 
	return '>' . nextIndent
    endif
endfunction
