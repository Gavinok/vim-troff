" File: troff.vim
" Maintainer: Gavin Jaeger-Freeborn <gavinfreeborn@gmail.com>
" Created: Fri 09 Oct 2020 04:53:30 PM
" License:
" Copyright (c) Gavin Jaeger-Freeborn.  Distributed under the same terms as Vim itself.
" See :help license
"
" Description: 
" syntax detection for troff files
autocmd! BufRead,BufNewFile *.ms,*.mom,*.me,*.mm,*.tr,*.troff,*.tmac setlocal filetype=troff
