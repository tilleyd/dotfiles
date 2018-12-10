" custom vim colorscheme
" author: tilleyd

hi clear

let g:colors_name = "custom"

" note that all gui and term colors are left out as they are not usually used

" vim ui color highlighting
hi ColorColumn					ctermbg=black
hi CursorLine	cterm=none      ctermbg=none
hi CursorLineNr                 ctermbg=black           ctermfg=white
hi DiffAdd						ctermbg=darkblue		ctermfg=white
hi DiffChange					ctermbg=darkmagenta		ctermfg=white
hi DiffDelete					ctermbg=darkred			ctermfg=white
hi DiffText		cterm=bold		ctermbg=red				ctermfg=white
hi Directory											ctermfg=darkblue
hi ErrorMsg						ctermbg=black           ctermfg=white
hi FoldColumn					ctermbg=black			ctermfg=darkblue
hi Folded						ctermbg=black			ctermfg=darkblue
hi IncSearch	cterm=reverse
hi LineNr                                               ctermfg=white
hi MatchParen					ctermbg=blue
hi ModeMsg		cterm=bold
hi MoreMsg												ctermfg=darkgreen
hi NonText												ctermfg=darkgray
hi Pmenu                        ctermbg=darkgray        ctermfg=white
hi PmenuSel						ctermbg=darkblue		ctermfg=white
hi Question												ctermfg=darkgreen
hi Search       cterm=reverse   ctermbg=yellow          ctermfg=black
hi SpecialKey											ctermfg=DarkBlue
hi StatusLine	cterm=bold		ctermbg=black			ctermfg=gray
hi StatusLineNC	cterm=bold		ctermbg=black			ctermfg=darkgray
hi Title												ctermfg=darkmagenta
hi Todo							ctermbg=none			ctermfg=blue
hi VertSplit	                ctermbg=black           ctermfg=black
hi Visual		cterm=reverse	ctermbg=none
hi VisualNOS	cterm=underline,bold
hi WarningMsg											ctermfg=darkred
hi WildMenu						ctermbg=yellow			ctermfg=black

" you complete me
hi YcmErrorSection     cterm=underline   ctermbg=none      ctermfg=red
hi YcmWarningSection   cterm=underline   ctermbg=none      ctermfg=yellow

" syntax highlighting
hi Comment	    cterm=none								ctermfg=gray
hi Constant	    cterm=none								ctermfg=yellow
hi Identifier   cterm=none								ctermfg=darkmagenta
hi PreProc	    cterm=none								ctermfg=red
hi Special		cterm=none								ctermfg=magenta
" these two can be blue for a nice blue theme
hi Statement    cterm=bold								ctermfg=blue
hi Type         cterm=none								ctermfg=blue

" vim: sw=2
