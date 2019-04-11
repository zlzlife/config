#!/usr/bin/env bash
_i3wmconfig(){
    cp -rf $(pwd)/i3wm/config/* ${HOME}/.config/i3/
    echo -e "i3wm deploy success!\n"
}

_vimconfig(){
    echo -e "vim deploy success!\n"
}

_zshconfig(){
    echo -e "zsh deploy success!\n"
}

read -t 10 -p "是否部署i3wm配置(Y/n)" depi3wm

case ${depi3wm} in
Y | y)
    _i3wmconfig
esac


read -t 10 -p "是否部署vim配置(Y/n)" depvim

case ${depvim} in
Y | y)
    _vimconfig
esac

read -t 10 -p "是否部署zsh配置(Y/n)" depzsh

case ${depzsh} in
Y | y)
    _zshconfig
esac
