# 查看容器日志
# $1(容器名称) --> redis
_dl(){
    containerName=$1
    echo "docker logs ${containerName}"
    docker logs ${containerName}
}

# 查看容器日志并且实时监控更新 $1(容器名称)
# $1(容器名称) -->  redis
_dlf(){
    containerName=$1

    echo "docker logs -f ${containerName}"
    docker logs -f ${containerName}
}

# 运行容器
# $1(容器名称) --> redis
# $2(主机端口) --> 6379
# $3(容器端口) --> 6379
# $4(tag版本名称) --> redis:latest
_drnpd(){
    containerName=$1
    hostPort=$2
    containerPort=3
    tagName=$4

    echo "docker run --name ${containerName}  -p ${hostPort}:${containerPort} -d ${tagName}"
    docker run --name ${containerName}  -p ${hostPort}:${containerPort} -d ${tagName}
}

# 登录docker服务
# $1(账号) --> test
# $2(服务) --> dockerhub.com
_dlogin(){
    username=$1
    server=$2
    echo "docker login -u ${username} ${server}"
    docker login -u ${username} ${server}
}


# docker 命令简写

alias dims="docker images"
alias dimp="docker image prune"

alias dpsa="docker ps -a"
alias dps="docker ps"

alias drm="docker rm"
alias drmi="docker rmi"

alias dstop="docker stop"
alias dpull="docker pull"
alias dpush="docker push"
alias drun="docker run"
alias dexec="docker exec"

# 示例: dl redis
alias dlogs=_dl

# 示例: dlf redis
alias dlogsf=_dlf

# 示例: drnpd redis 6379 6379 redis:latest
alias drnpd=_drnpd

# 示例: drnpd demo dockerhub.com
alias dlogin=_dlogin
