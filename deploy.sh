#!/usr/bin/env bash

rootpath=$(pwd)

# 部署i3wm配置
_i3wmconfig(){
    cp -rf ${rootpath}/i3wm/config/* ~/.config/i3/
    echo -e "i3wm deploy success!\n"
}

# 部署vim配置
_vimconfig(){

    vundle=~/.vim/bundle/Vundle.vim
    if [[ ! -d ${vundle} ]]
    then
        git clone https://github.com/VundleVim/Vundle.vim.git "${vundle}"
    else
        cd ${vundle}
        git pull origin master
    fi

    cp ${rootpath}/vim/.vimrc ~/

    # 安装vim插件
    vim +PluginInstall +qall

    echo -e "vim deploy success!\n"
}

# 部署zsh配置
_zshconfig(){
    zshpath=${HOME}/.zsh
    if [[ ! -d ${zshpath} ]]
    then
        mkdir ${zshpath}
    fi
    cp ${rootpath}/zsh/.zsh/* ${zshpath}
    cp ${rootpath}/zsh/.zshrc ~/
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
