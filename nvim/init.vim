" Basic settings -----{{{
echom "(>^.^<)"
let g:python3_host_prog = '/Users/ucasyfp/opt/anaconda3/bin/python3'
let mapleader="\<Space>"
let maplocalleader=","
set timeoutlen=500
syntax on
set laststatus=2
set number
set relativenumber
set wrap
set wildmenu
set hlsearch
exec "nohlsearch"



set incsearch
set ignorecase
set cursorline
set smartcase
set shortmess-=S "show search count message when searching, e.g. [1/5]"
set shortmess+=c
set nocompatible
filetype on
filetype indent on
filetype plugin on
set mouse=a
set encoding=utf-8
let &t_ut=' '
set expandtab " Substitute tab with whitespaces
set tabstop=4
set shiftwidth=4
set softtabstop=4
set list
set listchars=tab:▸\ ,trail:▫
set scrolloff=5
set tw=0
set indentexpr=
set backspace=indent,eol,start
set foldmethod=marker
set foldlevel=99
set conceallevel=2
set clipboard=unnamed
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
set laststatus=2
set autochdir " automatically change current working directory to the openned file, this makes changing cwd in NERDTree useless
set complete-=i
" set completeopt+=noinsert
" set completeopt+=noselect
set showcmd
"assumes set ignorecase smartcase
augroup dynamic_smartcase
    autocmd!
    autocmd CmdLineEnter : set nosmartcase
    autocmd CmdLineLeave : set smartcase
augroup END

autocmd FileType python map <buffer> <localleader>ll :w<CR>:exec '!python3' shellescape(@%, 1)<CR>

au TextYankPost * silent! lua vim.highlight.on_yank {higroup="IncSearch", timeout=400}
au TextYankPost * silent! lua vim.highlight.on_yank {on_visual=false}
au TextYankPost * silent! lua vim.highlight.on_yank()
" }}}
" Key mapping -----{{{
" swap jump and jump back
nnoremap <silent> z] zo]z
nnoremap <silent> z[ zo[z
nnoremap <silent> <c-o> <c-i>
nnoremap <silent> <c-i> <c-o>
nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>
vnoremap <silent> <leader> :<c-u>WhichKeyVisual '<Space>'<CR>
nnoremap <Leader>bp :bprev<Return>
nnoremap <Leader>bn :bnext<Return>
nnoremap <Leader>ve :split $MYVIMRC<cr>
nnoremap <Leader>vs :source $MYVIMRC<cr>
nnoremap <Leader>hn :nohl<cr>


" nnoremap J 5j
" nnoremap K 5k
nnoremap H ^
nnoremap L $
" }}}
" Vimscript file settings -----{{{
augroup filetype_vim
  autocmd!
  autocmd FileType vim setlocal foldmethod=marker
  autocmd FileType vim setlocal foldlevel=0
augroup END
" }}}
" vim-plug settings -----{{{
call plug#begin()
" fzf integration
" Plug '/usr/local/opt/fzf'
" Plug 'junegunn/fzf.vim'
Plug 'ctrlpvim/ctrlp.vim'
" Plug 'jiangmiao/auto-pairs'
" nerdtree/git -----{{{
Plug 'preservim/nerdtree' |
            \ Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'PhilRunninger/nerdtree-visual-selection'
Plug 'ryanoasis/vim-devicons'
function! StartifyEntryFormat()
    return 'WebDevIconsGetFileTypeSymbol(absolute_path) ." ". entry_path'
endfunction
nmap tt :<c-u>NERDTreeToggle<CR>
nmap tc :<c-u>NERDTreeCWD<CR>
" NERDTreeToggle behaves just as NERDTree when no tree is initialized for the current tab
" :tabedit<cr> create an empty buffer in a new tab with current cwd. since we set autochdir
" if we just open a new tab this way and initialize a tree, tree root will be cwd before.
" if we use tt for NERDTree command, then every time we tt, our tree root will be current file, but
" it will be a new tree, what will it cause? Some thing lost?




" Use NERDTreeCWD to open the tree in current file
" let NERDTreeMapOpenExpl = ""
" let NERDTreeMapUpdir = ""
" let NERDTreeMapUpdirKeepOpen = "l"
" let NERDTreeMapOpenSplit = ""
" let NERDTreeOpenVSplit = ""
" let NERDTreeMapActivateNode = "i"
" let NERDTreeMapOpenInTab = "o"
" let NERDTreeMapPreview = ""
" let NERDTreeMapCloseDir = "n"
" let NERDTreeMapChangeRoot = "y"

" ==
" == NERDTree-git
" ==
    
let g:NERDTreeGitStatusIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }
"}}}
"vim appearance -----{{{
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_theme='jellybeans'
Plug 'connorholyday/vim-snazzy'
Plug 'morhetz/gruvbox'
Plug 'dracula/vim'

"}}}
Plug 'andymass/vim-matchup'
Plug 'lervag/vimtex'
let g:matchup_override_vimtex = 1
let g:matchup_matchparen_deferred = 1
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" Plug 'SirVer/ultisnips'
" let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsJumpForwardTrigger="<tab>"
" let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
Plug 'neoclide/coc.nvim', {'tag':'v0.0.81'}
" Plug 'neoclide/coc.nvim', {'branch':'release'}
" Plug 'neoclide/coc.nvim', {'commit':'354c751'}
" Plug 'neoclide/coc.nvim', {'branch':'master'}
" Plug 'neoclide/coc.nvim', {'commit': 'a315ad6', 'do': 'yarn install --frozen-lockfile'}
Plug 'junegunn/vim-easy-align'
Plug 'liuchengxu/vim-which-key'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'liuchengxu/space-vim-theme'
Plug 'junegunn/seoul256.vim'
Plug 'ayu-theme/ayu-vim'
Plug 'mhinz/vim-startify'
let g:startify_bookmarks = ['~/.yabairc','~/.skhdrc' ,'~/tex documents/笔记/master.tex']
Plug 'kshenoy/vim-signature'
set signcolumn=number
call plug#end()
" }}}
" tex -----{{{
" ===
" === vimtex
" ===
let g:tex_flavor = 'latex'
let g:vimtex_view_method='skim'
" let g:vimtex_view_sioyek_exe='/Applications/sioyek.app/Contents/MacOS/sioyek'
" let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=2
let g:vimtex_quickfix_open_on_warning=0
let g:vimtex_quickfix_ignore_filters =[
	\'Package fontspec Warning',
	\'Overfull',
	\]

" }}}
" vim-easy-align -----{{{
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
" }}}
" coc-nvim settings -----{{{

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup 
set nowritebackup " Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable delays and poor user experience.
set updatetime=300
set cmdheight=2

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
inoremap <silent> <c-o> <c-o>:call coc#pum#stop()<CR>

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<cr>
function! s:show_documentation()
  if index(['vim', 'help'], &filetype) >= 0
    execute 'help ' . expand('<cword>')
  elseif &filetype ==# 'tex'
    VimtexDocPackage
  else
    call CocAction('doHover')
  endif
endfunction


inoremap <silent><expr> <TAB> 
\ pumvisible() ? coc#_select_confirm() :
  \ coc#expandableOrJumpable() ?  "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ coc#refresh()


function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <expr> <cr> pumvisible() ? coc#_select_confirm() : "\<CR>"
let g:coc_snippet_next = '<tab>'
let g:coc_snippet_prev = '<s-tab>'
" vmap <tab> <Plug>(coc-snippets-expand)
vmap <tab>  <Plug>(coc-snippets-select)
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

"}}}
" vim-which-key -----{{{
call which_key#register('<Space>', "g:which_key_map")
let g:which_key_map = {}
"
" The following can add nonexistent key mapping
let g:which_key_map['w'] = {
      \ 'name' : '+windows' ,
      \ 'w' : ['<C-W>w'     , 'other-window']          ,
      \ 'd' : ['<C-W>c'     , 'delete-window']         ,
      \ '-' : ['<C-W>s'     , 'split-window-below']    ,
      \ '|' : ['<C-W>v'     , 'split-window-right']    ,
      \ '2' : ['<C-W>v'     , 'layout-double-columns'] ,
      \ 'h' : ['<C-W>h'     , 'window-left']           ,
      \ 'j' : ['<C-W>j'     , 'window-below']          ,
      \ 'l' : ['<C-W>l'     , 'window-right']          ,
      \ 'k' : ['<C-W>k'     , 'window-up']             ,
      \ 'H' : ['<C-W>5<'    , 'expand-window-left']    ,
      \ 'J' : [':resize +5'  , 'expand-window-below']   ,
      \ 'L' : ['<C-W>5>'    , 'expand-window-right']   ,
      \ 'K' : [':resize -5'  , 'expand-window-up']      ,
      \ '=' : ['<C-W>='     , 'balance-window']        ,
      \ 's' : ['<C-W>s'     , 'split-window-below']    ,
      \ 'v' : ['<C-W>v'     , 'split-window-below']    ,
      \ '?' : ['Windows'    , 'fzf-window']            ,
      \ }

let g:which_key_map.b = {
      \ 'name' : '+buffer' ,
      \ '1' : ['b1'        , 'buffer 1']        ,
      \ '2' : ['b2'        , 'buffer 2']        ,
      \ 'd' : ['bd'        , 'delete-buffer']   ,
      \ 'f' : ['bfirst'    , 'first-buffer']    ,
      \ 'h' : ['Startify'  , 'home-buffer']     ,
      \ 'l' : ['blast'     , 'last-buffer']     ,
      \ 'n' : ['bnext'     , 'next-buffer']     ,
      \ 'p' : ['bprevious' , 'previous-buffer'] ,
      \ '?' : ['Buffers'   , 'fzf-buffer']      ,
      \ }

" }}}
"
"
"
color dracula
set termguicolors
hi! Normal ctermbg=NONE guibg=NONE
hi! Coneal ctermbg=NONE guibg=NONE
hi! Visual guifg=White guibg=LightBlue gui=none

lua << EOF
require'nvim-treesitter.configs'.setup {
    highlight = {
        enable = true,
        disable = {"latex"}
        },
    }
EOF
