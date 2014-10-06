" vim:fdm=marker fdl=0:
" -------------------------------------------------------------------------
"  _vimrc main
" -------------------------------------------------------------------------
" * general               "{{{
set nocompatible          " We're running Vim, not Vi!
set autoread
set visualbell            " no sound flash bell
"set grepprg=grep\ -nH
" ------------------------ }}}
" * vundle                "{{{
"
filetype off
" for windows -> mklink /D ~\.vim ~\dropbox\apps\vim\.vim
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" Let NeoBundle manage NeoBundle
Plugin 'gmarik/Vundle.vim'

"   " from github
"   " Plugin 'derekwyatt/vim-scala'
Plugin 'ctrlpvim/ctrlp.vim'
"   Plugin 'MarcWeber/vim-addon-actions'
"   Plugin 'MarcWeber/vim-addon-mw-utils'
"   Plugin 'MarcWeber/vim-addon-sbt'
Plugin 'Shougo/neocomplcache'
"   Plugin 'Shougo/unite.vim'
"   Plugin 'Shougo/vimfiler'
Plugin 'Shougo/vimproc'
Plugin 'Shougo/vimshell'
Plugin 'basyura/TweetVim'
Plugin 'farseer90718/vim-taskwarrior'
"   Plugin 'basyura/bitly.vim'
"   Plugin 'basyura/twibill.vim'
"   Plugin 'basyura/unite-yarm'
"   Plugin 'fs111/pydoc.vim'
"   Plugin 'fuenor/qfixhowm'
"   Plugin 'h1mesuke/unite-outline'
"   Plugin 'h1mesuke/vim-alignta'
Plugin 'tyru/open-browser.vim'
Plugin 'kakkyz81/evervim' , { 'rev' : 'unite' , 'depends' : 'tyru/open-browser.vim'}
"   Plugin 'kakkyz81/vim-redmine'
"   Plugin 'mattn/mkdpreview-vim'
Plugin 'mattn/webapi-vim'
"   Plugin 'mattn/emmet-vim'
Plugin 'motemen/hatena-vim.git'
Plugin 'nelstrom/vim-markdown-folding'
"   Plugin 'nvie/vim-flake8'
"   Plugin 'othree/eregex.vim'
Plugin 'thinca/vim-quickrun'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'derekwyatt/vim-scala'
Plugin 'LeafCage/yankround.vim'
"   Plugin 'vim-jp/vital.vim'
"   " Plugin 'koron/imcsc-vim' , { 'rtp' : 'uim-ctlso' }
Plugin 'yuratomo/w3m.vim'
"   " from vim.org
Plugin 'Align'
Plugin 'BufOnly.vim'
"   Plugin 'VimRepress'
"   Plugin 'YankRing.vim'
Plugin 'bufferlist.vim'
"   Plugin 'calendar.vim'
"   Plugin 'cursoroverdictionary'
"   Plugin 'grep.vim'
Plugin 'project.tar.gz'
Plugin 'restart.vim'
call vundle#end()
filetype plugin indent on
" ------------------------ }}}
" * edit                  "{{{
set nu
set ruler
set nowrap
set showcmd               "入力中のコマンドをステータスに表示
set scrolloff=5           "スクロールするとき上下に余裕を確保する
set laststatus=2
set modeline
set modelines=5
set clipboard=unnamedplus,unnamed
if !isdirectory($HOME . "/temp")
    call mkdir($HOME. "/temp")
endif
set directory=$HOME/temp     " swapfileの作成場所
set backupdir=$HOME/temp
set undofile              " 再読込、vim終了後も継続するundo
set undodir=$HOME/temp
set nopaste               " for neocomplcache
set foldlevelstart=2
"autocmd BufWritePre *.py :%S/\s+$//ge
syntax on                 " Enable syntax highlighting
" 末尾空白の除去
function! s:remove_dust()
    let cursor = getpos(".")
    %s/\s\+$//ge
"   %s/\t/  /ge
    call setpos(".", cursor)
    unlet cursor
endfunction
autocmd BufWritePre * call <SID>remove_dust()
" Messagesをクリップボードに
"  via. http://d.hatena.ne.jp/tyru/20110624/copy_messages_to_clipboard
command! MessCopy call s:messcopy()
function! s:messcopy()
    redir @+>
    silent messages
    redir END
    " Copy to selection too.
    call setreg('*', getreg('+', 1), getregtype('+'))
endfunction
" ------------------------ }}}
" * tab                   {{{
set expandtab
set tabstop=4             "Tab文字を画面上の見た目で何文字幅にするか設定
set shiftwidth=4          "自動で挿入されるタブの幅
set softtabstop=4         "タブの代わりに空白をいれるときの空白数。0だと無効。
" ------------------------ }}}
" * search                "{{{
set hlsearch
set ignorecase
set incsearch
" ------------------------ }}}
" * statusline            "{{{
" via http://d.hatena.ne.jp/ruedap/touch/20110712/vim_statusline_git_branch_name
set statusline=%<          " 行が長すぎるときに切り詰める位置
set statusline+=[%n]       " バッファ番号
set statusline+=%m         " %m 修正フラグ
set statusline+=%r         " %r 読み込み専用フラグ
set statusline+=%h         " %h ヘルプバッファフラグ
set statusline+=%w         " %w プレビューウィンドウフラグ
set statusline+=%{'['.(&fenc!=''?&fenc:&enc).':'.&ff.']'}  " fencとffを表示
set statusline+=%y         " バッファ内のファイルのタイプ
set statusline+=\          " 空白スペース
if winwidth(0) >= 130
  set statusline+=%F       " バッファ内のファイルのフルパス
else
  set statusline+=%t       " ファイル名のみ
endif
set statusline+=%=         " 左寄せ項目と右寄せ項目の区切り
set statusline+=%{fugitive#statusline()}  " Gitのブランチ名を表示
set statusline+=\ \        " 空白スペース2個
set statusline+=%1l        " 何行目にカーソルがあるか
set statusline+=/
set statusline+=%L         " バッファ内の総行数
set statusline+=,
set statusline+=%c         " 何列目にカーソルがあるか
set statusline+=%V         " 画面上の何列目にカーソルがあるか
set statusline+=\ \        " 空白スペース2個
set statusline+=%P         " ファイル内の何％の位置にあるか
" ------------------------ }}}
" * function key mapping   {{{
map <F1> :lcd %:p:h<CR>
"map <F2>
map <F3> :r!cat<CR>
"map <F4>
map <F5> :w<CR>:!jruby %
map <F6> :w<CR>:!ruby %
map <F7> :w<CR>:!python %
map <F8> :w<CR>:!spec -fs %
map <F9> :w<CR>:source %<CR>
"map <F10>
"map <F11>
"map <silent> <F12> :call BufferList()<CR>
" ------------------------ }}}
" * fugitive               {{{
nmap ,gc :Gcommit<CR>
nmap ,gl :Glog<CR>:copen<CR>
nmap ,gd :Gdiff<CR>
nmap ,gs :Gstatus<CR>
" ------------------------ }}}
" * unite                  {{{
"
let g:unite_source_history_yank_enable=1
" 入力モードで開始しない
let g:unite_enable_start_insert=0
" バッファ&bookmark
nnoremap <silent> ,ub :<C-u>Unite bookmark buffer<CR>
" ファイル一覧
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file bookmark<CR>
" レジスタ & yankhistory一覧
nnoremap <silent> ,uy :<C-u>Unite history/yank -buffer-name=register register<CR>
" 最近使用したファイル一覧
nnoremap <silent> ,um :<C-u>Unite file_mru<CR>
" 常用セット
nnoremap <silent> ,uu :<C-u>Unite buffer file_mru bookmark file<CR>
" outline
nnoremap <silent> ,uo :<C-u>Unite outline<CR>
" twitter
nnoremap <silent> ,ut :<C-u>Unite tweetvim<CR>
" 全部乗せ
nnoremap <silent> ,ua :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file outline<CR>
" ウィンドウを分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
" ウィンドウを縦に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> q
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>q
" ------------------------ }}}
" * neocomplcache         {{{
" " see http://vim-users.jp/2010/10/hack177/
let g:neocomplcache_enable_at_startup            = 1 " Use neocomplcache.
let g:neocomplcache_enable_smart_case            = 1 " Use smartcase.(大文字が入力されるまで大文字小文字の区別を無視)
let g:neocomplcache_enable_camel_case_completion = 0 " camelCaseCompletion. FAと入力すると、内部ではF*A*のように変換する機能 無効
let g:neocomplcache_enable_underbar_completion   = 1 " _区切りの補完 有効化
let g:neocomplcache_min_syntax_length            = 3 " シンタックスをキャッシュするときの最小文字長
" let g:neocomplcache_temporary_dir                = ''
" let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*' " ku.vimやfizzyfinderなど、相性の悪いplugin用 不要
" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell/command-history',
    \ }
" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
  let g:neocomplcache_keyword_patterns = {}
endif
" let g:neocomplcache_keyword_patterns['default'] = '\h\w*' "キーワードパターンの設定?

" Plugin key-mappings.
imap <C-k>     <Plug>(neocomplcache_snippets_expand)
smap <C-k>     <Plug>(neocomplcache_snippets_expand)
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" SuperTab like snippets behavior.
" imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"

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

let g:neocomplcache_enable_auto_select = 1 " AutoComplPop like behavior.(最初の候補を選択)

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplcache_enable_auto_select = 1
"let g:neocomplcache_disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<TAB>"
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
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
"autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'
" ------------------------ }}}
" * vimshell              "{{{
let vimshell_user_prompt    = 'getcwd()'
"let vimshell_right_prompt   = 'fugitive#statusline()'
" ------------------------ }}}
" * cursoroverdictionary.vim"{{{
vnoremap e y:CODSelected<CR>
" ------------------------ }}}
" * key mapping            {{{
nmap <C-w>t :tabn<CR>
nmap <C-w>e :tabnew
nmap <C-w>w :set wrap!<CR>
map <ESC><ESC> :noh<CR>:cclose<CR>
" xmlの整形 http://mattn.kaoriya.net/software/lang/python/20120209221728.htm
nmap <Leader>x !python -m BeautifulSoup<CR>
nmap <Leader>x !python -m BeautifulSoup<CR>
" messagesをクリップボードに
nmap <C-r>m :redir @*<CR>:silent messages<CR>:redir END<CR>
" to doの一覧をquickfixに表示する via.http://d.hatena.ne.jp/akihito_s/20110727
nmap <Leader>t :noautocmd vimgrep /TODO/j **/*.xml **/*.scala **/*.java <CR>:cw<CR>
" ------------------------ }}}
" * quickrun.vim          "{{{
function! s:clear_quickrunbuffer()
    let winnr = 1
    while winnr <= winnr('$')
        if getbufvar(winbufnr(winnr), '&filetype') ==# 'quickrun'
            execute winnr 'wincmd w'
            %delete _
            break
        endif
        let winnr += 1
    endwhile
endfunction
command! -nargs=0 ClearQuickrun call s:clear_quickrunbuffer()
nmap ,r <Plug>(quickrun)
nmap ,rc :ClearQuickrun<CR>
let g:quickrun_config = {}
let g:quickrun_config['*'] = { 'split': 'below' ,
                             \ 'runner': 'vimproc' }
let g:quickrun_config['python'] = {} "{ 'outputter/buffer/append': 1 }
" ------------------------ }}}
" * vimfiler {{{
let g:vimfiler_as_default_explorer = 0
nmap <silent> ,u<Space> :VimFilerBufferDir<CR>
" ------------------------ }}}
" * tweetvim {{{
nmap ,te :<C-u>TweetVimSay<CR>
nmap ,ts :<C-u>TweetVimSearch<Space>
nmap ,tt :<C-u>TweetVimHomeTimeline<CR>
nmap ,tv :<C-u>TweetVimListStatuses vim<CR>
let g:tweetvim_tweet_per_page=50
let g:tweetvim_expand_t_co=1
" let g:tweetvim_display_time=1
" ------------------------ }}}
" * flake8 {{{
let g:flake8_ignore='E501,E221,E701,E203' " ignore line too long & multiple statements on one line
" ------------------------ }}}
" * restart.vim {{{
command! RestartWithSession let g:restart_sessionoptions = 'blank,curdir,folds,help,localoptions,tabpages' | Restart
" ------------------------ }}}
" * cursorline            "{{{
" via.http://d.hatena.ne.jp/thinca/20090530/1243615055
"   augroup vimrc-auto-cursorline
"     autocmd!
"     autocmd CursorMoved,CursorMovedI * call s:auto_cursorline('CursorMoved')
"     autocmd CursorHold,CursorHoldI * call s:auto_cursorline('CursorHold')
"     autocmd WinEnter * call s:auto_cursorline('WinEnter')
"     autocmd WinLeave * call s:auto_cursorline('WinLeave')
"     let s:cursorline_lock = 0
"     function! s:auto_cursorline(event)
"       if a:event ==# 'WinEnter'
"         setlocal cursorline
"         let s:cursorline_lock = 2
"       elseif a:event ==# 'WinLeave'
"         setlocal nocursorline
"       elseif a:event ==# 'CursorMoved'
"         if s:cursorline_lock
"           if 1 < s:cursorline_lock
"             let s:cursorline_lock = 1
"           else
"             setlocal nocursorline
"             let s:cursorline_lock = 0
"           endif
"         endif
"       elseif a:event ==# 'CursorHold'
"         setlocal cursorline
"         let s:cursorline_lock = 1
"       endif
"     endfunction
"   augroup END
" ------------------------ }}}
" * project.vim {{{
let g:proj_flags="imstv"
nmap <C-o><C-p> :<C-u>Project<CR>
" # [YYYY-MM-DD HH:MM] を自動入力
nmap <C-o><C-i> 0i<C-u># [<C-R>=strftime("%Y/%m/%d %H:%M")<CR>]<Space>
nmap <C-o><C-d> 0i<C-u>[<C-R>=strftime("%Y/%m/%d (%a) %H:%M")<CR>]<Space>
" ------------------------ }}}
" * evervim {{{
nnoremap <silent> ,el :<C-u>EvervimNotebookList<CR>
nnoremap <silent> ,eT :<C-u>EvervimListTags<CR>
nnoremap <silent> ,en :<C-u>EvervimCreateNote<CR>
nnoremap <silent> ,eb :<C-u>EvervimOpenBrowser<CR>
nnoremap <silent> ,ec :<C-u>EvervimOpenClient<CR>
nnoremap ,es :<C-u>EvervimSearchByQuery<SPACE>
nnoremap <silent> ,et :<C-u>EvervimSearchByQuery<SPACE>tag:todo -tag:done -tag:someday<CR>
nnoremap <silent> ,eta :<C-u>EvervimSearchByQuery<SPACE>tag:todo -tag:done<CR>
let g:evervim_splitoption=''
let g:evervim_usermarkdown='0'
" ------------------------ }}}
" * vim-redmine {{{
nnoremap ,ra :<C-u>RedmineAddTicket<Space>
nnoremap ,rd :<C-u>RedmineAddTicketWithDiscription<Space>
" ------------------------ }}}
" * migemo {{{
nnoremap // :<C-u>Migemo<CR>
" ------------------------ }}}
" * CtrlP {{{
let g:ctrlp_map = '<c-h>'
nmap ,m :<C-u>CtrlPMRU<CR>
nmap ,a :<C-u>CtrlPMixed<CR>
let g:ctrlp_extensions = ['quickfix', 'dir', 'undo']
" ------------------------ }}}
" * Taskwarrior {{{
nmap <C-t><C-t> :<C-u>TW<CR>
nmap <C-t>a :<C-u>TW add<Space>
let g:task_default_prompt  = ['due', 'description','tag']
" ------------------------ }}}
" * Yankround {{{
nmap p <Plug>(yankround-p)
xmap p <Plug>(yankround-p)
nmap P <Plug>(yankround-P)
nmap gp <Plug>(yankround-gp)
xmap gp <Plug>(yankround-gp)
nmap gP <Plug>(yankround-gP)
nmap <C-p> <Plug>(yankround-prev)
nmap <C-n> <Plug>(yankround-next)
" ------------------------ }}}
" * sources               "{{{
source ~/.vim//personal.vimrc
" ------------------------ }}}
