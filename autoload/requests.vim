" File: requests.vim
" Maintainer: Gavin Jaeger-Freeborn <gavinfreeborn@gmail.com>
" Created: Mon 12 Oct 2020 02:09:27 PM
" License:
" Copyright (c) Gavin Jaeger-Freeborn.  Distributed under the same terms as Vim itself.
" See :help license
"
" Description: 
" Display troff documentation and Completion for base troff requests
" NOTE: focused on groff at the moment (compatibility with other troffs coming soon)


" This gives options for completing base groff commands
function! requests#GetRequests()
" This gives options for completing base groff commands
" base_macros  "{{{
let base_macros = [
			\{ 'word': 'ab'
			\, 'abbr': 'ab [string]'                                                                                 , 'info': 'Print string on standard error , exit program.' }                                                                  ,
			\{ 'word': 'ad'
			\, 'abbr': 'ad'                                                                                        , 'info': 'Begin line adjustment for output lines in current adjust mode.' }                                                                                          ,
			\{ 'word': 'ad'
			\, 'abbr': 'ad [c]'                                                                                      , 'info': 'Start line adjustment in mode c (c=l,r,c,b,n).' }                                                                                                                ,
			\{ 'word': 'af'
			\, 'abbr': 'af [register] [c] '                                                                            , 'info': 'Assign format c to register (c=l,i,I,a,A).' }                                                                                                                ,
			\{ 'word': 'aln'
			\, 'abbr': 'aln [alias] [register] '                                                                       , 'info': 'Create alias name for register.' }                                                                                                                         ,
			\{ 'word': 'als'
			\, 'abbr': 'als [alias] [object] '                                                                         , 'info': 'Create alias name for request, string, macro, or diversion object.' } ,
			\{ 'word': 'am'
			\, 'abbr': 'am [macro]'                                                                                    , 'info': 'Append to macro until .. is encountered.' }                             ,
			\{ 'word': 'am'
			\, 'abbr': 'am [macro] [end] '                                                                             , 'info': 'Append to macro until .end is called.' }                                                                                                                   ,
			\{ 'word': 'am1'
			\, 'abbr': 'am1 [macro]'                                                                                , 'info': 'Same as .am but with compatibility mode switched off during macro expansion.' }                                                                            ,
			\{ 'word': 'am1'
			\, 'abbr': 'am1 [macro] [end] '                                                                            , 'info': 'Same as .am but with compatibility mode switched off during macro expansion.' }                                                                            ,
			\{ 'word': 'ami'
			\, 'abbr': 'ami [macro]'                                                                                , 'info': 'Append to a macro whose name is contained in the string register macro until .. is encountered.' }                                                         ,
			\{ 'word': 'ami'
			\, 'abbr': 'ami [macro] [end] '                                                                            , 'info': 'Append to a macro indirectly.  macro and end are string registers whose contents are interpolated for the macro name and the end macro, respectively.' }                                                                  ,
			\{ 'word': 'ami1'
			\, 'abbr': 'ami1 [macro]'                                                                               , 'info': 'Same as .ami but with compatibility mode switched off during macro expansion.' }                                                                           ,
			\{ 'word': 'ami1'
			\, 'abbr': 'ami1 [macro] [end] '                                                                           , 'info': 'Same as .ami but with compatibility mode switched off during macro expansion.' }                                                                           ,
			\{ 'word': 'as'
			\, 'abbr': 'as [stringvar] [anything] '                                                                    , 'info': 'Append anything to stringvar.' }                                                                                                                           ,
			\{ 'word': 'as1'
			\, 'abbr': 'as1 [stringvar] [anything] '                                                                   , 'info': 'Same as .as but with compatibility mode switched off during string expansion.' }                                                                           ,
			\{ 'word': 'asciify'
			\, 'abbr': 'asciify [diversion]'                                                                        , 'info': 'Unformat ASCII characters, spaces, and some escape sequences in diversion.' }                              ,
			\{ 'word': 'backtrace'
			\, 'abbr': 'backtrace '                                                                                , 'info': 'Print a backtrace of the input on stderr.' }                                                                                                               ,
			\{ 'word': 'bd'
			\, 'abbr': 'bd [font] [N] '                                                                                , 'info': 'Embolden font by N-1 units.' }                                                                                                                             ,
			\{ 'word': 'bd'
			\, 'abbr': 'bd [S] [font] [N] '                                                                              , 'info': 'Embolden Special Font S when current font is font.' }                                                                                                      ,
			\{ 'word': 'blm'
			\, 'abbr': 'blm'                                                                                       , 'info': 'Unset the blank line macro.' }                                                                                                                             ,
			\{ 'word': 'blm'
			\, 'abbr': 'blm [macro]'                                                                                , 'info': 'Set the blank line macro to macro.' }                                                                                                                      ,
			\{ 'word': 'box'
			\, 'abbr': 'box'                                                                                       , 'info': 'End current diversion.' }                                                                                                                                  ,
			\{ 'word': 'box'
			\, 'abbr': 'box [macro]'                                                                                , 'info': 'Divert to macro, omitting a partially filled line.' }                                              ,
			\{ 'word': 'boxa'
			\, 'abbr': 'boxa'                                                                                      , 'info': 'End current diversion.' }                                                                                                                                  ,
			\{ 'word': 'boxa'
			\, 'abbr': 'boxa [macro]'                                                                               , 'info': 'Divert and append to macro, omitting a partially filled line.' }                                              ,
			\{ 'word': 'bp'
			\, 'abbr': 'bp'                                                                                        , 'info': 'Eject current page and begin new page.' }                                                                                                                  ,
			\{ 'word': 'bp'
			\, 'abbr': 'bp [±N]'                                                                                     , 'info': 'Eject current page; next page number ±N.' }                                                                                                                ,
			\{ 'word': 'br'
			\, 'abbr': 'br'                                                                                        , 'info': 'Line break.' }                                                                                                                                             ,
			\{ 'word': 'brp'
			\, 'abbr': 'brp'                                                                                       , 'info': 'Break output line; adjust if applicable.' }                                                                                                                ,
			\{ 'word': 'break'
			\, 'abbr': 'break'                                                                                     , 'info': 'Break out of a while loop.' }                                                                                                                              ,
			\{ 'word': 'c2'
			\, 'abbr': 'c2'                                                                                        , 'info': 'Reset no-break control character to quotes ' }                                                                                                             ,
			\{ 'word': 'c2'
			\, 'abbr': 'c2 [c]'                                                                                      , 'info': 'Set no-break control character to c.' }                                                                                                                    ,
			\{ 'word': 'cc'
			\, 'abbr': 'cc'                                                                                        , 'info': 'Reset control character to ‘.’.' }                                                                                                                         ,
			\{ 'word': 'cc'
			\, 'abbr': 'cc [c]'                                                                                      , 'info': 'Set control character to c.' }                                                                                                                             ,
			\{ 'word': 'ce'
			\, 'abbr': 'ce'                                                                                        , 'info': 'Center the next input line.' }                                                                                                                             ,
			\{ 'word': 'ce'
			\, 'abbr': 'ce [N]'                                                                                      , 'info': 'Center following N input lines.' }                                                                                                                         ,
			\{ 'word': 'cf'
			\, 'abbr': 'cf [filename]'                                                                              , 'info': 'Copy contents of file filename unprocessed to stdout or to the diversion.' }                                                                               ,
			\{ 'word': 'cflags'
			\, 'abbr': 'cflags [mode] [c1] [c2] ...'                                                                     , 'info': 'Treat characters c1, c2 , ... according to mode number.' }                                        ,
			\{ 'word': 'ch'
			\, 'abbr': 'ch [trap] [N] '                                                                                , 'info': 'Change trap location to N.' }                                                                                                                              ,
			\{ 'word': 'char'
			\, 'abbr': 'char [c] [anything] '                                                                          , 'info': 'Define entity c as string anything.' }                                                                                                                     ,
			\{ 'word': 'chop'
			\, 'abbr': 'chop [object]'                                                                              , 'info': 'Chop the last character off macro, string, or diversion object.' }                                                 ,
			\{ 'word': 'class'
			\, 'abbr': 'class [name] [c1] [c2] ...'                                                                      , 'info': 'Assign a set of characters, character ranges, or classes c1, c2, ... to name.' }                                                                                                      ,
			\{ 'word': 'close'
			\, 'abbr': 'close [stream]'                                                                             , 'info': 'Close the stream.' }                                                                                                                                       ,
			\{ 'word': 'color'
			\, 'abbr': 'color'                                                                                     , 'info': 'Enable colors.' }                                                                                                                                          ,
			\{ 'word': 'color'
			\, 'abbr': 'color [N]'                                                                                   , 'info': 'If N is zero disable colors, otherwise enable them.' }                                                         ,
			\{ 'word': 'composite'
			\, 'abbr': 'composite [from] [to] '                                                                        , 'info': 'Map glyph name from to glyph name to while constructing a composite glyph name.' }                                                                         ,
			\{ 'word': 'continue'
			\, 'abbr': 'continue'                                                                                  , 'info': 'Finish the current iteration of a while loop.' },
			\{ 'word': 'cp'
			\, 'abbr': 'cp'                                                                                        , 'info': 'Enable compatibility mode.' }                                                                                                                              ,
			\{ 'word': 'cp'
			\, 'abbr': 'cp [N]'                                                                                      , 'info': 'If N is zero disable compatibility mode, otherwise enable it.' }                                                           ,
			\{ 'word': 'cs'
			\, 'abbr': 'cs [font] [N] [M] '                                                                              , 'info': 'Set constant character width mode for font to N/36 ems with em M.' }                                                                                       ,
			\{ 'word': 'cu'
			\, 'abbr': 'cu [N]'                                                                                      , 'info': 'Continuous underline in nroff, like .ul in troff.' }                                                             ,
			\{ 'word': 'da'
			\, 'abbr': 'da'                                                                                        , 'info': 'End current diversion.' },
			\{ 'word': 'da'
			\, 'abbr': 'da [macro]'                                                                                  , 'info': 'Divert and append to macro.' }                                                                                                                             ,
			\{ 'word': 'de'
			\, 'abbr': 'de [macro]'                                                                                  , 'info': 'Define or redefine macro until .. is encountered.' }                                                                                                       ,
			\{ 'word': 'de'
			\, 'abbr': 'de [macro] [end] '                                                                             , 'info': 'Define or redefine macro until .end is called.' }                                                                                                          ,
			\{ 'word': 'de1'
			\, 'abbr': 'de1 [macro]'                                                                                , 'info': 'Same as .de but with compatibility mode switched off during macro expansion.' }                                                                            ,
			\{ 'word': 'de1'
			\, 'abbr': 'de1 [macro] [end] '                                                                            , 'info': 'Same as .de but with compatibility mode switched off during macro expansion.' }                                                                            ,
			\{ 'word': 'defcolor'
			\, 'abbr': 'defcolor [color] [scheme] [component] '                                                          , 'info': 'Define or redefine a color with name color.  scheme can be rgb, cym, cymk, gray, or grey.  component can be single components specified as fractions in the range 0 to 1 (default scaling indicator f), as a string of two-digit hexadecimal color components with a leading #, or as a string of four-digit hexadecimal components with two leading #.  The color default cant be redefined.' },
			\{ 'word': 'dei'
			\, 'abbr': 'dei [macro]'                                                                                , 'info': 'Define or redefine a macro whose name is contained in the string register macro until .. is encountered.' }                                                ,
			\{ 'word': 'dei'
			\, 'abbr': 'dei [macro] [end] '                                                                            , 'info': 'Define or redefine a macro indirectly.  macro and end are string registers whose contents are interpolated for the macro name and the end macro, respectively.' }                                                                  ,
			\{ 'word': 'dei1'
			\, 'abbr': 'dei1 [macro]'                                                                               , 'info': 'Same as .dei but with compatibility mode switched off during macro expansion.' }                                                                           ,
			\{ 'word': 'dei1'
			\, 'abbr': 'dei1 [macro] [end] '                                                                           , 'info': 'Same as .dei but with compatibility mode switched off during macro expansion.' }                                                                           ,
			\{ 'word': 'device'
			\, 'abbr': 'device [anything]'                                                                          , 'info': 'Write anything to the intermediate output as a device control function.' }                                                                                 ,
			\{ 'word': 'devicem'
			\, 'abbr': 'devicem [name]'                                                                             , 'info': 'Write contents of macro or string name uninterpreted to the intermediate output as a device control function.' }                                           ,
			\{ 'word': 'di'
			\, 'abbr': 'di'                                                                                        , 'info': 'End current diversion.' }                                                                                                                                  ,
			\{ 'word': 'di'
			\, 'abbr': 'di [macro] [Divert] [to] [macro].'                                                                 , 'info': 'See groff_tmac(5) for more details.' }                                                                                                                     ,
			\{ 'word': 'do'
			\, 'abbr': 'do [name]'                                                                                   , 'info': 'Interpret .name with compatibility mode disabled.' }                                                                                                       ,
			\{ 'word': 'ds'
			\, 'abbr': 'ds [stringvar] [anything] '                                                                    , 'info': 'Set stringvar to anything.' }                                                                                                                              ,
			\{ 'word': 'ds1'
			\, 'abbr': 'ds1 [stringvar] [anything] '                                                                   , 'info': 'Same as .ds but with compatibility mode switched off during string expansion.' }                                                                           ,
			\{ 'word': 'dt'
			\, 'abbr': 'dt [N] [trap] '                                                                                , 'info': 'Set diversion trap to position N (default scaling indicator v).' }                                                                                         ,
			\{ 'word': 'ec'
			\, 'abbr': 'ec'                                                                                        , 'info': 'Reset escape character to ‘\’.' }                                                                                                                          ,
			\{ 'word': 'ec'
			\, 'abbr': 'ec [c]'                                                                                      , 'info': 'Set escape character to c.' }                                                                                                                              ,
			\{ 'word': 'ecr'
			\, 'abbr': 'ecr'                                                                                       , 'info': 'Restore escape character saved with .ecs.' }                                                                                                               ,
			\{ 'word': 'ecs'
			\, 'abbr': 'ecs'                                                                                       , 'info': 'Save current escape character.' }                                                                                                                          ,
			\{ 'word': 'el'
			\, 'abbr': 'el [anything]'                                                                              , 'info': 'Else part for if-else (.ie) request.' }                                                                                                                    ,
			\{ 'word': 'em'
			\, 'abbr': 'em [macro]'                                                                                  , 'info': 'The macro is run after the end of input.' }                                                                                                                ,
			\{ 'word': 'eo'
			\, 'abbr': 'eo'                                                                                        , 'info': 'Turn off escape character mechanism.' }                                                                                                                    ,
			\{ 'word': 'ev'
			\, 'abbr': 'ev'                                                                                        , 'info': 'Switch to previous environment and pop it off the stack.' }                                                                                                ,
			\{ 'word': 'ev'
			\, 'abbr': 'ev [env]'                                                                                    , 'info': 'Push down environment number or name env to the stack and switch to it.' }                                                                                 ,
			\{ 'word': 'evc'
			\, 'abbr': 'evc [env]'                                                                                   , 'info': 'Copy the contents of environment env to the current environment.  No pushing or popping.' }                                                                ,
			\{ 'word': 'ex'
			\, 'abbr': 'ex'                                                                                        , 'info': 'Exit from roff processing.' }                                                                                                                              ,
			\{ 'word': 'fam'
			\, 'abbr': 'fam'                                                                                       , 'info': 'Return to previous font family.' }                                                                                                                         ,
			\{ 'word': 'fam'
			\, 'abbr': 'fam [name]'                                                                                  , 'info': 'Set the current font family to name.' }                                                                                                                    ,
			\{ 'word': 'fc'
			\, 'abbr': 'fc'                                                                                        , 'info': 'Disable field mechanism.' }                                                                                                                                ,
			\{ 'word': 'fc'
			\, 'abbr': 'fc [a]'                                                                                      , 'info': 'Set field delimiter to a and pad glyph to space.' }                                                                                                        ,
			\{ 'word': 'fc'
			\, 'abbr': 'fc [a] [b]'                                                                                    , 'info': 'Set field delimiter to a and pad glyph to b.' }                                                                                                            ,
			\{ 'word': 'fchar'
			\, 'abbr': 'fchar [c] [anything] '                                                                         , 'info': 'Define fallback character (or glyph) c as string anything.' }                                                                                              ,
			\{ 'word': 'fcolor'
			\, 'abbr': 'fcolor'                                                                                    , 'info': 'Set fill color to previous fill color.' }                                                                                                                  ,
			\{ 'word': 'fcolor'
			\, 'abbr': 'fcolor [c]'                                                                                  , 'info': 'Set fill color to c.' }                                                                                                                                    ,
			\{ 'word': 'fi'
			\, 'abbr': 'fi'                                                                                        , 'info': 'Fill output lines.' }                                                                                                                                      ,
			\{ 'word': 'fl'
			\, 'abbr': 'fl'                                                                                        , 'info': 'Flush output buffer.' }                                                                                                                                    ,
			\{ 'word': 'fp'
			\, 'abbr': 'fp [n] [font] '                                                                                , 'info': 'Mount font on position n.' }                                                                                                                               ,
			\{ 'word': 'fp'
			\, 'abbr': 'fp [n] [internal] [external]'                                                                   , 'info': 'Mount font with long external name to short internal name on position n.' }                                                                                ,
			\{ 'word': 'fschar'
			\, 'abbr': 'fschar [f] [c] [anything]'                                                                      , 'info': 'Define fallback character (or glyph) c for font f as string anything.' }                                                                                   ,
			\{ 'word': 'fspecial'
			\, 'abbr': 'fspecial [font]'                                                                            , 'info': 'Reset list of special fonts for font to be empty.' }                                                                                                       ,
			\{ 'word': 'fspecial'
			\, 'abbr': 'fspecial [font] [s1] [s2] ...'                                                                   , 'info': 'When the current font is font, then the fonts s1, s2, ... are special.' }     ,
			\{ 'word': 'ft'
			\, 'abbr': 'ft'                                                                                        , 'info': 'Return to previous font.  Same as \ or \.' }                                                                                                               ,
			\{ 'word': 'ft'
			\, 'abbr': 'ft [font]'                                                                                   , 'info': 'Change to font name or number font; same as \f[font] escape sequence.' }                                                                                   ,
			\{ 'word': 'ftr'
			\, 'abbr': 'ftr [font1] [font2]'                                                                          , 'info': 'Translate font1 to font2.' }                                                                                                                               ,
			\{ 'word': 'fzoom'
			\, 'abbr': 'fzoom [font]'                                                                               , 'info': 'Dont magnify font.' }                                                                                                                                      ,
			\{ 'word': 'fzoom'
			\, 'abbr': 'fzoom [font] [zoom]'                                                                          , 'info': 'Set zoom factor for font (in multiples of 1/1000th).' }                                                                                                    ,
			\{ 'word': 'gcolor'
			\, 'abbr': 'gcolor'                                                                                    , 'info': 'Set glyph color to previous glyph color.' }                                                                                                                ,
			\{ 'word': 'gcolor'
			\, 'abbr': 'gcolor [c]'                                                                                  , 'info': 'Set glyph color to c.' }                                                                                                                                   ,
			\{ 'word': 'hc'
			\, 'abbr': 'hc'                                                                                        , 'info': 'Remove additional hyphenation indicator character.' }                                                                                                      ,
			\{ 'word': 'hc'
			\, 'abbr': 'hc [c]'                                                                                      , 'info': 'Set up additional hyphenation indicator character c.' }                                                                                                    ,
			\{ 'word': 'hcode'
			\, 'abbr': 'hcode [c1] [code1] [c2 code2] ...'                                                             , 'info': 'Set the hyphenation code of character c1 to code1, that of c2 to code2, etc.' }                                                                 ,
			\{ 'word': 'hla'
			\, 'abbr': 'hla', 'info': 'lang Set the current hyphenation language to lang.' }                                  ,
			\{ 'word': 'hlm'
			\, 'abbr': 'hlm [n]'                                                                                     , 'info': 'Set the maximum number of consecutive hyphenated lines to n.' }                                                                                            ,
			\{ 'word': 'hpf'
			\, 'abbr': 'hpf [file]', 'info': 'Read hyphenation patterns from file.' }                                           ,
			\{ 'word': 'hpfa'
			\, 'abbr': 'hpfa [file]'                                                                                , 'info': 'Append hyphenation patterns from file.' }                                                                                                                  ,
			\{ 'word': 'hpfcode'
			\, 'abbr': 'hpfcode [a] [b] [c] [d] ...'                                                                       , 'info': 'Set input mapping for .hpf.' }                                                                                                                    ,
			\{ 'word': 'hw'
			\, 'abbr': 'hw [words]'                                                                                  , 'info': 'List of words with exceptional hyphenation.' }                                                                                                             ,
			\{ 'word': 'hy'
			\, 'abbr': 'hy [N]'                                                                                      , 'info': 'Switch to hyphenation mode N.' }                                                                                                                           ,
			\{ 'word': 'hym'
			\, 'abbr': 'hym [n]'                                                                                     , 'info': 'Set the hyphenation margin to n (default scaling indicator m).' }                                                                                          ,
			\{ 'word': 'hys'
			\, 'abbr': 'hys [n]'                                                                                     , 'info': 'Set the hyphenation space to n.' }                                                                                                                         ,
			\{ 'word': 'ie'
			\, 'abbr': 'ie [cond] [anything]'                                                                         , 'info': 'If cond then anything else goto .el.' }                                                                                                                    ,
			\{ 'word': 'if'
			\, 'abbr': 'if [cond] [anything]'                                                                         , 'info': 'If cond then anything; otherwise do nothing.' }                                                                                                            ,
			\{ 'word': 'ig'
			\, 'abbr': 'ig'                                                                                        , 'info': 'Ignore text until .. is encountered.' }                                                                                                                    ,
			\{ 'word': 'ig'
			\, 'abbr': 'ig [end]'                                                                                    , 'info': 'Ignore text until .end is called.' }                                                                                                                       ,
			\{ 'word': 'in'
			\, 'abbr': 'in'                                                                                        , 'info': 'Change to previous indentation value.' }                                                                                                                   ,
			\{ 'word': 'in'
			\, 'abbr': 'in [±N]'                                                                                     , 'info': 'Change indentation according to ±N (default scaling indicator m).' }                                                                                       ,
			\{ 'word': 'it'
			\, 'abbr': 'it [N] [trap]'                                                                                , 'info': 'Set an input-line count trap for the next N lines.' }                                                                                                      ,
			\{ 'word': 'itc'
			\, 'abbr': 'itc [N] [trap]'                                                                               , 'info': 'Same as .it but dont count lines interrupted with \c.' }                                                                                                   ,
			\{ 'word': 'kern'
			\, 'abbr': 'kern'                                                                                      , 'info': 'Enable pairwise kerning.' }                                                                                                                                ,
			\{ 'word': 'kern'
			\, 'abbr': 'kern [n]'                                                                                    , 'info': 'If n is zero, disable pairwise kerning, otherwise enable it.' }                                                 ,
			\{ 'word': 'lc'
			\, 'abbr': 'lc'                                                                                        , 'info': 'Remove leader repetition glyph.' }                                                                                                                         ,
			\{ 'word': 'lc'
			\, 'abbr': 'lc [c]'                                                                                      , 'info': 'Set leader repetition glyph to c.' }                                                                                                                       ,
			\{ 'word': 'length'
			\, 'abbr': 'length [register] [anything]'                                                                 , 'info': 'Write the length of the string anything to register.' }                                                                                                    ,
			\{ 'word': 'linetabs'
			\, 'abbr': 'linetabs' ,'info': 'Enable line-tabs mode (i.e., calculate tab positions relative to output line).' }                                                                                                                ,
			\{ 'word': 'linetabs'
			\, 'abbr': 'linetabs [n]'                                                                               , 'info': 'If n is zero, disable line-tabs mode, otherwise enable it.' }                                                 ,
			\{ 'word': 'lf'
			\, 'abbr': 'lf [N]'                                                                                      , 'info': 'Set input line number to N.' }                                                                                                                             ,
			\{ 'word': 'lf'
			\, 'abbr': 'lf [N] [file]'                                                                                , 'info': 'Set input line number to N and filename to file.' }                                                                                                        ,
			\{ 'word': 'lg'
			\, 'abbr': 'lg [N]'                                                                                      , 'info': 'Ligature mode on if N>0.' }                                                                                                                                ,
			\{ 'word': 'll'
			\, 'abbr': 'll'                                                                                        , 'info': 'Change to previous line length.' }                                                                                                                         ,
			\{ 'word': 'll'
			\, 'abbr': 'll [±N]'                                                                                     , 'info': 'Set line length according to ±N (default length 6.5i, default scaling indicator m).' }                                                  ,
			\{ 'word': 'lsm'
			\, 'abbr': 'lsm'                                                                                       , 'info': 'Unset the leading spaces macro.' }                                                                                                                         ,
			\{ 'word': 'lsm'
			\, 'abbr': 'lsm [macro]'                                                                                , 'info': 'Set the leading spaces macro to macro.' }                                                                                                                  ,
			\{ 'word': 'ls'
			\, 'abbr': 'ls'                                                                                        , 'info': 'Change to the previous value of additional intra-line skip.' }                                                                                             ,
			\{ 'word': 'ls'
			\, 'abbr': 'ls [N]'                                                                                      , 'info': 'Set additional intra-line skip value to N, i.e., N-1 blank lines are inserted after each text output line.' }            ,
			\{ 'word': 'lt'
			\, 'abbr': 'lt [±N]'                                                                                     , 'info': 'Length of title (default scaling indicator m).' }                                                                                                          ,
			\{ 'word': 'mc'
			\, 'abbr': 'mc'                                                                                        , 'info': 'Margin glyph off.' }                                                                                                                                       ,
			\{ 'word': 'mc'
			\, 'abbr': 'mc [c]'                                                                                      , 'info': 'Print glyph c after each text line at actual distance from right margin.' }                                                                                ,
			\{ 'word': 'mc'
			\, 'abbr': 'mc [c] [N]'                                                                                    , 'info': 'Set margin glyph to c and distance to N from right margin (default scaling indicator m).' }                                                                ,
			\{ 'word': 'mk'
			\, 'abbr': 'mk [register] '                                                                            , 'info': 'Mark current vertical position in register, or in an internal register used by .rt if no argument.' }                         ,
			\{ 'word': 'mso'
			\, 'abbr': 'mso [file]'                                                                                  , 'info': 'The same as .so except that file is searched in the tmac directories.' }                                                                                   ,
			\{ 'word': 'na'
			\, 'abbr': 'na'                                                                                        , 'info': 'No output-line adjusting.' }                                                                                                                               ,
			\{ 'word': 'ne'
			\, 'abbr': 'ne'                                                                                        , 'info': 'Need a one-line vertical space.' }                                                                                                                         ,
			\{ 'word': 'ne'
			\, 'abbr': 'ne [N]'                                                                                      , 'info': 'Need N vertical space (default scaling indicator v).' }                                                                                                    ,
			\{ 'word': 'nf'
			\, 'abbr': 'nf'                                                                                        , 'info': 'No filling or adjusting of output lines.' }                                                                                                                ,
			\{ 'word': 'nh'
			\, 'abbr': 'nh'                                                                                        , 'info': 'No hyphenation.' }                                                                                                                                         ,
			\{ 'word': 'nm'
			\, 'abbr': 'nm'                                                                                        , 'info': 'Number mode off.' }                                                                                                                                        ,
			\{ 'word': 'nm'
			\, 'abbr': 'nm [±N] [M [S] [I] '                                                                        , 'info': 'In line number mode, set number, multiple, spacing, and indentation.' }                                                                                                  ,
			\{ 'word': 'nn'
			\, 'abbr': 'nn'                                                                                        , 'info': 'Do not number next line.' }                                                                                                                                ,
			\{ 'word': 'nn'
			\, 'abbr': 'nn [N]'                                                                                      , 'info': 'Do not number next N lines.' }                                                                                                                             ,
			\{ 'word': 'nop'
			\, 'abbr': 'nop [anything]'                                                                             , 'info': 'Always process anything.' }                                                                                                                                ,
			\{ 'word': 'nr'
			\, 'abbr': 'nr [register] [±N] [M] '                                                                       , 'info': 'Define or modify register using ±N with auto-increment M.' }                                                                                               ,
			\{ 'word': 'nroff'
			\, 'abbr': 'nroff'                                                                                     , 'info': 'Make the built-in conditions n true and t false.' }                                                                                                        ,
			\{ 'word': 'ns'
			\, 'abbr': 'ns'                                                                                        , 'info': 'Turn on no-space mode.' }                                                                                                                                  ,
			\{ 'word': 'nx'
			\, 'abbr': 'nx'                                                                                        , 'info': 'Immediately jump to end of current file.' }                                                                                                                ,
			\{ 'word': 'nx'
			\, 'abbr': 'nx [filename]'                                                                              , 'info': 'Immediately continue processing with file file.' }                                                                                                         ,
			\{ 'word': 'open'
			\, 'abbr': 'open [stream] [filename]'                                                                     , 'info': 'Open filename for writing and associate the stream named stream with it.' }                                                                                ,
			\{ 'word': 'opena'
			\, 'abbr': 'opena [stream] [filename]'                                                                    , 'info': 'Like .open but append to it.' }                                                                                                                            ,
			\{ 'word': 'os'
			\, 'abbr': 'os'                                                                                        , 'info': 'Output vertical distance that was saved by the sv request.' }                                                                                              ,
			\{ 'word': 'output'
			\, 'abbr': 'output [string]'                                                                            , 'info': 'Emit string directly to intermediate output, allowing leading whitespace if string starts with " (which is stripped off).' }   ,
			\{ 'word': 'pc'
			\, 'abbr': 'pc'                                                                                        , 'info': 'Reset page number character to ‘%’.' }                                                                                                                     ,
			\{ 'word': 'pc'
			\, 'abbr': 'pc [c]'                                                                                      , 'info': 'Page number character.' }                                                                                                                                  ,
			\{ 'word': 'pev'
			\, 'abbr': 'pev'                                                                                       , 'info': 'Print the current environment and each defined environment state to stderr.' }                                                                             ,
			\{ 'word': 'pi'
			\, 'abbr': 'pi [program]'                                                                               , 'info': 'Pipe output to program (nroff only).' }                                                                                                                    ,
			\{ 'word': 'pl'
			\, 'abbr': 'pl'                                                                                        , 'info': 'Set page length to default 11i.  The current page length is stored in register .p.' }                                                                      ,
			\{ 'word': 'pl'
			\, 'abbr': 'pl [±N]'                                                                                     , 'info': 'Change page length to ±N (default scaling indicator v).' }                                                                                                 ,
			\{ 'word': 'pm'
			\, 'abbr': 'pm'                                                                                        , 'info': 'Print macro names and sizes (number of blocks of 128 bytes).' }                                                                                            ,
			\{ 'word': 'pm'
			\, 'abbr': 'pm [t]'                                                                                      , 'info': 'Print only total of sizes of macros (number of 128 bytes blocks).' }                                                                                       ,
			\{ 'word': 'pn'
			\, 'abbr': 'pn [±N]'                                                                                     , 'info': 'Next page number N.' }                                                                                                                                     ,
			\{ 'word': 'pnr'
			\, 'abbr': 'pnr'                                                                                       , 'info': 'Print the names and contents of all currently defined number registers on stderr.' }                                                                       ,
			\{ 'word': 'po'
			\, 'abbr': 'po'                                                                                        , 'info': 'Change to previous page offset.  The current page offset is available in register .o.' }                                                                   ,
			\{ 'word': 'po'
			\, 'abbr': 'po [±N]'                                                                                     , 'info': 'Page offset N.' }                                                                                                                                          ,
			\{ 'word': 'ps'
			\, 'abbr': 'ps'                                                                                        , 'info': 'Return to previous point size.' }                                                                                                                          ,
			\{ 'word': 'ps'
			\, 'abbr': 'ps [±N]'                                                                                     , 'info': 'Point size; same as \s[±N].' }                                                                                                                             ,
			\{ 'word': 'psbb'
			\, 'abbr': 'psbb [filename]'                                                                            , 'info': 'Get the bounding box of a PostScript image filename.' }                                                                                                    ,
			\{ 'word': 'pso'
			\, 'abbr': 'pso [command]'                                                                              , 'info': 'This behaves like the so request except that input comes from the standard output of command.' }                                                           ,
			\{ 'word': 'ptr'
			\, 'abbr': 'ptr'                                                                                       , 'info': 'Print the names and positions of all traps (not including input line traps and diversion traps) on stderr.' }                                              ,
			\{ 'word': 'pvs'
			\, 'abbr': 'pvs'                                                                                       , 'info': 'Change to previous post-vertical line spacing.' }                                                                                                          ,
			\{ 'word': 'pvs'
			\, 'abbr': 'pvs [±N]'                                                                                    , 'info': 'Change post-vertical line spacing according to ±N (default scaling indicator p).' }                                                                        ,
			\{ 'word': 'rchar'
			\, 'abbr': 'rchar [c1] [c2] ...'                                                                           , 'info': 'Remove the definitions of entities c1, c2, ...' }                                                                  ,
			\{ 'word': 'rd'
			\, 'abbr': 'rd [prompt]'                                                                                , 'info': 'Read insertion.' }                                                                                                                                         ,
			\{ 'word': 'return'
			\, 'abbr': 'return'                                                                                    , 'info': 'Return from a macro.' }                                                                                                                                    ,
			\{ 'word': 'return'
			\, 'abbr': 'return [anything]'                                                                          , 'info': 'Return twice, namely from the macro at the current level and from the macro one level higher.' },
			\{ 'word': 'rfschar'
			\, 'abbr': 'rfschar [f] [c1] [c2] ...'                                                                       , 'info': 'Remove the definitions of entities c1, c2, ... for font f.' }                                                      ,
			\{ 'word': 'rj'
			\, 'abbr': 'rj [n]'                                                                                      , 'info': 'Right justify the next n input lines.' }                                                                                                                   ,
			\{ 'word': 'rm'
			\, 'abbr': 'rm [name]'                                                                                   , 'info': 'Remove request, macro, diversion, or string name.' }      ,
			\{ 'word': 'rn'
			\, 'abbr': 'rn [old] [new]'                                                                               , 'info': 'Rename request, macro, diversion, or string old to new.' },
			\{ 'word': 'rnn'
			\, 'abbr': 'rnn [reg1] [reg2]'                                                                            , 'info': 'Rename register reg1 to reg2.' }                                                                                                                           ,
			\{ 'word': 'rr'
			\, 'abbr': 'rr [register]'                                                                              , 'info': 'Remove register.' }                                                                                                                                        ,
			\{ 'word': 'rs'
			\, 'abbr': 'rs'                                                                                        , 'info': 'Restore spacing; turn no-space mode off.' }                                                                                                                ,
			\{ 'word': 'rt'
			\, 'abbr': 'rt'                                                                                        , 'info': 'Return (upward only) to vertical position marked by .mk on the current page.' }                                                                            ,
			\{ 'word': 'rt'
			\, 'abbr': 'rt [±N]'                                                                                     , 'info': 'Return (upward only) to specified distance from the top of the page (default scaling indicator v).' }                                                      ,
			\{ 'word': 'schar'
			\, 'abbr': 'schar [c] [anything]'                                                                         , 'info': 'Define global fallback character (or glyph) c as string anything.' }                                                                                       ,
			\{ 'word': 'shc'
			\, 'abbr': 'shc'                                                                                       , 'info': 'Reset soft hyphen glyph to \(hy.' }                                                                                                                        ,
			\{ 'word': 'shc'
			\, 'abbr': 'shc [c]'                                                                                     , 'info': 'Set the soft hyphen glyph to c.' }                                                                                                                         ,
			\{ 'word': 'shift'
			\, 'abbr': 'shift [n]'                                                                                   , 'info': 'In a macro, shift the arguments by n positions.' }                                            ,
			\{ 'word': 'sizes'
			\, 'abbr': 'sizes [s1] [s2] ... sn [0] '                                                                   , 'info': 'Set available font sizes similar to the sizes command in a DESC file.' }                                                                                   ,
			\{ 'word': 'so'
			\, 'abbr': 'so [filename]'                                                                              , 'info': 'Include source file.' }                                                                                                                                    ,
			\{ 'word': 'sp'
			\, 'abbr': 'sp'                                                                                        , 'info': 'Skip one line vertically.' }                                                                                                                               ,
			\{ 'word': 'sp'
			\, 'abbr': 'sp [N]'                                                                                      , 'info': 'Space vertical distance N up or down according to sign of N (default scaling indicator v).' }                                                              ,
			\{ 'word': 'special'
			\, 'abbr': 'special'                                                                                   , 'info': 'Reset global list of special fonts to be empty.' }                                                                                                         ,
			\{ 'word': 'special'
			\, 'abbr': 'special [s1] [s2] ...'                                                                         , 'info': 'Fonts s1, s2, etc. are special and are searched for glyphs not in the current font.' },
			\{ 'word': 'spreadwarn'
			\, 'abbr': 'spreadwarn'                                                                               , 'info': 'Toggle the spread warning on and off without changing its value.' }                                                                                        ,
			\{ 'word': 'spreadwarn'
			\, 'abbr': 'spreadwarn [limit]'                                                                         , 'info': 'Emit a warning if each space in an output line is widened by limit or more (default scaling indicator m).' }                                               ,
			\{ 'word': 'ss'
			\, 'abbr': 'ss [N]'                                                                                      , 'info': 'Set space glyph size to N/12 of the space width in the current font.' }                                                                                    ,
			\{ 'word': 'ss'
			\, 'abbr': 'ss [N] [M]'                                                                                    , 'info': 'Set space glyph size to N/12 and sentence space size set to M/12 of the space width in the current font.' }                                                ,
			\{ 'word': 'sty'
			\, 'abbr': 'sty [n] [style]'                                                                              , 'info': 'Associate style with font position n.' }                                                                                                                   ,
			\{ 'word': 'substring'
			\, 'abbr': 'substring [xx] [n1] [n2]'                                                                       , 'info': 'Replace the string named xx with the substring defined by the indices n1 and n2.' }                                                                        ,
			\{ 'word': 'sv'
			\, 'abbr': 'sv'                                                                                        , 'info': 'Save 1 v of vertical space.' }                                                                                                                             ,
			\{ 'word': 'sv'
			\, 'abbr': 'sv [N]'                                                                                      , 'info': 'Save the vertical distance N for later output with os request (default scaling indicator v).' }                                                            ,
			\{ 'word': 'sy'
			\, 'abbr': 'sy [command]-line'                                                                          , 'info': 'Execute program command-line.' }                                                                                                                           ,
			\{ 'word': 'ta'
			\, 'abbr': 'ta [T] [N]'                                                                                    , 'info': 'Set tabs after every position that is a multiple of N (default scaling indicator m).' }                                                                    ,
			\{ 'word': 'ta'
			\, 'abbr': 'ta [n1] [n2] ... nn T r1 r2 ... rn'                                                           , 'info': 'Set tabs at positions n1, n2, ..., nn, then set tabs at nn+m×rn+r1 through nn+m×rn+rn, where m increments from 0, 1, 2, ... to infinity.' },
			\{ 'word': 'tc'
			\, 'abbr': 'tc'                                                                                        , 'info': 'Remove tab repetition glyph.' }                                                                                                                            ,
			\{ 'word': 'tc'
			\, 'abbr': 'tc [c]'                                                                                      , 'info': 'Set tab repetition glyph to c.' }                                                                                                                          ,
			\{ 'word': 'ti'
			\, 'abbr': 'ti [±N]'                                                                                     , 'info': 'Temporary indent next line (default scaling indicator m).' }                                                                                               ,
			\{ 'word': 'tkf'
			\, 'abbr': 'tkf [font] [s1] [n1] [s2] [n2]'                                                                     , 'info': 'Enable track kerning for font.' }                                                                                                                          ,
			\{ 'word': 'tl'
			\, 'abbr': 'tl ’left’center’right'                                                                    , 'info': 'Three-part title.' }                                                                                                                                       ,
			\{ 'word': 'tm'
			\, 'abbr': 'tm [anything]'                                                                               , 'info': 'Print anything on stderr.' }                                                                                                                               ,
			\{ 'word': 'tm1'
			\, 'abbr': 'tm1 [anything]'                                                                             , 'info': 'Print anything on stderr, allowing leading whitespace if anything starts with " (which is stripped off).' } ,
			\{ 'word': 'tmc'
			\, 'abbr': 'tmc [anything]'                                                                             , 'info': 'Similar to .tm1 without emitting a final newline.' }                                                                                                       ,
			\{ 'word': 'tr'
			\, 'abbr': 'tr [abcd]...'                                                                                , 'info': 'Translate a to b, c to d, etc. on output.' }                                                      ,
			\{ 'word': 'trf'
			\, 'abbr': 'trf [filename]'                                                                             , 'info': 'Transparently output the contents of file filename.' }                                                                                                     ,
			\{ 'word': 'trin'
			\, 'abbr': 'trin [abcd]...'                                                                              , 'info': 'This is the same as the tr request except that the asciify request uses the character code (if any) before the character translation.' }          ,
			\{ 'word': 'trnt'
			\, 'abbr': 'trnt [abcd]...'                                                                              , 'info': 'This is the same as the tr request except that the translations do not apply to text that is transparently throughput into a diversion with \!.' },
			\{ 'word': 'troff'
			\, 'abbr': 'troff'                                                                                     , 'info': 'Make the built-in conditions t true and n false.' }                                                                                                        ,
			\{ 'word': 'uf'
			\, 'abbr': 'uf [font]'                                                                                   , 'info': 'Set underline font to font (to be switched to by .ul).' }                                                                                                  ,
			\{ 'word': 'ul'
			\, 'abbr': 'ul [N]'                                                                                      , 'info': 'Underline (italicize in troff) N input lines.' }                                                                                                           ,
			\{ 'word': 'unformat'
			\, 'abbr': 'unformat [diversion]'                                                                       , 'info': 'Unformat space characters and tabs in diversion, preserving font information.' }                                                   ,
			\{ 'word': 'vpt'
			\, 'abbr': 'vpt [n]'                                                                                     , 'info': 'Enable vertical position traps if n is non-zero, disable them otherwise.' }                                                        ,
			\{ 'word': 'vs'
			\, 'abbr': 'vs'                                                                                        , 'info': 'Change to previous vertical base line spacing.' }                                                                                                          ,
			\{ 'word': 'vs'
			\, 'abbr': 'vs [±N]'                                                                                     , 'info': 'Set vertical base line spacing to ±N (default scaling indicator p).' }                                                                                     ,
			\{ 'word': 'warn'
			\, 'abbr': 'warn [n]'                                                                                    , 'info': 'Set warnings code to n.' }                                                                                                                                 ,
			\{ 'word': 'warnscale'
			\, 'abbr': 'warnscale [si]'                                                                             , 'info': 'Set scaling indicator used in warnings to si.' }                                                                                                           ,
			\{ 'word': 'wh'
			\, 'abbr': 'wh [N]'                                                                                      , 'info': 'Remove (first) trap at position N.' }                                                                                                                      ,
			\{ 'word': 'wh'
			\, 'abbr': 'wh [N] [trap] '                                                                                , 'info': 'Set location trap; negative means from page bottom.' }                                                                                                     ,
			\{ 'word': 'while'
			\, 'abbr': 'while [cond] [anything] '                                                                      , 'info': 'While condition cond is true, accept anything as input.' }                                                      ,
			\{ 'word': 'write'
			\, 'abbr': 'write [stream] [anything] '                                                                    , 'info': 'Write anything to the stream named stream.' }                                                                                                              ,
			\{ 'word': 'writec'
			\, 'abbr': 'writec [stream] [anything] '                                                                   , 'info': 'Similar to .write without emitting a final newline.' }                                                                                                     ,
			\{ 'word': 'writem'
			\, 'abbr': 'writem [stream] [xx] '                                                                         , 'info': 'Write contents of macro or string xx to the stream named stream.' }                                                                                        ,
			\] " }}}
return base_macros
endfunction
