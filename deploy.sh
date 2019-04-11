#!/usr/bin/env bash
_i3wmconfig(){
    cp -rf $(pwd)/i3wm/config/* ${HOME}/.config/i3/
}

read -t 5 -p "是否部署i3wm配置(Y/n)" depi3m

case ${depi3m} in
Y | y)
    _i3wmconfig
esac
