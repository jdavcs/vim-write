" write.vim :   Vim plugin for minimalist writing mode 
" Maintainer :  Sergey Golitsynskiy <sgolitsynskiy@gmail.com>
" License :     See LICENSE file
" Version :     0.1

echom "this is a test"

" prevent from loading twice
if exists("g:autoloaded_write")
  finish
endif
let g:autoloaded_write = 1


" toggle writing mode (for any file)
if !exists("g:writing_mode")
    let g:writing_mode=0
endif

function! write#toggleWritingMode()
    if g:writing_mode == 0
        let g:writing_mode = 1

        " save current option values 
        let s:formatoptions = &l:formatoptions
        let s:foldcolumn = &l:foldcolumn
        let s:formatprg = &l:formatprg
        let s:background = &l:background
        let s:number = &l:number
        let s:list = &l:list
        let s:autoindent = &l:autoindent
        let s:smartindent = &l:smartindent

        " set new values
        setlocal formatoptions=nt1
        setlocal foldcolumn=10
        setlocal formatprg=par
        setlocal background=light

        setlocal nonumber
        setlocal nolist
        setlocal noautoindent
        setlocal nosmartindent

        " these options don't need to be reset
        setlocal textwidth=80
        setlocal columns=100
    else
        let g:writing_mode = 0

        " restore previous option values
        let &l:formatoptions = s:formatoptions
        let &l:foldcolumn = s:foldcolumn
        let &l:formatprg = s:formatprg
        let &l:background = s:background
        let &l:number = s:number
        let &l:list = s:list
        let &l:autoindent = s:autoindent
        let &l:smartindent = s:smartindent
    endif
endfunction


