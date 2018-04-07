"colorscheme molokai
set encoding=utf-8
set nocompatible    " 去掉讨厌的有关vi一致性模式，避免以前版本的一些bug和局限
set foldenable      " 允许折叠
syntax on           " 语法高亮
set cursorline      " 用浅色高亮当前行  
set cuc             " 用浅色高亮当前列
set ruler           " 显示标尺 
set number
set hlsearch        " 搜索结果高亮
syntax on           " 语法高亮
set autoindent
set showcmd
set showmatch       "高亮显示匹配的括号
set matchtime=5     " 匹配括号高亮的时间（单位是十分之一秒）
set cmdheight=3
set laststatus=2
set tabstop=4       " 制表符的宽度
set sw=4
"set lbr
"set fo+=mB
"set sm
"set smarttab
set expandtab
set smartindent     " 开启新行时使用智能自动缩进
"nmap <tt> :%retab!  <CR>
" 快捷键tab变为空格
nmap tt :%s/\t/    /g<CR> 
set ignorecase      " 在搜索的时候忽略大小写
set helplang=cn     " 使用中文帮助文档
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on
set history=100
set autoread
set nobackup
set nowb
set noswapfile
"set mouse=a
"set mousemodel=popup
set selection=exclusive
"set selection=inclusive
"set selectmode=mode,key


set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'andrewstuart/vim-kubernetes'
Bundle 'tpope/vim-fugitive'
Bundle 'JSON.vim'
Bundle 'tpope/vim-surround.git'
Bundle 'altercation/vim-colors-solarized'
Bundle 'Valloric/YouCompleteMe'
Bundle 'taglist.vim'
" #####TlistToggle Configure
nmap <F3> :TlistToggle  <CR>
let Tlist_Show_One_File=1     "不同时显示多个文件的tag，只显示当前文件的    
let Tlist_Exit_OnlyWindow=1   "如果taglist窗口是最后一个窗口，则退出vim   
let Tlist_Ctags_Cmd="/usr/bin/ctags" "将taglist与ctags关联 
let Tlist_Use_Right_Window="1"
let Tlist_Exit_OnlyWindow=1
" #####TlistToggle Configure

" #####NERDTreeToggle Configure
Bundle 'scrooloose/nerdtree'
nmap <F2> :NERDTreeToggle  <CR>
" NERDTree.vim
let g:NERDTreeWinPos="left"
let g:NERDTreeWinSize=40
let g:NERDTreeShowLineNumbers=1
let g:neocomplcache_enable_at_startup = 1
let g:NERDTreeHidden=0
let NERDTreeShowHidden=1

autocmd vimenter * if !argc()|NERDTree|endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" #####NERDTreeToggle Configure

Bundle 'ctrlp.vim'
Bundle 'vim-syntastic/syntastic'
Bundle 'airblade/vim-gitgutter'
Bundle 'vim-airline/vim-airline'
Bundle 'vim-airline/vim-airline-themes'
" #####vim-airline Configure
set laststatus=2
let g:airline_theme="luna"
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#branch#enabled=1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline_detect_spelllang=1
let g:airline_detect_iminsert=1
let g:airline_symbols_ascii = 1
"设置切换Buffer快捷键"
nnoremap <C-N> :bn<CR>
nnoremap <C-M> :bp<CR>
" #####vim-airline Configure
Bundle 'mhinz/vim-signify'

Bundle 'EasyGrep'

"新建.c,.h,.sh,.java文件，自动插入文件头 
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.rb,*.java,*.py exec ":call SetTitle()" 
""定义函数SetTitle，自动插入文件头 
func SetTitle() 
    "如果文件类型为.sh文件 
    if &filetype == 'sh' 
        call setline(1,"#!/usr/bin/env bash") 
	    call append(line(".")+1, "")
    elseif &filetype == 'python'
        call setline(1,"#!/usr/bin/env python")
        call append(line("."),"# -*- coding:utf8 -*-")
	    call append(line(".")+1, "")
    elseif &filetype == 'ruby'
        call setline(1,"#!/usr/bin/env ruby")
        call append(line("."),"# encoding: utf-8")
	    call append(line(".")+1, "")
    endif
    if &filetype == 'cpp'
        call append(line(".")+10, "#include<iostream>")
        call append(line(".")+11, "using namespace std;")
        call append(line(".")+12, "")
    endif
    if &filetype == 'c'
        call append(line(".")+10, "#include<stdio.h>")
        call append(line(".")+11, "")
    endif
	if expand("%:e") == 'h'
		call append(line(".")+10, "#ifndef _".toupper(expand("%:r"))."_H")
		call append(line(".")+11, "#define _".toupper(expand("%:r"))."_H")
		call append(line(".")+12, "#endif")
	endif
	if &filetype == 'java'
		call append(line(".")+10,"public class ".expand("%:r"))
		call append(line(".")+11,"")
	endif
    
endfunc
"新建文件后，自动定位到文件末尾
autocmd BufNewFile * normal G
