"----------------------------------------
"�V�X�e���ݒ�
"----------------------------------------

if has('multi_byte_ime') || has('xim')
    set iminsert=0 imsearch=0
    if has('xim') && has('GUI_GTK')
        "XIM�̓��͊J�n�L�[
        "set imactivatekey=C-space
    endif
endif

"IME�̏�Ԃ��J���[�\��
if has('multi_byte_ime')
    highlight Cursor guifg=NONE guibg=Green
    highlight CursorIM guifg=NONE guibg=Purple
endif

"----------------------------------------
" �\���ݒ�
"----------------------------------------
"�c�[���o�[���\��
set guioptions-=T
"���j���[�o�[�폜
set guioptions-=m
"���j���[�o�[������
"source $VIMRUNTIME/delmenu.vim
"set langmenu=ja_jp.utf-8
"source $VIMRUNTIME/menu.vim

"�J���[�ݒ�:
colorscheme mycolor

if executable("vimtweak.dll")
    autocmd guienter * call libcallnr("vimtweak","SetAlpha",200)
endif

"�t�H���g�ݒ�
"�t�H���g�͉p�ꖼ�Ŏw�肷��Ɩ�肪�N���ɂ����Ȃ�܂�
if has('xfontset')
    "  set guifontset=a14,r14,k14
elseif has('unix')

elseif has('mac')
    set guifont=Osaka-Mono:h14
elseif has('win32') || has('win64')
    scriptencoding cp932
    "  set guifont=MS_Gothic:h12:cSHIFTJIS
    "  set guifontwide=MS_Gothic:h12:cSHIFTJIS
endif



if has('gui_running') && has ('mac')
    set fuoptions=maxvert,maxhorz
    "au GUIEnter * set fullscreen
endif
"����p�t�H���g
if has('printer')
    if has('win32') || has('win64')
        "    set printfont=MS_Mincho:h12:cSHIFTJIS
        "    set printfont=MS_Gothic:h12:cSHIFTJIS
    endif
endif

""""""""""""""""""""""""""""""
"Window�ʒu�̕ۑ��ƕ��A
""""""""""""""""""""""""""""""
if has('unix')
    let s:infofile = '~/.vim/.vimpos'
else
    let s:infofile = '~/_vimpos'
endif

function! s:SaveWindowParam(filename)
    redir => pos
    exec 'winpos'
    redir END
    let pos = matchstr(pos, 'X[-0-9 ]\+,\s*Y[-0-9 ]\+$')
    let file = expand(a:filename)
    let str = []
    let cmd = 'winpos '.substitute(pos, '[^-0-9 ]', '', 'g')
    cal add(str, cmd)
    let l = &lines
    let c = &columns
    cal add(str, 'set lines='. l.' columns='. c)
    silent! let ostr = readfile(file)
    if str != ostr
        call writefile(str, file)
    endif
endfunction

augroup SaveWindowParam
    autocmd!
    execute 'autocmd SaveWindowParam VimLeave * call s:SaveWindowParam("'.s:infofile.'")'
augroup END

if filereadable(expand(s:infofile))
    execute 'source '.s:infofile
endif
unlet s:infofile

"----------------------------------------
"���j���[�A�C�e���쐬
"----------------------------------------
silent! aunmenu &File.Save
silent! aunmenu &File.�ۑ�(&S)
silent! aunmenu &File.�����\��(&D)\.\.\.

let message_revert="�ēǍ����܂���?"
amenu <silent> 10.330 &File.�ēǍ�(&U)<Tab>:e!  :if confirm(message_revert, "&Yes\n&No")==1<Bar> e! <Bar> endif<CR>
amenu <silent> 10.331 &File.�o�b�t�@�폜(&K)<Tab>:bd  :confirm bd<CR>
amenu <silent> 10.340 &File.�ۑ�(&W)<Tab>:w  :if expand('%') == ''<Bar>browse confirm w<Bar>else<Bar>confirm w<Bar>endif<CR>
amenu <silent> 10.341 &File.�X�V���ۑ�(&S)<Tab>:update  :if expand('%') == ''<Bar>browse confirm w<Bar>else<Bar>confirm update<Bar>endif<CR>
amenu <silent> 10.400 &File.���o�b�t�@�����\��(&D)<Tab>:DiffOrig  :DiffOrig<CR>
amenu <silent> 10.401 &File.���o�b�t�@�ƍ����\��(&D)<Tab>:Diff\ #  :Diff #<CR>
amenu <silent> 10.402 &File.�����\��(&D)<Tab>:Diff  :browse vertical diffsplit<CR>

if has('win32') && has('kaoriya')
    gui
    set transparency=180
endif