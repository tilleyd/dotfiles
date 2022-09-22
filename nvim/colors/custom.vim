" custom vim colorscheme
" author: tilleyd

hi clear

let g:colors_name = "custom"

"------ NORMAL --------
" BLACK      | #282A2E
" RED        | #A54242
" GREEN      | #8C9440
" YELLOW     | #DE935F
" BLUE       | #5F819D
" MAGENTA    | #85678F
" CYAN       | #5E8D87
" WHITE      | #969896
"------ BRIGHT --------
" BLACK      | #373B41
" RED        | #CC6666
" GREEN      | #B5BD68
" YELLOW     | #F0C674
" BLUE       | #81A2BE
" MAGENTA    | #B294BB
" CYAN       | #8ABEB7
" WHITE      | #C5C8C6
"------- MISC ---------
" BACKGROUND | #141414
" FOREGROUND | #94A3A5
"----------------------

" vim ui color highlighting
hi Normal                                                                                 guibg=#141414   guifg=#94A3A5
hi ColorColumn                                ctermbg=black                               guibg=#282A2E
hi CursorLine          cterm=none             ctermbg=none                                guibg=none
hi CursorLineNr        cterm=none             ctermbg=black         ctermfg=white         guibg=#282A2E   guifg=#C5C8C6
hi DiffAdd                                    ctermbg=darkblue      ctermfg=white         guibg=#5F819D   guifg=#C5C8C6
hi DiffChange                                 ctermbg=darkmagenta   ctermfg=white         guibg=#85678F   guifg=#C5C8C6
hi DiffDelete                                 ctermbg=darkred       ctermfg=white         guibg=#A54242   guifg=#C5C8C6
hi DiffText            cterm=bold             ctermbg=red           ctermfg=white         guibg=#CC6666   guifg=#C5C8C6
hi Directory                                                        ctermfg=darkblue                      guifg=#5F819D
hi ErrorMsg                                   ctermbg=black         ctermfg=white         guibg=#282A2E   guifg=#C5C8C6
hi FoldColumn                                 ctermbg=black         ctermfg=darkblue      guibg=#282A2E   guifg=#5F819D
hi Folded                                     ctermbg=black         ctermfg=darkblue      guibg=#282A2E   guifg=#5F819D
hi IncSearch           cterm=reverse
hi LineNr                                                           ctermfg=white                         guifg=#C5C8C6
hi MatchParen                                 ctermbg=blue          ctermfg=white         guibg=#81A2BE   guifg=#C5C8C6
hi ModeMsg             cterm=bold
hi MoreMsg                                                          ctermfg=darkgreen                     guifg=#8C9440
hi NonText                                                          ctermfg=darkgray                      guifg=#373B41
hi Pmenu                                      ctermbg=black         ctermfg=white         guibg=#282A2E   guifg=#C5C8C6
hi PmenuSel                                   ctermbg=darkblue      ctermfg=white         guibg=#5F819D   guifg=#C5C8C6
hi Question                                                         ctermfg=darkgreen                     guifg=#8C9440
hi Search              cterm=reverse          ctermbg=yellow        ctermfg=black         guibg=#F0C674   guifg=#282A2E
hi SpecialKey                                                       ctermfg=DarkBlue                      guifg=#5F819D
hi StatusLine          cterm=bold             ctermbg=black         ctermfg=gray          guibg=#282A2E   guifg=#94A3A5
hi StatusLineNC        cterm=bold             ctermbg=black         ctermfg=darkgray      guibg=#282A2E   guifg=#373B41
hi Title                                                            ctermfg=darkmagenta                   guifg=#85678F
hi Todo                                       ctermbg=none          ctermfg=blue          guibg=none      guifg=#81A2BE
hi Visual              cterm=reverse          ctermbg=none                                guibg=none
hi VisualNOS           cterm=underline,bold
hi WarningMsg                                                       ctermfg=darkred                       guifg=#A54242
hi WildMenu                                   ctermbg=yellow        ctermfg=black         guibg=#F0C674   guifg=#282A2E

" syntax highlighting
hi Comment             cterm=none                                   ctermfg=gray                          guifg=#373B41
hi Constant            cterm=none                                   ctermfg=yellow                        guifg=#F0C674
hi Identifier          cterm=none                                   ctermfg=darkmagenta   guibg=red       guifg=#85678F
hi PreProc             cterm=none                                   ctermfg=red                           guifg=#CC6666
hi Special             cterm=none                                   ctermfg=magenta                       guifg=#B294BB
hi Statement           cterm=bold                                   ctermfg=blue                          guifg=#81A2BE
hi Type                cterm=none                                   ctermfg=blue                          guifg=#81A2BE

" git gutter
hi SignColumn                                 ctermbg=none                                guibg=none
hi GitGutterAdd        cterm=none                                   ctermfg=green                         guifg=#B5BD68
hi GitGutterChange     cterm=none                                   ctermfg=yellow                        guifg=#F0C674
hi GitGutterDelete     cterm=none                                   ctermfg=red                           guifg=#CC6666

hi clear VertSplit

" vim: sw=2
