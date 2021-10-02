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
Plug 'tpope/vim-commentary'
Plug 'cohama/lexima.vim'
Plug 'airblade/vim-gitgutter'
Plug 'preservim/nerdcommenter'
Plug 'ycm-core/YouCompleteMe'

" Git support
Plug 'tpope/vim-fugitive'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Languages support
Plug 'vim-syntastic/syntastic'
" LaTeX
Plug 'lervag/vimtex'
" Markdown
Plug 'jtratner/vim-flavored-markdown'
" Python
Plug 'vim-scripts/indentpython.vim'
Plug 'nvie/vim-flake8'
" Nginx conf files
Plug 'chr4/nginx.vim'

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
let g:syntastic_mode_map = { 'passive_filetypes': ['tex'] }

" gitgutter
set updatetime=100 " set refresh time to a smaller amount

" LaTeX
let g:vimtex_complete_enabled = 1
if !exists('g:ycm_semantic_triggers')
	let g:ycm_semantic_triggers = {}
endif
au VimEnter * let g:ycm_semantic_triggers.tex=g:vimtex#re#youcompleteme
autocmd FileType tex setlocal indentexpr=GetTeXIndent() " use LaTeX indentation

" Markdown

" Command autocompletion
set wildmenu
set wildmode=longest,list,full

" Themes
au ColorScheme * highlight BadWhitespace ctermbg=red guibg=red
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

"YouCompleteMe
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>

" Icons
set encoding=UTF-8

" Always show numbers
set number

" Set normal sidescroll
set nowrap
set sidescroll=1

" This is for better Python indentation as per
" https://realpython.com/vim-and-python-a-match-made-in-heaven/
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
au BufNewFile, BufRead *.py
	\ set textwidth=80

" Code folding
set foldmethod=indent
set foldlevel=99

" Flag trailing whitespace
highlight BadWhitespace ctermbg=red guibg=red
match BadWhitespace /\s\+$/
autocmd BufWinEnter * match BadWhitespace /\s\+$/
autocmd InsertEnter * match BadWhitespace /\s\+$/
autocmd InsertLeave * match BadWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" Enable usage of system clipboard (requires vim-x11 but I don't want to
" bother installing this just for p or yy to work)
"set clipboard=unnamedplus

" Shortcuts
" Nerd tree
map <C-n> :NERDTreeToggle<CR>
" Save
map <C-s> :w<CR>
" Undo
map <C-x> :u<CR>
" Switch between tabs
map <C-l> :tabn<CR>
" Map leader to space
nnoremap <space> <nop>
let mapleader=' '
" Code folding
map <leader>f za
