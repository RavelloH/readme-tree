# -*- coding: utf-8 -*-
## Author: RavelloH
### LICENSE: MIT
#### Readme-tree

import os,math

target = '<!-- readme-tree start -->'
targetend = '<!-- readme-tree end -->'
liness = target+'\n```\n'
originline = ''
with open("tree.bak", "r", encoding="utf-8") as f1,open("README.md", "r", encoding="utf-8") as f2:
    for line in f1:
        liness = liness + line
    liness=liness+'```\n'+targetend+'\n'
    print(liness)   
    totalline = len(open("README.md",'r').readlines())
    line = f2.readline()
    counts = 1
    while line:
        if target in line:
            break
        if counts == totalline:
            break
            print("请在README内添加标识")
            os._exit()
        line = f2.readline()
        counts += 1
    totalline2 = len(open("README.md",'r').readlines())
    with open("README.md", 'r') as file:
        line2 = file.readline()
        counts2 = 1
        while line2:
            if targetend in line2:
                break
            if counts2 == totalline2:
                break
            line2 = file.readline()
            counts2 += 1
    print(counts2)
    #os.remove("tree.bak")
newcounts = counts-1
newcounts2= counts2-1
linelist = []
linelist = list(range(math.ceil(newcounts), math.floor(newcounts2) + 1))
print(linelist)
l1 = []
with open(r"README.md", 'r') as fp:
    l1 = fp.readlines()
with open(r"README.md", 'w') as fp:
    for number, line in enumerate(l1):
        if number not in linelist:
            fp.write(line)
fp.close()
with open('README.md','r') as f:
    ltines = f.readlines()
    ltines.insert(newcounts,liness)
    s = ''.join(ltines)
with open('README.md', 'w') as f:
    f.write(s)
