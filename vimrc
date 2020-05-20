"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SETTING OPTIONS BEGIN
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" No need to be compatible with vi "
set nocp 	

" For ease of vertical navigation "
set number
set rnu

" Syntax support for different languages "
syntax enable

" Splitting to the right and below is more intuitive "
set splitright
set splitbelow

" Show the statusline at the bottom of the buffer using string interpolation
" set laststatus=2          " Show that the status line will show up at the bottom
" set statusline=%F         " Full path to the file. Lowercase f for relative path
" set statusline+=\ -\      " Separator
" set statusline+=FileType: " Label
" set statusline+=%y        " Filetype of the file
" set statusline+=%=        " Switch to the right side
" set statusline+=%l	  " Current line
" set statusline+=/	  " Separator
" set statusline+=%L,	  " Total lines
" set statusline+=%c        " Number of columns

" For indents that consist of 4 space characters but are entered by pressing the 
" tab key
set tabstop=8 softtabstop=0 expandtab  smarttab
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SETTING OPTIONS END
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" KEY BINDINGS BEGIN
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = ","

" To have ,w for saving a file while in insert mode
inoremap <leader>w <esc>:w<cr>
nnoremap <leader>w <esc>:w<cr>
vnoremap <leader>w <esc>:w<cr>

" Key binding to open up vimrc for a quick edit
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
" Key binding to source vimrc after a quick edit
nnoremap <leader>sv :source $MYVIMRC<cr>

" move the current line down by one line by pressing -
nnoremap <leader>j ddp   
" move the current line up by one line by pressing _
nnoremap <leader>k ddkP  

" Surround plugin in normal mode - leaves you in normal mode after execution
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>le
nnoremap <leader>' viw<esc>a'<esc>bi'<esc>le
nnoremap <leader>( viw<esc>a)<esc>bi(<esc>le
nnoremap <leader>{ viw<esc>a}<esc>bi{<esc>le
nnoremap <leader>[ viw<esc>a]<esc>bi[<esc>le

" Surround plugin in visual mode - leaves you in normal mode after execution
vnoremap <leader>" <esc>`>a"<esc>`<i"<esc>`>
vnoremap <leader>' <esc>`>a'<esc>`<i'<esc>`>
vnoremap <leader>( <esc>`>a)<esc>`<i(<esc>`>
vnoremap <leader>{ <esc>`>a}<esc>`<i{<esc>`>
vnoremap <leader>[ <esc>`>a]<esc>`<i[<esc>`>

" To replace $ with ,4 for operator pending motions
onoremap <leader>4 $

" To replace $ with ,4 for moving to the end of line
nnoremap <leader>4 $
vnoremap <leader>4 $

" To relieve stress on the left hand 
inoremap jk <esc>
" To force the use of the above mapping
inoremap <esc> <nop>

" Key bindings to make navigation between split windows easier "
inoremap <C-h> <C-\><C-N><C-w>h
inoremap <C-j> <C-\><C-N><C-w>j
inoremap <C-k> <C-\><C-N><C-w>k
inoremap <C-l> <C-\><C-N><C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Keybinding to comment out a visually selected block of code in python
 autocmd filetype python vnoremap <leader>m <S-i>#<esc>

" Bindings to interchange the character written in one line with the character 
" in the line below, specifically for writing guitar tabs.
" has plenty of edge cases where it fails
" move the current character down by one line by pressing -
nnoremap s- xjphxkhpj
" move the current character up by one line by pressing _
nnoremap s_ xkphxjhpk

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" KEY BINDINGS END
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" AUTOCOMMANDS BEGIN
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" To save the current view and load it when the file is reopened "
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview

" To create python files with the shebang already at the top
let python3path = system("which python3")
let shebangline = "#! ".python3path
autocmd BufNewFile *.py execute "0put = shebangline"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" AUTOCOMMANDS END
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
