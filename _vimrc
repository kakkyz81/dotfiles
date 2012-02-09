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

" �K�{
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
set showcmd               "���͒��̃R�}���h���X�e�[�^�X�ɕ\��
set scrolloff=5           "�X�N���[������Ƃ��㉺�ɗ]�T���m�ۂ���
set laststatus=2
set modeline
set modelines=5
set clipboard=unnamedplus,unnamed
set directory=R:\temp     " swapfile�̍쐬�ꏊ
set backupdir=D:\temp
set undofile              " �ēǍ��Avim�I������p������undo
set undodir=D:\temp
set nopaste               " for neocomplcache
syntax on                 " Enable syntax highlighting
" ------------------------ }}}
" * tab                   {{{
set expandtab
set tabstop=4             "Tab��������ʏ�̌����ڂŉ��������ɂ��邩�ݒ�
set shiftwidth=4          "�����ő}�������^�u�̕�
set softtabstop=4         "�^�u�̑���ɋ󔒂������Ƃ��̋󔒐��B0���Ɩ����B
" ------------------------ }}}
" * search                "{{{
set hlsearch 
set ignorecase
set incsearch
" ------------------------ }}}
" * statusline            "{{{
" via http://d.hatena.ne.jp/ruedap/touch/20110712/vim_statusline_git_branch_name
set statusline=%<          " �s����������Ƃ��ɐ؂�l�߂�ʒu
set statusline+=[%n]       " �o�b�t�@�ԍ�
set statusline+=%m         " %m �C���t���O
set statusline+=%r         " %r �ǂݍ��ݐ�p�t���O
set statusline+=%h         " %h �w���v�o�b�t�@�t���O
set statusline+=%w         " %w �v���r���[�E�B���h�E�t���O
set statusline+=%{'['.(&fenc!=''?&fenc:&enc).':'.&ff.']'}  " fenc��ff��\��
set statusline+=%y         " �o�b�t�@���̃t�@�C���̃^�C�v
set statusline+=\          " �󔒃X�y�[�X
if winwidth(0) >= 130      
  set statusline+=%F       " �o�b�t�@���̃t�@�C���̃t���p�X
else
  set statusline+=%t       " �t�@�C�����̂�
endif
set statusline+=%=         " ���񂹍��ڂƉE�񂹍��ڂ̋�؂�
set statusline+=%{fugitive#statusline()}  " Git�̃u�����`����\��
set statusline+=\ \        " �󔒃X�y�[�X2��
set statusline+=%1l        " ���s�ڂɃJ�[�\�������邩
set statusline+=/
set statusline+=%L         " �o�b�t�@���̑��s��
set statusline+=,
set statusline+=%c         " ����ڂɃJ�[�\�������邩
set statusline+=%V         " ��ʏ�̉���ڂɃJ�[�\�������邩
set statusline+=\ \        " �󔒃X�y�[�X2��
set statusline+=%P         " �t�@�C�����̉����̈ʒu�ɂ��邩
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
" �f�t�H���g��Markdown�`����
let QFixHowm_HowmMode     = 0
let QFixHowm_Title        = '#'
let suffix                = 'mkd'
let QFixHowm_UserFileType = 'markdown'
let QFixHowm_UserFileExt  = suffix
let howm_filename         = '%Y/%m/%Y-%m-%d-%H%M%S.'.suffix
let QFixHowm_DiaryFile    = 'diary/%Y/%Y-%m-%d.mkd'          " ���L�� diary�f�B���N�g���ɍ쐬
let qfixmemo_mapleader    = 'f'                              " g, �̑���
"let qfixmemo_folding      = 1                               " �t�H�[���f�B���O
"let qfixmemo_folding_pattern = '^#[^#]'                     "
"let howm_filename         = '%Y/%m/%Y-%m-%d-000000.'.suffix "�����t�@�C���Ŏg�p���鎞
let QFixHowm_Template = [
 \"%TITLE% %TAG%",
 \""
\]
"�N�C�b�N�����t�@�C�����ݒ�
"�f�t�H���g��fU�ł͒ʏ�̃N�C�b�N�����A
"1fu�ŃL�[�{�[�h�V���[�g�J�b�g���W�߂�����
let QFixHowm_QuickMemoFile  = "Qmem-00-0000-00-00-000000.mkd"
let QFixHowm_QuickMemoFile1 = "KeyboardShortcuts-0000000.mkd"

" ���̑�
"let mygrepprg                      = 'grep'    " �w�肷��Ƃ��܂������Ȃ�
let QFixHowm_ListReminder_ScheExt  = '[-@!]'    " fy�ŕ\�� ���}�C���_�A�\��A����
let QFixHowm_ListReminder_TodoExt  = '[-@+!~.]' " ft�őS��
let QFixHowm_ShowScheduleTodo      = 10           " ft fy f, �ł̕\������
let QFixHowm_ShowSchedule          = 10
let QFixHowm_ShowScheduleMenu      = 10
let QFixHowm_RemovePriorityDays    = 100          " 100���o�߂����\��E���}�C���_�͍폜
let QFixHowm_JpDayOfWeek           = 1            " ���{��̗j���\��
"let QFixHowm_VimEnterCmd          = 'y'          " �����񂾂������̗\��������\��
"let QFixHowm_VimEnterMsg          = 'today's tasks'
let QFixHowm_SwitchListActionLock  = ['{ }', '{-}', '{*}', '{_}']  " TODO���X�g�̎��
let QFixHowm_UserSwActionLock      = ['[ ]', '[:tech]', '[:vim]', '[:!go]', '[:!buy]', '[:finished]'] " �J�e�S���^�O
let QFixHowm_HolidayFile           = 'Sche-Hd-0000-00-00-000000.*'
let QFixHowm_ReminderPriority      = {'@' : 1, '!' : 1, '+' : 3, '-' : 4, '~' : 5, '.' : 6} " @��!�𓯂����т�
let QFixHowm_ReminderHolidayName   = '����\|���l�̓�\|�����L�O�̓�\|���a�̓�\|���@�L�O��\|�݂ǂ�̓�\|���ǂ��̓�\|�C�̓�\|�h�V�̓�\|�̈�̓�\|�����̓�\|�ΘJ���ӂ̓�\|�V�c�a����\|�t���̓�\|�H���̓�\|�U�֋x��\|�����̋x��\|���j��\|�y�j��'
" keymap
nmap fd :<C-U>call qfixmemo#InsertDate('Date')<CR><Right>
nmap fT :<C-U>call qfixmemo#InsertDate('Time')<CR><Right>
map  fF <ESC><Insert># finished todos
" insert action
nmap fa fT+<Space>
" ���Ƃ��� fa�Ƀ}�b�s���O����Ă�������(memo zenbu list)
nmap fz :<C-U>call qfixmemo#ListCmd()<CR>
" �^�C�g���s�������K�\���̎�����������
let QFixMRU_Title = {}
" MRU�Ń^�C�g���s�Ƃ݂Ȃ����K�\��(Vim�̐��K�\���Ŏw��)
let QFixMRU_Title['mkd']       = '^###[^#]'
" grep�Ń^�C�g���s�Ƃ݂Ȃ����K�\��(�g�p����grep�ɂ���Ă͕ύX����K�v������܂�)
let QFixMRU_Title['mkd_regxp'] = '^###[^#]'
" �O���u���E�U
let QFixHowm_OpenURIcmd        = '!start ' . $HOMEPATH . '\AppData\Local\Google\Chrome\Application\chrome.exe %s --disk-cache-dir="R:\Temp\Chrome"'
" ------------------------ }}}
" * unite                  {{{
"
" ���̓��[�h�ŊJ�n���Ȃ�
let g:unite_enable_start_insert=0
" �o�b�t�@�ꗗ
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
" �t�@�C���ꗗ
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
" ���W�X�^�ꗗ
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
" �ŋߎg�p�����t�@�C���ꗗ
nnoremap <silent> ,um :<C-u>Unite file_mru<CR>
" ��p�Z�b�g
nnoremap <silent> ,uu :<C-u>Unite buffer file_mru<CR>
" outline
nnoremap <silent> ,uo :<C-u>Unite outline<CR>
" twitter
nnoremap <silent> ,ut :<C-u>Unite tweetvim<CR>
" �S���悹
nnoremap <silent> ,ua :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file outline<CR>
" �E�B���h�E�𕪊����ĊJ��
au FileType unite nnoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
" �E�B���h�E���c�ɕ������ĊJ��
au FileType unite nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
" ESC�L�[��2�񉟂��ƏI������
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> q
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>q
" ------------------------ }}}
" * neocomplcache         {{{
" " see http://vim-users.jp/2010/10/hack177/
let g:neocomplcache_enable_at_startup            = 1 " Use neocomplcache.
let g:neocomplcache_enable_smart_case            = 1 " Use smartcase.(�啶�������͂����܂ő啶���������̋�ʂ𖳎�)
let g:neocomplcache_enable_camel_case_completion = 0 " camelCaseCompletion. FA�Ɠ��͂���ƁA�����ł�F*A*�̂悤�ɕϊ�����@�\ ����
let g:neocomplcache_enable_underbar_completion   = 1 " _��؂�̕⊮ �L����
let g:neocomplcache_min_syntax_length            = 3 " �V���^�b�N�X���L���b�V������Ƃ��̍ŏ�������
let g:neocomplcache_temporary_dir                = 'R:\Temp\.neocon'
" let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*' " ku.vim��fizzyfinder�ȂǁA�����̈���plugin�p �s�v
" Define dictionary. 
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell/command-history',
    \ }
" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
  let g:neocomplcache_keyword_patterns = {}
endif
" let g:neocomplcache_keyword_patterns['default'] = '\h\w*' "�L�[���[�h�p�^�[���̐ݒ�?

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

let g:neocomplcache_enable_auto_select = 1 " AutoComplPop like behavior.(�ŏ��̌���I��)

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

