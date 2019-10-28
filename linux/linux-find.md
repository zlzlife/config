## Linux find命令使用总结

find命令用来在指定目录下查找文件.

### 语法
```bash
find path -option [-print] [-exec -ok command] {}\;
```

##### 1.在当前目录下查找(.ts后缀)的文件
```bash
    find ./*.ts
```

##### 2.在当前目录及子目录查找(.ts后缀)的文件
```bash
    find ./ -name "*.ts"
    find ./ -iname "*.ts" # 忽略大小写 
```

##### 3.在当前目录及子目录查找(.js, .sh, .json)的文件
```bash
    find ./ -name "*.js" -o -name "*.sh" -o -name "*.json" 
```

##### 4.在当前目录及子目录使用正则查找(.js, .json)的文件
```bash
    find . -regex ".*\(\.js\|\.json\)$"
    find . -iregex ".*\(\.js\|\.json\)$"  
```

##### 5.在当前目录及子目录查找(不包含ts)的文件
```bash
    find ./ ! -name "*ts*" 
```

##### 6.在当前目录查找所有子目录
```bash
    find ./ -type d
```

##### 7.在当前目录及子目录查找所有文件
```bash
    find ./ -type f
```

##### 8.在当前目录查找(.sh)且不包含(test)的文件
```bash
    find ./ -name "*.sh" ! -path "*test*"
```

##### 9.删除当前目录及子目录所有.js的文件
```bash
    find ./ -name "*.js" -exec rm {} \;
```
