
# git 命令相关的函数
_current_branch() {
#    git symbolic-ref --short -q HEAD
    br=$(git branch | grep "*")
    echo ${br/* /}
}

# git提交信息
_gac() {
    commit_info=$1
        if [ -z ${commit_info} ]
        then
            commit_info=$(date "+%Y-%m-%d %H:%M:%S")
            echo "$commit_info"
        fi
    git add .
    git commit -m ${commit_info}
}

# git 提交信息,并且推送分支
_gacp() {
    _gac $1
    git push origin "$(_current_branch)"
}

# git 通过cz提交信息
_gacz() {
    git add .
    git cz
}

# git通过cz提交信息,并且推送分支
_gaczp() {
    git add .
    git cz
    git push origin "$(_current_branch)"
}

# git 推送分支
_gpush() {
    git push origin "$(_current_branch)"
}

# git pull 分支最新代码
_gpull() {
    git pull origin "$(_current_branch)"
}

_gfp() {
    git fetch
    git pull origin "$(_current_branch)"
}

# git 提交代码
_gc() {
    git add .
    git commit -m "$1"
}

# git 提交tag
_gctag(){
    git tag -a $1 -m $2
}

# git 提交分支,并且推送
_gcptag(){
    _gctag $1 $2
    git push origin $1
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
alias gctag=_gctag
alias gcptag=_gcptag

alias gstat="git status"
alias gssh="git stash"
alias gsshp="git stash pop"
alias gsshls="git stash list"
alias gadd="git add ."
alias gclone="git clone"
alias gcz="git cz"
alias gfetch="git fetch"

alias gck="git checkout"

alias gba="git branch -a"

alias gr='git remote'
alias grv='git remote -v'

alias gtag='git tag'
alias gdtag='git tag -d $1'
alias gstag='git show $1'
alias gpatag='git push --tags'

alias gchpick='git cherry-pick'

alias glola="git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --all"
alias gpath="git rev-parse --show-toplevel"
