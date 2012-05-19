colorscheme vividchalk
map <silent> <LocalLeader>nt :NERDTreeToggle<CR>
map <silent> <LocalLeader>nr :NERDTree<CR>
map <silent> <LocalLeader>ch :HighlightColumnAdd<CR>
map <silent> <LocalLeader>co :HighlightColumnOne<CR>
map <silent> <LocalLeader>cc :HighlightColumnOff<CR>
set number
set shiftwidth=2
set tabstop=2
set expandtab
set nowrap
set incsearch
set hlsearch

silent !mkdir -p /tmp/vim
set dir=/tmp/vim//
filetype plugin indent on
syntax on

" Highlight hamlc as haml
au BufRead,BufNewFile *.hamlc set ft=haml

" Highlight trailing whitespace
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd BufRead,InsertLeave * match ExtraWhitespace /\s\+$/
" Set up highlight group & retain through colorscheme changes
highlight ExtraWhitespace ctermbg=red guibg=red
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red

" Highlight too-long lines
autocmd BufRead,InsertEnter,InsertLeave * 2match LineLengthError /\%76v.*/
highlight LineLengthError ctermbg=yellow guibg=gold4
autocmd ColorScheme * highlight LineLengthError ctermbg=yellow guibg=gold4

" Make ack reasonable
let g:AckCmd = 'ack --ignore-dir=tmp --ignore-dir=log'
set statusline=
set statusline+=%<\                       " cut at start
set statusline+=%-40f\                    " relative path
set statusline+=%=                        " seperate between right- and left-aligned
set statusline+=%1*%y%*%*\                " file type
set statusline+=%10(L(%l/%L)%)\           " line
set statusline+=%2(C(%v/125)%)\           " column

