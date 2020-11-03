" File: troff.vim
" Maintainer: Gavin Jaeger-Freeborn <gavinfreeborn@gmail.com>
" Created: Wed 22 Apr 2020 06:41:12 PM
" License:
" Copyright (c) Gavin Jaeger-Freeborn.  Distributed under the same terms as Vim itself.
" See :help license
"
" Description: 
" extended syntax support for troff

" TODO: add better compatibility for older versions of troff <09-10-20 Gavin Jaeger-Freeborn>
runtime! syntax/groff.vim

" Make this optional
if !exists('g:troff_greek')
	let g:troff_greek =1
endif
if !exists('g:troff_math')
	let g:troff_math =1
endif
if !exists('g:troff_supsub')
	let g:troff_supsub =1
endif

" TODO: support for using eqn delimiter <09-10-20 Gavin Jaeger-Freeborn>
" concealing for eqn equations
fun! s:TroffConceal(group,pat,cchar)  " {{{
	exe 'syn match '.a:group." '".a:pat."' contained conceal cchar=".a:cchar
endfun

if exists('g:troff_greek')
	call s:TroffConceal('roffGreek'  ,'\<alpha\>'		      ,'α')
	call s:TroffConceal('roffGreek'  ,'\<beta\>'		      ,'β')
	call s:TroffConceal('roffGreek'  ,'\<gamma\>'		      ,'γ')
	call s:TroffConceal('roffGreek'  ,'\<delta\>'		      ,'δ')
	call s:TroffConceal('roffGreek'  ,'\<epsilon\>'		      ,'ϵ')
	call s:TroffConceal('roffGreek'  ,'\<varepsilon\>'	      ,'ε')
	call s:TroffConceal('roffGreek'  ,'\<zeta\>'		      ,'ζ')
	call s:TroffConceal('roffGreek'  ,'\<eta\>'		          ,'η')
	call s:TroffConceal('roffGreek'  ,'\<theta\>'		      ,'θ')
	call s:TroffConceal('roffGreek'  ,'\<vartheta\>'	      ,'ϑ')
	call s:TroffConceal('roffGreek'  ,'\<iota\>'              ,'ι')
	call s:TroffConceal('roffGreek'  ,'\<kappa\>'		      ,'κ')
	call s:TroffConceal('roffGreek'  ,'\<lambda\>'		      ,'λ')
	call s:TroffConceal('roffGreek'  ,'\<mu\>'		          ,'μ')
	call s:TroffConceal('roffGreek'  ,'\<nu\>'		          ,'ν')
	call s:TroffConceal('roffGreek'  ,'\<xi\>'		          ,'ξ')
	call s:TroffConceal('roffGreek'  ,'\<pi\>'		          ,'π')
	call s:TroffConceal('roffGreek'  ,'\<varpi\>'		      ,'ϖ')
	call s:TroffConceal('roffGreek'  ,'\<rho\>'		          ,'ρ')
	call s:TroffConceal('roffGreek'  ,'\<varrho\>'		      ,'ϱ')
	call s:TroffConceal('roffGreek'  ,'\<sigma\>'		      ,'σ')
	call s:TroffConceal('roffGreek'  ,'\<varsigma\>'	      ,'ς')
	call s:TroffConceal('roffGreek'  ,'\<tau\>'		          ,'τ')
	call s:TroffConceal('roffGreek'  ,'\<upsilon\>'		      ,'υ')
	call s:TroffConceal('roffGreek'  ,'\<phi\>'		          ,'ϕ')
	call s:TroffConceal('roffGreek'  ,'\<varphi\>'		      ,'φ')
	call s:TroffConceal('roffGreek'  ,'\<chi\>'		          ,'χ')
	call s:TroffConceal('roffGreek'  ,'\<psi\>'		          ,'ψ')
	call s:TroffConceal('roffGreek'  ,'\<omega\>'		      ,'ω')
	call s:TroffConceal('roffGreek'  ,'\<GAMMA\>'		      ,'Γ')
	call s:TroffConceal('roffGreek'  ,'\<DELTA\>'		      ,'Δ')
	call s:TroffConceal('roffGreek'  ,'\<THETA\>'		      ,'Θ')
	call s:TroffConceal('roffGreek'  ,'\<LAMBDA\>'		      ,'Λ')
	call s:TroffConceal('roffGreek'  ,'\<XI\>'                ,'Ξ')
	call s:TroffConceal('roffGreek'  ,'\<PI\>'		          ,'Π')
	call s:TroffConceal('roffGreek'  ,'\<SIGMA\>'		      ,'Σ')
	call s:TroffConceal('roffGreek'  ,'\<UPSILON\>'		      ,'Υ')
	call s:TroffConceal('roffGreek'  ,'\<PHI\>'		          ,'Φ')
	call s:TroffConceal('roffGreek'  ,'\<CHI\>'		          ,'Χ')
	call s:TroffConceal('roffGreek'  ,'\<PSI\>'		          ,'Ψ')
	call s:TroffConceal('roffGreek'  ,'\<OMEGA\>'		      ,'Ω')
endif 

if exists('g:troff_math')
	call s:TroffConceal('roffMath'   , '>= '		          , '≥ ')
	call s:TroffConceal('roffMath'   , '<= '		          , '≤ ')
	call s:TroffConceal('roffMath'   , '== '		          , '≡ ')
	call s:TroffConceal('roffMath'   , '!= '		          , '≠ ')
	call s:TroffConceal('roffMath'   , '\<int\>'		      , '∫')
	call s:TroffConceal('roffMath'   , '\<inf\>'		      , '∞')
	call s:TroffConceal('roffMath'   , '<-'	   	              , '←')
	call s:TroffConceal('roffMath'   , '->'	   	              , '→')
	call s:TroffConceal('roffMath'   , '\<partial\>'	      , '∂')
	call s:TroffConceal('roffMath'   , '\<prime \>'		      , '′')
	call s:TroffConceal('roffMath'   , '\<times\>'		      , '×')
	call s:TroffConceal('roffMath'   , '\<prod\>'		      , '∏')
	call s:TroffConceal('roffMath'   , '\<del\>'              , '∇')
	call s:TroffConceal('roffMath'   , '\<grad\>'             , '∇')
	call s:TroffConceal('roffMath'   , '\<inter\>'		      , '∩')
	call s:TroffConceal('roffMath'   , '\<union\>'		      , '∪')
	call s:TroffConceal('roffMath'   , '\<sum\>'		      , '∑')
	call s:TroffConceal('roffMath'   , '\<sqrt\>' 		      , '√')
	call s:TroffConceal('roffMath'   , '\<over\>' 		      , '/')
endif

if exists('g:troff_supsub')
	fun! s:SuperSub(group,leader,pat,cchar)
		"     call Decho("SuperSub: group<".a:group."> leader<".a:leader."> pat<".a:pat."> cchar<".a:cchar.">")
		exe 'syn match '.a:group." '".a:leader.a:pat."' contained conceal cchar=".a:cchar
		exe 'syn match '.a:group."s '".a:pat        ."' contained conceal cchar=".a:cchar.' nextgroup='.a:group.'s'
	endfun

	call s:SuperSub('roffSuperscript',' sup ','\<0\>','⁰')
	call s:SuperSub('roffSuperscript',' sup ','\<1\>','¹')
	call s:SuperSub('roffSuperscript',' sup ','\<2\>','²')
	call s:SuperSub('roffSuperscript',' sup ','\<3\>','³')
	call s:SuperSub('roffSuperscript',' sup ','\<4\>','⁴')
	call s:SuperSub('roffSuperscript',' sup ','\<5\>','⁵')
	call s:SuperSub('roffSuperscript',' sup ','\<6\>','⁶')
	call s:SuperSub('roffSuperscript',' sup ','\<7\>','⁷')
	call s:SuperSub('roffSuperscript',' sup ','\<8\>','⁸')
	call s:SuperSub('roffSuperscript',' sup ','\<9\>','⁹')
	call s:SuperSub('roffSuperscript',' sup ','\<a\>','ᵃ')
	call s:SuperSub('roffSuperscript',' sup ','\<b\>','ᵇ')
	call s:SuperSub('roffSuperscript',' sup ','\<c\>','ᶜ')
	call s:SuperSub('roffSuperscript',' sup ','\<d\>','ᵈ')
	call s:SuperSub('roffSuperscript',' sup ','\<e\>','ᵉ')
	call s:SuperSub('roffSuperscript',' sup ','\<f\>','ᶠ')
	call s:SuperSub('roffSuperscript',' sup ','\<g\>','ᵍ')
	call s:SuperSub('roffSuperscript',' sup ','\<h\>','ʰ')
	call s:SuperSub('roffSuperscript',' sup ','\<i\>','ⁱ')
	call s:SuperSub('roffSuperscript',' sup ','\<j\>','ʲ')
	call s:SuperSub('roffSuperscript',' sup ','\<k\>','ᵏ')
	call s:SuperSub('roffSuperscript',' sup ','\<l\>','ˡ')
	call s:SuperSub('roffSuperscript',' sup ','\<m\>','ᵐ')
	call s:SuperSub('roffSuperscript',' sup ','\<n\>','ⁿ')
	call s:SuperSub('roffSuperscript',' sup ','\<o\>','ᵒ')
	call s:SuperSub('roffSuperscript',' sup ','\<p\>','ᵖ')
	call s:SuperSub('roffSuperscript',' sup ','\<r\>','ʳ')
	call s:SuperSub('roffSuperscript',' sup ','\<s\>','ˢ')
	call s:SuperSub('roffSuperscript',' sup ','\<t\>','ᵗ')
	call s:SuperSub('roffSuperscript',' sup ','\<u\>','ᵘ')
	call s:SuperSub('roffSuperscript',' sup ','\<v\>','ᵛ')
	call s:SuperSub('roffSuperscript',' sup ','\<w\>','ʷ')
	call s:SuperSub('roffSuperscript',' sup ','\<x\>','ˣ')
	call s:SuperSub('roffSuperscript',' sup ','\<y\>','ʸ')
	call s:SuperSub('roffSuperscript',' sup ','\<z\>','ᶻ')
	call s:SuperSub('roffSuperscript',' sup ','\<A\>','ᴬ')
	call s:SuperSub('roffSuperscript',' sup ','\<B\>','ᴮ')
	call s:SuperSub('roffSuperscript',' sup ','\<D\>','ᴰ')
	call s:SuperSub('roffSuperscript',' sup ','\<E\>','ᴱ')
	call s:SuperSub('roffSuperscript',' sup ','\<G\>','ᴳ')
	call s:SuperSub('roffSuperscript',' sup ','\<H\>','ᴴ')
	call s:SuperSub('roffSuperscript',' sup ','\<I\>','ᴵ')
	call s:SuperSub('roffSuperscript',' sup ','\<J\>','ᴶ')
	call s:SuperSub('roffSuperscript',' sup ','\<K\>','ᴷ')
	call s:SuperSub('roffSuperscript',' sup ','\<L\>','ᴸ')
	call s:SuperSub('roffSuperscript',' sup ','\<M\>','ᴹ')
	call s:SuperSub('roffSuperscript',' sup ','\<N\>','ᴺ')
	call s:SuperSub('roffSuperscript',' sup ','\<O\>','ᴼ')
	call s:SuperSub('roffSuperscript',' sup ','\<P\>','ᴾ')
	call s:SuperSub('roffSuperscript',' sup ','\<R\>','ᴿ')
	call s:SuperSub('roffSuperscript',' sup ','\<T\>','ᵀ')
	call s:SuperSub('roffSuperscript',' sup ','\<U\>','ᵁ')
	call s:SuperSub('roffSuperscript',' sup ','\<W\>','ᵂ')
	call s:SuperSub('roffSuperscript',' sup ','\<,\>','︐')
	call s:SuperSub('roffSuperscript',' sup ','\<:\>','︓')
	call s:SuperSub('roffSuperscript',' sup ','\<;\>','︔')
	call s:SuperSub('roffSuperscript',' sup ','\<+\>','⁺')
	call s:SuperSub('roffSuperscript',' sup ','\<-\>','⁻')
	call s:SuperSub('roffSuperscript',' sup ','\<<\>','˂')
	call s:SuperSub('roffSuperscript',' sup ','\<>\>','˃')
	call s:SuperSub('roffSuperscript',' sup ','\</\>','ˊ')
	call s:SuperSub('roffSuperscript',' sup ','\<(\>','⁽')
	call s:SuperSub('roffSuperscript',' sup ','\<)\>','⁾')
	call s:SuperSub('roffSuperscript',' sup ','\<\\>.','˙')
	call s:SuperSub('roffSuperscript',' sup ','\<=\>','˭')
	call s:SuperSub('roffSuperscript',' sup ','\<4\>','⁴')
	call s:SuperSub('roffSuperscript',' sup ','\<5\>','⁵')
	call s:SuperSub('roffSuperscript',' sup ','\<6\>','⁶')
	call s:SuperSub('roffSuperscript',' sup ','\<7\>','⁷')
	call s:SuperSub('roffSuperscript',' sup ','\<8\>','⁸')
	call s:SuperSub('roffSuperscript',' sup ','\<9\>','⁹')
	call s:SuperSub('roffSuperscript',' sup ','\<a\>','ᵃ')
	call s:SuperSub('roffSuperscript',' sup ','\<b\>','ᵇ')
	call s:SuperSub('roffSuperscript',' sup ','\<c\>','ᶜ')
	call s:SuperSub('roffSuperscript',' sup ','\<d\>','ᵈ')
	call s:SuperSub('roffSuperscript',' sup ','\<e\>','ᵉ')
	call s:SuperSub('roffSuperscript',' sup ','\<f\>','ᶠ')
	call s:SuperSub('roffSuperscript',' sup ','\<g\>','ᵍ')
	call s:SuperSub('roffSuperscript',' sup ','\<h\>','ʰ')
	call s:SuperSub('roffSuperscript',' sup ','\<i\>','ⁱ')
	call s:SuperSub('roffSuperscript',' sup ','\<j\>','ʲ')
	call s:SuperSub('roffSuperscript',' sup ','\<k\>','ᵏ')
	call s:SuperSub('roffSuperscript',' sup ','\<l\>','ˡ')
	call s:SuperSub('roffSuperscript',' sup ','\<m\>','ᵐ')
	call s:SuperSub('roffSuperscript',' sup ','\<n\>','ⁿ')
	call s:SuperSub('roffSuperscript',' sup ','\<o\>','ᵒ')
	call s:SuperSub('roffSuperscript',' sup ','\<p\>','ᵖ')
	call s:SuperSub('roffSuperscript',' sup ','\<r\>','ʳ')
	call s:SuperSub('roffSuperscript',' sup ','\<s\>','ˢ')
	call s:SuperSub('roffSuperscript',' sup ','\<t\>','ᵗ')
	call s:SuperSub('roffSuperscript',' sup ','\<u\>','ᵘ')
	call s:SuperSub('roffSuperscript',' sup ','\<v\>','ᵛ')
	call s:SuperSub('roffSuperscript',' sup ','\<w\>','ʷ')
	call s:SuperSub('roffSuperscript',' sup ','\<x\>','ˣ')
	call s:SuperSub('roffSuperscript',' sup ','\<y\>','ʸ')
	call s:SuperSub('roffSuperscript',' sup ','\<z\>','ᶻ')
	call s:SuperSub('roffSuperscript',' sup ','\<A\>','ᴬ')
	call s:SuperSub('roffSuperscript',' sup ','\<B\>','ᴮ')
	call s:SuperSub('roffSuperscript',' sup ','\<D\>','ᴰ')
	call s:SuperSub('roffSuperscript',' sup ','\<E\>','ᴱ')
	call s:SuperSub('roffSuperscript',' sup ','\<G\>','ᴳ')
	call s:SuperSub('roffSuperscript',' sup ','\<H\>','ᴴ')
	call s:SuperSub('roffSuperscript',' sup ','\<I\>','ᴵ')
	call s:SuperSub('roffSuperscript',' sup ','\<J\>','ᴶ')
	call s:SuperSub('roffSuperscript',' sup ','\<K\>','ᴷ')
	call s:SuperSub('roffSuperscript',' sup ','\<L\>','ᴸ')
	call s:SuperSub('roffSuperscript',' sup ','\<M\>','ᴹ')
	call s:SuperSub('roffSuperscript',' sup ','\<N\>','ᴺ')
	call s:SuperSub('roffSuperscript',' sup ','\<O\>','ᴼ')
	call s:SuperSub('roffSuperscript',' sup ','\<P\>','ᴾ')
	call s:SuperSub('roffSuperscript',' sup ','\<R\>','ᴿ')
	call s:SuperSub('roffSuperscript',' sup ','\<T\>','ᵀ')
	call s:SuperSub('roffSuperscript',' sup ','\<U\>','ᵁ')
	call s:SuperSub('roffSuperscript',' sup ','\<W\>','ᵂ')
	call s:SuperSub('roffSuperscript',' sup ','\<+\>','⁺')
	call s:SuperSub('roffSuperscript',' sup ','\<-\>','⁻')

	call s:SuperSub('roffSubscript',' sub ','\<0\>','₀')
	call s:SuperSub('roffSubscript',' sub ','\<1\>','₁')
	call s:SuperSub('roffSubscript',' sub ','\<2\>','₂')
	call s:SuperSub('roffSubscript',' sub ','\<3\>','₃')
	call s:SuperSub('roffSubscript',' sub ','\<4\>','₄')
	call s:SuperSub('roffSubscript',' sub ','\<5\>','₅')
	call s:SuperSub('roffSubscript',' sub ','\<6\>','₆')
	call s:SuperSub('roffSubscript',' sub ','\<7\>','₇')
	call s:SuperSub('roffSubscript',' sub ','\<8\>','₈')
	call s:SuperSub('roffSubscript',' sub ','\<9\>','₉')
	call s:SuperSub('roffSubscript',' sub ','\<a\>','ₐ')
	call s:SuperSub('roffSubscript',' sub ','\<e\>','ₑ')
	call s:SuperSub('roffSubscript',' sub ','\<h\>','ₕ')
	call s:SuperSub('roffSubscript',' sub ','\<i\>','ᵢ')
	call s:SuperSub('roffSubscript',' sub ','\<j\>','ⱼ')
	call s:SuperSub('roffSubscript',' sub ','\<k\>','ₖ')
	call s:SuperSub('roffSubscript',' sub ','\<l\>','ₗ')
	call s:SuperSub('roffSubscript',' sub ','\<m\>','ₘ')
	call s:SuperSub('roffSubscript',' sub ','\<n\>','ₙ')
	call s:SuperSub('roffSubscript',' sub ','\<o\>','ₒ')
	call s:SuperSub('roffSubscript',' sub ','\<p\>','ₚ')
	call s:SuperSub('roffSubscript',' sub ','\<r\>','ᵣ')
	call s:SuperSub('roffSubscript',' sub ','\<s\>','ₛ')
	call s:SuperSub('roffSubscript',' sub ','\<t\>','ₜ')
	call s:SuperSub('roffSubscript',' sub ','\<u\>','ᵤ')
	call s:SuperSub('roffSubscript',' sub ','\<v\>','ᵥ')
	call s:SuperSub('roffSubscript',' sub ','\<x\>','ₓ')
	call s:SuperSub('roffSubscript',' sub ','\<,\>','︐')
	call s:SuperSub('roffSubscript',' sub ','\<+\>','₊')
	call s:SuperSub('roffSubscript',' sub ','\<-\>','₋')
	call s:SuperSub('roffSubscript',' sub ','\</\>','ˏ')
	call s:SuperSub('roffSubscript',' sub ','\<(\>','₍')
	call s:SuperSub('roffSubscript',' sub ','\<)\>','₎')
	call s:SuperSub('roffSubscript',' sub ','\<\\>.','‸')
	call s:SuperSub('roffSubscript',' sub ','\<r\>','ᵣ')
	call s:SuperSub('roffSubscript',' sub ','\<v\>','ᵥ')
	call s:SuperSub('roffSubscript',' sub ','\<x\>','ₓ')
	call s:SuperSub('roffSubscript',' sub ','\\beta\>' ,'ᵦ')
	call s:SuperSub('roffSubscript',' sub ','\\delta\>','ᵨ')
	call s:SuperSub('roffSubscript',' sub ','\\phi\>'  ,'ᵩ')
	call s:SuperSub('roffSubscript',' sub ','\\gamma\>','ᵧ')
	call s:SuperSub('roffSubscript',' sub ','\\chi\>'  ,'ᵪ')
	delfun s:SuperSub
endif
hi def link roffMath Special
" }}} "troff conceal

" TODO: add support for underlining <10-10-20 Gavin Jaeger-Freeborn>
" turn bolded text bold and italic text italic {{{
syn region nroffBold matchgroup=Delimiter start="\\fB\|\\f\[B\]" end="\\fP\|\\f\[P\?\]\|\\f\[R\]\|\\fR" contains=@Spell keepend  concealends
syn region nroffItalic matchgroup=Delimiter start="\\fI\|\\f\[I\]" end="\\fP\|\\f\[P\?\]\|\\f\[R\]\|\\fR" contains=@Spell keepend  concealends

hi def nroffBold   term=bold                 cterm=bold        gui=bold
hi def nroffItalic term=italic               cterm=italic      gui=italic
" }}} "

" Avoids highlighting spelling in macro names
" NoSpell {{{"
syntax spell toplevel
if !exists("g:troff_nospell_macros") || g:troff_nospell_macros
	syn region nroffEscArg start=/'/ end=/'/ contained contains=nroffEscape,@nroffSpecial,@NoSpell
	syn cluster nroffSpecial contains=nroffSpecialChar,nroffSpace,@NoSpell
	syn match nroffReqLeader /^[.']/ contains=@NoSpell	nextgroup=nroffReqName skipwhite

	syn region nroffIgnore start=/^[.']\s*ig/ end=/^['.]\s*\./
	syn match nroffReqLeader /[.']/	contains=@NoSpell contained nextgroup=nroffReqName skipwhite
	syn match nroffReqName /[^\t \\\[?]\+/ contains=@NoSpell contained nextgroup=nroffReqArg
	syn region nroffReqArg start=/\S/ skip=/\\$/ end=/$/ contained contains=nroffEscape,@nroffSpecial,nroffString,nroffError,nroffSpaceError,nroffNumBlock,nroffComment,@NoSpell
	syn match nroffReqName /\(if\|ie\)/ contains=@NoSpell contained nextgroup=nroffCond skipwhite
	syn match nroffReqName /el/ contains=@NoSpell contained nextgroup=nroffReqLeader skipwhite
	syn match nroffReqname /[da]s/  contains=@NoSpell contained nextgroup=nroffDefIdent skipwhite
	syn region nroffDefinition matchgroup=nroffSpecialChar start=/"/ matchgroup=NONE end=/\\"/me=e-2 skip=/\\$/ start=/\S/ end=/$/ contained contains=nroffDefSpecial,@NoSpell
	syn match nroffReqName /\(d[ei]\|am\)/ contains=@NoSpell contained nextgroup=nroffIdent skipwhite
	syn match nroffReqName /als/ contains=@NoSpell contained nextgroup=nroffIdent skipwhite
	syn match nroffReqName /[rn]r/ contains=@NoSpell contained nextgroup=nroffIdent skipwhite
	syn match nroffReqName /\(rnn\|aln\)/ contains=@NoSpell contained nextgroup=nroffIdent skipwhite
endif
" }}} "NoSpell

" Allow for folding of preprocessor sections
" preprocessor folding {{{"
syn region nroffEquation start=/^\.\s*EQ\>/ end=/^\.\s*EN\>/ contains=roffGreek,roffMath,roffSuperscript,roffSubscript fold

if exists('g:troff_eqndelim')
	exec 'syn region nroffEquationDel matchgroup=Delimiter start="' . troff_eqndelim[0] .'"  matchgroup=Delimiter	end="' . troff_eqndelim[1] . '"  contains=roffGreek,roffMath,roffSuperscript,roffSubscript concealends '
endif
syn region nroffTable start=/^\.\s*TS\>/ end=/^\.\s*TE\>/ fold
syn region nroffPicture start=/^\.\s*PS\>/ end=/^\.\s*PE\>/ fold
syn region nroffRefer start=/^\.\s*\[\>/ end=/^\.\s*\]\>/ fold
syn region nroffGrap start=/^\.\s*G1\>/ end=/^\.\s*G2\>/ fold
syn region nroffGremlin start=/^\.\s*GS\>/ end=/^\.\s*GE|GF\>/ fold
" }}} "preprocessor folding
" vim:foldmethod=marker:foldlevel=0
