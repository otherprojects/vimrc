""""""""""""""""""""""""""""""""""""""""""""""""
" HYUNWOOK SHIN VIM SHORT CUTS

""""""""""""""""""""""""""""""""""""""""""""""""
"BASICS
" Built-Ins -----------------------------------
" Ctrl + : Zoom in
" Ctrl - : Zoom out
"
" F-Keys----------------------------------------

" F2 (previous tab) 
" F3 (next tab) 
" F4 (new tab) 
" F5 (save all)
" F6 (repeat last command)
" F7 (repeat second last command)
" F8 (repeat third last command)
" F9 (Autocompletion)
" F10 (close no cascading)
" F12 (escape/close cascading)

"Movement----------------------------------------

 
"Insert Mode Movement" 

"       [UP   ]
"[LEFT] [DOWN ] [RIGHT]

"Normal Mode Movement
 
"         [  ; ]
" [  ,  ] [  . ] [ /  ]
"
"Note: Alt forces movement in normal mode
"
"          [  M ]
" [    SPACE    ]
"
" [   M ] UP * 5
" [SPACE] DOWN * 5
"
"
"Pane Switch------------------------------------ 
"
" [  ' ] switching to the right pane
" [  \ ] switching to the left pane 

"Numbers----------------------------------------

" <#>` go to that line number
" - open file

"Click------------------------------------------
" <double Click> insert
" <Right Click> autocompletion

"Shift------------------------------------------

" <SHIFT O> insert new line and escape
" <SHIFT U> bubble up a line
" <SHIFT D> bubble down a line
" <SHIFT P> duplicate a line 

"Other-------------------------------------------
" \        save all
" Enter    insert new line
" Delete   delete line
" H        open .vimrc
" 
"""""""""""""""""""""""""""""""""""""""""""""""""
" Open Vimrc

map  <C-H> <ESC>:e $HOME/.vimrc<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""
" make sure you have 256-color (echo $TERM)
set t_Co=256

"Customize colorscheme here (under .vim/colors)
colorscheme xoria256
":colorscheme darkblue

"""""""""""""""""""""""""""""""""""""""""""""""""
" Pathogen

execute pathogen#infect()
call pathogen#helptags() " generate helptags for everything in 'runtimepath'
syntax on
filetype plugin indent on

"""""""""""""""""""""""""""""""""""""""""""""""""
"NERDTree

function OpenNERDTree()
:let g:NERDTreeWinSize =20
:execute ":NERDTree"
endfunction

command -nargs=0 OpenNERDTree :call OpenNERDTree()
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p
:vsplit
:call feedkeys("\<C-W>l")
:call feedkeys(":set nowrap\<CR>")
:call feedkeys(":set nu\<CR>")
:call feedkeys(":e $HOME/.vimrc\<CR>")
:call feedkeys("\<C-W>h")
:vertical resize 120

""""""""""""""""""""""""""""""""""""""""""""""""""
"Pane
:set fillchars+=vert:\ 
:highlight VertSplit ctermbg=9 

"""""""""""""""""""""""""""""""""""""""""""""""""
" Basic setings

function BasicSettings()
:set guioptions+=T 
:set nocompatible
:set showtabline=2
:set backspace=2
:set nu
:set nowrap
:set mouse=a
:imap <F12> <ESC>
:imap <F5> <ESC>:wa<CR>
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""
" Windows map
function SetDocKeys()
:inoremap <C-C> <ESC>y<CR>
:inoremap <C-S> <ESC>:wa<CR>
:inoremap <C-Z> <ESC>u<CR>
:inoremap <C-P> <ESC>p<CR>

endfunction


"""""""""""""""""""""""""""""""""""""""""""""""""
"Mouse Options

function SetMouse()
:map <2-LeftMouse> i
:map <3-LeftMouse> tabn
endfunction


"""""""""""""""""""""""""""""""""""""""""""""""""
"Movement

"Move and move to insert mode"
:map <Down> ji
:map <Left> h 
:map <Right> li
:map <Up> ki

"Move in normal mode"
:map ; k
:map , h
:map / l
:map . j

"Express Movement
:map m kkkkk
:map <space> jjjjj

"Alt forces move in normal mode
:inoremap <A-;> <ESC>k
:inoremap <A-,> <ESC>h
:inoremap <A-/> <ESC>l
:inoremap <A-.> <ESC>j

"Switching pane
:map ' <C-W>h
:map \ <C-W>l

"""""""""""""""""""""""""""""""""""""""""""""""""
"tab short cuts, file open, close short cuts

:map <F6> <ESC>:wa<CR>
:map <F2> <ESC>:tabp<CR>
:map <F3> <ESC>:tabn<CR>
:map - <ESC>:e.<CR>

"Open in a new tab
:map = <ESC>:tabnew<CR>:vsplit<CR>:vertical resize 120<CR>:OpenNERDTree<CR><C-W>l<CR>:set nu<CR>:set nowrap<CR>:e.<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""
"open and close tabs <F12> allows cascading closure

:map <F4> <ESC>:tabnew<CR>:vsplit<CR>:vertical resize 120<CR>:OpenNERDTree<CR>\\<C-W>l:e.<CR>'<CR>
:map <F10> <ESC>:q<CR>
:map <F12> <ESC>:q!<CR>:q!<CR>:q!<CR>tabp<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""
"Go to <number>

function SetGoTo()
:nmap ` G
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""
"C style Indentation, Autocompletion and Highlight

function CStyle()
:set cindent
:set shiftwidth=4  
:syntax on
:inoremap <F9> <C-N>
:inoremap <RightMouse> <C-N>
endfunction

:call CStyle()


"""""""""""""""""""""""""""""""""""""""""""""""""
"Basic C++ Compilations
function SetCompilation()
:map <C-C> <ESC>:!g++ -o vim_compiled_target -ggdb *.cc > vim_compiled_logs;cat vim_compiled_logs;cat vim*logs<CR>
endfunction


""""""""""""""""""""""""""""""""""""""""""""""""""
"Text Edit Shortcuts

function EditShortcuts()
:nmap <S-U> <S-V>xkkp<ESC>
:nmap <S-D> ddp<ESC>			" bubble down line 
:nmap <S-0> o<ESC>		" create a new line
:nmap <CR> O<Down><ESC>		" enter new line
:nmap <S-P> <S-V>yp		" duplicate line
:nmap vv <S-V>			" highlight line
:map <BS> i<BS> 
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""
"Repeat first, second, third last commands over
function PreviousCommands()
:imap <F6> <ESC>:<Up><CR>
:imap <F7> <ESC>:<Up><Up><CR>
:imap <F8> <ESC>:<Up><Up><Up><CR>
endfunction


"""""""""""""""""""""""""""""""""""""""""""""""""
"Text Wrapping and Line

" See above for text wrapping
function TextWrapping()
:set tabstop=4
:highlight ColorColumn ctermbg=750
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""
" Auxilary

function CShortcuts()
:inoremap <c-N> #include
:inoremap <c-B> #include<
:inoremap <c-G> #ifndef
:inoremap <c-P> printf(
endfunction

function CPPShortcuts()
:inoremap <c-O> #include <iostream>
:inoremap <c-V> #include <vector>
:inoremap <c-S> #include <sstream>
:inoremap <c-F> #include <fstream>
:inoremap <c-L> endl;
endfunction
"""""""""""""""""""""""""""""""""""""""""""""""""
" Switches

:call BasicSettings()

:call SetDocKeys()

:call SetMouse()

:call SetGoTo()

:call SetCompilation()

:call EditShortcuts()

:call PreviousCommands()

:call TextWrapping()

:call CShortcuts()

:call CPPShortcuts()

