# vim个人配置
## 安装vim

- ubuntu 系统
```shell
    sudo apt install vim
```

## 配置
- 引用gundo插件
```
    set rtp+=~/.vim/bundle/gundo/
    set rtp+=~/.vim/bundle/Vundle.vim
```

- 基本配置
```
    set nocompatible            " 不与Vi兼容(采用自己的操作命令)
    set number                  " 显示行号
    set ruler                   " 打开状态栏标尺
    set tabstop=4               " 设定 tab 长度为4
    set helplang=cn             " 设置帮助为中文
    set wildmenu                " vim 自身命令行模式智能补全
    set showmode                " 在底部显示，当前处于命令模式还是插入模式
    set nobackup                " 不创建备份文件
    set noswapfile              " 不创建交换文件
    set history=1000            " Vim 需要记住多少次历史操作
    set autoread                " 打开文件监视。如果在编辑过程中文件发生外部改变（比如被别的编辑器编辑了）
```

- 配色方案
```
    syntax enable
    syntax on "允许用指定语法高亮配色方案替换默认方案
    set background=dark
```

- 插件配置
```
    filetype off                            " 必须
    call vundle#begin()
    
    Plugin 'iamcco/markdown-preview.vim'   " markdown插件,可在浏览器预览
    Plugin 'Shougo/neocomplcache.vim'      " 自动补全
    Plugin 'msanders/snipmate.vim'         " 代码补全插件，输入if或for等按tab键自动补全
    
    call vundle#end()                      " 必须
    filetype plugin indent on              " 必须 加载vim自带和插件相应的语法和文件类型相关脚本
```

- vim插件之markdown-preview配置
```
    let g:mkdp_path_to_chrome = ""
    let g:mkdp_browserfunc = 'MKDP_browserfunc_default'
    let g:mkdp_auto_start = 0
    let g:mkdp_auto_open = 0
    let g:mkdp_auto_close = 1
    let g:mkdp_refresh_slow = 0
    let g:mkdp_command_for_global = 0
    nmap <silent> <F8> <Plug>MarkdownPreview        " for normal mode
    imap <silent> <F8> <Plug>MarkdownPreview        " for insert mode
    nmap <silent> <F9> <Plug>StopMarkdownPreview    " for normal mode
    imap <silent> <F9> <Plug>StopMarkdownPreview    " for insert mode
```
