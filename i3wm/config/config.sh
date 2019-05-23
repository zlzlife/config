#!/usr/bin/env bash
# 启动运行脚本

# 自动更新时间
# ntpdate pool.ntp.org

# 设置扩展屏幕
_xrandr(){
    xrandr --output DP-1 --primary --output DP-1-2 --rotate left --left-of DP-1 --auto
}

# 桌面壁纸定时更换
_wallpaper(){
    shopt -s nullglob

    # 图片路径
    path=${HOME}/Files/images

    # 间隔30秒切换一张壁纸
    interval=30s

    if [[ -f $(command -v node) ]]
    then
        wallpaper=${HOME}/.config/i3/wallpaper.js
        if [[ -f ${wallpaper} ]]
        then
            node ${wallpaper} ${path} 1 &
        fi
    fi

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

_setting_wallpaper(){
    # image="${HOME}/Downloads/t017180e089128e9749.jpg"
    # if [[ -f ${image} ]]
    # then
    #     feh --bg-scale ${image}
    # fi
}

_xrandr
#_wallpaper
#_setting_wallpaper
