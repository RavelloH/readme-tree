# readme-tree
<div align='center'>  

> **此文档也有[中文版本](#language)**

</div>
使用Github Actions在提交时自动为仓库的Readme文档添加树状文件图   

Use GitHub actions to automatically add a tree view for the readme document of the warehouse when submitting

<!-- readme-tree start -->
```
.
├── .github
│   └── workflows
│       └── main.yml
├── LICENCE
├── README.md
├── action.yml
├── main.py
├── tree.bak
└── tree.sh

展示
2 directories, 7 files
```
<!-- readme-tree end -->

## Language
<details>
  <summary align="center"> <b> 中文 </b> </summary>
  
## 效果
> 注:以下效果可组合使用
 <details open>
  <summary align="center"> <b> 展示/隐藏 </b> </summary>
  
### 默认

```
.
├── .github
│   └── workflows
│       └── main.yml
├── README.md
├── action.yml
├── main.py
└── tree.sh

2 directories, 5 files
```

### 仅显示仓库文件

```
.
├── README.md
├── action.yml
├── main.py
├── tree.bak
└── tree.sh

0 directories, 5 files
```

### 仅显示仓库目录

```
.
└── .github
    └── workflows
    
2 directories
```

### 展示文件大小

```
.
├── [       4096]  .github
│   └── [       4096]  workflows
│       └── [        591]  main.yml
├── [       1018]  README.md
├── [       4067]  action.yml
├── [       1677]  main.py
├── [          0]  tree.bak
└── [        809]  tree.sh

2 directories, 6 files
```

### 展示相对路径

```
.
├── ./.github
│   └── ./.github/workflows
│       └── ./.github/workflows/main.yml
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
        uses: RavelloH/readme-tree@latest
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
| 功能名             | 描述                            | 可选值  | 默认值  |
|-------------------|--------------------------------|--------|--------|
| showall           | 是否展示所有文件及目录             | yes/no | yes    |
| showdirectoryname | 仅展示文件夹名                    | yes/no | no     |
| showchangetime    | 显示更改时间(废弃参数，不可用)       | -      | no     |
| showsize          | 以字节为单位，显示文件大小            | yes/no | no     |
| showallname       | 显示相对路径                      | yes/no | no     |
| ignoregit         | 隐藏.git文件                     | yes/no | yes    |
要想单独打开/关闭这些功能，仅需在仓库的yml文件中以with的方式更改。  
例如，若希望显示文件大小并显示相对路径，并且关闭对.git文件的隐藏，只需这样写:  
``` yml
#以上省略......
    name: readme-tree
    steps:
      - uses: actions/checkout@v3
      - name: Tree
        uses: RavelloH/readme-tree@latest
        with:
          showsize: 'yes'
          showallname: 'yes'
          ignoregit: 'no'
      - name: commit
        continue-on-error: True
        run: |
          git init
 #以下省略......
 ```
#### 针对长内容进行隐藏
若内容过长，可以在markdown标签中使用` <details>`标签隐藏。 用法如下:

``` html
 <details> 
  <summary>显示内容</summary>
  <!-- readme-tree start -->
  <!-- readme-tree end -->
 这里放置隐藏的内容
 </details>
```

效果:
<details> 
  <summary>显示内容</summary>
 这里放置隐藏的内容
 </details>
若需要默认隐藏readme-tree，将[#快速开始](#快速开始)中提到的代码放入文字区域即可。另外，也可以默认显示，并提供隐藏功能:

``` html
 <details open> 
  <summary>显示/隐藏内容</summary>
  <!-- readme-tree start -->
  <!-- readme-tree end -->
 这里的内容默认显示
 </details>
```

效果:
<details open> 
  <summary>显示/隐藏内容</summary>
 这里的内容默认显示
 </details>
 
## 版本
![GitHub tag (latest by date)](https://img.shields.io/github/v/tag/ravelloh/readme-tree?label=latest%20%2F%20%E6%9C%80%E6%96%B0%E7%89%88%E6%9C%AC&style=for-the-badge)
![GitHub Release Date](https://img.shields.io/github/release-date/RavelloH/readme-tree?style=for-the-badge)

若想进行版本更新，仅需修改yml配置中`RavelloH/readme-tree`中@后面的版本号即可

## 贡献&反馈
若有任何想法或建议，或者发现了BUG，欢迎您的直接贡献，也欢迎您在这里[提个ISSUE来反馈]()以更好的帮助此项目
## LICENCE
![GitHub](https://img.shields.io/github/license/ravelloh/readme-tree?style=for-the-badge)  
  
</details>


 <details open>
  <summary align="center"> <b> English </b> </summary>

## Performance:
> The following effects can be combined.
 <details open>
  <summary align="center"> <b> Show/Hide </b> </summary>
  
### Default

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

### Show only files in the warehouse

```
.
├── README.md
├── action.yml
├── main.py
├── tree.bak
└── tree.sh

0 directories, 5 files
```

### Show only the directories in the warehouse

```
.
└── .github
    └── workflows
    
2 directories
```

### Display files size(Bytes)

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

### Show relative path

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

### Display git file

 <details>
  <summary align="center"> <b> Open </b> </summary>
    
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

## How to use  
### Quick start 
1.Add the following code to the README.md of the repo that needs to add the readme-tree function: (the location can be customized)
```
<!-- readme-tree start -->
<!-- readme-tree end -->
```
2.Create an actions file in the repo, the path is: `.GitHub/workflows/[fill in a name here].yml`, and the content is as follows:
``` yml
on: [push]

jobs:
  tree:
    runs-on: ubuntu-latest
    name: readme-tree
    steps:
      - uses: actions/checkout@v3
      - name: Tree
        uses: RavelloH/readme-tree@latest
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

(If you don't want GitHub-action user in the repo contributor, you can also change `actions@github.com` and `GitHub actions` with your own GitHub mailbox and nickname.)

3.Be accomplished! If the above operations are successfully completed, automatic generation will be triggered every time the warehouse is pushed.If not, please check whether the actions function of the warehouse is enabled, and whether the actions token (settings>actions>general>workflow permissions) is set to read and write.

### Detailed settings
#### Manage function options
| Function name     | Describe                       | Optional value  | Default value |
|-------------------|--------------------------------|--------|--------|
| showall           | Are all documents and directories displayed   | yes/no | yes    |
| showdirectoryname | Show folder name only                  | yes/no | no     |
| showchangetime    | Display the change time (obsolete parameters, unavailable)     | -      | no     |
| showsize          | Displays the file size in bytes           | yes/no | no     |
| showallname       | Show relative path                      | yes/no | no     |
| ignoregit         | Hide .Git files                     | yes/no | yes    |


要想单独打开/关闭这些功能，仅需在仓库的yml文件中以with的方式更改。  
例如，若希望显示文件大小并显示相对路径，并且关闭对.git文件的隐藏，只需这样写:  
```diff
#以上省略......
    name: readme-tree
    steps:
      - uses: actions/checkout@v3
      - name: Tree
        uses: RavelloH/readme-tree@latest
+        with:
+          showsize: 'yes'
+          showallname: 'yes'
+          ignoregit: 'no'
      - name: commit
        continue-on-error: True
        run: |
          git init
 #以下省略......
 ```
#### 针对长内容进行隐藏
若内容过长，可以在markdown标签中使用` <details>`标签隐藏。 用法如下:

``` html
 <details> 
  <summary>显示内容</summary>
 这里放置隐藏的内容
 </details>
```

效果:
<details> 
  <summary>显示内容</summary>
 这里放置隐藏的内容
 </details>
若需要默认隐藏readme-tree，将(#快速开始)中提到的代码放入文字区域即可。另外，也可以默认显示，并提供隐藏功能:

``` html
 <details open> 
  <summary>显示/隐藏内容</summary>
 这里的内容默认显示
 </details>
```

效果:
<details open> 
  <summary>显示/隐藏内容</summary>
 这里的内容默认显示
 </details>
 
## 版本
![GitHub tag (latest by date)](https://img.shields.io/github/v/tag/ravelloh/readme-tree?label=latest%20%2F%20%E6%9C%80%E6%96%B0%E7%89%88%E6%9C%AC&style=for-the-badge)
![GitHub Release Date](https://img.shields.io/github/release-date/RavelloH/readme-tree?style=for-the-badge)

若想进行版本更新，仅需修改yml配置中`RavelloH/readme-tree`中@后面的版本号即可

## 贡献&反馈
若有任何想法或建议，或者发现了BUG，欢迎您的直接贡献，也欢迎您在这里[提个ISSUE来反馈]()以更好的帮助此项目
## LICENCE
![GitHub](https://img.shields.io/github/license/ravelloh/readme-tree?style=for-the-badge)

</details>
