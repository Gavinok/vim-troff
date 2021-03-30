" File: pic.vim
" Maintainer: Gavin Jaeger-Freeborn <gavinfreeborn@gmail.com>
" Created: Mon 12 Oct 2020 01:59:40 PM
" License:
" Copyright (c) Gavin Jaeger-Freeborn.  Distributed under the same terms as Vim itself.
" See :help license
"
" Description: 
" Completion for pic sections of troff files


" you can find more of them at /home/gavinok/groff/doc/pic.pdf
let s:pic_closed_primitives = [ 'box', 'circle', 'ellipse' ]
let s:pic_open_primitives = [ 'arc', 'line', 'arrow', 'spline' ]
let s:pic_closed_attributes = [
			\'ht',
			\'height',
			\'wid',
			\'width',
			\'solid',
			\]
let s:pic_closed_curve_attributes = [
			\'rad',
			\'radius',
			\'diam',
			\'diameter',
			\]
let s:pic_open_attributes = [
			\'from',
			\'to',
			\'at',
			\]
let s:pic_circle_attribute = [ 'diam', 'rad']
let s:pic_objects_attribute = [ 'colored', 'shaded', 'outlined', 'invis', 'dotted', 'dashed']
let s:pic_directions = ['down', 'up', 'right', 'left']
let s:pic_options = [ 'dashed', 'inves', 'at (' ]
let s:pic_expressions = [
			\{ 'word': 'sin(', 'info': 'sin(x)' },
			\{ 'word': 'cos(', 'info': 'cos(x)' },
			\{ 'word': 'atan2(', 'info': 'atan2(y, x)' },
			\{ 'word': 'log(x)', 'info': 'log(x) (base 10)' },
			\{ 'word': 'exp(x)', 'info': 'exp(x) (base 10, i.e. 10^x)' },
			\{ 'word': 'sqrt(', 'info': 'sqrt(x)' },
			\{ 'word': 'int(', 'info': 'int(x)' },
			\{ 'word': 'rand()', 'info': 'rand() (return a random number between 0 and 1)' },
			\{ 'word': 'rand(', 'info': 'rand(x) (return a random number between 1 and x; deprecated)' },
			\{ 'word': 'srand(', 'info': 'srand(x) (set the random number seed)' },
			\{ 'word': 'max(', 'info': 'max(e1, e2)' },
			\{ 'word': 'min(', 'info': 'min(e1, e2)' },
			\]
let s:pic = s:pic_closed_primitives + s:pic_open_primitives

" TODO: Improve pic completion <09-10-20 Gavin Jaeger-Freeborn>
" used for completion in pic
function! pic#PicComplete(context) abort " {{{
	"
	let object = matchstr(a:context, '^\zs\k\+\ze\s\+$')
	if object =~# '\(box\|circle\|ellipse\)'
		return s:pic_closed_attributes + s:pic_objects_attribute + s:pic_options
	elseif object =~# '\(arc\|line\|arrow\|spline\)'
		return s:pic_open_attributes + s:pic_options
	endif
	" if a:context =~? '\(^\|^.*;\)$'
	return s:pic_open_primitives + s:pic_closed_primitives + s:pic_directions
	" endif
	return []
endfunction " }}}
