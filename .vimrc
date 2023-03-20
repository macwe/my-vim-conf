"
" elemeta 的配置文件
" elemeta@foxmail.com
"
"vim-plug {{
    call plug#begin('~/.vim/pluged')
        Plug 'airblade/vim-gitgutter'
        Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
        Plug 'majutsushi/tagbar'
        Plug 'vim-airline/vim-airline'
        Plug 'kien/ctrlp.vim'
        Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
        Plug 'rust-lang/rust.vim'
    call plug#end()
"}}

"通用配置 {{
    set nocompatible            " be iMproved, required
    set history=1000             " 保存的历史记录条目
    set bs=2                    " 在insert模式下用退格键删除
    set showmatch               " 代码匹配
    set laststatus=2            " 总是显示状态行
    set expandtab               " 以下三个配置配合使用，设置tab和缩进空格数
    set shiftwidth=4
    set tabstop=4
    set cursorline              " 为光标所在行加下划线
    set number                  " 显示行号
    set autoread                " 文件在Vim之外修改过，自动重新读入
    set nowrap                  " 禁止折行

    set incsearch               " Makes search act like search in modern browsers
    set ignorecase              " 检索时忽略大小写
    set smartcase               " When searching try to be smart about cases
    set encoding=utf8
    set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936 "使用utf-8或gbk打开文件
    set ffs=unix,dos,mac        " Use Unix as the standard file type
    set hls                     " 检索时高亮显示匹配项
    set paste                   " 外部粘贴时保存原格式

    syn on                      " 语法支持
    syntax enable               " 语法高亮

    filetype plugin on
    
    " Turn backup off, since most stuff is in SVN, git et.c anyway...  set nobackup
    set nowb
    set noswapfile

    " :W sudo saves the file
    " (useful for handling the permission-denied error)
    command W w !sudo tee % > /dev/null

    "conf for tabs, 为标签页进行的配置，通过ctrl h/l切换标签等
    let mapleader = ','
    nnoremap <C-l> gt
    nnoremap <C-h> gT
    nnoremap <leader>t : tabe<CR>
    
    "窗口分割配置 {
        map <C-j> <C-w>j
        map <C-k> <C-w>k
        map <C-h> <C-w>h
        map <C-l> <C-w>l
        " 使用'+'或'-'调整窗口大小
        map + <C-W>+
        map - <C-W>-
    "}

"}}

" 插件配置 {{

    "文件浏览器
    "NERDTree {
        " 开关文件浏览器
        nmap <F2> :NERDTreeToggle <CR>
        let NERDTreeDirArrows=0
	    let NERDTreeShowHidden=1
        " Quit nerdtree if it's the last open
	    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
    "}

    "代码导航
    "Taglist {
        imap <F3> :TagbarToggle <CR>
        map <F3> :TagbarToggle <CR>
        let g:tagbar_width = 40  "设置宽度， 默认为40
        "autocmd VimEnter * nested :call tagbar#autoopen(1) "打开vim时自动打开
        let g:tagbar_right = 1 "在右侧
        let g:tagbar_sort = 0 "关闭排序
    "}

    "Airline {
        set laststatus=2    " Always show the statusline
        let g:airline_powerline_fonts = 1
    "}

    "Get Gutter {
        highlight clear SignColumn
        let g:gitgutter_max_signs = 99999
    "}

    "Ctags {
        set tags=tags;/   " 搜索上一级建立的tag
    "}
    
    "vim-go {
        " 保存文件的时候格式化代码并自动解决包依赖
        let g:go_fmt_command = "goimports"
    "}
"}}

