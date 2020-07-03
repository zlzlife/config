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


# 停止删除容器
# dstoprm node-quant
_dstoprm(){
    docker stop $1
    docker rm $1
}

# 运行mysql8.0
_drunmysql(){
  docker run -d --name local-mysql -p 3306:3306 --restart=always -e MYSQL_ROOT_PASSWORD=123456 mysql:8.0
}

# 运行redis
_drunredis(){
  docker run --name redis -d -p 6379:6379 --restart=always redis:latest
}

# 运行mongodb
_drunmongodb(){
  docker run -d -p 27017:27017 --name mongo --restart=always mongo:latest
}

# 运行sql server
_drunmssql(){
  docker run -e "ACCEPT_EULA=Y" -e "SA_PASSWORD=MyPassWord123"  -p 1433:1433 --name sql1  -d mcr.microsoft.com/mssql/server:2017-latest
}

# docker 命令简写

alias dims="docker images"
alias dimp="docker image prune"
alias dimpf="docker image prune -f"

alias dpsa="docker ps -a"
alias dps="docker ps"

alias drm="docker rm"
alias drmi="docker rmi"

alias dstop="docker stop"
alias dpull="docker pull"
alias dpush="docker push"
alias drun="docker run"
alias dexec="docker exec"
alias dstart="docker start"
alias drestart="docker restart"
alias dclearlog='sudo sh -c "$(curl https://raw.githubusercontent.com/zlzlife/zlz-project/master/docker/clear-container-log.sh)"'

# 示例: dlogs redis
alias dlogs=_dl

# 示例: dlogsf redis
alias dlogsf=_dlf

# 示例: drnpd redis 6379 6379 redis:latest
alias drnpd=_drnpd

# 示例: drnpd demo dockerhub.com
alias dlogin=_dlogin

# 示例: dstoprm ubuntu
alias dstoprm=_dstoprm

# 示例: drunmysql (运行mysql)
alias drunmysql=_drunmysql

# 示例: drunredis (运行redis)
alias drunredis=_drunredis

# 示例: drunmongodb (运行mongodb)
alias drunmongodb=_drunmongodb

# 势力: drunmssql (运行mssql)
alias drunmssql=_drunmssql
