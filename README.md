# readme-tree
在提交时自动为仓库的Readme文档添加树状文件图

<!-- readme-tree start -->
```
.
├── .github
│   └── workflows
│       └── main.yml
├── README.md
├── action.yml
├── main.py
├── tree.bak
└── tree.sh

2 directories, 6 files
```
<!-- readme-tree end -->
## 效果:
> 注:以下多种效果可组合使用
 <details open>
  <summary align="center"> <b> 显示/隐藏 </b> </summary>
  
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

### 显示git文件

 <details>
  <summary align="center"> <b> 展开 </b> </summary>
    
```
.
├── .git
│   ├── FETCH_HEAD
│   ├── HEAD
│   ├── branches
│   ├── config
│   ├── description
│   ├── hooks
│   │   ├── applypatch-msg.sample
│   │   ├── commit-msg.sample
│   │   ├── fsmonitor-watchman.sample
│   │   ├── post-update.sample
│   │   ├── pre-applypatch.sample
│   │   ├── pre-commit.sample
│   │   ├── pre-merge-commit.sample
│   │   ├── pre-push.sample
│   │   ├── pre-rebase.sample
│   │   ├── pre-receive.sample
│   │   ├── prepare-commit-msg.sample
│   │   ├── push-to-checkout.sample
│   │   └── update.sample
│   ├── index
│   ├── info
│   │   └── exclude
│   ├── logs
│   │   ├── HEAD
│   │   └── refs
│   │       ├── heads
│   │       │   └── main
│   │       └── remotes
│   │           └── origin
│   │               └── main
│   ├── objects
│   │   ├── 32
│   │   │   └── 91e7de4715c57b39dd04cda52b7fd42f9f3fb7
│   │   ├── 3c
│   │   │   └── 00233aaca2704ff5eb8b59ea5d3cb00bf4a170
│   │   ├── 61
│   │   │   └── 365f6c6bf64e9e8b5a81f2d6161b29f30e3ac0
│   │   ├── 65
│   │   │   └── f2274944ed41c8f1f3b23f62d654329e018c65
│   │   ├── 75
│   │   │   └── 8e46b40b670dd33c53758979256da27cb3cb4b
│   │   ├── 93
│   │   │   └── cb9b7c5a3a5e0e3c36152b091bf9f84f9fc60e
│   │   ├── bc
│   │   │   └── fcd82886eb8f9ae9e1c95337f6a3a12f767e8a
│   │   ├── bf
│   │   │   └── a8b87102f67ff125f87ef1b8f20eaeb2601e75
│   │   ├── cc
│   │   │   └── 0f3f0697c757e92a3fef16fa5624c2e882bf1a
│   │   ├── info
│   │   └── pack
│   ├── refs
│   │   ├── heads
│   │   │   └── main
│   │   ├── remotes
│   │   │   └── origin
│   │   │       └── main
│   │   └── tags
│   └── shallow
├── .github
│   └── workflows
│       └── main.yml
├── README.md
├── action.yml
├── main.py
├── tree.bak
└── tree.sh

28 directories, 40 files
```
    
  </details>
</details>

## 使用  
### 快速开始  
1.将以下代码加入需要添加readme-tree功能的仓库的README.md:(位置可自定义)
```
<!-- readme-tree start -->
<!-- readme-tree end -->
```
2.在仓库中创建一个actions文件，路径为:`.github/workflows/[这里填写一个名字].yml`，内容如下:
``` yml
on: [push]

jobs:
  tree:
    runs-on: ubuntu-latest
    name: readme-tree
    steps:
      - uses: actions/checkout@v3
      - name: Tree
        uses: RavelloH/readme-tree@v1
      - name: commit
        continue-on-error: True
        run: |
          git init
          git pull
          git config --local user.email "actions@github.com"
          git config --local user.name "github-actions"
          git add .
          git commit -m "[Readme-Tree]`date '+%Y-%m-%d %H:%M:%S'`" || exit
          git status
          git push -f
```  

(若不希望仓库贡献者中出现github-action-user，也可以将上述代码中的`actions@github.com`与`github-actions`替换为自己的github邮箱及昵称。)

3.大功告成!如果上述操作顺利完成，每次对仓库进行push后都会触发自动生成。若未出现，请检查仓库的Actions功能是否开启、Actions的令牌(Settings>Actions>General>Workflow permissions)是否设置为读写。

### 详细设置
#### 管理功能选项
#### 针对长内容进行隐藏

## 版本

## 贡献&反馈

## LICENCE





