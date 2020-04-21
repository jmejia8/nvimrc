syntax on
set number
set clipboard+=unnamedplus
set tabstop=4
set shiftwidth=4

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
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'sheerun/vim-polyglot'
Plug 'phanviet/vim-monokai-pro'
Plug 'jpalardy/vim-slime'



call plug#end()


let g:vimtex_compiler_progname = 'nvr'
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
