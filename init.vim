syntax on
set number
set numberwidth=1
set clipboard+=unnamedplus
set tabstop=4
set shiftwidth=4
set showcmd
set showmatch
set mouse=a
set cursorline
set spelllang=en spell

let mapleader=" "

set expandtab
map <F2> :retab <CR> :w <CR>


call plug#begin()

Plug 'JuliaEditorSupport/julia-vim'
Plug 'tomasr/molokai'
Plug 'fmoralesc/molokayo'
Plug 'endel/vim-github-colorscheme'
Plug 'arcticicestudio/nord-vim'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'lambdalisue/session.vim'
Plug 'lervag/vimtex'
Plug 'sheerun/vim-polyglot'
Plug 'morhetz/gruvbox'
Plug 'danilo-augusto/vim-afterglow'


" nerd tree
Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'scrooloose/nerdcommenter'


" snippets
Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'

" indent
Plug 'Yggdroot/indentLine'
" typst
Plug 'kaarmu/typst.vim'

" julia language server

call plug#end()




" Configurac NERDtree
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Toggle
nnoremap <silent> <C-n> :silent! NERDTreeToggle<CR>
nnoremap <silent> <C-k> :silent! NERDTreeFind<CR>
" sync open file with NERDTree
" " Check if NERDTree is open or active
function! IsNERDTreeOpen()
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

let g:vimtex_compiler_latexmk = {
            \ 'build_dir' : 'build',
            \ 'aux_dir' : 'build',
            \ 'out_dir' : 'build',
            \}


inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O
tnoremap <Esc> <C-\><C-n>

" Color scheme
colorscheme gruvbox
let light_mode=0

" color of julia
hi link juliaFunctionCall Identifier
let g:julia_highlight_operators=1
highlight link juliaOperator Keyword

set colorcolumn=90


noremap <Leader>y "*y
noremap <Leader>p "*p
noremap <Leader>Y "+y
noremap <Leader>P "+p

" Moving the cursor through long soft-wrapped lines
nnoremap <expr> j v:count ? 'j' : 'gj'
nnoremap <expr> k v:count ? 'k' : 'gk'


let g:go_snippet_engine = "automatic"

let g:UltiSnipsExpandTrigger="<tab>"
" Use tab to switch to the next trigger point, shit+tab the previous trigger point
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-tab>"
" Split the screen vertically when using the UltiSnipsEdit command
let g:UltiSnipsEditSplit="vertical"


let g:indentLine_char_list = ['┊', '┆','⋮', '│', '| ']

if light_mode == 1
  " light mode
  set background=light
  highlight Normal ctermfg=black ctermbg=white
  let g:indentLine_color_term = 'lightgray' " light mode only
endif


augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
augroup END
