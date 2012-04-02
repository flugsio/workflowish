
"if exists("b:did_indent")
"  finish
"endif
"let b:did_indent = 1

setlocal autoindent
setlocal indentexpr=GetWorkflowishIndent()

function! GetWorkflowishIndent()

  let foldcloseend = foldclosedend(v:lnum-1)
  if foldcloseend > -1
    return indent(foldcloseend+1)
  endif

  let indent = indent(v:lnum-1)
  let next_row = v:lnum+1
  let indent_next = indent(next_row)

  if indent_next > indent
    return indent_next
  elseif indent_next < indent
    return indent
  elseif indent_next == indent
    return indent
  endif
endfunction

