# readme-tree
在提交时自动为仓库的Readme文档添加树状文件图

<!-- readme-tree start -->
```
.

0 directories
```
<!-- readme-tree end -->
## 效果:
> 注:以下多种效果可组合使用
### 默认
```
.
├── .github
│   └── workflows
│       └── main.yml
├── README.md
├── action.yml
├── main.py
└── tree.sh

2 directories, 5 files
```
### 仅显示当前目录中的文件
```
.
├── README.md
├── action.yml
├── main.py
├── tree.bak
└── tree.sh

0 directories, 5 files
```
### 仅显示目录名
```
.
└── .github
1 directories
```
### 显示更改时间
### 显示文件大小
### 显示相对路径
