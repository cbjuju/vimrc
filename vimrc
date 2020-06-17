"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SETTING OPTIONS BEGIN
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" No need to be compatible with vi "
set nocp 	

" For ease of vertical navigation "
set number
set rnu

" Syntax support for different languages "
syntax on
syntax enable

" Splitting to the right and below is more intuitive "
set splitright
set splitbelow

" Show the statusline at the bottom of the buffer using string interpolation
set laststatus=2          " Ensures that the status line will show up at the bottom
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
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab

" Allows the user to see five lines below where the cursor is
set scrolloff=5

" Set column 80 to a different colour
let &colorcolumn=join(range(81,999),",")
highlight ColorColumn ctermbg=235 guibg=#2c2d27
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SETTING OPTIONS END
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" KEY BINDINGS BEGIN
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = ","

" To have ,w for saving a file while in insert mode
inoremap <leader>w <esc>:w<cr>
nnoremap <leader>w <esc>:w<cr>
vnoremap <leader>w <esc>:w<cr>

" To save and quit vim using leader key
nnoremap <leader>q <esc>:wq<cr>
inoremap <leader>q <esc>:wq<cr>

" Key binding to open up vimrc for a quick edit
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
" Key binding to source vimrc after a quick edit
nnoremap <leader>sv :source $MYVIMRC<cr>

" To create two new lines above the current line and enter insert mode
nnoremap <leader>o o<esc>o<esc>i
" To create two new lines below the current line and enter insert mode
nnoremap <leader>O O<esc>O<esc>i
" move the current line down by one line by pressing -
nnoremap - ddp   
" move the current line up by one line by pressing _
nnoremap _ ddkP  

" Add a semicolon to the end of the line 
nnoremap <leader>; mqA;<esc>`q
" delete two lines at the same time but recover them one at a time
nnoremap <leader>d ddi<C-G>u<esc>dd

" Surround plugin in normal mode - leaves you in normal mode after execution
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel
nnoremap <leader>' viw<esc>a'<esc>bi'<esc>lel
nnoremap <leader>( viw<esc>a)<esc>bi(<esc>lel
nnoremap <leader>{ viw<esc>a}<esc>bi{<esc>lel
nnoremap <leader>[ viw<esc>a]<esc>bi[<esc>lel

" Surround plugin in visual mode - leaves you in normal mode after execution
vnoremap <leader>" <esc>`>a"<esc>`<i"<esc>`>f"
vnoremap <leader>' <esc>`>a'<esc>`<i'<esc>`>f'
vnoremap <leader>( <esc>`>a)<esc>`<i(<esc>`>f)
vnoremap <leader>{ <esc>`>a}<esc>`<i{<esc>`>f}
vnoremap <leader>[ <esc>`>a]<esc>`<i[<esc>`>f]

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

" for block commenting in python
autocmd filetype python vnoremap <leader># <esc>`>o"""<esc>`<O"""<esc>}

" for block uncommenting in python
autocmd filetype python vnoremap <leader>3 <esc>`>dd`<dd}

" console log shortcut for javascript files
autocmd filetype javascript inoremap <leader>cl console.log()<esc>i

" Bindings to interchange the character written in one line with the character 
" in the line below, specifically for writing guitar tabs.
" has plenty of edge cases where it fails
" move the current character down by one line by pressing -
nnoremap s- xjphxkhpj
" move the current character up by one line by pressing _
nnoremap s_ xkphxjhpk

" Binding to delete the characters [200~ and [201~ at the beginning and end of
" text copied from the internet
nnoremap <leader>l :s/\[200\~//<cr>:s/\[201\~//<cr>A
vnoremap <leader>l :s/\[200\~\\|\[201\~//g<cr>
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
let shebangline = "#!".python3path
autocmd BufNewFile *.py execute "0put = shebangline"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" AUTOCOMMANDS END
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! FormatWalaFunction1()
    " Move to the line at the start of the visually selected area
    execute "normal! '<"

    " Create a list that holds the col nos of the equals signs
    let l:eqSignPos = []

    " Loop over all lines to get the col nos of the equals signs
    for l:i in range(line("'<"), line("'>"))
        execute "normal! 0f="
        call add(l:eqSignPos, col("."))
        execute "normal! j"
    endfor

    " Get the max value of the cols of the equals signs
    let l:maxEqCol = max(eqSignPos)

    " Go back to the beginning of the visually selected area
    execute "normal! '<"

    for l:colno in l:eqSignPos
        let l:indentSpaces = ""

        for l:k in range(l:colno + 1, l:maxEqCol)
            let l:indentSpaces = l:indentSpaces." "
        endfor

        execute "normal! 0f=i".l:indentSpaces
        execute "normal! j"
    endfor
endfunction

vnoremap <leader>f1 <esc>:call FormatWalaFunction1()<cr>

function! FormatWalaFunction2()
    " search for whatever expression is in register s
    execute "\/\\%V\\V".@"

    " array for holding the col nos. of all the matches
    let l:colNos = []

    " move to the last match and record the line & col number
    execute "normal! GN"
    call add(l:colNos, col("."))
    let l:lastLine = line(".")
    " the line number of the last match is needed for stopping the loops

    " move to the first match and record col number
    execute "normal! ggn"
    call insert(l:colNos, col("."), -1)

    " move to the second match to record all the matches
    execute "normal! n"

    while line(".") < l:lastLine
        call insert(l:colNos, col("."), -1)
        execute "normal! n"
    endwhile

    let l:maxCol = max(l:colNos)

    execute "normal! ggn"
    echo l:colNos

    for l:col in l:colNos
        for l:space in range(l:col + 1, l:maxCol)
            execute "normal! i "
        endfor
        execute "normal! En"
    endfor
endfunction

vnoremap <leader>f2 <esc>:call FormatWalaFunction2()<cr>
