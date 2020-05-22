""""""""""""""""""""""""""""""""""""""""""
" Basic Vim configuration optimized for	 "
" good looks, prose writing (with LaTeX) "
" and web development.					 "
" 										 "
" Made with love by Jakub Piskiewicz	 "
" 										 "
""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""
" PLUGINS SECTION "
"""""""""""""""""""

" Plugin directory
call plug#begin('~/.vim/plugged')

" Plugins

" Utility
Plug 'scrooloose/nerdtree'
Plug 'Valloric/YouCompleteMe'
Plug 'tpope/vim-commentary'
Plug 'cohama/lexima.vim'

" Git support
Plug 'tpope/vim-fugitive'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Languages support
Plug 'vim-syntastic/syntastic'
" LaTeX
Plug 'lervag/vimtex'
" Markdown
Plug 'jtratner/vim-flavored-markdown'
" TypeScript
Plug 'leafgarland/typescript-vim'
Plug 'ianks/vim-tsx'

" Visuals and UI
Plug 'arcticicestudio/nord-vim'
Plug 'itchyny/lightline.vim'
Plug 'ryanoasis/vim-devicons'

" End of plugins
call plug#end()

"""""""""""""""""""""""""
" CONFIGURATION SECTION "
""""""""""""""""""""""""

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" LaTeX
let g:vimtex_complete_enabled = 1
if !exists('g:ycm_semantic_triggers')
	let g:ycm_semantic_triggers = {}
endif
au VimEnter * let g:ycm_semantic_triggers.tex=g:vimtex#re#youcompleteme

" Markdown

" Command autocompletion
set wildmenu
set wildmode=longest,list,full

" Themes
colorscheme nord
let g:nord_cursor_line_number_background = 1
" higlight current line
set cursorline

" Cursor shape changing
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"

" Lightline
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

" NERDTree
let NERDTreeShowHidden=1 " Show hidden files

" Icons
set encoding=UTF-8

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
