
# git 命令相关的函数
_current_branch() {
    br=`git branch | grep "*"`
    echo ${br/* /}
}

_gac() {
    commit_info=$1
        if [ -z ${commit_info} ]
        then
            commit_info="add or update files"
        fi
    git add .
    git commit -m ${commit_info}
}

_gacp() {
    _gac $1
    git push origin "$(_current_branch)"
}

_gaczp() {
    git add .
    git cz
    git push origin "$(_current_branch)"
}

_gacz() {
    git add .
    git cz
}

_gpush() {
    git push origin "$(_current_branch)"
}

_gpull() {
    git pull origin "$(_current_branch)"
}

_gfp() {
    git fetch
    git pull origin "$(_current_branch)"
}

_gc() {
    git add .
    git commit -m "$1"
}

# git 命令简写
alias gac=_gac
alias gacp=_gacp
alias gacz=_gacz
alias gaczp=_gaczp
alias gpush=_gpush
alias gpull=_gpull
alias gfp=_gfp
alias gc=_gc

alias gstat="git status"
alias gssh="git stash"
alias gsshp="git stash pop"
alias gsshls="git stash list"
alias gadd="git add ."
alias gcz="git cz"

alias gck="git checkout"

alias gba="git branch -a"

alias gr='git remote'
alias grv='git remote -v'

alias glola="git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --all"
