" Custom vim colorscheme file
" Author: Duncan Tilley

hi clear

let g:colors_name = "custom"

" note that all gui and term colors are left out as they are not usually used

" vim ui color highlighting
hi CursorLine	cterm=none		ctermbg=black
hi CursorLineNr	cterm=bold		ctermbg=darkgray
hi DiffAdd						ctermbg=darkblue		ctermfg=white
hi DiffChange					ctermbg=darkmagenta		ctermfg=white
hi DiffDelete					ctermbg=darkred			ctermfg=white
hi DiffText		cterm=bold		ctermbg=red				ctermfg=white
hi Directory											ctermfg=darkblue
hi ErrorMsg						ctermbg=darkred			ctermfg=white
hi FoldColumn					ctermbg=black			ctermfg=darkblue
hi Folded						ctermbg=black			ctermfg=darkblue
hi IncSearch	cterm=reverse
hi LineNr						ctermbg=black			ctermfg=gray
hi MatchParen					ctermbg=blue
hi ModeMsg		cterm=bold
hi MoreMsg												ctermfg=darkgreen
hi NonText												ctermfg=blue
hi PmenuSel						ctermbg=darkblue		ctermfg=white
hi Question												ctermfg=darkgreen
if &background == "light"
    hi Search											ctermfg=none
else
    hi Search					ctermbg=yellow			ctermfg=black
endif
hi SpecialKey											ctermfg=DarkBlue
hi StatusLine	cterm=bold		ctermbg=black			ctermfg=gray
hi StatusLineNC	cterm=bold		ctermbg=black			ctermfg=darkgray
hi Title												ctermfg=darkmagenta
hi Todo							ctermbg=none			ctermfg=blue
hi VertSplit	cterm=reverse
hi Visual		cterm=reverse	ctermbg=none
hi VisualNOS	cterm=underline,bold
hi WarningMsg											ctermfg=darkred
hi WildMenu						ctermbg=yellow			ctermfg=black

" syntax highlighting
hi Comment		cterm=none								ctermfg=gray
hi Constant		cterm=none								ctermfg=yellow
hi Identifier	cterm=none								ctermfg=darkcyan
hi PreProc		cterm=none								ctermfg=magenta
hi Special		cterm=none								ctermfg=lightred
hi Statement	cterm=bold								ctermfg=blue
hi Type			cterm=none								ctermfg=blue

" vim: sw=2
