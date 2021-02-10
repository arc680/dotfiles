filetype on
filetype indent on
filetype plugin on

set encoding=utf-8

set expandtab "タブ入力を複数の空白入力に置き換える
set tabstop=4 "画面上でタブ文字が占める幅
set shiftwidth=4 "自動インデントでずれる幅
set softtabstop=4 "連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set autoindent "改行時に前の行のインデントを継続する
set smartindent "改行時に入力された行の末尾に合わせて次の行のインデントを増減
set showmatch
set showmode

set number
set list
set listchars=tab:»-,eol:↲,extends:»,precedes:«,nbsp:%

" 全角スペース・行末のスペース・タブの可視化
if has("syntax")
    syntax on

    " PODバグ対策
    syn sync fromstart

    function! ActivateInvisibleIndicator()
        " 下の行の"　"は全角スペース
        syntax match InvisibleJISX0208Space "　" display containedin=ALL
        highlight InvisibleJISX0208Space term=underline ctermbg=Blue guibg=darkgray gui=underline
        "syntax match InvisibleTrailedSpace "[ \t]\+$" display containedin=ALL
        "highlight InvisibleTrailedSpace term=underline ctermbg=Red guibg=NONE gui=undercurl guisp=darkorange
        "syntax match InvisibleTab "\t" display containedin=ALL
        "highlight InvisibleTab term=underline ctermbg=white gui=undercurl guisp=darkslategray
    endfunction
    augroup invisible
        autocmd! invisible
        autocmd BufNew,BufRead * call ActivateInvisibleIndicator()
    augroup END
endif

set backspace=start,eol,indent
"set cursorline
highlight CursorLine term=none cterm=none ctermfg=none ctermbg=darkgray

set laststatus=2
set statusline=%<%f\%m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%y%=%l,%c%V%8P
function! g:Date()
    return strftime("%x %H:%M:%S")
endfunction
set statusline+=\ \%{g:Date()}

vnoremap <silent> <C-p> "0p<CR>

command! Gcc call s:Gcc()
nmap <F6> :Gcc<CR>

function! s:Gcc()
    :w
    :!g++ % -o %.out
    :!%.out
        endfunction

        " ターミナルタイプによるカラー設定
        if &term =~ "xterm-256color" || "screen-256color"
            " 256色
            set t_Co=256
            set t_Sf=dm
            set t_Sb=dm
        elseif &term =~ "xterm-debian" || &term =~ "xterm-xfree86"
            set t_Co=16
            set t_Sf=dm
            set t_Sb=dm
        elseif &term =~ "xterm-color"
            set t_Co=8
            set t_Sf=dm
            set t_Sb=dm
        endif

"ポップアップメニューのカラーを設定
"hi Pmenu guibg=#666666
"hi PmenuSel guibg=#8cd0d3 guifg=#666666
"hi PmenuSbar guibg=#333333

" ハイライト on
syntax on
" 補完候補の色づけ for vim7
" hi Pmenu ctermbg=255 ctermfg=0 guifg=#000000 guibg=#999999
" hi PmenuSel ctermbg=blue ctermfg=black
hi PmenuSel cterm=reverse ctermfg=33 ctermbg=222 gui=reverse guifg=#3399ff guibg=#f0e68c
" hi PmenuSbar ctermbg=0 ctermfg=9
" hi PmenuSbar ctermbg=255 ctermfg=0 guifg=#000000 guibg=#FFFFFF

set nocompatible               " Be iMproved
filetype off

if version > 703
    if has('vim_starting')
        set runtimepath+=~/.vim/bundle/neobundle.vim
        let g:neobundle_default_git_protocol='git'
    endif

    call neobundle#begin(expand('~/.vim/bundle/'))

    " Let NeoBundle manage NeoBundle
    NeoBundleFetch 'https://github.com/Shougo/neobundle.vim.git'
    NeoBundle 'https://github.com/Shougo/neocomplcache.git'
    "NeoBundle 'git://github.com/Shougo/neosnippet.vim.git'
    NeoBundle 'https://github.com/Shougo/unite.vim.git'
    NeoBundle "https://github.com/Shougo/neocomplete.vim"
    "NeoBundleFetch 'Shougo/neobundle.vim'
    "NeoBundleFetch 'Shougo/neocomplcache'
    "NeoBundleFetch 'Shougo/unite.vim'


    " Recommended to install
    " After install, turn shell ~/.vim/bundle/vimproc, (n,g)make -f your_machines_makefile
    "NeoBundle 'Shougo/vimproc'

    " My Bundles here:
    "
    " Note: You don't set neobundle setting in .gvimrc!
    " Original repos on github
    "NeoBundle 'tpope/vim-fugitive'
    "NeoBundle 'Lokaltog/vim-easymotion'
    "NeoBundle 'rstacruz/sparkup', {'rtp': 'vim/'}
    " vim-scripts repos
    "NeoBundle 'L9'
    "NeoBundle 'FuzzyFinder'
    "NeoBundle 'rails.vim'
    " Non github repos
    "NeoBundle 'git://git.wincent.com/command-t.git'
    " gist repos
    "NeoBundle 'gist:Shougo/656148', {
    "      \ 'name': 'everything.vim',
    "      \ 'script_type': 'plugin'}
    " Non git repos
    "NeoBundle 'http://svn.macports.org/repository/macports/contrib/mpvim/'
    "NeoBundle 'https://bitbucket.org/ns9tks/vim-fuzzyfinder'

    call neobundle#end()
    " ...

    filetype plugin indent on     " Required!
    "
    " Brief help
    " :NeoBundleList          - list configured bundles
    " :NeoBundleInstall(!)    - install(update) bundles
    " :NeoBundleClean(!)      - confirm(or auto-approve) removal of unused bundles

    " Installation check.
    NeoBundleCheck


    "" neocomplcache
    " if_luaが有効ならneocompleteを使う
    NeoBundle has('lua') ? 'Shougo/neocomplete' : 'Shougo/neocomplcache'
    
    if neobundle#is_installed('neocomplete')
        " neocomplete用設定
        " Disable AutoComplPop.
        let g:acp_enableAtStartup = 0
        let g:neocomplete#enable_at_startup = 1
        let g:neocomplete#enable_ignore_case = 1
        let g:neocomplete#enable_smart_case = 1
        let g:neocomplete#sources#syntax#min_keyword_length = 3
        let g:neocomplete#lock_buffer_name_pattern = '¥*ku¥*'
        if !exists('g:neocomplete#keyword_patterns')
            let g:neocomplete#keyword_patterns = {}
        endif
        let g:neocomplete#keyword_patterns['default'] = '\h\w*
        inoremap <expr><C-g> neocomplete#undo_completion()
        inoremap <expr><C-l> neocomplete#complete_common_string()
    elseif neobundle#is_installed('neocomplcache')
        " neocomplcache用設定
        " Disable AutoComplPop.
        let g:acp_enableAtStartup = 0
        let g:neocomplcache_enable_at_startup = 1
        let g:neocomplcache_enable_ignore_case = 1
        let g:neocomplcache_sources#syntax#min_keyword_length = 3
        let g:neocomplcache_lock_buffer_name_pattern = '¥*ku¥*'
        let g:neocomplcache_enable_smart_case = 1
        if !exists('g:neocomplcache_keyword_patterns')
            let g:neocomplcache_keyword_patterns = {}
        endif
        let g:neocomplcache_keyword_patterns._ = '\h\w*'
        let g:neocomplcache_enable_camel_case_completion = 1
        let g:neocomplcache_enable_underbar_completion = 1
        inoremap <expr><C-g> neocomplcache_undo_completion()
        inoremap <expr><C-l> neocomplcahce_complete_common_string()
    endif
    inoremap <expr><TAB> pumvisible() ?  "\<C-n>" : "\<TAB>"
    inoremap <expr><S-TAB> pumvisible() ?  "\<C-p>" : "\<S-TAB>"

endif

" テンプレ挿入
autocmd BufNewFile *.cpp 0r $HOME/.vim/template/cpp.txt

" markupで閉じタグが入ればいいのに
augroup MyXML
    autocmd!
    autocmd Filetype xml inoremap <buffer> </ </<C-x><C-o>
    autocmd Filetype html inoremap <buffer> </ </<C-x><C-o>
    autocmd Filetype eruby inoremap <buffer> </ </<C-x><C-o>
augroup END
