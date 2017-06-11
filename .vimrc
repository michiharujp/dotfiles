if &compatible
    set nocompatible
endif

let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
endif
execute 'set runtimepath^=' . s:dein_repo_dir

if dein#load_state(s:dein_dir)
    call dein#begin(s:dein_dir)

    call dein#add('Shougo/neocomplete.vim')
    call dein#add('w0ng/vim-hybrid')
    call dein#add('scrooloose/nerdtree')
    call dein#add('joshdick/onedark.vim')
    call dein#add('tomtom/tcomment_vim')
    call dein#add('nathanaelkane/vim-indent-guides')
    call dein#add('bronson/vim-trailing-whitespace')
    call dein#add('jistr/vim-nerdtree-tabs')
    call dein#add('itchyny/lightline.vim')
    call dein#add('othree/html5.vim')
    call dein#add('hail2u/vim-css3-syntax')
    call dein#add('jelera/vim-javascript-syntax')
    call dein#add('hokaccha/vim-html5validator')
    call dein#add('pasela/unite-webcolorname')
    call dein#add('mattn/emmet-vim')
    call dein#add('Shougo/unite.vim')
    call dein#add('tpope/vim-surround')
    call dein#add('cohama/lexima.vim')
    if dein#check_install()
        call dein#install()
    endif

    call dein#end()
    call dein#save_state()
endif

filetype plugin indent on
syntax enable

" 画面表示の設定
set number
set cursorline
set laststatus=2
set cmdheight=2
set showmatch
set helpheight=999
set list
set background=dark
colorscheme hybrid

" カーソル移動関連の設定
set backspace=indent,eol,start
set whichwrap=b,s,h,l,<,>,[,]
set scrolloff=8
set sidescrolloff=16
set sidescroll=1

" ファイル処理関連の設定
set confirm
set hidden
set autoread
set nobackup
set noswapfile

" 検索/置換の設定
set hlsearch
set incsearch
set ignorecase
set smartcase
set wrapscan
set path=~/**

" タブ/インデントの設定
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
set smartindent

" コマンドラインモードでTABキーによるファイル名補完を有効にする
set wildmenu
set wildmode=full
set history=1000

"ビープ音すべてを無効にする
set visualbell t_vb=
set noerrorbells

set pastetoggle=<F5>

" インデント色の初期設定
let g:indent_guides_enable_on_vim_startup = 1

" NEADTree
map <C-n> <plug>NERDTreeTabsToggle<CR>
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
    exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
    exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction
call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')

" ファイル移動時_キーマッピング
nnoremap s <nop>
nnoremap S <nop>
nnoremap <space> <Nop>
nnoremap <space>c <C-w>c
nnoremap <space>o <C-w>o
nnoremap <space>j <C-w>j
nnoremap <space>k <C-w>k
nnoremap <space>l <C-w>l
nnoremap <space>h <C-w>h
nnoremap <space>J <C-w>J
nnoremap <space>K <C-w>K
nnoremap <space>L <C-w>L
nnoremap <space>H <C-w>H
nnoremap <space>x <C-w>x
nnoremap <space>r <C-w>r
nnoremap <space>= <C-w>=
nnoremap <space>+ <C-w>+
nnoremap <space>- <C-w>-
nnoremap <space>< <C-w><
nnoremap <space>> <C-w>>
nnoremap <space>w <C-w>w
nnoremap <space>t :<C-u>tabnew<CR>
nnoremap <space>T <C-w>T

"行をみやすく
autocmd ColorScheme * highlight LineNr ctermfg = 244

" 数の増減を行う
nnoremap + <C-a>
nnoremap - <C-x>

" Emmetのキーバインド
imap <C-e> <C-y>,

" カーソル移動のキーマップ
nnoremap j gj
nnoremap gj j
nnoremap k gk
nnoremap gk k
nnoremap 0 g0
nnoremap g0 0
nnoremap ^ g^
nnoremap g^ ^
nnoremap $ g$
nnoremap g$ $
inoremap <C-h> <Left>
inoremap <C-l> <Right>

" yとdとcの範囲揃えにする
nnoremap Y v$y

" コマンドラインモードの移動設定
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
cnoremap <C-h> <Left>
cnoremap <C-l> <Right>

" バッファの移動
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>

" readonlyに強制書き込み
cnoremap <C-w><C-w> :<C-u>w<space>!sudo<space>tee<space>%<space>><space>/dev/null

" vimに矢印キーはいらない
inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>
nnoremap <Up> <Nop>
nnoremap <Down> <Nop>
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>
cnoremap <Up> <Nop>
cnoremap <Down> <Nop>
cnoremap <Left> <Nop>
cnoremap <Right> <Nop>

" 日本語ノーマルモードキーマップ
nnoremap あ a
nnoremap い i
nnoremap ｈ h
nnoremap ｊ j
nnoremap ｋ k
nnoremap ｌ l

augroup setAutoCompile
    autocmd!
    autocmd BufWritePost *.tex :!latexmk %:p
augroup END

" templateの召喚
nnoremap <F2> :read ~/.vim/template/%:e

" 末尾に;を追加する
nnoremap S A;<ESC>
