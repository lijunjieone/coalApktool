#!/bin/bash

path=/home/lijunjie/mywork/my/script/unbuild/
path=$(dirname $0)
path=${path/\./$(pwd)}

path=$path/../unbuild/
echo $path
                

function checkdir()
{
    if [[ -e $1 ]]
    then
        rm -rf $1
    fi
    mkdir -pv $1
}

function unapk()
{
    checkdir $2
    unzip  $1 -d $2 
}

function dex2jar()
{
    cd $path
    $path/dex2jar.sh $1
    echo $1
    $path/jd-gui &
}

function dumpres() 
{
    for i in `find $2 | grep xml`
        {
            destfile=$i.xml
            java -jar $path/AXMLPrinter2.jar $i > $destfile
            
        }
    #$path/AXMLPrinter2.jar $1
}


function unbuild()
{
    echo "开始解压文件 $1 到 $2"
    unapk $1 $2
    echo "解压结束"
    echo "开始转化dex为jar包"
    dex2jar $2/classes.dex
    echo "转化结束，生成的jar放在$2/"
    echo "开始转化资源为文件为可读文件"
    dumpres $1 $2
    echo "转化资源结束，转化文件放在资源文件同级目录中"
}



if [[ $# == 1 ]]
then
    destdir="$path/../tmp/unbuild"
    unbuild $1 $destdir
elif [[ $# == 2 ]]
then
    unbuild $1 $2
else
    echo "./unbuild.sh a.apk"
    exit
fi

