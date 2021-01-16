call plug#begin('~/.vim/plugged')

Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'morhetz/gruvbox'
Plug 'arcticicestudio/nord-vim'
Plug 'itchyny/lightline.vim'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'dhruvasagar/vim-table-mode'
Plug 'gyim/vim-boxdraw'

Plug 'preservim/nerdcommenter'

Plug 'mattn/emmet-vim'
Plug 'lervag/vimtex'

Plug 'tpope/vim-fugitive'

call plug#end()

let mapleader = " "

let g:pymode_indent = 0

" |--------------|
" | Vim-fugitive |
" |--------------|

nnoremap <leader>gs :G<CR>
nnoremap <leader>gf :diffget //2<CR>
nnoremap <leader>gj :diffget //3<CR>
nnoremap <leader>gc :Gcommit<CR>

" |--------|
" | VimTex |
" |--------|

let g:tex_flavor = 'lualatex'

" |----------------|
" | Nerd Commenter |
" |----------------|

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1

" |-----------|
" | Vim Table |
" |-----------|

let g:table_mode_corner='+'

function! s:isAtStartOfLine(mapping)
  let text_before_cursor = getline('.')[0 : col('.')-1]
  let mapping_pattern = '\V' . escape(a:mapping, '\')
  let comment_pattern = '\V' . escape(substitute(&l:commentstring, '%s.*$', '', ''), '\')
  return (text_before_cursor =~? '^' . ('\v(' . comment_pattern . '\v)?') . '\s*\v' . mapping_pattern . '\v$')
endfunction

inoreabbrev <expr> <bar><bar>
          \ <SID>isAtStartOfLine('\|\|') ?
          \ '<c-o>:TableModeEnable<cr><bar>' : '<bar><bar>'
inoreabbrev <expr> __
          \ <SID>isAtStartOfLine('__') ?
          \ '<c-o>:silent! TableModeDisable<cr>' : '__'

" |-----|
" | Coc |
" |-----|


" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=100

"" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" GoTo code navigation.
nmap <silent> gr <Plug>(coc-references)

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" |-----------|
" | lightline |
" |-----------|

let g:lightline = {
	\ 'active': {
	\   'left': [ [ 'mode', 'paste' ],
	\             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
	\ },
	\ 'component_function': {
	\   'cocstatus': 'coc#status'
	\ },
	\ }

autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()

" |-------|
" | Emmet |
" |-------|

" Enable only for html/css
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

" Change trigger key
let g:user_emmet_leader_key=','

" |--------|
" | Normal |
" |--------|

" TextEdit might fail if hidden is not set.
set hidden

" let g:palenight_terminal_italics=1
set termguicolors
set background=dark
colorscheme dracula
set t_Co=256

set noshowmode
set noruler
set laststatus=2
set noshowcmd
" set cmdheight=1

" Set the vertical split character to  a space (there is a single space after '\ ')
set fillchars+=vert:\|

syntax on
" set cursorline
set mouse=a
set completeopt-=preview
" set noerrorbells

" Use spaces instead of tabs
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab

set smartindent
set nowrap
set number relativenumber

" Case insensitive search
set ignorecase
set smartcase

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup
set noswapfile
set undodir=~/.vim/undodir
set undofile
set incsearch
filetype plugin indent on
" set autoindent
set clipboard=unnamedplus
set colorcolumn=79
set tw=79
set fo-=t
set guicursor=i-ci:block-icursor,r-cr:block-rcursor

set nohlsearch
set hidden
set scrolloff=8

" nnoremap <C-[> :tabp<CR>
" nnoremap <C-]> :tabn<CR>

nnoremap <C-h> :wincmd h<CR>
inoremap <C-h> <Esc>:wincmd h<CR>i
nnoremap <C-j> :wincmd j<CR>
inoremap <C-j> <Esc>:wincmd j<CR>i
nnoremap <C-k> :wincmd k<CR>
inoremap <C-k> <Esc>:wincmd k<CR>i
nnoremap <C-l> :wincmd l<CR>
inoremap <C-l> <Esc>:wincmd l<CR>i
nnoremap <leader>x :NERDTreeToggle<CR>
nnoremap <leader>= :vertical resize +10<CR>
nnoremap <leader>- :vertical resize -10<CR>
nnoremap <leader>p :Files<CR>
tnoremap <Esc> <C-\><C-n>

" Easier moving of codeblocks
vnoremap < <gv
vnoremap > >gv

nmap <leader>/ :noh<CR>
nnoremap <leader>i :!$TERM &<CR><CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

autocmd FileType html inoremap <buffer> {% {%%}<Left><Left><Space><Space><Left>
autocmd FileType html inoremap <buffer> {{ {{}}<Left><Left><Space><Space><Left>

autocmd FileType htmldjango inoremap <buffer> {% {%%}<Left><Left><Space><Space><Left>
autocmd FileType htmldjango inoremap <buffer> {{ {{}}<Left><Left><Space><Space><Left>
autocmd FileType htmldjango inoremap <buffer> <leader>r :setf html<CR>:setf htmldjango<CR>

autocmd FileType python inoremap <buffer> ,,c class **(object):<Enter><Enter>
            \def __init__(self, **):<Enter>**<Esc>3<Up>0f*c2<Right>
autocmd FileType python inoremap <buffer> ,,f def **(**):<Enter>**

autocmd filetype rust inoremap <buffer> ,,f fn **(**) {<Enter>**<Enter>}
autocmd filetype rust inoremap <buffer> ,,p println!("**");<Esc>F*ci"

inoremap <C-c> <Esc>/\*\*<CR>:noh<CR>c2<Right>

hi icursor guibg=#00ff00 guifg=#000000
hi rcursor guibg=#ff0000 guifg=#000000
hi normal guibg=None
