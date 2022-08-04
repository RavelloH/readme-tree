# readme-tree
在提交时自动为仓库的Readme文档添加树状文件图

<!-- readme-tree start -->
```
.
├── [Aug  4 11:05]  .github
│   └── [Aug  4 11:05]  workflows
│       └── [Aug  4 11:05]  main.yml
├── [Aug  4 11:05]  README.md
├── [Aug  4 11:05]  action.yml
├── [Aug  4 11:05]  main.py
├── [Aug  4 11:05]  tree.bak
└── [Aug  4 11:05]  tree.sh

2 directories, 6 files
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
