" File: tbl.vim
" Maintainer: Gavin Jaeger-Freeborn <gavinfreeborn@gmail.com>
" Created: Mon 12 Oct 2020 02:04:54 PM
" License:
" Copyright (c) Gavin Jaeger-Freeborn.  Distributed under the same terms as Vim itself.
" See :help license
"
" Description: 
" Completion for tbl sections
"

let s:tbl = ['allbox', 'box', 'center', 'delim(', 'doublebox', 'expand', 'frame', 'linesize(', ]
let s:gnu_tbl = [ 'decimapoint(', 'nokeep', 'nospaces', 'nowarn', 'tab(' ]

function! tbl#TblComplete(shortcontext)
	return s:tbl
endfunction
