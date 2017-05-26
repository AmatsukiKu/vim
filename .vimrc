"dein Scripts-----------------------------
set nocompatible  "Vi compatible off, Vim feature on

set shellslash
set fileformat=unix "改行をUnix形式に

filetype off
filetype plugin indent off
if has('vim_starting')
    set rtp^=~/.vim/bundle/repos/github.com/Shougo/dein.vim
endif

call dein#begin(expand('~/.vim/bundle'))

"Common Plugins
call dein#add('Shougo/dein.vim')
call dein#add('Shougo/vimproc', {'build' : 'make'})
call dein#add('vim-scripts/sudo.vim', {'on_cmd' : 'sudo'})
call dein#add('tsukkee/unite-help', {'on_cmd' : 'help'})
call dein#add('mattn/learn-vimscript', {'on_cmd' : 'commands'})

"UI Plugins
call dein#add('Shougo/unite.vim')
call dein#add('Shougo/neomru.vim')
call dein#add('Shougo/vimfiler', {'on_map' : '<Plug>vimfiler-', 'on_cmd' : ['VimFiler', 'VimFilerTab']})
call dein#add('Shougo/vimshell', {'on_cmd' : 'VimShell'})
call dein#add('ujihisa/vimshell-ssh', {'depends' : 'vimshell' })
call dein#add('osyo-manga/vim-anzu')
call dein#add('itchyny/lightline.vim')
call dein#add('vim-scripts/EasyMotion')
call dein#add('thinca/vim-ref', {'lazy' : 1, 'on_cmd' : 'Ref' })
call dein#add('motemen/git-vim')
call dein#add('vimwiki', {'on_map' : 'vimwiki-', 'on_cmd' : ['VimwikiIndex', 'VimwikiTabIndex'] })

"Visual Plugins
call dein#add('ujihisa/unite-colorscheme')
call dein#add('thinca/vim-fontzoom')
call dein#add('tyru/current-func-info.vim')

"Edit Plugins
call dein#add('kana/vim-smartinput')
call dein#add('Shougo/neocomplete', {'lazy' : 1, 'on_i' : 1})
call dein#add('Shougo/neosnippet-snippets', {'lazy' : 1, 'on_i' : 1, 'depends' : 'neocomplete' })
call dein#add('Shougo/neosnippet', {'lazy' : 1, 'on_i' : 1, 'depends' : 'neosnippet-snippets' })
call dein#add('scrooloose/nerdcommenter')
call dein#add('tpope/vim-surround')
call dein#add('thinca/vim-qfreplace')
call dein#add('thinca/vim-quickrun', {'on_cmd' : 'QuickRun'})

"Web Development Plugins
call dein#add('mattn/emmet-vim',{'lazy' : 1, 'on_ft': ['html', 'xhtml', 'php', 'eruby']})
call dein#add('tpope/vim-rails', {'on_ft': ['rb', 'erb']})
call dein#add('basyura/unite-rails', {'on_ft': ['rb', 'erb']})
call dein#add('kchmck/vim-coffee-script', {'on_ft': ['coffee']})
call dein#add('nono/jquery.vim', {'on_ft': ['js', 'jquery']})
call dein#add('soh335/vim-ref-jquery', {'on_ft': ['js', 'jquery', 'html', 'php', 'erb', 'coffee']})
call dein#add('slim-template/vim-slim', {'on_ft': 'slim'})
call dein#add('lilydjwg/colorizer')
call dein#add('pasela/unite-webcolorname', {'depends' : 'unite.vim'})
call dein#add('koron/chalice')

"Other Development
call dein#add('msanders/cocoa.vim')
call dein#add('vim-scripts/Processing', {'on_ft': 'pde'})
call dein#add('sudar/vim-arduino-syntax', {'on_ft': 'ino'})
call dein#add('tclem/vim-arduino', {'on_ft': 'ino'})

call dein#end()

filetype plugin indent on
"End dein Scripts-------------------------

augroup MyAutoCmd
    autocmd!
augroup END"

source $VIMRUNTIME/macros/matchit.vim

syntax on

set helplang=ja,en
set undodir=$HOME/.vim/undo

set nobackup
set noswapfile
set history=200

"Turn off error sounds
set noerrorbells
set novisualbell
set visualbell t_vb=

if v:version >= 703
    set relativenumber
else
    set number
end
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
set laststatus=2
set matchpairs+=<:>
set wildmenu
set wildmode=longest
set ambiwidth=double
set incsearch
set list
set lcs=trail:_

set formatoptions=q

if has('gui_macvim')
    set transparency=30
    let mapleader='¥'
elseif has("gui_running")
    set guifont=Ricty:h13,FixedSys:h13
endif

"マッピング設定
nnoremap <C-e> :<C-u>Ref webdict alc<Space>
noremap <silent> <leader>s :NeoSnippetEdit<CR>

noremap <Space>vs :<C-u>VimShell<Return>
noremap <Space>vt :<C-u>VimShellTab<Return>
noremap <Space>vp :<C-u>VimShellPop<Return>
noremap <Space>rv :<C-u>RVview<CR>
noremap <Space>rc :<C-u>RVcontroller<CR>
noremap <Space>rm :<C-u>RVmodel<CR>
nnoremap <leader>ww :<C-u>VimwikiIndex<CR>
nnoremap <leader>tt :<C-u>VimwikiToggleListItem<CR>

noremap <CR> i<CR><ESC>
"noremap SS pkdd
noremap <C-h> :<C-u>help<Space>
noremap <Space>; A;<ESC>
noremap <silent> <leader>r :source $MYVIMRC<CR>
map <silent> <leader>q :<C-u>QuickRun<CR>
imap <C-s> <Plug>(neosnippet_expand)
inoremap <C-l> <delete>
inoremap jj <ESC>
cnoremap <C-h> <BS>
cnoremap <C-l> <delete>

if dein#tap('vim-anzu')
    nmap n <Plug>(anzu-n)
    nmap N <Plug>(anzu-N)
    nmap * <Plug>(anzu-star)
    nmap # <Plug>(anzu-sharp)
    nmap <ESC><ESC> :<C-u>nohlsearch<CR><Plug>(anzu-clear-search-status)
endif

let g:lightline = {
    \ 'active': {
        \ 'left': [['mode', 'modified'], ['absolutepath', 'readonly', 'function', 'anzu', 'position']],
        \ 'right': [['wordcount', 'fileformat', 'fileencoding', 'filetype', 'ascii', 'hex']] },
    \ 'component_function': {'anzu': 'anzu#search_status'},
    \ 'component': {
        \ 'position': '%3l/%L:%-2v',
        \ 'hex': 'HEX:%B',
        \ 'ascii': 'ASCII:%03.3b',
        \ 'function': '%{cfi#format("[%s()]", "[no function]")}'}}

vnoremap <silent> * "vy/\V<C-r>=substitute(escape(@v,'\/'),"\n",'\\n','g')<CR><CR>

"Directory Setting
let s:dataPath = $HOME.'/Dropbox/vim/tooldata/'

" Unite Settings
if dein#tap('unite.vim')
    let g:unite_source_file_mru_limit = 200
    let g:unite_source_history_yank_enable = 1
    if executable('hw')
        let g:unite_source_grep_command = 'hw'
        let g:unite_source_grep_default_opts = '--no-group --no-color'
        let g:unite_source_grep_recursive_opt = ''
    endif
    noremap <silent> <Space><Space> :Unite file_mru file directory_mru<Return>
    noremap <silent> <Space><S-Space> :Unite -no-quit file_mru file directory_mru<Return>
    noremap <Space>ub :<C-u>Unite bookmark buffer<Return>
    noremap <Space>uc :<C-u>Unite command<Return>
    noremap <Space>uy :<C-u>Unite history/yank<CR>
    "noremap <C-h> :<C-u>Unite help -start-insert<CR>

    autocmd FileType unite call s:unite_my_settings()
    function! s:unite_my_settings()
        imap <buffer> <C-w> <Plug>(unite_delete_backward_path)
        nnoremap <silent><buffer><expr> t unite#do_action('tabopen')
        nnoremap <silent><buffer><expr> r unite#do_action('right')
        nnoremap <silent><buffer><expr> R unite#do_action('left')
        nnoremap <silent><buffer><expr> ff unite#do_action('vimfiler')
        nnoremap <silent><buffer><expr> ft unite#do_action('tabvimfiler')
        nnoremap <silent><buffer><expr> c unite#do_action('project_cd')
    endfunction

    call unite#custom#profile('default', 'context', {
        \ "ignorecase": 1,
        \ "smartcase": 1,
    \ })
endif

if dein#tap('vimfiler')
    function! s:vimfiler_on_source() abort
        let g:vimfiler_external_copy_directory_command = 'cp -r $src $dest'
        let g:vimfiler_external_copy_file_command = 'cp $src $dest'
        let g:vimfiler_external_delete_command = 'rm -r $srcs'
        let g:vimfiler_external_move_command = 'mv $srcs $dest'
        " Enable file operation commands.
        call vimfiler#custom#profile('default', 'context', {'safe' : 0})
        function! s:vimfiler_my_setting()
            nnoremap <silent><buffer><expr> n vimfiler#do_action('split')
        endfunction
        autocmd FileType vimfiler call s:vimfiler_my_setting()
    endfunction
    call dein#source('Shougo/vimfiler', {'hook_source': function('s:vimfiler_on_source')})
endif

if dein#tap("neocomplete")
    function! s:neocomplete_on_source() abort
        " Use neocomplete.
        let g:neocomplete#enable_at_startup = 1
        " Use smartcase.
        let g:neocomplete#enable_smart_case = 1
        " Set minimum syntax keyword length.
        let g:neocomplete#sources#syntax#min_keyword_length = 3
        let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

        " Define dictionary.
        let g:neocomplete#sources#dictionary#dictionaries = {
            \ 'default' : '',
            \ 'vimshell' : $HOME.'/.vimshell_hist',
            \ 'scheme' : $HOME.'/.gosh_completions'
                \ }

        " Define keyword.
        if !exists('g:neocomplete#keyword_patterns')
            let g:neocomplete#keyword_patterns = {}
        endif
        let g:neocomplete#keyword_patterns['default'] = '\h\w*'

        " Plugin key-mappings.
        inoremap <expr><C-g>     neocomplete#undo_completion()
        inoremap <expr><C-l>     neocomplete#complete_common_string()

        " Recommended key-mappings.
        " <CR>: close popup and save indent.
        inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
        function! s:my_cr_function()
          return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
          " For no inserting <CR> key.
          "return pumvisible() ? "\<C-y>" : "\<CR>"
        endfunction
        " <TAB>: completion.
        inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
        " <C-h>, <BS>: close popup and delete backword char.
        inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
        inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
        " Close popup by <Space>.
        "inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

        " AutoComplPop like behavior.
        "let g:neocomplete#enable_auto_select = 1

        " Shell like behavior(not recommended).
        "set completeopt+=longest
        "let g:neocomplete#enable_auto_select = 1
        "let g:neocomplete#disable_auto_complete = 1
        "inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

        " Enable omni completion.
        autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
        autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
        autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
        autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
        autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

        " Enable heavy omni completion.
        if !exists('g:neocomplete#sources#omni#input_patterns')
          let g:neocomplete#sources#omni#input_patterns = {}
        endif
        "let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
        "let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
        "let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

        " For perlomni.vim setting.
        " https://github.com/c9s/perlomni.vim
        let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
    endfunction
    call dein#set_hook('neocomplete', 'hook_source', function('s:neocomplete_on_source'))
endif

if dein#tap('EasyMotion')
    let g:EasyMotion_leader_key = '<Space>'
    let g:EasyMotion_keys = 'asdfjkl;gheiwovnqp'
endif

if dein#tap('vim-ref')
    function! s:vim_ref_on_source() abort
        "ref.vimの設定
        let g:ref_source_webdict_sites = {
        \   'wikipedia:ja': 'http://ja.wikipedia.org/wiki/%s',
        \   'alc': {'url': 'http://eow.alc.co.jp/search?q=%s', 'line': 42},
        \ }

        let g:ref_jquery_path = s:dataPath.'jqapi-latest/docs/'
        let g:ref_phpmanual_path = s:dataPath.'phpmanual/php-chunked-xhtml/'
        let g:neosnippet#snippets_directory = $HOME.'/.vim//snippets'
    endfunction
    call dein#set_hook('vim-ref', 'hook_source', function('s:vim_ref_on_source'))
endif

if dein#tap('emmet-vim')
    function! s:emmet_vim_on_source() abort
        let g:user_emmet_leader_key = '<c-z>'
    endfunction
    call dein#set_hook('emmet-vim', 'hook_source', function('s:emmet_vim_on_source'))
endif

"syntax
"
autocmd BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery

autocmd BufRead *.c,*.h,*.cpp,*.hpp if search('^#include <OpenGL\/','n')>0|call GL_mode()|endif
function! GL_mode()
  source ~/.vim/ftplugin/opengl.vim
  "set dictionary+=~/vimfiles/dict/opengl
endfunction

function! s:FixWhitespace()
    let l:save_cursor = getpos(".")
    silent! execute ':%s/\\\@<!\s\+$//'
    call setpos('.', l:save_cursor)
endfunction
autocmd BufWritePre * call s:FixWhitespace()

let g:vimwiki_list = [{'path': s:dataPath.'vimwiki', 'path_html': s:dataPath.'vimwiki/html'}]
autocmd FileType php :setlocal dictionary=<expr>s:dataPath.'wordpress.dict'

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
