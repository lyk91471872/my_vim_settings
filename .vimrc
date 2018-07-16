set nocompatible
highlight LineNr ctermfg=240
highlight LineNr ctermbg=233
set number

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'git://github.com/rkulla/pydiction.git'
Plugin 'git://github.com/scrooloose/nerdtree.git'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround' 
Plugin 'tpope/vim-repeat' 
Plugin 'easymotion/vim-easymotion' 

call vundle#end()
filetype plugin indent on

let g:pydiction_location = '~/.vim/bundle/pydiction/complete-dict'

map <S-r> :call CompileRunGcc()<CR>
    func! CompileRunGcc()
        exec "w"
        if &filetype == 'java'
            exec "!javac %"
            exec "!time java %<"
        elseif &filetype == 'sh'
            :!time bash %
        elseif &filetype == 'python'
            exec "!time python3 %"
        elseif &filetype == 'html'
            exec "!open %"
        elseif &filetype == 'markdown'
            exec "!open $(python3 ~/.vim/md2html.py %)"
            silent exec "!rm $(python3 ~/.vim/rmhtml.py %)"
        endif
    endfunc

nmap m <Plug>(easymotion-w)
nmap <S-m> <Plug>(easymotion-b)

set ts=4
set expandtab
%retab!

inoremap ( ()<Left>
inoremap [ []<Left>
inoremap { {}<Left>
inoremap < <><Left>

inoremap ' '<ESC>h"zx"z<S-p>l:call PairSingleQuote()<CR>a
    func! PairSingleQuote()
        if @z!='\'
            exec "normal! a'\<ESC>h"
        endif
    endfunc

inoremap " "<ESC>h"zx"z<S-p>l:call PairDoubleQuote()<CR>a
    func! PairDoubleQuote()
        if @z!='\'
            exec "normal! a\"\<ESC>h"
        endif
    endfunc

nnoremap <silent> q :NERDTreeToggle<CR>
nnoremap t q
