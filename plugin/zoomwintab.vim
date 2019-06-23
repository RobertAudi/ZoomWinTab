" ZoomWinTab - Simple plugin to zoom windows
"
" Maintainer:    Robert Audi
" Author:        Dmitry "troydm" Geurkov <d.geurkov@gmail.com>
" Version:       0.1
" Description:   ZoomWinTab is a simple plugin to zoom windows using tabs.
" Last Change:   2019-06-23
" License:       Vim License (see :help license)
" Website:       https://github.com/RobertAudi/ZoomWinTab

if exists('g:loaded_ZoomWinTab') || &cp || v:version < 704
  finish
endif
let g:loaded_ZoomWinTab = 1

let s:save_cpo = &cpo
set cpo&vim

" Options {{{
" ------------------------------------------------------------------------------

if !exists('g:ZoomWinTabHideTabBar')
  let g:ZoomWinTabHideTabBar = 1
endif

" ------------------------------------------------------------------------------ }}}

" Functions {{{
" ------------------------------------------------------------------------------

function! ZoomWinTabIn() " {{{
  if exists('*getcmdwintype') && getcmdwintype() !=# ''
    echo 'No zoom in command line window'
    return
  endif

  if exists('t:ZoomWinTab')
    echo 'Already zoomed in'
    return
  endif

  if winnr('$') == 1
    echo 'Already only one window'
    return
  endif

  let l:bufnr = bufnr('%')
  let l:tabpagenr = tabpagenr()
  let l:switchbuf = &switchbuf

  set switchbuf&

  execute 'tab sb ' . l:bufnr

  let &switchbuf = l:switchbuf

  if l:tabpagenr != tabpagenr()
    let t:ZoomWinTab = &showtabline
    let t:ZoomWinTabNr = l:tabpagenr

    if g:ZoomWinTabHideTabBar == 1
      set showtabline=0
    endif
  endif
endfunction " }}}

function! ZoomWinTabOut() " {{{
  if !exists('t:ZoomWinTab')
    echo 'Already zoomed out'
    return
  endif

  let &showtabline = t:ZoomWinTab
  let l:tabpagenr = t:ZoomWinTabNr

  tabclose

  if tabpagenr() != l:tabpagenr
    execute 'tabnext ' . l:tabpagenr
  endif
endfunction " }}}

function! ZoomWinTabToggle() " {{{
  if exists('t:ZoomWinTab')
    call ZoomWinTabOut()
  else
    call ZoomWinTabIn()
  endif
endfunction " }}}

" ------------------------------------------------------------------------------ }}}

" Commands {{{
" ------------------------------------------------------------------------------

command! ZoomWinTabIn     call ZoomWinTabIn()
command! ZoomWinTabOut    call ZoomWinTabOut()
command! ZoomWinTabToggle call ZoomWinTabToggle()

" ------------------------------------------------------------------------------ }}}

let &cpo = s:save_cpo
unlet s:save_cpo

" vim: set sw=2 sts=2 et fdm=marker:
