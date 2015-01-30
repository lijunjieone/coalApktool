#!/bin/bash

if [ $# == 2 ];
then
    path=$(dirname $0)
    path=${path/\./$(pwd)}

    localpath=$path/../auto-sign/
    echo $localpath
    java -jar $localpath/signapk.jar $localpath/testkey.x509.pem $localpath/testkey.pk8  $1  $2
    if [ $? == 0 ];
    then
        echo "create file " $2
    else
        echo "sign " $1 " file is fail"
    fi
else
    echo "sign.sh source.apk dest.apk"
    exit
fi

