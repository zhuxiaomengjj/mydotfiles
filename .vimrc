set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Bundle 'gmarik/Vundle.vim'

"my Bundle here:
"
" original repos on github

" Full path fuzzy file, buffer, mru, tag, ... finder for Vim.
" Bundle 'kien/ctrlp.vim'
"Bundle 'sukima/xmledit'
"Graph your Vim undo tree in style
"Bundle 'sjl/gundo.vim'
"Bundle 'jiangmiao/auto-pairs'
"The plugin contains all you need to develop python applications in Vim
Plugin 'klen/python-mode'
"A simple vim plugin for toggling the display of the quickfix list and the location-list.
"Plugin 'Valloric/ListToggle'
Plugin 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'
Plugin 'Valloric/YouCompleteMe'
"Plugin 'scrooloose/syntastic'
"Highlight on the fly
"Plugin 't9md/vim-quickhl'
" Plugin 'Lokaltog/vim-powerline'
"Plugin 'scrooloose/nerdcommenter'
"A better JSON for Vim: distinct highlighting of keywords vs values, JSON-specific (non-JS) warnings, quote concealing.
Plugin 'elzr/vim-json'
" glsl hilighter
Plugin 'tikhomirov/vim-glsl'
"..................................
" vim-scripts repos
"Plugin 'YankRing.vim'
"Plugin 'vcscommand.vim'
"Plugin 'ShowPairs'
"Plugin 'SudoEdit.vim'
"Plugin 'EasyGrep'
"Plugin 'VOoM'
"Plugin 'VimIM'
"Plugin 'octol/vim-cpp-enhanced-highlight'
" markdown render to browser on synchronously
Plugin 'suan/vim-instant-markdown'
" gradle file syntax highlighting
Plugin 'tfnico/vim-gradle'
Plugin 'kelan/gyp.vim'
"Plugin 'vim-scripts/Conque-GDB'
"let g:ConqueGdb_GdbExe = $GDB
"..................................
" non github repos
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
"Plugin 'file:///Users/zhuxiaomeng/.vim/local_plugins/helloworld'
"Plugin 'file:///Users/zhuxiaomeng/.vim/local_plugins/vimdbg'
"......................................
"Plugin 'scrooloose/nerdtree'
" All of your Plugins must be added before the following line

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""setting of nerdtree

let NERDTreeWinPos='left'
let NERDTreeWinSize=31
let NERDTreeChDirMode=1
"F8 打开nerdtree
map f8 :NERDTreeToggle /media/My_Documents/htdocs<CR>
"F7 新开一个tab标签
map f7 :tabnew<CR>
"F5 前一个tab标签
map f5 :tabp<CR>
"F6 后一个tab标签
map f6 :tabn<CR>

" settings of YouCompleteMe
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_config.py' "where to search for .ycm_extra_conf.py if not found
let g:ycm_confirm_extra_conf = 1 

" setting vim-cpp-enhanced-highlight
let g:cpp_class_scope_highlight = 1
let g:cpp_experimental_template_highlight = 1

call vundle#end()            " required
filetype plugin indent on    " required

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<tab>', '<Down>']
let g:ycm_key_list_previous_completion = ['<tab>', '<Up>']
let g:SuperTabDefaultCompletionType = '<s-tab>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" this mapping Enter key to <C-y> to chose the current highlight item
" and close the selection list, same as other IDEs.
" CONFLICT with some plugins like tpope/Endwise
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"


set nobackup
set noswapfile
"set backupdir=~/tmp
winpos 200 50
set lines=40 columns=108
colors lucius 

set guioptions-=T               " 删除工具栏
set tabstop=4                   " 设置tab键的宽度
set shiftwidth=4                " 换行时行间交错使用4个空格
set expandtab                   " 空格代替tab
set autoindent                  " 自动对齐
set backspace=2                 " 设置退格键可用
set cindent shiftwidth=4        " 自动缩进4空格
set smartindent                 " 智能自动缩进
set ai                          " 设置自动缩进
set nu                          " 显示行号
set guifont=Monaco:h13          " 设置字体
"set showmatch                   " 显示括号配对情况
set hlsearch                    " 开启高亮显示结果
set incsearch                   " 开启实时搜索功能
set nowrapscan                  " 搜索到文件两端时不重新搜索
set hidden                      " 允许在有未保存的修改时切换缓冲区
set nobackup                    " 设置无备份文件
set nocompatible                " 不使用vi兼容的模式
set clipboard=unnamed          " 使用系统的复制粘贴
if has('unnamedplus')
  set clipboard=unnamedplus     " Linux
else
  set clipboard=unnamed         " MacOS
endif
set cursorline                 " 突出显示当前行

syntax enable                   " 打开语法高亮
syntax on                       " 开启文件类型侦测
filetype on
filetype indent on
filetype plugin on              " 针对不同的文件类型加载对应的插件
autocmd! bufwritepost .vimrc source ~/.vimrc    " 保存.vimrc文件后自动加载
autocmd! BufNewFile,BufRead *.ino setlocal ft=arduino

"---------------------------------------------------
" cmake配置
"---------------------------------------------------
:autocmd BufRead,BufNewFile *.cmake,CMakeLists.txt,*.cmake.in runtime! ~/.vim/bundle/cmake/indent/cmake-indent.vim
:autocmd BufRead,BufNewFile *.cmake,CMakeLists.txt,*.cmake.in setf cmake
:autocmd BufRead,BufNewFile *.ctest,*.ctest.in setf cmake
:au BufRead,BufNewFile *.md set filetype=markdown

