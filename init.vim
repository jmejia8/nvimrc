syntax on
set number
set clipboard+=unnamedplus
set tabstop=4
set shiftwidth=4

set expandtab
map <F2> :retab <CR> :w <CR>
nnoremap <C-Up> <Up>ddp<Up>
nnoremap <C-Down> ddp
""set guifont=DroidSansMono\ Nerd\ Font\ 11


call plug#begin()

Plug 'JuliaEditorSupport/julia-vim'
Plug 'tomasr/molokai'
Plug 'fmoralesc/molokayo'
Plug 'endel/vim-github-colorscheme'
Plug 'arcticicestudio/nord-vim'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'lambdalisue/session.vim'
""Plug 'lervag/vimtex'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'sheerun/vim-polyglot'
Plug 'phanviet/vim-monokai-pro'
Plug 'jpalardy/vim-slime'
Plug 'morhetz/gruvbox'

" nerd tree
Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'scrooloose/nerdcommenter'


call plug#end()

"----------------------------- NERDtree ----------------------------------------

" Configurac NERDtree
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Toggle
nnoremap <silent> <C-n> :NERDTreeToggle<CR>
" sync open file with NERDTree
" " Check if NERDTree is open or active
function! IsNERDTreeOpen()
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

" Call NERDTreeFind iff NERDTree is active, current window contains a modifiable
" file, and we're not in vimdiff
function! SyncTree()
  if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
    NERDTreeFind
    wincmd p
  endif
endfunction


" Highlight currently open buffer in NERDTree
"autocmd BufEnter * call SyncTree()
"let g:vimtex_compiler_progname = 'nvr'
" julia


inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O
tnoremap <Esc> <C-\><C-n>


colorscheme monokai_pro
set colorcolumn=90

noremap <Leader>y "*y
noremap <Leader>p "*p
noremap <Leader>Y "+y
noremap <Leader>P "+p

map <F5> :call RunJulia()<CR>
let g:term_id = -1
function RunJulia()
    let cmd = "include(\"" . expand('%:t') . "\")\n"

	if g:term_id == -1
		let g:term_id = str2nr(input("term job id: "))
	endif
    call jobsend(g:term_id, cmd)
    
endfunction
