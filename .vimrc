execute pathogen#infect()
"Keep the same level of indentation
set autoindent
"Collectively, these turn tab into 4 spaces
set tabstop=4 "A tab is 4 spaces
set shiftwidth=4 "An indent is 4 spaces
set softtabstop=4 "4 spaces when tab is pressed
set smarttab "Indent instead of tab at start of line
set expandtab "Spaces instead of tabs always
set shiftround "Round spaces to nearest shiftwidth module
"Not sure.
set showmatch
"Backspace goes back one indent
set backspace=indent,eol,start
"Always show the row, column
set ruler

set encoding=utf-8


"This splits the window when you type @s for easy reading
"Doesn't seem to cooperate with indent folding
let @s = 'vgg:set scrollbindlLzt:set scrollbindLh'

"Space toggles fold
nnoremap <space> za
"Space creates visually selected fold
vnoremap <space> zf

"Press <F5> in insert or normal mode to insert the datetime
:nnoremap <F5> "=strftime("%Y-%m-%d %R")<CR>P
:inoremap <F5> <C-R>=strftime("%Y-%m-%d %R")<CR>

"Python-style folding
autocmd Syntax python set foldmethod=indent
autocmd Syntax python normal zR
autocmd Syntax python %foldc
"Auto-indent for python, especially after : and so on.
autocmd Syntax python filetype plugin indent on
autocmd Syntax python set tabstop=4
autocmd Syntax python set shiftwidth=4
autocmd Syntax python set softtabstop=4

" in makefiles, don't expand tabs to spaces, since actual tab characters are
" needed, and have indentation at 8 chars to be sure that all indents are tabs
" (despite the mappings later):
autocmd FileType make set noexpandtab shiftwidth=8 softtabstop=0

autocmd Syntax coffee set tabstop=2
autocmd Syntax coffee set shiftwidth=2
autocmd Syntax coffee set softtabstop=2

au BufNewFile,BufRead Tupfile,*.tup setf tup

autocmd BufRead ~/journal/{today,inbox,soon,ever} set foldmethod=indent

autocmd BufRead ~/journal/gtd setfiletype gtd
autocmd Syntax gtd set foldmethod=indent
"Save folding state if exiting vim.  Note this is done regardless 
"of whether the file is saved.
"au BufWinLeave * mkview
"au BufWinEnter * silent loadview

"Set vim to use a centralized swap + backup directory instead of 
"having them put in the directory of the file being edited
set backupdir=~/.cache/vim,.
set directory=~/.cache/vim,.

"Disable viminfo file
set viminfo="NONE"

"Disable copy-psating with mouse
set mouse=r

"Make word wrap respect indents
set bri

"Add a command to print index cards
function LeafPrintLetter()
    call LeafYank()
    call system('iconv -f utf-8 -t iso-8859-1//TRANSLIT | enscript -X 88591 -fDejaVuSansMono@9 -FDejaVuSansMono@9 --no-header --margins=72:0:72:72 -M Letter -o - | /usr/bin/print', @0)
endfunction
function LeafPrintIndex()
    call LeafYank()
    call system('/usr/bin/print.index', @0)
endfunction
autocmd BufRead *.standard.leaves nnoremap <c-p> :call LeafPrintLetter()<CR>
autocmd BufRead *.letter.leaves nnoremap P :call LeafPrintLetter()<CR>
autocmd BufRead *.index.leaves nnoremap P :call LeafPrintIndex()<CR>

syntax on

"Eric's recommended rust commands
"nnoremap <leader>gb :GBrowse<CR>
"nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
"nnoremap <leader>gd :YcmCompleter GoToDeclaration<CR>

let g:ale_linters = {
\   'python': ['pylint'],
\   'go': ['go vet', 'go build'],
\   'javascript': ['eslint'],
\}

let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_enter = 0
let g:ale_lint_on_save = 1
let g:ycm_allow_changing_updatetime = 0
