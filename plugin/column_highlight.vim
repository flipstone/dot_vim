" column_highlight.vim
"
" Author: David Vollbracht <david@flipstone.com>
" Version: 1.0 for Vim 7.3
" Last Change:  2012 4/28
" Licence: Public Domain
"
" Description:
"   Allows you to highlight the column the cursor is
"   on, then move away and have that column remain
"   highlighted.
"
"   How to Use
"     :HighlightColumnAdd
"       - Adds the cursor column to highlighted columns
"
"     :HighlightColumnOne
"       - Adds the cursor column to highlighted columns
"         and unhighlights other columns
"
"     :HighlightColumnOff
"       - unhighlights all columns
"
"  Recommended local header mappings:
"     map <silent> <LocalLeader>ch :HighlightColumnAdd<CR>
"     map <silent> <LocalLeader>co :HighlightColumnOne<CR>
"     map <silent> <LocalLeader>cc :HighlightColumnOff<CR>
"
if exists("g:loaded_column_highlight")
  finish
endif
let g:loaded_column_highlight = 1

function! s:HighlightColumnOne()
  let &colorcolumn = col(".")
endfunction

function! s:HighlightColumnAdd()
  if &colorcolumn
    let &colorcolumn = join([&colorcolumn, col(".")], ",")
  else
    call s:HighlightColumnOne()
  end
endfunction

function! s:HighlightColumnOff()
  let &colorcolumn = ""
endfunction

command! -nargs=0 HighlightColumnOne :call s:HighlightColumnOne()
command! -nargs=0 HighlightColumnOff :call s:HighlightColumnOff()
command! -nargs=0 HighlightColumnAdd :call s:HighlightColumnAdd()

