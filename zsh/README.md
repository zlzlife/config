# zsh个人配置
## 安装zsh

- ubuntu 系统
```shell
    sudo apt install zsh
```

- mac 系统
```shell
    brew install zsh
```

- 安装.oh-my-zsh
```bash
    # curl 方式:    
    sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" 

    #wget 方式:
    sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)" 
```

## 配置
- 插件
    - [extract](https://github.com/robbyrussell/oh-my-zsh/tree/master/plugins/extract)
    - [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting.git)
    - [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
    - [fzf-zsh](https://github.com/Wyntau/fzf-zsh.git)
    - [git-open](https://github.com/paulirish/git-open)

```
    # extract 解析zip包
    # zsh-syntax-highlighting 语法高亮显示
    # zsh-autosuggestions 自动补全
    plugins=(
      # 解析
      extract
      # 高亮显示
      zsh-syntax-highlighting
      # 自动补全
      zsh-autosuggestions
      # 历史智能提示 crt+r
      fzf-zsh
      # git 网页查看
      git-open
    )
```
