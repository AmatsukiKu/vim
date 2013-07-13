set nocompatible "Vi互換オフ→ Vim機能オン

"scriptencoding cp932
"silent! source $VIMRUNTIME/encode.vim
"scriptencoding cp932

set fileformat=unix "改行をUnix形式に

"vundle setting
filetype off
filetype plugin indent off
if has('vim_starting')
    set rtp+=~/Dropbox/vim/.vim/bundle/neobundle.vim
    call neobundle#rc(expand('~/Dropbox/vim/.vim/bundle/'))
endif

NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'vimwiki'
NeoBundle 'The-NERD-Commenter'
NeoBundle 'tpope/vim-rails'
NeoBundle 'tpope/vim-surround'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/vimproc'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'Shougo/vimshell'
NeoBundle 'ujihisa/vimshell-ssh'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'thinca/vim-qfreplace'
NeoBundle 'ZenCoding.vim'
NeoBundle 'soh335/vim-ref-jquery'
NeoBundle 'nono/jquery.vim'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'motemen/git-vim'
NeoBundle 'tyru/eskk.vim'
NeoBundle 'koron/chalice'
NeoBundle 'vim-scripts/Processing'
NeoBundle 'tsukkee/unite-help'
NeoBundle 'basyura/unite-rails'
NeoBundle 'vim-scripts/EasyMotion'
NeoBundle 'msanders/cocoa.vim'
NeoBundle 'pasela/unite-webcolorname'
NeoBundle 'vim-scripts/sudo.vim'
NeoBundle 'mattn/learn-vimscript'
NeoBundle 'mattn/excitetranslate-vim'
NeoBundle 'mattn/googletranslate-vim'
NeoBundle 'kana/vim-smartinput'
NeoBundle 'thinca/vim-ref'

filetype plugin indent on

source $VIMRUNTIME/macros/matchit.vim

set helplang=ja,en
set nobackup
set noswapfile

"エラー時の音とビジュアルベルの抑制。
set noerrorbells
set novisualbell
set visualbell t_vb=

syntax on
set relativenumber
set autoindent
set hlsearch
set display=lastline
set showcmd
"set ruler
set expandtab
set tabstop=4
set shiftwidth=4

"コマンドラインの高さ
set cmdheight=1

set whichwrap=b,s,<,>,[,]
set backspace=indent,eol,start
set clipboard+=unnamed
set statusline=%F%m%r%h%w\ format:%{&ff}\ type:%Y\ ASCII:\%03.3b\ HEX:\%02.2B\ pos:%l,%v,%p%%\ lines:%L
set laststatus=2
set matchpairs+=<:>
set wildmenu
set wildmode=longest
set ambiwidth=double
set incsearch
set list
set lcs=trail:_

if has('gui_macvim')
    set transparency=30
    let mapleader='¥'
elseif has("gui_running")
    set guifont=Ricty:h13,FixedSys:h13
endif

"マッピング設定
nnoremap <C-e> :<C-u>Ref webdict alc 
noremap <silent> <leader>s :NeoComplCacheEditSnippets<CR>
noremap <silent> <Space><Space> :Unite file_mru file directory_mru<Return>
noremap <silent> <Space><S-Space> :Unite -no-quit file_mru file directory_mru<Return>
noremap <Space>ub :<C-u>Unite bookmark buffer<Return>
noremap <Space>uc :<C-u>Unite command<Return>
noremap <Space>uy :<C-u>Unite history/yank<CR>
noremap <Space>vs :<C-u>VimShell<Return>
noremap <Space>vt :<C-u>VimShellTab<Return>
noremap <Space>vp :<C-u>VimShellPop<Return>
noremap <Space>rv :<C-u>RVview<CR>
noremap <Space>rc :<C-u>RVcontroller<CR>
noremap <Space>rm :<C-u>RVmodel<CR>
nnoremap <leader>tt :<C-u>VimwikiToggleListItem<CR>
"noremap <C-h> :<C-u>Unite help -start-insert<CR>

noremap <CR> i<CR><ESC>
"noremap SS pkdd
noremap <C-h> :<C-u>help<Space>
noremap <Space>; A;<ESC>
noremap <silent> <leader>r :source $MYVIMRC<CR>
noremap <C-[> :<C-u>nohlsearch<Return>
map <leader>q <Plug>(quickrun)
imap <C-s> <Plug>(neocomplcache_snippets_expand)
inoremap <C-l> <delete>
inoremap jj <ESC>
cnoremap <C-h> <BS>
cnoremap <C-l> <delete>

vnoremap <silent> * "vy/\V<C-r>=substitute(escape(@v,'\/'),"\n",'\\n','g')<CR><CR>

autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()
    imap <buffer> <C-w> <Plug>(unite_delete_backward_path)
    nnoremap <silent><buffer><expr> t unite#do_action('tabopen')
    nnoremap <silent><buffer><expr> r unite#do_action('right')
    nnoremap <silent><buffer><expr> R unite#do_action('left')
    nnoremap <silent><buffer><expr> ff unite#do_action('vimfiler')
    nnoremap <silent><buffer><expr> ft unite#do_action('tabvimfiler')
    nnoremap <silent><buffer><expr> c unite#do_action('project_cd')
    call unite#set_profile("", "ignorecase", 1)
    call unite#set_profile("", "smartcase", 1)
endfunction

autocmd FileType vimfiler call s:vimfiler_my_setting()
function! s:vimfiler_my_setting()
    nnoremap <silent><buffer><expr> n vimfiler#do_action('tabopen')
endfunction

"syntax
autocmd BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery

autocmd BufRead *.c,*.h,*.cpp,*.hpp if search('^#include <OpenGL\/','n')>0|call GL_mode()|endif
function! GL_mode()
  source /Users/Kenji/Dropbox/vim/.vim/ftplugin/opengl.vim
  "set dictionary+=~/vimfiles/dict/opengl
endfunction

let g:user_zen_leader_key = '<c-z>'
let g:EasyMotion_leader_key = '<Space>'
let g:EasyMotion_keys = 'asdfjkl;gheiwovnqp'

"ref.vimの設定
let g:ref_source_webdict_sites = {
\   'wikipedia:ja': 'http://ja.wikipedia.org/wiki/%s',
\   'alc': {'url': 'http://eow.alc.co.jp/search?q=%s', 'line': 42},
\ }

"Directory Setting
if has('unix') || has('mac')
    let s:dataPath = $HOME.'/Dropbox/vim/tooldata/'
    let g:vimwiki_list = [{'path': s:dataPath.'vimwiki', 'path_html': s:dataPath.'vimwiki/html'}]
    let g:ref_phpmanual_path = s:dataPath.'phpmanual/php-chunked-xhtml/'
    let g:ref_jquery_path = s:dataPath.'jqapi-latest/docs/'
    let g:neocomplcache_snippets_dir = s:dataPath.'snippets'
    let g:eskk#directory = s:dataPath.'eskk'
    let g:eskk#dictionary = { 'path': s:dataPath."eskk/.skk-jisyo", 'sorted': 0, 'encoding': 'utf-8', }
    let g:eskk#large_dictionary = { 'path': s:dataPath."eskk/SKK-JISYO.L", 'sorted': 1, 'encoding': 'euc-jp', }
    autocmd FileType php :setlocal dictionary=<expr>s:dataPath.'wordpress.dict'
else
    let s:dataPath = $HOME.'\Dropbox\vim\tooldata\'
    let g:vimwiki_list = [{'path': s:dataPath.'vimwiki', 'path_html': s:dataPath.'vimwiki\html'}]
    let $PATH = $PATH . ';C:\Program Files (x86)\Lynx for Win32'
    let $PATH = $PATH . ';C:\Program Files\Lynx for Win32'
    let g:ref_phpmanual_path = s:dataPath.'phpmanual\php-chunked-xhtml\'
    let g:ref_jquery_path = s:dataPath.'jqapi-latest\docs\'
    let g:neocomplcache_snippets_dir = s:dataPath.'snippets'
    let g:eskk#directory = s:dataPath.'eskk'
    let g:eskk#dictionary = { 'path': s:dataPath."eskk/.skk-jisyo", 'sorted': 0, 'encoding': 'utf-8', }
    let g:eskk#large_dictionary = { 'path': s:dataPath."eskk/SKK-JISYO.L", 'sorted': 1, 'encoding': 'euc-jp', }
endif

let g:eskk#enable_completion = 1
let g:eskk#auto_save_dictionary_at_exit = 1

let g:unite_source_history_yank_enable = 1


"vimfiler Setting
let g:vimfiler_external_copy_directory_command = 'cp -r $src $dest'
let g:vimfiler_external_copy_file_command = 'cp $src $dest'
let g:vimfiler_external_delete_command = 'rm -r $srcs'
let g:vimfiler_external_move_command = 'mv $srcs $dest'
" Enable file operation commands.
let g:vimfiler_safe_mode_by_default = 0

"neocomplcacheの設定
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_disable_select_mode_mappings = 0
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
"Use quick_match
"let g:neocomplcache_enable_quick_match = 1
"Use neocomplcache ignore another
let g:neocomplcache_force_overwrite_completefunc = 1

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
imap <C-k>     <Plug>(neocomplcache_snippets_expand)
smap <C-k>     <Plug>(neocomplcache_snippets_expand)
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-k>     neocomplcache#complete_common_string()

" SuperTab like snippets behavior.
"imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

" AutoComplPop like behavior.
"let g:neocomplcache_enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplcache_enable_auto_select = 1
"let g:neocomplcache_disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"
"inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
    let g:neocomplcache_omni_patterns = {}
endif
"let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
"autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'

"URL encode and decode via chalice
function! s:URLEncode()
    let l:line = getline('.')
    let l:encoded = AL_urlencode(l:line)
    call setline('.', l:encoded)
endfunction

function! s:URLDecode()
    let l:line = getline('.')
    let l:encoded = AL_urldecode(l:line)
    call setline('.', l:encoded)
endfunction
command! -nargs=0 -range URLEncode :<line1>,<line2>call <SID>URLEncode()
command! -nargs=0 -range URLDecode :<line1>,<line2>call <SID>URLDecode()

command! -count -nargs=1 ContinuousNumber let c = col('.')|for n in range(1, <count>?<count>-line('.'):1)|exec 'normal! j' . n . <q-args>|call cursor('.', c)|endfor
vnoremap <silent> <C-a> :ContinuousNumber <C-a><CR>
vnoremap <silent> <C-x> :ContinuousNumber <C-x><CR>


function! ExUpLower()
    let l:currentChar = getline(".")[col(".")-1]
    if(match(l:currentChar,'\l')==0)
        execute "normal r".toupper(l:currentChar)."l"
    elseif(match(l:currentChar,'\u')==0) "[A-Z]
        execute "normal r".tolower(l:currentChar)."l"
    elseif(match(l:currentChar,'\"')==0)
        execute "normal r'l"
    elseif(match(l:currentChar,"\'")==0)
        execute 'normal r"l'
    else
        execute 'normal l'
    endif
endfunction

nnoremap <silent> ~ :<C-u>call ExUpLower()<CR>

" Tue Apr 22 07:49:35 JST 2008
"
" b:charCounterCount に文字数をセットするスクリプト
" バッファを保存したりしたときに、更新される。
"
" ステータスラインに入れて使う例↓
" set statusline=%{b:charCounterCount}
set statusline+=\ wc:%{b:charCounterCount}

if exists("anekos_charCounter")
    finish
endif
let anekos_charCounter=1

augroup CharCounter
    autocmd!
    autocmd BufCreate,BufEnter * call <SID>Initialize()
    autocmd BufUnload,FileWritePre,BufWritePre * call <SID>Update()
augroup END

function! s:Initialize()
    if exists('b:charCounterCount')
    else
        return s:Update()
    endif
endfunction

function! s:Update()
    let b:charCounterCount = s:CharCount()
endfunction

function! s:CharCount()
    let l:result = 0
    for l:linenum in range(0, line('$'))
        let l:line = getline(l:linenum)
        let l:result += strlen(substitute(l:line, ".", "x", "g"))
    endfor
    return l:result
endfunction

function! AnekoS_CharCounter_CharCount()
    return s:CharCount()
endfunction

