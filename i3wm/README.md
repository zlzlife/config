# i3wm个人配置
## 安装i3wm

- ubuntu 系统
```shell
    sudo apt install i3
```

## 安装配置应用软件
- 截图软件,使用 [flameshot](https://flameshot.js.org/) ubuntu18.04以上系统可安装
```shell
    sudo apt install flameshot 
```

- 锁屏软件 [i3lock](https://github.com/i3/i3lock)
```shell
    sudo apt install i3lock
```

- 图片浏览器 [feh](https://wiki.archlinux.org/index.php/Feh)
```shell
    sudo apt install feh
```

## 配置
- 设置功能键,一般配置的是**windows**键或**super**键, alt键在配置中写作**mod1**,回车键**Enter**写作**Return**
```shell
    set $mod Mod4   #配置windows键写法
    set $mod mod1   #配置alt键写法 
```

- 打开终端 **$mod** + **回车**
```shell
    bindsym $mod+Return exec --no-startup-id i3-sensible-terminal
```

- 打开桌面菜单 **$mod** + **d**
```shell
    bindsym $mod+d exec --no-startup-id i3-dmenu-desktop
```

- 重新加载i3配置 **$mod** + **Shift** + **c**
```shell
    bindsym $mod+Shift+c reload
```

- 重启i3 **$mod** + **Shift** + **r**
```shell
    bindsym $mod+Shift+r restart
```

- 退出i3 **$mod** + **Shift** + **e**
```shell
    bindsym $mod+Shift+e exec "i3-nagbar -t warning -m 'You pressed the exit shortcut. Do you really want to exit i3? This will end your X session.' -b 'Yes, exit i3' 'i3-msg exit'"
```

- 截图 **ctrl** + **$mod** + **a**
```shell
    bindsym --release Control+$mod+a exec "flameshot gui"
```

- 锁屏 **$mod** + **l**
```shell
    # 锁住屏幕,执行背景图
    bindsym $mod+l exec "i3lock -i $HOME/files/img.jpg"
    
    # 锁住屏幕,使用模糊图片, 这个要安装 scrot 
    bindsym $mod+l exec "scrot /tmp/lockscreen.png && mogrify -scale 50% -gaussian-blur 0x4 -gamma 0.8 -scale 200% /tmp/lockscreen.png && i3lock -i /tmp/lockscreen.png"
```

- 音量调节 **$mod** + **F12,F11,F10**
```shell
    # 音量+5%
    bindsym $mod+F12 exec amixer set Master 5%+
    # 音量-5%
    bindsym $mod+F11 exec amixer set Master 5%-
    # 静音,取消静音
    bindsym $mod+F10 exec amixer set Master toggle
```

- 开启一个工作区 **$mod** + (**1** ~ **0**)
```shell
    bindsym $mod+1 workspace 1
    bindsym $mod+2 workspace 2
    bindsym $mod+3 workspace 3
    bindsym $mod+4 workspace 4
    bindsym $mod+5 workspace 5
    bindsym $mod+6 workspace 6
    bindsym $mod+7 workspace 7
    bindsym $mod+8 workspace 8
    bindsym $mod+9 workspace 9
    bindsym $mod+0 workspace 10
```

- 移动到某个工作区 **$mod** + **Shift** + (**1** ~ **0**)
```shell
    bindsym $mod+Shift+1 move container to workspace 1
    bindsym $mod+Shift+2 move container to workspace 2
    bindsym $mod+Shift+3 move container to workspace 3
    bindsym $mod+Shift+4 move container to workspace 4
    bindsym $mod+Shift+5 move container to workspace 5
    bindsym $mod+Shift+6 move container to workspace 6
    bindsym $mod+Shift+7 move container to workspace 7
    bindsym $mod+Shift+8 move container to workspace 8
    bindsym $mod+Shift+9 move container to workspace 9
    bindsym $mod+Shift+0 move container to workspace 10
```

- 状态栏配置
```shell
    bar {
        status_command i3status

        # 状态栏位置 bottom top
        position bottom

        # 隐藏 hide
        # mode hide

        # 工作区按钮
        workspace_buttons yes

        # 状态栏颜色
        colors {
            background #285477
            statusline #dedede
            separator #2d2d2d
            focused_workspace #636e88 #285de7 #dedfdg
            active_workspace #556677 #234567 #56ef67
            inactive_workspace #636d72 #2d2d2d #dedede
            urgent_workspace #ffffff #900000 #d23d32
        }
    }
```

- 启动执行sh脚本
```shell
    # 启动运行脚本
    exec ${HOME}/.config/i3/config.sh
```

- 桌面定时切换壁纸
```shell
    #桌面壁纸定时更换
    _wallpaper(){
        shopt -s nullglob
    
        # 图片路径
        path=${HOME}/images
    
        # 间隔30秒切换一张壁纸
        interval=30s
    
        if [[ -n $(which feh) ]]
        then
            if [[ -d ${path} ]]
            then
                cd ${path}
                while true
                do
                    files=()
                    for i in *.jpg *.png; do
                        [[ -f ${i} ]] && files+=("${i}")
                    done
                    range=${#files[@]}
                    ((range)) && feh --bg-scale "${files[RANDOM % range]}"
                    sleep ${interval}
                done
            fi
        fi
    }
    _wallpaper
```
