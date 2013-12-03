#!/bin/sh
bin=~/workspace/PHPNamespacer/nschecker.sh
if ! type "$bin" > /dev/null; then
    echo "please install PHPNamespacer first:"
    echo "git clone https://github.com/kcliu/PHPNamespacer ~/workspace/PHPNamespacer"
    exit 1
else
    echo "...checking PHP namespace"
    $bin
fi

