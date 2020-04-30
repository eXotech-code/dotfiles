"""""""""""""""""""
" PLUGINS SECTION "
"""""""""""""""""""

" Plugin directory
call plug#begin('~/.vim/plugged')

" Plugins

" Utility
Plug 'scrooloose/nerdtree'
Plug 'Valloric/YouCompleteMe'

" Git support
Plug 'tpope/vim-fugitive'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Languages support
" LaTeX
Plug 'lervag/vimtex'
" TypeScript
Plug 'leafgarland/typescript-vim'
Plug 'ianks/vim-tsx'

" Visuals and UI
Plug 'arcticicestudio/nord-vim'
Plug 'itchyny/lightline.vim'

" End of plugins
call plug#end()

"""""""""""""""""""""""""
" CONFIGURATION SECTION "
""""""""""""""""""""""""

" LaTeX configuration
let g:vimtex_complete_enabled = 1
if !exists('g:ycm_semantic_triggers')
	let g:ycm_semantic_triggers = {}
endif
au VimEnter * let g:ycm_semantic_triggers.tex=g:vimtex#re#youcompleteme

" Command autocompletion
set wildmenu
set wildmode=longest,list,full

" Themes configuration
colorscheme nord
let g:nord_cursor_line_number_background = 1
" higlight current line
set cursorline

" Lightline configuration
set laststatus=2
if !has('gui_running')
	set t_Co=256
endif
set noshowmode

" TODO: Get branch name and add  symbol to it

let g:lightline = {
	\ 'colorscheme': 'nord',
	\ 'separator': { 'left': '', 'right': '' },
	\ 'subseparator': { 'left': '', 'right': '' },
	\ 'active': {
	\   'left': [ [ 'mode', 'paste' ],
	\             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
	\ },
	\ 'component_function': {
	\   'gitbranch': 'FugitiveHead'
	\ },
	\ }

" Always show numbers
set number

" Set normal sidescroll
set nowrap
set sidescroll=1

" Set tab size
set tabstop=4

" Shortcuts
" Nerd tree
map <C-n> :NERDTreeToggle<CR>
" Save
map <C-s> :w<CR>
" Undo
map <C-x> :u<CR>
" Switch between tabs
map <C-l> :tabn<CR>
