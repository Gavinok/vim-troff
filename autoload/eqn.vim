" File: eqn.vim
" Maintainer: Gavin Jaeger-Freeborn <gavinfreeborn@gmail.com>
" Created: Mon 12 Oct 2020 02:02:01 PM
" License:
" Copyright (c) Gavin Jaeger-Freeborn.  Distributed under the same terms as Vim itself.
" See :help license
"
" Description: 
" Completion of eqn sections of troff files


function! eqn#EqnComplete(shortcontext)
	return s:eqn_words + s:eqn_letters + s:eqn_marks
endfunction

" eqn {{{3
let s:eqn_marks = [
			\{'word': 'bar'},
			\{'word': 'under'},
			\{'word': 'under'},
			\{'word': 'dot'},
			\{'word': 'dotdot'},
			\{'word': 'hat'},
			\{'word': 'tilde'},
			\{'word': 'vec'},
			\{'word': 'dyad'},
			\]

let s:eqn_translations = [
			\{'word': '>='
			\,'menu': '≥'},
			\{'word': '<='
			\,'menu': '≤'},
			\{'word': '=='
			\,'menu': '≡'},
			\{'word': '!='
			\,'menu': '≠'},
			\{'word': '+-'
			\,'menu': '±'},
			\{'word': '->'
			\,'menu': '→'},
			\{'word': '<-'
			\,'menu': '←'},
			\{'word': '<<'
			\,'menu': '<<'},
			\{'word': '>>'
			\,'menu': '>>'},
			\{'word': 'nothing'
			\,'menu': ''},
			\{'word': 'sum'
			\,'menu': 'Σ'},
			\{'word': 'inf'
			\,'menu': '∞ '},
			\{'word': 'partial'
			\,'menu': '∂'},
			\{'word': 'approx'
			\,'menu': '≈'},
			\{'word': 'cdot'
			\,'menu': '⋅'},
			\{'word': 'times'
			\,'menu': '×'},
			\{'word': 'grad'
			\,'menu': '∇'},
			\{'word': 'del'
			\,'menu': '∇'},
			\{'word': 'prod'
			\,'menu': 'Π'},
			\{'word': 'int'
			\,'menu': '∫'},
			\{'word': 'half'
			\,'menu': '½'},
			\{'word': 'prime'
			\,'menu': '′'},
			\{'word': 'union'
			\,'menu': '∪'},
			\{'word': 'inter'
			\,'menu': '∩'},
			\]

let s:eqn_letters = [
			\{'word': 'alpha'
			\,'menu': 'α'},
			\{'word': 'beta'
			\,'menu': 'β'},
			\{'word': 'gamma'
			\,'menu': 'γ'},
			\{'word': 'delta'
			\,'menu': 'δ'},
			\{'word': 'epsilon'
			\,'menu': 'ε'},
			\{'word': 'zeta'
			\,'menu': 'ζ'},
			\{'word': 'eta'
			\,'menu': 'η'},
			\{'word': 'theta'
			\,'menu': 'θ'},
			\{'word': 'iota'
			\,'menu': 'ι'},
			\{'word': 'kappa'
			\,'menu': 'κ'},
			\{'word': 'lambda'
			\,'menu': 'λ'},
			\{'word': 'mu'
			\,'menu': 'µ'},
			\{'word': 'nu'
			\,'menu': 'ν'},
			\{'word': 'xi'
			\,'menu': 'ξ'},
			\{'word': 'omicron'
			\,'menu': 'ο'},
			\{'word': 'pi'
			\,'menu': 'π'},
			\{'word': 'rho'
			\,'menu': 'ρ'},
			\{'word': 'sigma'
			\,'menu': 'σ'},
			\{'word': 'tau'
			\,'menu': 'τ'},
			\{'word': 'upsilon'
			\,'menu': 'υ'},
			\{'word': 'phi'
			\,'menu': 'φ'},
			\{'word': 'chi'
			\,'menu': 'χ'},
			\{'word': 'psi'
			\,'menu': 'ψ'},
			\{'word': 'omega'
			\,'menu': 'ω'},
			\{'word': 'GAMMA'
			\,'menu': 'Γ'},
			\{'word': 'DELTA'
			\,'menu': '∆'},
			\{'word': 'THETA'
			\,'menu': 'Θ'},
			\{'word': 'LAMBDA'
			\,'menu': 'Λ'},
			\{'word': 'XI'
			\,'menu': 'Ξ'},
			\{'word': 'PI'
			\,'menu': 'Π'},
			\{'word': 'SIGMA'
			\,'menu': 'Σ'},
			\{'word': 'UPSILON'
			\,'menu': 'ϒ'},
			\{'word': 'PHI'
			\,'menu': 'Φ'},
			\{'word': 'PSI'
			\,'menu': 'Ψ'},
			\{'word': 'OMEGA'
			\,'menu': 'Ω'},
			\]

let s:eqn_words = [
			\{'word': 'above'
			\,'info': 'Separate the pieces of a pile or matrix column.'},
			\{'word': 'back'
			\,'abbr': 'back {n}'
			\,'info': 'Move backwards horizontally n 1/100’s of an em.'},
			\{'word': 'bold'
			\,'info': 'Change to bold font.'},
			\{'word': 'ccol'
			\,'info': 'Center a column of a matrix.'},
			\{'word': 'col???'
			\,'info': 'Used with a preceding l or r to left or right adjust the columns of the matrix.'},
			\{'word': 'cpile'
			\,'info': 'Make a centered pile (same as a pile).'},
			\{'word': 'define'
			\,'info': 'Create a name for a frequently used string.'},
			\{'word': 'delim'
			\,'info': 'Define two characters to mark the left and right ends of an eqn equation to be printed in line.'},
			\{'word': 'down'
			\,'abbr': 'down {n}'
			\,'info': 'Move down n 1/100’s of an em.'},
			\{'word': 'fat'
			\,'info': 'Widen the current font by overstriking it.'},
			\{'word': 'font'
			\,'abbr': 'font {x}'
			\,'info': 'Change to font x, where x is the one-character name or the number of a font.'},
			\{'word': 'from'
			\,'info': 'Used in summations, integrals and other similar constructions to signify the lower limit.'},
			\{'word': 'fwd'
			\,'abbr': 'fwd {n}'
			\,'info': 'Move forward n 1/100’s of an em.'},
			\{'word': 'gfont'
			\,'abbr': 'gfont {x}'
			\,'info': 'Set a global font x for all equations.'},
			\{'word': 'gsize'
			\,'abbr': 'gsize {n}'
			\,'info': 'Set a global size for all equations.'},
			\{'word': 'italic'
			\,'info': 'Change to italic font.'},
			\{'word': 'lcol'
			\,'info': 'Left justify a column of a matrix.'},
			\{'word': 'left'
			\,'info': 'Create large brackets, braces, bars, etc.'},
			\{'word': 'lineup'
			\,'info': 'Line up marks in equations on different lines.'},
			\{'word': 'lpile'
			\,'info': 'Left justify the elements of a pile.'},
			\{'word': 'mark'
			\,'info': 'Remember the horizontal position in an equation. Used with lineup.'},
			\{'word': 'matrix'
			\,'info': 'Create a matrix.'},
			\{'word': 'ndefine'
			\,'info': 'Create a definition which only takes effect when neqn is running.'},
			\{'word': 'over'
			\,'info': 'Make a fraction.'},
			\{'word': 'pile'
			\,'info': 'Make a vertical pile with elements centered above one another.'},
			\{'word': 'rcol'
			\,'info': 'Right adjust a column of a matrix.'},
			\{'word': 'right'
			\,'info': 'Create large brackets, braces, bars, etc.'},
			\{'word': 'roman'
			\,'info': 'Change to roman font.'},
			\{'word': 'rpile'
			\,'info': 'Right justify the elements of a pile.'},
			\{'word': 'size'
			\,'abbr': 'size {n}'
			\,'info': 'Change the size of the font to n.'},
			\{'word': 'sqrt'
			\,'info': 'Draw a square root sign.'},
			\{'word': 'sub'
			\,'info': 'Start a subscript.'},
			\{'word': 'sup'
			\,'info': 'Start a superscript.'},
			\{'word': 'tdefine'
			\,'info': 'Make a definition that will apply only for eqn.'},
			\{'word': 'to'
			\,'info': 'Used in summations, integrals, and other similar constructions to signify the upper limit.'},
			\{'word': 'up {n} '
			\,'info': 'Move up n 1/100’s of an em.'},
			\]
" }}}3 "eqn
