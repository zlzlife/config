# tmux个人配置

## 安装
- ubuntu 系统
```shell
    sudo apt install tmux
```

## 命令大全

- 基本操作
```shell
    # 列出所有可以快捷和其运行的tmux命令
    tmux list-keys
    
    tmux list-commands
```

- session会话
```shell
    # 新开一个会话    
    tmux new -s [sessionName]
    
    # 重新开启会话
    tmux attach -t [sessionName]
```

## 快捷键

