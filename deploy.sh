#!/usr/bin/env bash

rootpath=$(pwd)

# 部署i3wm配置
_i3wmconfig(){
    cp -rf ${rootpath}/i3wm/config/* ~/.config/i3/
    echo -e "i3wm deploy success!"
}

# 部署tmux配置
_tmuxconfig(){
  cp -rf ${rootpath}/tmux/.tmux.conf ~/
  echo -e "tmux deploy success"
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

    echo -e "vim deploy success!"
}

# 部署zsh配置
_zshconfig(){
    zshpath=${HOME}/.zsh
    if [[ ! -d ${zshpath} ]]
    then
        mkdir ${zshpath}
    fi
    cp ${rootpath}/zsh/.zsh/* ${zshpath}

    if [[ -f "${HOME}/.zshrc" ]]
    then 
        echo ".zshrc文件已存在。"
    else
        echo ".zshrc文件不存在。"
        cp ${rootpath}/zsh/.zshrc ~/
    fi

    plugins_path=(
      $ZSH/custom/plugins/zsh-syntax-highlighting
      $ZSH/custom/plugins/zsh-autosuggestions
      $ZSH/custom/plugins/fzf
      $ZSH/custom/plugins/fzf-zsh
      $ZSH/custom/plugins/git-open
    )

    git_urls=(
      https://github.com/zsh-users/zsh-syntax-highlighting.git
      https://github.com/zsh-users/zsh-autosuggestions.git
      https://github.com/junegunn/fzf.git
      https://github.com/Treri/fzf-zsh.git
      https://github.com/paulirish/git-open.git
    )

    for(( i=0;i<${#plugins_path[@]};i++))
    do
      plugin_path=${plugins_path[i]}
      git_url=${git_urls[i]}

      if [[ -d ${plugin_path} ]]
      then
          cd ${plugin_path}

          if [[ -d ${plugin_path}/.git ]]
          then
            git pull origin $(git symbolic-ref --short -q HEAD)
          fi

      else
          git clone ${git_url} ${plugin_path}
      fi
    done

#    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH/custom/plugins/zsh-syntax-highlighting
#    git clone git://github.com/zsh-users/zsh-autosuggestions $ZSH/custom/plugins/zsh-autosuggestions
#    git clone https://github.com/junegunn/fzf.git $ZSH/custom/plugins/fzf
#    git clone https://github.com/Treri/fzf-zsh.git $ZSH/custom/plugins/fzf-zsh
#    git clone https://github.com/paulirish/git-open.git $ZSH/custom/plugins/git-open

#    source ~/.zshrc
    echo -e "zsh deploy success!"
}

status=0
runScript=$1

if [[ -n ${runScript} ]]
then
#    echo "runScript取值(vim,zsh,i3wm)"
#    echo "runScript=${runScript}"
    status=1
fi

if [[ ${runScript} == 'vim' ]]
then
   _vimconfig
   exit 1
fi

if [[ ${runScript} == 'tmux' ]]
then
   _tmuxconfig
   exit 1
fi

if [[ ${runScript} == 'zsh' ]]
then
   _zshconfig
   exit 1
fi

if [[ ${runScript} == 'i3wm' ]]
then
   _i3wmconfig
   exit 1
fi

if [[ ${status} == 1 ]]
then
    echo "参数错误,取值应该为(vim,tmux,zsh,i3wm);${runScript}参数无效"
    exit 1
fi

_vimconfig
_tmuxconfig
_zshconfig
_i3wmconfig

#read -t 10 -p "是否部署i3wm配置(Y/n)" depi3wm
#
#case ${depi3wm} in
#Y | y)
#    _i3wmconfig
#esac
#
#
#read -t 10 -p "是否部署vim配置(Y/n)" depvim
#
#case ${depvim} in
#Y | y)
#    _vimconfig
#esac
#
#read -t 10 -p "是否部署zsh配置(Y/n)" depzsh
#
#case ${depzsh} in
#Y | y)
#    _zshconfig
#esac
