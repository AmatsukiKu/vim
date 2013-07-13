" Vim color file

set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif
"colorscheme default
let g:colors_name = "mycolor"

" hardcoded colors :
" GUI Comment : #80a0ff = Light blue

" GUI
highlight Normal     guifg=white   guibg=Black
highlight Search     guifg=Black   guibg=#990033  gui=bold
highlight Visual     guifg=white   guibg=#666666
highlight Cursor     guifg=Black   guibg=white    gui=bold
highlight Special    guifg=Orange
highlight Comment    guifg=#80a0ff
highlight StatusLine guifg=Black   guibg=Gray     gui=NONE
highlight Statement  guifg=Yellow                 gui=NONE
highlight Type                                    gui=NONE
highlight LineNr     guifg=white   guibg=black
highlight Folded     guifg=white   guibg=#339900

" Console
highlight Normal     ctermfg=LightGrey  ctermbg=Black
highlight Search     ctermfg=Black  ctermbg=Red  cterm=NONE
highlight Visual                                 cterm=reverse
highlight Cursor     ctermfg=Black  ctermbg=Green  cterm=bold
highlight Special    ctermfg=Brown
highlight Comment    ctermfg=Blue
highlight StatusLine ctermfg=blue  ctermbg=white
highlight Statement  ctermfg=Yellow      cterm=NONE
highlight Type            cterm=NONE

" only for vim 5
if has("unix")
  if v:version<600
    highlight Normal  ctermfg=Grey  ctermbg=Black  cterm=NONE  guifg=Grey80      guibg=Black  gui=NONE
    highlight Search  ctermfg=Black  ctermbg=Red  cterm=bold  guifg=Black       guibg=Red  gui=bold
    highlight Visual  ctermfg=Black  ctermbg=yellow  cterm=bold  guifg=#404040      gui=bold
    highlight Special ctermfg=LightBlue      cterm=NONE  guifg=LightBlue      gui=NONE
    highlight Comment ctermfg=Cyan      cterm=NONE  guifg=LightBlue      gui=NONE
  endif
endif

