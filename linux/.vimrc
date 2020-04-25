set number
set autochdir
set backspace=indent,eol,start


syntax on
" Turn beeping off
set noeb vb t_vb=

" Effective tab while editing
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smartindent

set cursorline
set noswapfile
" Incremental search
set incsearch

filetype indent on

set wildmenu


" Splits settings
set splitbelow splitright
" Remap splits navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l


" Highlight matching brackets [{()}]
set showmatch


" Automatic installation of vim-plugged, plug-in manager
if empty(glob('~/.vim/autoload/plug.vim'))
      silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
          \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'scrooloose/nerdtree'         
"Plug 'klen/python-mode'
Plug 'vim-python/python-syntax'
Plug 'dracula/vim', {'as':'dracula'}

call plug#end()

autocmd FileType python map <buffer> <F9> :w<CR>:exec '!python' shellescape(@%, 1)<CR> 
autocmd FileType python imap <buffer> <F9> <esc>:w<CR>:exec '!python' shellscape(@%, 1)<CR>

let g:python_highlight_all = 1

autocmd vimenter * NERDTree
nmap <F6> :NERDTreeToggle<CR>
let NERDTreeQuitInOpen=1
let NERDTreeShowBookmarks=1


colorscheme dracula
