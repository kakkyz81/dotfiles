" vim:fdm=marker
" -------------------------------------------------------------------------
"  _vimrc main
" -------------------------------------------------------------------------
" * general               "{{{
set nocompatible          " We're running Vim, not Vi!
set autoread
set visualbell            " no sound flash bell
" ------------------------ }}}
" * vundle                "{{{
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" 必須
Bundle 'gmarik/vundle'

" from github
Bundle 'motemen/hatena-vim.git'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
Bundle 'othree/eregex.vim'
Bundle 'thinca/vim-quickrun'
Bundle 'Shougo/neocomplcache'
Bundle 'Shougo/unite.vim'
Bundle 'Shougo/vimshell'
Bundle 'Shougo/vimproc'
Bundle 'Shougo/vimfiler'
Bundle 'fuenor/qfixhowm'
Bundle 'h1mesuke/unite-outline'
Bundle 'h1mesuke/vim-alignta'
Bundle 'kakkyz81/evervim'
Bundle 'thinca/TweetVim'
Bundle 'tyru/open-browser.vim'
Bundle 'basyura/twibill.vim'
Bundle 'basyura/bitly.vim'
Bundle 'mattn/webapi-vim'
Bundle 'mattn/mkdpreview-vim'
" from vim.org
Bundle 'YankRing.vim'
Bundle 'bufferlist.vim'
Bundle 'Align'
Bundle 'calendar.vim'
Bundle 'grep.vim'
Bundle 'cursoroverdictionary'
Bundle 'restart.vim'
Bundle 'VimRepress'
Bundle 'project.tar.gz'

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
set directory=R:\temp     " swapfileの作成場所
set backupdir=D:\temp
set undofile              " 再読込、vim終了後も継続するundo
set undodir=D:\temp
set nopaste               " for neocomplcache
syntax on                 " Enable syntax highlighting
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
map <silent> <F12> :call BufferList()<CR>
" ------------------------ }}}
" * fugitive               {{{
nmap ,gc :Gcommit<CR>
nmap ,gl :Glog<CR>:copen<CR>
nmap ,gd :Gdiff<CR>
nmap ,gs :Gstatus<CR>
" ------------------------ }}}
" * QFixHowm               {{{
let howm_dir              = '~/.vim_junk/howm'
let howm_fileencoding     = 'utf-8'
let howm_fileformat       = 'dos'
" デフォルトをMarkdown形式に
let QFixHowm_HowmMode     = 0
let QFixHowm_Title        = '#'
let suffix                = 'mkd'
let QFixHowm_UserFileType = 'markdown'
let QFixHowm_UserFileExt  = suffix
let howm_filename         = '%Y/%m/%Y-%m-%d-%H%M%S.'.suffix
let QFixHowm_DiaryFile    = 'diary/%Y/%Y-%m-%d.mkd'          " 日記は diaryディレクトリに作成
let qfixmemo_mapleader    = 'f'                              " g, の代わり
"let qfixmemo_folding      = 1                               " フォールディング
"let qfixmemo_folding_pattern = '^#[^#]'                     "
"let howm_filename         = '%Y/%m/%Y-%m-%d-000000.'.suffix "一日一ファイルで使用する時
let QFixHowm_Template = [
 \"%TITLE% %TAG%",
 \""
\]
"クイックメモファイル名設定
"デフォルトとfUでは通常のクイックメモ、
"1fuでキーボードショートカットを集めたメモ
let QFixHowm_QuickMemoFile  = "Qmem-00-0000-00-00-000000.mkd"
let QFixHowm_QuickMemoFile1 = "KeyboardShortcuts-0000000.mkd"

" その他
"let mygrepprg                      = 'grep'    " 指定するとうまく動かない
let QFixHowm_ListReminder_ScheExt  = '[-@!]'    " fyで表示 リマインダ、予定、締切
let QFixHowm_ListReminder_TodoExt  = '[-@+!~.]' " ftで全部
let QFixHowm_ShowScheduleTodo      = 10           " ft fy f, での表示件数
let QFixHowm_ShowSchedule          = 10
let QFixHowm_ShowScheduleMenu      = 10
let QFixHowm_RemovePriorityDays    = 100          " 100日経過した予定・リマインダは削除
let QFixHowm_JpDayOfWeek           = 1            " 日本語の曜日表示
"let QFixHowm_VimEnterCmd          = 'y'          " 一日一回だけ今日の予定を自動表示
"let QFixHowm_VimEnterMsg          = 'today's tasks'
let QFixHowm_SwitchListActionLock  = ['{ }', '{-}', '{*}', '{_}']  " TODOリストの種類
let QFixHowm_UserSwActionLock      = ['[ ]', '[:tech]', '[:vim]', '[:!go]', '[:!buy]', '[:finished]'] " カテゴリタグ
let QFixHowm_HolidayFile           = 'Sche-Hd-0000-00-00-000000.*'
let QFixHowm_ReminderPriority      = {'@' : 1, '!' : 1, '+' : 3, '-' : 4, '~' : 5, '.' : 6} " @と!を同じ並びに
let QFixHowm_ReminderHolidayName   = '元日\|成人の日\|建国記念の日\|昭和の日\|憲法記念日\|みどりの日\|こどもの日\|海の日\|敬老の日\|体育の日\|文化の日\|勤労感謝の日\|天皇誕生日\|春分の日\|秋分の日\|振替休日\|国民の休日\|日曜日\|土曜日'
" keymap
nmap fd :<C-U>call qfixmemo#InsertDate('Date')<CR><Right>
nmap fT :<C-U>call qfixmemo#InsertDate('Time')<CR><Right>
map  fF <ESC><Insert># finished todos
" insert action
nmap fa fT+<Space>
" もともと faにマッピングされていたもの(memo zenbu list)
nmap fz :<C-U>call qfixmemo#ListCmd()<CR>
" タイトル行検索正規表現の辞書を初期化
let QFixMRU_Title = {}
" MRUでタイトル行とみなす正規表現(Vimの正規表現で指定)
let QFixMRU_Title['mkd']       = '^###[^#]'
" grepでタイトル行とみなす正規表現(使用するgrepによっては変更する必要があります)
let QFixMRU_Title['mkd_regxp'] = '^###[^#]'
" 外部ブラウザ
let QFixHowm_OpenURIcmd        = '!start ' . $HOMEPATH . '\AppData\Local\Google\Chrome\Application\chrome.exe %s --disk-cache-dir="R:\Temp\Chrome"'
" ------------------------ }}}
" * unite                  {{{
"
" 入力モードで開始しない
let g:unite_enable_start_insert=0
" バッファ一覧
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
" ファイル一覧
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
" レジスタ一覧
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
" 最近使用したファイル一覧
nnoremap <silent> ,um :<C-u>Unite file_mru<CR>
" 常用セット
nnoremap <silent> ,uu :<C-u>Unite buffer file_mru<CR>
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
let g:neocomplcache_temporary_dir                = 'R:\Temp\.neocon'
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
map <C-w>t :tabn<CR>
map <C-w>e :tabnew
map <C-w>w :set wrap!<CR>
map <ESC><ESC> :noh<CR>:cclose<CR>

" ------------------------ }}}
" * quickrun.vim          "{{{
nmap ,r <Plug>(quickrun)
let g:quickrun_config = {}
let g:quickrun_config['*'] = { 'split': 'below'}
let g:quickrun_config['python'] = {}
" ------------------------ }}}
" * vimfiler {{{
let g:vimfiler_as_default_explorer = 1
nmap <silent> ,u<Space> :VimFilerBufferDir<CR>
" ------------------------ }}}
" * tweetvim {{{
map ,tt <CR>:TweetVimSay<CR>
" au FileType unite nnoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
" ------------------------ }}}
" * sources               "{{{
source ~/.vim/vimrc_source/personal.vimrc
" ------------------------ }}}

