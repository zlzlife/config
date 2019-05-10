## 开发环境,工具配置

```
├── deploy.sh                // 部署的shell脚本
├── i3wm                     // i3wm
│   ├── config               // i3wm的配置
│   │   ├── config           // i3wm的基本配置
│   │   ├── config.sh        // i3wm的执行的配置shell脚本
│   │   └── i3status.conf    // i3wm状态栏配置
│   └── README.md            // i3wm配置说明
├── vim                      // vim配置
│   └── README.md            // vim配置说明
├── zsh                      // zsh配置
│   └── README.md            // zsh配置说明
└── README.md                // 配置说明
```

## 部署
- [chrome配置说明](https://github.com/zlzsingle/config/blob/master/chrome/README.md)

- [tmux配置说明](https://github.com/zlzsingle/config/blob/master/tmux/README.md)

- [webstorm配置说明](https://github.com/zlzsingle/config/blob/master/webstorm/README.md)

- [i3wm配置说明](https://github.com/zlzsingle/config/blob/master/i3wm/README.md)

- [vim配置说明](https://github.com/zlzsingle/config/blob/master/vim/README.md)

- [zsh配置说明](https://github.com/zlzsingle/config/blob/master/zsh/README.md)

```bash
# 获取源码
git clone https://github.com/zlzsingle/config.git ./config
```

```bash
# 部署i3wm配置
cd ./config && ./deploy.sh i3wm
```

```bash
# 部署vim配置
cd ./config && ./deploy.sh vim
```

```bash
# 部署zsh配置
cd ./config && ./deploy.sh zsh
```

```bash
# 部署所有配置
cd ./config && ./deploy.sh
```
