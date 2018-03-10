#!/bin/bash

# 提交时候先运行这个文件，然后再进行提交
# 因为提交 .enc 时，需要将 git 库中所有 xx.enc 文件的历史全部抹掉，因为我们不需要保留历史记录，保留最新即可

# 使用方法：commit.sh xxx.enc ...
for filename in $@; do
    echo "${filename}"
    git filter-branch --tree-filter "find * -type f -name ${filename} -delete" HEAD
done
