# zsh个人配置
## 安装zsh

- ubuntu 系统
```shell
    sudo apt install zsh
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
    )
```
