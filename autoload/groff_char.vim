" File: char.vim
" Maintainer: Gavin Jaeger-Freeborn <gavinfreeborn@gmail.com>
" Created: Mon 12 Oct 2020 02:15:52 PM
" License:
" Copyright (c) Gavin Jaeger-Freeborn.  Distributed under the same terms as Vim itself.
" See :help license
"
" Description: Completion for groff chars
" NOTE: currently only focused on groff 

" This allows for competion of gifs such as \[la] and \[Fn]
function! groff_char#GroffCompleteGlyph(escape_sequence) " {{{
	let postescape = ''
	if a:escape_sequence ==# '\\['
		let postescape = ']'
	endif
	let namedglyph = [
				\{'word': 'AN'.postescape,       'menu'             :'∧',             'info':'logical and'},
				\{'word': 'OR'.postescape,       'menu'             :'∨',             'info':'logical or'},
				\{'word': 'no'.postescape,       'menu'             :'¬',             'info':'logical not + ***'},
				\{'word': 'tno'.postescape,      'menu'             :'¬',             'info':'text variant of ‘no’'},
				\{'word': 'te'.postescape,       'menu'             :'∃',             'info':'there exists'},
				\{'word': 'fa'.postescape,       'menu'             :'∀',             'info':'for all'},
				\{'word': 'st'.postescape,       'menu'             :'∋',             'info':'sucht that'},
				\{'word': '3d'.postescape,       'menu'             :'∴',             'info':'therefore'},
				\{'word': 'tf'.postescape,       'menu'             :'∴',             'info':'therefore'},
				\{'word': 'or'.postescape,       'menu'             :'|',             'info':'bitwise OR operator (as used in C) +'},
				\{'word': '12'.postescape,       'menu'             :'½',             'info':'1/2 symbol +'},
				\{'word': '14'.postescape,       'menu'             :'¼',             'info':'1/4 symbol +'},
				\{'word': '34'.postescape,       'menu'             :'¾',             'info':'3/4 symbol +'},
				\{'word': '18'.postescape,       'menu'             :'⅛',             'info':'1/8 symbol'},
				\{'word': '38'.postescape,       'menu'             :'⅜',             'info':'3/8 symbol'},
				\{'word': '58'.postescape,       'menu'             :'⅝',             'info':'5/8 symbol'},
				\{'word': '78'.postescape,       'menu'             :'⅞',             'info':'7/8 symbol'},
				\{'word': 'S1'.postescape,       'menu'             :'¹',             'info':'superscript 1'},
				\{'word': 'S2'.postescape,       'menu'             :'²',             'info':'superscript 2'},
				\{'word': 'S3'.postescape,       'menu'             :'³',             'info':'superscript 3'},
				\{'word': 'pl'.postescape,       'menu'             :'+',             'info':'plus in special font +'},
				\{'word': 'mi'.postescape,       'menu'             :'−',             'info':'minus in special font +'},
				\{'word': '-+'.postescape,       'menu'             :'∓',             'info':'minus-plus'},
				\{'word': '+-'.postescape,       'menu'             :'±',             'info':'plus-minus + ***'},
				\{'word': 't+-'.postescape,       'menu'            :'±',             'info':'text variant of \[+-]'},
				\{'word': 'pc'.postescape,       'menu'             :'·',             'info':'period centered'},
				\{'word': 'md'.postescape,       'menu'             :'⋅',             'info':'multiplication dot'},
				\{'word': 'mu'.postescape,       'menu'             :'×',             'info':'multiply sign + ***'},
				\{'word': 'tmu'.postescape,       'menu'            :'×',             'info':'text variant of \[mu]'},
				\{'word': 'c*'.postescape,       'menu'             :'⊗',             'info':'multiply sign in circle'},
				\{'word': 'c+'.postescape,       'menu'             :'⊕',             'info':'plus sign in circle'},
				\{'word': 'di'.postescape,       'menu'             :'÷',             'info':'division sign + ***'},
				\{'word': 'tdi'.postescape,       'menu'            :'÷',             'info':'text variant of \[di]'},
				\{'word': 'f/'.postescape,       'menu'             :'⁄',             'info':'bar for fractions'},
				\{'word': '**'.postescape,       'menu'             :'∗',             'info':'mathematical asterisk +'},
				\{'word': '<='.postescape,       'menu'             :'≤',             'info':'less or equal +'},
				\{'word': '>='.postescape,       'menu'             :'≥',             'info':'greater or equal +'},
				\{'word': '<<'.postescape,       'menu'             :'≪',             'info':'much less'},
				\{'word': '>>'.postescape,       'menu'             :'≫',             'info':'much greater'},
				\{'word': 'eq'.postescape,       'menu'             :'=',             'info':'equals in special font +'},
				\{'word': '!='.postescape,       'menu'             :'≠',             'info':'not equal +'},
				\{'word': '=='.postescape,       'menu'             :'≡',             'info':'equivalent +'},
				\{'word': 'ne'.postescape,       'menu'             :'≢',             'info':'not equivalent'},
				\{'word': '=~'.postescape,       'menu'             :'≅',             'info':'congruent, approx. equal'},
				\{'word': '|='.postescape,       'menu'             :'≃',             'info':'asymptot. equal to +'},
				\{'word': 'ap'.postescape,       'menu'             :'∼',             'info':'similar +'},
				\{'word': '~~'.postescape,       'menu'             :'≈',             'info':'almost equal to'},
				\{'word': '~='.postescape,       'menu'             :'≈',             'info':'almost equal to'},
				\{'word': 'pt'.postescape,       'menu'             :'∝',             'info':'proportional +'},
				\{'word': 'es'.postescape,       'menu'             :'∅',             'info':'empty set +'},
				\{'word': 'mo'.postescape,       'menu'             :'∈',             'info':'element of a set +'},
				\{'word': 'nm'.postescape,       'menu'             :'∉',             'info':'not element of set'},
				\{'word': 'sb'.postescape,       'menu'             :'⊂',             'info':'proper subset +'},
				\{'word': 'nb'.postescape,       'menu'             :'⊄',             'info':'not supset'},
				\{'word': 'sp'.postescape,       'menu'             :'⊃',             'info':'proper superset +'},
				\{'word': 'nc'.postescape,       'menu'             :'⊅',             'info':'not superset'},
				\{'word': 'ib'.postescape,       'menu'             :'⊆',             'info':'subset or equal +'},
				\{'word': 'ip'.postescape,       'menu'             :'⊇',             'info':'superset or equal +'},
				\{'word': 'ca'.postescape,       'menu'             :'∩',             'info':'intersection, cap +'},
				\{'word': 'cu'.postescape,       'menu'             :'∪',             'info':'union, cup +'},
				\{'word': '/_'.postescape,       'menu'             :'∠',             'info':'angle'},
				\{'word': 'pp'.postescape,       'menu'             :'⊥',             'info':'perpendicular'},
				\{'word': 'is'.postescape,       'menu'             :'∫',             'info':'integral +'},
				\{'word': 'integral'.postescape, 'menu'             :'∫',             'info':'integral ***'},
				\{'word': 'sum'.postescape,      'menu'             :'∑',             'info':'summation ***'},
				\{'word': 'product'.postescape,  'menu'             :'∏',             'info':'product ***'},
				\{'word': 'coproduct'.postescape,'menu'             :'∐',             'info':'coproduct ***'},
				\{'word': 'gr'.postescape,       'menu'             :'∇',             'info':'gradient +'},
				\{'word': 'sr'.postescape,       'menu'             :'√',             'info':'square root +'},
				\{'word': 'sqrt'.postescape,     'menu'             :'√',             'info':'square root'},
				\{'word': 'lc'.postescape,       'menu'             :'⌈',             'info':'left ceiling +'},
				\{'word': 'rc'.postescape,       'menu'             :'⌉',             'info':'right ceiling +'},
				\{'word': 'lf'.postescape,       'menu'             :'⌊',             'info':'left floor +'},
				\{'word': 'rf'.postescape,       'menu'             :'⌋',             'info':'right floor +'},
				\{'word': 'if'.postescape,       'menu'             :'∞',             'info':'infinity +'},
				\{'word': 'Ah'.postescape,       'menu'             :'ℵ',             'info':'aleph'},
				\{'word': 'Im'.postescape,       'menu'             :'ℑ',             'info':'Gothic I, imaginary'},
				\{'word': 'Re'.postescape,       'menu'             :'ℜ',             'info':'Gothic R, real'},
				\{'word': 'wp'.postescape,       'menu'             :'℘',             'info':'Weierstrass p'},
				\{'word': 'pd'.postescape,       'menu'             :'∂',             'info':'partial differentiation +'},
				\{'word': '-h'.postescape,       'menu'             :'ℏ',             'info':'Planck constant / 2pi (h-bar)'},
				\{'word': 'hbar'.postescape,     'menu'             :'ℏ',             'info':'Planck constant / 2pi (h-bar)'},
				\]
	return namedglyph
endfunction
" }}} "GroffcompleteCandidates
