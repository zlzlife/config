# vim个人配置
### 安装vim

- ubuntu 系统
```shell
    sudo apt install vim
```

### 配置
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

- vim插件之nerdtree配置
```
    " 显示或关闭tree
    nmap <silent> <F2> :NERDTreeToggle<CR>
    imap <silent> <F2> :NERDTreeToggle<CR>
    
    " 获取焦点
    nmap <silent> <C-f> :NERDTreeFocus<CR>
    imap <silent> <C-f> :NERDTreeFocus<CR>
    
    " 刷新NERDTree
    nmap <silent> <F5> :NERDTreeRefreshRoot<CR>
    imap <silent> <F5> :NERDTreeRefreshRoot<CR>
    
    " 当不带参数打开Vim时自动加载项目树
    autocmd StdinReadPre * let s:std_in=1
    autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
    
    " 当所有文件关闭时关闭项目树窗格
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
    
    " 开启vim时,自动弹出NERDTree
    " autocmd vimenter * NERDTree
    
    " 不显示这些文件
    let NERDTreeIgnore=['node_modules', '\.idea', '\.git'] "ignore files in NERDTree
    
    " 不显示项目树上额外的信息，例如帮助、提示什么的
    let NERDTreeMinimalUI=1
    
    " 显示行号
    " let NERDTreeShowLineNumbers=1
    let NERDTreeAutoCenter=1
    
    " 是否显示隐藏文件
    let NERDTreeShowHidden=1
    
    " 目录收起图标
    let g:NERDTreeDirArrowExpandable = '▸'
    
    " 目录展开图标
    let g:NERDTreeDirArrowCollapsible = '▾'
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
### vim插件
- [nerdtree](https://github.com/scrooloose/nerdtree)
- [markdown-preview](https://github.com/iamcco/markdown-preview.vim)

### 快捷键说明
- 复制选定快: **Y**
- 复制当前行: **YY**
- 剪切选定快: **D**
- 删除当前行: **DD**
- 删除当前字符: **X**
- 还原上一个操作: **U**

### 自定义快捷键
- 弹出NERDTree: **F2**
- 刷新NERDTree: **F5**
- Markdown预览: **F8**
- Markdown关闭预览: **F9**
- NERDTree获取焦点: **Ctl+F**

