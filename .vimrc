call plug#begin('~/.vim/plugged')

Plug 'drewtempelmeyer/palenight.vim'
Plug 'morhetz/gruvbox'
Plug 'arcticicestudio/nord-vim'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-easymotion.vim'

Plug 'dhruvasagar/vim-table-mode'

Plug 'preservim/nerdcommenter'

call plug#end()

let mapleader = " "

" AIrline configuraion

" Enable aitline
" let g:airline#extensions#tabline#enabled = 1

" Set formatter
" let g:airline#extensions#tabline#formatter = 'default'

" Set theme
" let g:airline_theme='onedark'

"--Incsearch
" map / <Plug>(incsearch-easymotion-/)
" map ? <Plug>(incsearch-easymotion-?)
" map g/ <Plug>(incsearch-easymotion-stay)
" 
" highlight EasyMotionTarget guifg=#e6f81c
" 
" "--EasyMotion config
" let g:EasyMotion_startofline = 0 " keep cursor column when JK motion

" You can use other keymappings like <C-l> instead of <CR> if you want to
" use these mappings as default search and sometimes want to move cursor with
" EasyMotion.

let g:palenight_terminal_italics=1
" let g:gruvbox_contrast_dark='hard'
set termguicolors
colorscheme palenight
set t_Co=256
" colorscheme gruvbox
set background=dark
syntax on
" set cursorline
set mouse=a
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nowrap
set number relativenumber
set ignorecase
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
filetype plugin indent on
"set autoindent
set clipboard=unnamedplus
" set colorcolumn=70


nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>x :NERDTree<CR>
nnoremap <leader>= :vertical resize +5<CR>
nnoremap <leader>- :vertical resize -5<CR>
nnoremap <leader>p :Files<CR>

nmap <leader>/ :noh<CR>

autocmd FileType python map <buffer> <F5> :w<CR>:!clear;python %<CR>
autocmd FileType python imap <buffer> <F5> <Esc>:w<CR>:!clear;python %<CR>
autocmd FileType c map <buffer> <F5> :w<CR>:!clear;gcc % -Wall -o %<.out<CR>
autocmd FileType c imap <buffer> <F5> <Esc>:w<CR>:!clear;gcc -Wall % -o %<.out<CR>
autocmd FileType c map <buffer> <F6> :!clear;./%<.out<CR>
autocmd FileType c imap <buffer> <F6> <Esc>:!clear;./%<.out<CR>
autocmd FileType cpp map <buffer> <F5> :w<CR>:!clear;g++ -std=c++11 -Wall % -o %<<CR>
autocmd FileType cpp imap <buffer> <F5> <Esc>:w<CR>:!clear;g++ -std=c++11 -Wall % -o %<<CR>
autocmd FileType cpp map <buffer> <F6> :!clear;./%<<CR>
autocmd FileType cpp map <buffer> <F6> :!clear;./%<<CR>
map <F4> :w<CR>:!clear;chmod +x %;./%<CR>
imap <F4> <Esc>:w<CR>:!clear;chmod +x %;./%<CR>

