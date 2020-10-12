scriptencoding utf-8
" File: groff.vim
" Maintainer: Gavin Jaeger-Freeborn <gavinfreeborn@gmail.com>
" Created: Fri 14 Feb 2020 09:52:12 AM MST
" License:
" Copyright (c) Gavin Jaeger-Freeborn.  Distributed under the same terms as Vim itself.
" See :help license
"
" Description:
" ftplugin for groff files

" allow for sourcing local macro packages
setlocal include=^\\.m\\?so

" allow for searching for machine macros or strings
let &l:define = '^\.\(de\|nr\|ds\)\s*'

" add comment string for inline use
setlocal commentstring=\\\"%s

" TODO: clean up formatting <09-10-20 Gavin Jaeger-Freeborn>
" TODO: add pic warnings  <09-10-20 Gavin Jaeger-Freeborn>
" Handle all kinds for tracebacks
setlocal errorformat=%o:<standard\ input>\ (%f):%l:%m,
			\%o:\ <standard\ input>\ (%f):%l:%m,
			\%o:\ %f:%l:%m,
			\%o:%f:%l:%m,
			\%f:%l:\ macro\ %trror:%m,
			\%f:%l:%m,
			\%W%tarning:\ file\ '%f'\\,\ around\ line\ %l:,%Z%m

" setlocal errorformat=%o:<standard\ input>\ (%f):%l:%m
" setlocal errorformat+=%o:%f:%l:%m
" setlocal errorformat+=%o:\ %f:%l:%m
" setlocal errorformat+=refer:%f:%l:%m                                     " invalid symbol
" setlocal errorformat+=refer:%f:%l:%m                                     " invalid symbol
" setlocal errorformat+=%f:%l:\ macro\ %trror:%m                           " macro errors
" setlocal errorformat+=%f:%l:%m                                           " general errors
" setlocal errorformat+=%W%tarning:\ file\ '%f'\\,\ around\ line\ %l:,%Z%m " warnings


" TODO: allow this to be set and automated <09-10-20 Gavin Jaeger-Freeborn>
" add tmac files to path

" TODO: check if this has been set
" TODO: add support for $GROFF_TMAC_PATH <10-10-20 Gavin Jaeger-Freeborn>
let g:groff_install_prefix='/usr/share'
if isdirectory( g:groff_install_prefix . '/groff/current/tmac' )
	execute 'setlocal path+="' . g:groff_install_prefix . '/groff/current/tmac"'
	execute 'setlocal tags+="' . g:groff_install_prefix . '/groff/current/tmac/tags"'
	execute 'setlocal tags+="' . g:groff_install_prefix . '/usr/local/lib/groff/site-tmac/tags"'
	execute 'setlocal tags+="' . g:groff_install_prefix . '/usr/local/share/groff/site-tmac/tags"'
endif

" user specified macro directory
if !exists('g:troff_macro_dir')
	let g:troff_macro_dir='/usr/share/groff/current/tmac'
endif




" TODO: Don't use groff functions for non groff requests <09-10-20 Gavin Jaeger-Freeborn>
" uses base macros to provide documentation
" GroffDoc {{{
function! GroffDoc(word)
	for req in requests#GetRequests()
		" echoerr req
		if a:word ==# req.word
			if has_key(req, 'info')
				echo req.info
				return
			endif
		endif
	endfor
	call GroffMan()
endfunction

command! -nargs=1 GroffDoc call GroffDoc(<f-args>)

setlocal keywordprg=:GroffDoc
" }}} "GroffDoc

" Variables (used for omnifunc) {{{1
" preprocessor definitions {{{ "2
let s:general_macros = [
			\{ 'word': 'EQ', 'icase': 1 },
			\{ 'word': 'TS', 'icase': 1 },
			\{ 'word': 'PS', 'icase': 1 },
			\{ 'word': 'G1', 'icase': 1 },
			\{ 'word': 'G2', 'icase': 1 },
			\{ 'word': 'PSPIC'
			\, 'abbr': 'PSPIC [image.eps]', 'icase': 1 }
			\]
" }}}2 "preprocessor definitions
" mom {{{2
let s:mom_prestart_macros = [
			\{ 'word': 'TITLE "', 'info': 'TITLE [COVER | DOC_COVER] "<title string>" ["<2nd line>" ["<3rd line>" ... ] ]', 'icase': 1 },
			\{ 'word': 'SUBTITLE "', 'info': 'SUBTITLE [COVER | DOC_COVER] "<subtitle>" ["<2nd line>" ["<3rd line>" ... ] ]', 'icase': 1 },
			\{ 'word': 'AUTHOR "', 'icase': 1 },
			\{ 'word': 'PRINTSTYLE', 'icase': 1 },
			\{ 'word': 'COPYRIGHT', 'icase': 1 },
			\{ 'word': 'COVERTITLE "', 'icase': 1 },
			\{ 'word': 'HEADING_STYLE', 'icase': 1 },
			\{ 'word': 'COPYRIGHT_STYLE', 'icase': 1 },
			\{ 'word': 'CHAPTER', 'icase': 1 },
			\{ 'word': 'CHAPTER_TITLE "', 'icase': 1 },
			\{ 'word': 'DRAFT', 'icase': 1 },
			\{ 'word': 'REVISION', 'icase': 1 },
			\{ 'word': 'DOCTYPE', 'icase': 1 },
			\{ 'word': 'COPYSTYLE', 'icase': 1 },
			\{ 'word': 'FAMILY', 'icase': 1 },
			\{ 'word': 'PT_SIZE', 'icase': 1 },
			\{ 'word': 'START', 'icase': 1 },
			\{ 'word': 'DOC_COVERTITLE "', 'icase': 1 },
			\{ 'word': 'PDF_TITLE "', 'icase': 1 },
			\{ 'word': 'TOC_HEADING "', 'icase': 1 },
			\{ 'word': 'L_MARGIN', 'icase': 1 },
			\{ 'word': 'R_MARGIN',  'icase': 1 }
			\]
let s:mom_style_options = [
			\{ 'word': 'FAMILY', 'icase': 1 },
			\{ 'word': 'FONT', 'icase': 1 },
			\{ 'word': 'UNDERSCORE', 'icase': 1 },
			\{ 'word': 'SIZE', 'icase': 1 },
			\{ 'word': 'COLOR', 'icase': 1 },
			\{ 'word': 'QUAD', 'icase': 1 },
			\{ 'word': 'SPACE_ABOVE', 'icase': 1 },
			\{ 'word': 'SPACE_BENEATH',  'icase': 1 }
			\]
let s:mom_poststart_macros = [
			\{ 'word': 'IL', 'abbr': 'IL [ <measure> ]', 'info': 'set and turn on a left indent' },
			\{ 'word': 'IR', 'abbr': 'IR [ <measure> ]',	'info': 'set and turn on a right indent'},
			\{ 'word': 'IB', 'abbr': 'IB [ <measure> ]',	'info': 'set and turn on indents both left and right'},
			\{ 'word': 'TI', 'abbr': 'TI [ <measure> ]',	'info': 'set and turn on a temporary (one line) indent'},
			\{ 'word': 'HI', 'abbr': 'HI [ <measure> ]',	'info': 'set and turn on a hanging indent (TREATED LITERALY) '},
			\{ 'word': 'IQ', 'info': 'quit (exit) all indents'},
			\{ 'word': 'ILX',	'info': 'left indents off'},
			\{ 'word': 'IRX',	'info': 'right indents off'},
			\{ 'word': 'IBX',	'info': 'both left and right indents off'},
			\
			\{ 'word': 'HEADING', 'abbr': 'HEADING <level> "<heading text>"', 'info': 'Macro: HEADING <level> [ PARAHEAD ] [ NAMED <pdf-id> ] "<heading text>"', 'icase': 1 },
			\
			\{ 'word': 'LEFT',   'info': 'set line-by-line quad left', 'icase': 1 },
			\{ 'word': 'RIGHT',  'info': 'set line-by-line quad right','icase': 1 },
			\{ 'word': 'CENTER', 'info': 'set line-by-line quad centre','icase': 1 },
			\{ 'word': 'QUAD',   'abbr': 'QUAD L | LEFT | R | RIGHT | C | CENTER | J | JUSTIFY', 'info': ' "justify" text left, centre, or right' },
			\{ 'word': 'JUSTIFY', 'info': 'justify text to both margins' },
			\{ 'word': 'BR', 'info': 'break a justified line'},
			\{ 'word': 'SPREAD', 'info': 'force justify a line'},
			\{ 'word': 'EL', 'info': ' break a line without advancing on the page'},
			\
			\{ 'word': 'UNDERSCORE', 'abbr': 'UNDERSCORE [ <distance below baseline> ] "<string>"', 'info': 'underscore' },
			\{ 'word': 'UNDERSCORE2', 'abbr': 'UNDERSCORE2 [ <distance below baseline> [ <distance between rules> ] ] "<string>"', 'info': ' double underscore' },
			\
			\{ 'word': 'PP', 'icase': 1 },
			\{ 'word': 'LINEBREAK', 'icase': 1 },
			\{ 'word': 'SECTION', 'icase': 1 },
			\{ 'word': 'LIST', 'abbr': 'LIST [ BULLET | DASH | ... ] [ <separator> ] [ <prefix> ] [ <anything> ]', 'info': 'Invoked by itself (ie with no argument), LIST initializes a list with bullets as the default enumerator. Afterward,s each block of input text preceded by .ITEM, on a line by itself, is treated as a list item. LIST [ BULLET | DASH | DIGIT | ALPHA | alpha | ROMAN<n> | roman<n> | USER <user-defined enumerator> | PLAIN | VARIABLE <character>] [ <separator> ] [ <prefix> ] [ <anything> ]}', 'icase': 1 },
			\{ 'word': 'ITEM', 'icase': 1 },
			\{ 'word': 'PP_FONT', 'icase': 1 },
			\{ 'word': 'PARA_INDENT', 'icase': 1 },
			\{ 'word': 'EPIGRAPH', 'icase': 1 },
			\{ 'word': 'EL',  'icase': 1 }
			\]
let s:mom_heading_options = [
			\{ 'word': 'NUMBER',  'icase': 1 },
			\]
let s:mom_poststart_toggle_macros = [
			\{ 'word': 'QUOTE', 'icase': 1 },
			\{ 'word': 'FLOAT', 'icase': 1 },
			\{ 'word': 'BLOCKQUOTE', 'icase': 1 },
			\{ 'word': 'CODE', 'icase': 1 },
			\{ 'word': 'JUSTIFY', 'icase': 1 },
			\{ 'word': 'FOOTNOTE', 'icase': 1 },
			\]
" }}}2 "mom

" ms {{{ "2
let s:ms_macros = [
			\{ 'word': 'NH', 'icase': 1 },
			\{ 'word': 'SH', 'icase': 1 },
			\{ 'word': 'PP', 'icase': 1 },
			\{ 'word': 'LP', 'icase': 1 },
			\{ 'word': 'B' , 'icase': 1 },
			\{ 'word': 'R' , 'icase': 1 },
			\{ 'word': 'I' , 'icase': 1 },
			\{ 'word': 'CW', 'icase': 1 },
			\{ 'word': 'BI', 'icase': 1 },
			\{ 'word': 'UL', 'icase': 1 },
			\{ 'word': 'LG', 'icase': 1 },
			\{ 'word': 'SM', 'icase': 1 },
			\{ 'word': 'IP', 'icase': 1 },
			\{ 'word': 'KS', 'icase': 1 },
			\{ 'word': 'KE', 'icase': 1 },
			\{ 'word': 'RS', 'icase': 1 },
			\{ 'word': 'RE', 'icase': 1 },
			\{ 'word': 'TL', 'icase': 1 },
			\{ 'word': 'BX', 'icase': 1 },
			\{ 'word': 'B1', 'icase': 1 },
			\{ 'word': 'B2', 'icase': 1 }
			\]
" }}}2 "ms
" font {{{ "2
let s:font = [
			\{ 'word': 'B', 'icase': 1 },
			\{ 'word': 'I', 'icase': 1 },
			\{ 'word': 'BI', 'icase': 1 },
			\{ 'word': 'R', 'icase': 1 },
			\{ 'word': 'P', 'icase': 1 }
			\]
" }}}2 "font

" TODO: add more escape sequences <10-08-20 Gavin Jaeger-Freeborn>
" escapes {{{ "2
let s:escapes = [
			\{ 'word': 'f', 'abbr': '\f', 'info': 'Change to font with one-character name or one-digit number F.', 'icase': 1 },
			\{ 'word': 'l', 'abbr': '\l’Nc’', 'info': 'Horizontal line drawing function (optionally using character c).', 'icase': 1 },
			\{ 'word': 'L', 'abbr': '\L’Nc’', 'info': 'Vertical line drawing function (optionally using character c).', 'icase': 1 },
			\{ 'word': 'D', 'abbr': '\D’charseq’', 'info': 'Draw a graphical element defined by the characters in charseq; see the groff Texinfo manual for details.', 'icase': 1 },
			\{ 'word': '"', 'abbr': '\"', 'info': 'Start of a comment.  Everything up to the end of the line is ignored.', 'icase': 1 },
			\{ 'word': 'Z', 'abbr': '\Z’anything’', 'info': 'Print anything and then restore the horizontal  and  vertical  position; anything may not contain tabs or leaders.', 'icase': 1 },
			\{ 'word': '$*', 'abbr': '\$*', 'info': 'In a macro or string, the concatenation of all the arguments separated by spaces.', 'icase': 1 },
			\{ 'word': '$@', 'abbr': '\$@', 'info': 'In a macro or string, the concatenation of all the arguments with each surrounded by double quotes, and separated by spaces.', 'icase': 1 },
			\{ 'word': '$^', 'abbr': '\$^', 'info': 'In a macro, the representation of all parameters as if they were an argument to the ds request.', 'icase': 1 },
			\{ 'word': '&', 'abbr': '\&', 'info': 'Non-printable, zero-width glyph. (used for escaping)', 'icase': 1 }
			\]
" }}}2 "escapes

" ms registers {{{ "2
let s:registers = [
			\{ 'word': 'PS', 'icase': 1 },
			\{ 'word': 'VS', 'icase': 1 },
			\{ 'word': 'PSINCR', 'icase': 1 },
			\{ 'word': 'GROWPS', 'icase': 1 }
			\]
" }}}2 "ms registers
" strings need work
let s:strings = ['ce']


" }}}1 "Variables (used for omnifunc)

" used to determine the macros used
function! CheckMacros()
	if search('^\.\s*START\s*', 'bnW') > 0
		return 'mom_poststart'
	elseif search('^\.\s*START\s*', 'nW') > 0 || expand('%:e') ==# 'mom'
		return 'mom_prestart'
	elseif search('^\.\s*\(UL\|TL\|NH\|XP\|XN\)\s*', 'bnw') > 0 || expand('%:e') ==# 'ms'
		return 'ms'
	elseif search('^\.\s*[ilnp]p\s*', 'bnw') > 0 || expand('%:e') ==# 'ms'
		return 'me'
	endif
endfunction

" Omnifunc for use with groff (currently only supports ms macros)
fun! GroffOmnifunc(findstart, base) " {{{
	if a:findstart
		" set filetype
		let line = getline('.')
		let start = col('.') - 1
		let curline = line('.')
		let compl_begin = col('.') - 2
		while start >= 0 && line[start - 1] =~? '\k'
			let start -= 1
		endwhile
		let b:compl_context = getline('.')[0:compl_begin]
		return start
	else
		" calling a macro
		let res = []
		let res2 = []
		" a:base is very short - we need context
		" Shortcontext is context without a:base, useful for checking if we are
		" looking for objects and for what objects we are looking for
		let context = b:compl_context
		let shortcontext = substitute(context, a:base.'$', '', '')
		unlet! b:compl_context
		" echoerr a:base
		" echoerr shortcontext

		" let object = matchstr(shortcontext, '^\.\s*\zs\k\+\ze\s\+$')

		" if len(object) > 0
		" 	if search(object.'\s*\s*', 'bn') > 0
		" 		let object_type = 'Register'
		" 	elseif search(object.'\.\s*ds\s*', 'bn') > 0
		" 		let object_type = 'String'
		" 	elseif search(object.'\.\s*', 'bn') > 0
		" 		let object_type = 'Macro'
		" 	endif
		" endif

		" if !exists('object_type')
		" 	let object_type = ''
		" endif

		" if object_type == 'Macro'
		" 	let values = s:macros
		" elseif object_type == 'String'
		" 	let values = s:strings
		" elseif object_type == 'Register'
		" 	let values = s:registers
		" elseif object_type == 'Object'
		" 	let values = s:objes
		" endif
		let [line, col] = [line('.'), col('.')]
		let syntype = reverse(map(synstack(line, col), 'synIDattr(v:val,"name")'))
		for synt in syntype
			if synt ==# 'nroffEquation'
				let values = eqn#EqnComplete(shortcontext)
				if shortcontext =~? '\.\s*$'
					let values = [ { 'word': 'EN', 'icase': 1 } ]
				elseif shortcontext =~? '\\[$':w
					let values = groff_char#GroffCompleteGlyph('\\[')
					if values == [] | unlet values | endif
				elseif shortcontext =~? '\\($'
					let values = groff_char#GroffCompleteGlyph('\\(')
					if values == [] | unlet values | endif
				endif
			elseif synt ==# 'nroffTable'
				let values = tbl#TblComplete(shortcontext)
				if shortcontext =~? '\.\s*$'
					let values = [ { 'word': 'TE', 'icase': 1 } ]
				elseif shortcontext =~# '\\f\([\|(\)$'
					let values = s:font
				elseif shortcontext =~? '\\[$'
					let values = groff_char#GroffCompleteGlyph('\\[')
					if values == [] | unlet values | endif
				elseif shortcontext =~? '\\($'
					let values = groff_char#GroffCompleteGlyph('\\(')
					if values == [] | unlet values | endif
				endif
			elseif synt ==# 'nroffPicture'
				let values = pic#PicComplete(shortcontext)
				if shortcontext =~? '\.\s*$'
					let values = [ { 'word': 'PE', 'icase': 1 } ]
				elseif shortcontext =~? '\\[$'
					let values = groff_char#GroffCompleteGlyph('\\[')
					if values == [] | unlet values | endif
				elseif shortcontext =~? '\\($'
					let values = groff_char#GroffCompleteGlyph('\\(')
					if values == [] | unlet values | endif
				endif
				if values == [] | unlet values | endif
			endif
		endfor

		" requests that can be used in all macros
		let s:macros = s:general_macros + requests#GetRequests()
		" add to the end of the completion
		if !exists('values')
			if shortcontext =~? '\.\s*$'
				let ft = CheckMacros()
				if exists('ft')
					if ft ==# 'mom_poststart'
						let s:macros = s:mom_poststart_macros + s:mom_poststart_toggle_macros + s:general_macros + requests#GetRequests()
					elseif ft ==# 'mom_prestart'
						let s:macros = s:mom_prestart_macros + s:general_macros + requests#GetRequests()
					elseif ft ==# 'ms'
						let s:macros = s:ms_macros + s:general_macros + requests#GetRequests()
					endif
					let values = s:macros
				endif
			elseif shortcontext =~# '\\$'
				let values = s:escapes
			elseif shortcontext =~# '\\f$'
				let values = s:font
			elseif shortcontext =~# '\\f\([\|(\)$'
				let values = s:font
			elseif shortcontext =~? '\\[$'
				let values = groff_char#GroffCompleteGlyph('\\[')
				if values == [] | unlet values | endif
			elseif shortcontext =~? '\\($'
				let values = groff_char#GroffCompleteGlyph('\\(')
				if values == [] | unlet values | endif
			elseif shortcontext =~# '^\.\s*nr\s\+$'
				let values = s:registers
			elseif shortcontext =~# '^\\n$'
				let values = s:registers
			elseif shortcontext =~# '^\\n\([\|(\)$'
				let values = s:registers
			elseif shortcontext =~# '^\.\s*ds\s\+$'
				let values = s:strings
			elseif shortcontext =~# '\\s$'
				let values = s:strings
			elseif shortcontext =~# '\\s\([\|(\)$'
				let values = s:strings
			endif
		endif

		if exists('values')
			for m in values
				if type(m) ==# v:t_dict
					if m['word'] =~? '^'.a:base
						call add(res, m)
					endif
				elseif m =~? '^'.a:base
					call add(res, m)
				endif
			endfor
			return res + res2
		endif
	endif
endfunction " }}}

" make optional
setlocal omnifunc=GroffOmnifunc

function! GroffMan() " {{{
	let [line, col] = [line('.'), col('.')]
	" get the syntax type at the cursor
	let syntype = reverse(map(synstack(line, col), 'synIDattr(v:val,"name")'))
	for synt in syntype
		if synt ==# 'nroffEquation'
			Man eqn
			return
		elseif synt ==# 'nroffTable'
			Man tbl
			return
		elseif synt ==# 'nroffPicture'
			Man pic
			return
		endif
	endfor

	" let macro = CheckMacros()
	Man 7 groff
endfunction " }}}

" plugins {{{ "1
" surround {{{2
" prevent indenting anything
let b:surround_indent = 1
let b:surround_102 = "\\f[\1font: \1]\r\\f[P]"
let b:surround_92 = "\\[\r]"
let b:surround_69 = ".EQ\r.EN"
let b:surround_80 = ".PS\r.PE"
let b:surround_84 = ".TS\r.TE"
" 2}}} "surround

" TODO: support for mom and other macros <09-10-20 Gavin Jaeger-Freeborn>
" matchit {{{ "2
" matchit now supports ms macros
let b:match_words = '^\.QS:^\.QE,' . '^\.RS:^\.RE,' . '^\.AB:^\.AE,' . '^\.KS:^\.KE,' . '^\.B1:^\.B2,'
			\. '^\.cstart:^\.cend,'. '^\.EQ:^\.EN,' . '^\.G1:^\.G2,' . '^\.GS:^\.GE,'
			\. '^\.sqltbl:^\.sqlend,'. '^\.``:^\.``,'
			\. '^\.IS:^\.IE,' . '^\.PS:^\.PE,' . '^\.R1:^\.R2,' . '^\.TS:^\.TE,. ^\.JS:^\.JE,'
" 2}}} "matchit
" 1}}} "plugins

" TODO: Add options for automatic compilation
" Automatically compile groff

" vim:foldmethod=marker:foldlevel=0
