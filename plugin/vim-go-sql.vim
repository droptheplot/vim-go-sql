function! s:enable_vim_go_sql()
  let s:b_current_syntax = b:current_syntax
  unlet b:current_syntax

  syntax include @SQL syntax/sql.vim

  let b:current_syntax = s:b_current_syntax

  syntax region vimGoSQLSameLineSnip matchgroup=Statement start=+`SELECT+ end="`" contains=@SQL
  syntax region vimGoSQLNewLineSnip matchgroup=Statement start=+`\n\s*SELECT+ end="`" contains=@SQL
endfunction

augroup vim_go_sql
  autocmd!
  autocmd Syntax go call s:enable_vim_go_sql()
augroup END
