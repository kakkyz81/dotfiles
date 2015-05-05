" vim:fdm=marker
" -------------------------------------------------------------------------
"  _vimrc main
" -------------------------------------------------------------------------
"
" Vundle init
set nocompatible
filetype off
set rtp+=D:\cygwin64\bin
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
"set grepprg=grep\ -nH
" ------------------------ }}}
" * vundle                "{{{

" from github
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'h1mesuke/vim-alignta'
" Plugin 'kakkyz81/evervim' , { 'rev' : 'unite' , 'depends' : 'tyru/open-browser.vim'}
Plugin 'kakkyz81/evervim'
Plugin 'nelstrom/vim-markdown-folding'
" Plugin 'nvie/vim-flake8'
" Plugin 'kakkyz81/eregex.vim'
Plugin 'thinca/vim-quickrun'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'tyru/open-browser.vim'
" from vim.org
Plugin 'BufOnly.vim'
Plugin 'bufferlist.vim'
Plugin 'project.tar.gz'
Plugin 'restart.vim'

call vundle#end()
filetype plugin indent on
" ------------------------ }}}
" * general               "{{{
set autoread
set visualbell            " no sound flash bell
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
set tw=0
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
map <silent> <F12> :call BufferList()<CR>
" ------------------------ }}}
" * fugitive               {{{
nmap ,gc :Gcommit<CR>
nmap ,gl :Glog<CR>:copen<CR>
nmap ,gd :Gdiff<CR>
nmap ,gs :Gstatus<CR>
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
" * flake8 {{{
let g:flake8_ignore='E501,E221,E701,E203' " ignore line too long & multiple statements on one line
" ------------------------ }}}
" * restart.vim {{{
command! RestartWithSession let g:restart_sessionoptions = 'blank,curdir,folds,help,localoptions,tabpages' | Restart
" ------------------------ }}}
" * ctrlp.vim {{{
let g:ctrlp_map = '<c-h>'
nnoremap <silent> ,m :<C-u>CtrlPMixed<CR>
" ------------------------ }}}
" * project.vim {{{
nnoremap <silent> ,pp :<C-u>Project<CR>
let g:proj_flags="imstv"
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
" * sources               "{{{
if filereadable(expand('~/.vim/personal.vimrc'))
    source ~/.vim/personal.vimrc
endif
" ------------------------ }}}
"
