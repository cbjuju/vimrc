"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SETTING OPTIONS BEGIN
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" No need to be compatible with vi 
set nocp 	

" For ease of vertical navigation 
set rnu
set number

" Syntax support for different languages 
syntax on
syntax enable

" Splitting to the right and below is more intuitive 
set splitright
set splitbelow

"colorscheme pulumi
colorscheme pablo

" Show the statusline at the bottom of the buffer using string interpolation
set laststatus=2          " Ensures that the status line will show up at the bottom
set statusline=%F         " Full path to the file. Lowercase f for relative path
set statusline+=\ -\      " Separator
set statusline+=%y        " Filetype of the file
set statusline+=%=        " Switch to the right side
set statusline+=%l	  " Current line
set statusline+=/	  " Separator
set statusline+=%L,	  " Total lines
set statusline+=%c        " Number of columns

" For indents that consist of 4 space characters but are entered by pressing the 
" tab key
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab

" Allows the user to see five lines below where the cursor is. If someone uses
" zt in normal mode then the current line under the cursor will not jump to the
" top but to five lines below the top. Similar with zb
set scrolloff=5

set incsearch
"highlight ColorColumn ctermbg=grey
"set colorcolumn=80
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SETTING OPTIONS END
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" KEY BINDINGS BEGIN
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = ","

" To write the buffer to the file from the homerow
inoremap <leader>w <esc>:w<cr>
nnoremap <leader>w <esc>:w<cr>

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
" shortcut to undo the above
nnoremap <leader>cfl bhxelx

" Surround plugin in visual mode - leaves you in normal mode after execution
vnoremap <leader>" <esc>`>a"<esc>`<i"<esc>`>f"
vnoremap <leader>' <esc>`>a'<esc>`<i'<esc>`>f'
vnoremap <leader>( <esc>`>a)<esc>`<i(<esc>`>f)
vnoremap <leader>{ <esc>`>a}<esc>`<i{<esc>`>f}
vnoremap <leader>[ <esc>`>a]<esc>`<i[<esc>`>f]
" shortcut to undo the above
vnoremap <leader>cfl <esc><esc>lx`<hxe

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
" The use of C-k below disables the use of digraphs but I don't see
" a use for digraphs for myself anyway so I am okay with this
inoremap <leader>m <C-\><C-N><C-w>h
inoremap <leader>j <C-\><C-N><C-w>j
inoremap <leader>k <C-\><C-N><C-w>k
inoremap <leader>. <C-\><C-N><C-w>l
nnoremap <leader>m <C-w>h
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>. <C-w>l

" for std::cout in cpp
autocmd filetype cpp nnoremap <leader>co i std::cout << "" << std::endl;<esc>0ci"
" for std::cin in cpp
autocmd filetype cpp nnoremap <leader>ci i std::cin >> ;<esc>i
" for adding curly braces
autocmd filetype cpp nnoremap <leader>br g^y0A {<esc>o<esc>pa}<esc>O<esc>pa
" for starting at the same indent on the next line
autocmd filetype cpp nnoremap cd g^y0o<esc>pa
" for starting at the same indent on the previous line
autocmd filetype cpp nnoremap dc g^y0O<esc>pa

" for block commenting in python
autocmd filetype python vnoremap <leader># <esc>`>o"""<esc>`<O"""<esc>}

" for block uncommenting in python
autocmd filetype python vnoremap <leader>3 <esc>`>dd`<dd}

" console log shortcut for javascript files
autocmd filetype javascript inoremap <leader>cl console.log()<esc>i

autocmd filetype plaintex inoremap <leader>lr <esc>:execute "normal i\\left(\\right)"<CR>%a

" Binding to delete the characters [200~ and [201~ at the beginning and end of
" text copied from the internet
nnoremap <leader>cl :s/\[200\~//<cr>:s/\[201\~//<cr>A
vnoremap <leader>cl :s/\[200\~\\|\[201\~//g<cr>

" Binding for toggling relative line numbers
nnoremap <leader>rn :set rnu!<cr>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" KEY BINDINGS END
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" AUTOCOMMANDS BEGIN
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" To save the current view and load it when the file is reopened "
" autocmd BufWinLeave *.* mkview
" autocmd BufWinEnter *.* silent loadview

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
    " search inside visually selected area for whatever expression is in the unnamed register
    " all the extra backslashes are to escape whatever comes after it
    execute "\/\\%V\\V".@"

    " array for holding the col nos. of all the matches
    let s:colNos = []

    " move to the first match to find the first col numeber of the visually selected area
    execute "normal! `<"
    let s:minCol = col(".")

    " move to the last match and record the line & col number
    execute "normal! '>".(s:minCol - 1)."ln"
    call add(s:colNos, col("."))
    let s:lastLine = line(".")
    " the line number of the last match is needed for stopping the loops

    " move to the first match and record col number
    execute "normal! '<"
    execute "normal! '<".(s:minCol - 1)."l"
    execute "normal! n"
"    call insert(s:colNos, col("."), -1)
"
"    " move to the second match to start recording all the matches
"    let s:scm = "normal! j"
"    ".(s:minCol - 1)."|n"
"    execute s:scm
"    echo s:scm
"
"    " loop to record the column numbers of all the matches
"    while line(".") < s:lastLine
"        call insert(s:colNos, col("."), -1)
"        execute "normal! j".s:minCol."|n"
"    endwhile
"
"    " maximum column number
"    let s:maxCol = max(s:colNos)
"    let s:maxmin = [s:minCol, s:maxCol]
"    echo s:maxmin
"
"    " Move to the first match to start the formatting process
"    execute "normal! '<".s:minCol."|n"
"
"    for s:col in s:colNos
""    for s:i in range(0, 0)
""        let s:col = s:colNos[s:i]
"        for s:space in range(s:col + 1, s:maxCol)
"            execute "normal! i "
"        endfor
"        execute "normal! j".s:minCol."|n"
"    endfor
endfunction
vnoremap <leader>f2 <esc>:call FormatWalaFunction2()<cr>
