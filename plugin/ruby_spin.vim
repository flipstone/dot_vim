" ruby_spin.vim
"
" Author: David Vollbracht <david@flipstone.com>
" Version: 1.0 for Vim 7.3
" Last Change:  2012 5/16
" Licence: Public Domain
"
" Description:
"
if exists("g:loaded_ruby_spin")
  finish
endif
let g:loaded_ruby_spin = 1

let s:files = ""

function! s:SpinAddCurrent()
  let s:files = s:files . " " . @%
  call s:Spin()
endfunction

function! s:SpinClear()
  let s:files = ""
endfunction

function! s:Spin()
  call system("spin push " . s:files)
endfunction

augroup Spin

command! -nargs=0 SpinAdd :call s:SpinAddCurrent()
command! -nargs=0 SpinClear :call s:SpinClear()
command! -nargs=0 Spin :call s:Spin()
command! -nargs=0 AutoSpin :autocmd Spin BufWritePost * Spin
command! -nargs=0 NoAutoSpin :autocmd! Spin BufWritePost *

