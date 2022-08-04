#!/bin/bash

if [[ "$showall" != 'yes' && "$showall" != 'no' ]]
then
    echo "Error in parameter setting: ${showall} must contain the value yes or no , but now the value is ${showall}"
    echo "参数设置有误:showall必须包含值yes或no，而当前值为${showall}"
    echo
fi
if [[ "$showdirectoryname" != 'yes' && "$showdirectoryname" != 'no' ]]
then
    echo "Error in parameter setting: ${showdirectoryname} must contain the value yes or no , but now the value is ${showdirectoryname}"
    echo "参数设置有误:showdirectoryname必须包含值yes或no，而当前值为${showdirectoryname}"
    echo
fi
if [[ "$showchangetime" != 'yes' && "$showchangetime" != 'no' ]]
then
    echo "Error in parameter setting: ${showchangetime} must contain the value yes or no , but now the value is ${showchangetime}"
    echo "参数设置有误:showchangetime必须包含值yes或no，而当前值为${showchangetime}"
    echo
fi
if [[ "$showsize" != 'yes' && "$showsize" != 'no' ]]
then
    echo "Error in parameter setting: ${showsize} must contain the value yes or no , but now the value is ${showsize}"
    echo "参数设置有误:showsize必须包含值yes或no，而当前值为${showsize}"
    echo
fi
if [[ "$showallname" != 'yes' && "$showallname" != 'no' ]]
then
    echo "Error in parameter setting: ${showallname} must contain the value yes or no , but now the value is ${showallname}"
    echo "参数设置有误:showallname必须包含值yes或no，而当前值为${showallname}"
    echo
fi

echo "$showall"
