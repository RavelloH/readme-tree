# readme-tree
在提交时自动为仓库的Readme文档添加树状文件图

<!-- readme-tree start -->
```
.
└── .github
    └── workflows

2 directories
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
    └── workflows
    
2 directories
```
### 显示文件大小
```
.
├── [       4096]  .github
│   └── [       4096]  workflows
│       └── [        591]  main.yml
├── [       1018]  README.md
├── [       4067]  action.yml
├── [       1677]  main.py
├── [          0]  tree.bak
└── [        809]  tree.sh

2 directories, 6 files
```
### 显示相对路径
```
.
├── ./.github
│   └── ./.github/workflows
│       └── ./.github/workflows/main.yml
├── ./README.md
├── ./action.yml
├── ./main.py
├── ./tree.bak
└── ./tree.sh

2 directories, 6 files
```
