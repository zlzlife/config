# tmux个人配置

### 安装
- ubuntu系统
```shell
    sudo apt install tmux
```

- mac系统
```shell
     brew install tmux
```

### 命令大全

- 基本操作
```shell
    # 列出所有可以快捷和其运行的tmux命令
    tmux list-keys
    
    # 列出所有命令
    tmux list-commands
```

- session会话
```shell
    # 新开一个会话    
    tmux new -s [sessionName]
    
    # 重新开启会话
    tmux attach -t [sessionName]
```

### 快捷键 (prefix见 .tmux.conf)

| 功能 | 按键 |
| -- | -- |
| 上下分屏 | prefix + " |
| 左右分屏 | prefix + % |
| 区域全屏 | prefix + z |
