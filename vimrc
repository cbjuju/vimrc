""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" PLUGINS BEGIN
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"" Using junegunn/vim-plug to manage plugins
call plug#begin('~/.vim/plugged')

" renaming files from inside vim                             
Plug 'danro/rename.vim'
" automatically alternate of the pair of a bracket or a quote
Plug 'jiangmiao/auto-pairs'
" making block comments easier                               
Plug 'tpope/vim-commentary'
" highlight the text that was just yanked                    
Plug 'machakann/vim-highlightedyank'
" nice statusline                                            
Plug 'itchyny/lightline.vim'
" Formatting
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" project navigation
Plug 'preservim/nerdtree'
" Base library for all lua plugins
Plug 'nvim-lua/plenary.nvim'
" Fuzzy finder
Plug 'nvim-telescope/telescope.nvim'
" For changing things like surrounding inverted commas and html tags
Plug 'tpope/vim-surround'

call plug#end()
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" PLUGINS END
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Credit joshdick
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

let g:table_mode_corner_corner='+'
let g:table_mode_header_fillchar='='

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" SETTING OPTIONS BEGIN
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"" For ease of vertical navigation 
set rnu
set number

"set shiftwidth=4 tabstop=4 softtabstop=4 expandtab autoindent smartindent smarttab

"set scrolloff=2
"set noshowmode

set nohlsearch
set incsearch

"set clipboard=unnamedplus

set undodir=~/.vimdid
set undofile

"let g:UltiSnipsExpandTrigger="<tab>"
"" list all snippets for current filetype
"let g:UltiSnipsListSnippets="<c-l>"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" SETTING OPTIONS END
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" KEY BINDINGS BEGIN
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = ","

" Key binding to open up vimrc for a quick edit
nnoremap <leader>erc :vsplit ~/.vimrc<cr>
" Key binding to source vimrc after a quick edit
nnoremap <leader>src :source ~/.vimrc<cr>

" To create two new lines above the current line and enter insert mode
nnoremap <leader>o o<esc>o<esc>i
" To create two new lines below the current line and enter insert mode
nnoremap <leader>O O<esc>O<esc>i

" Add a semicolon to the end of the line 
nnoremap <leader>; mqA;<esc>`q
" delete two lines at the same time but recover them one at a time
nnoremap <leader>d ddi<C-G>u<esc>dd

"" Binding to delete the characters [200~ and [201~ at the beginning and end of
"" text copied from the internet
"nnoremap <leader>cl :s/\[200\~//<cr>:s/\[201\~//<cr>A
"vnoremap <leader>cl :s/\[200\~\\|\[201\~//g<cr>

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Remaps for tab navigation
nnoremap <silent> <C-t> :tabnext<CR>
nnoremap <silent> <C-S-t> :tabprevious<CR>
" Shift to next tab from terminal mode
tnoremap <silent> <C-t> <C-\><C-N>:tabnext<CR>
tnoremap <silent> <C-T> <C-\><C-N>:tabprevious<CR>

" Remaps for switching windows
tnoremap <C-w>h <C-\><C-N><C-w>h
tnoremap <C-w>j <C-\><C-N><C-w>j
tnoremap <C-w>k <C-\><C-N><C-w>k
tnoremap <C-w>l <C-\><C-N><C-w>l

nnoremap <leader>n :NERDTree<CR>
nnoremap <silent> <C-n> :bnext<CR>
nnoremap <silent> <C-p> :bprevious<CR>

nnoremap <silent> <F1> :NERDTreeToggle<CR>
nnoremap <silent> <F8> :TagbarToggle<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" KEY BINDINGS END
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Make sure folds are saved after I quit a buffer
augroup AutoSaveFolds
    autocmd!
    autocmd BufWinLeave *.* mkview
    autocmd BufWinEnter *.* silent! loadview
augroup END

au BufNewFile,BufRead *.py set tabstop=4
au BufNewFile,BufRead *.py set softtabstop=4
au BufNewFile,BufRead *.py set shiftwidth=4
au BufNewFile,BufRead *.py set textwidth=79
au BufNewFile,BufRead *.py set expandtab
au BufNewFile,BufRead *.py set autoindent
au BufNewFile,BufRead *.py set fileformat=unix

"Cool files. Only for the Stanford compiler course.
au BufNewFile,BufRead *.cl set ft=cool

"Next bit of code is to change the colorscheme of the lightline plugin
let g:lightline = {
      \ 'colorscheme': 'selenized_black',
      \ }
colorscheme molokai
set cursorline

lua << EOF
-- your lua code here
EOF

