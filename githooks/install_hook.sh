#!/bin/sh
pushd .git/hooks
if ! [ -L .git/hooks/pre-commit ] ;then
    echo "...create symlink to enable git-hook"
    ln -s ~/workspace/PHPNamespacer/githooks/pre-commit.sh pre-commit
fi
if ! [ -d ~/workspace/PHPNamespacer ] ;then
    git clone https://github.com/kcliu/PHPNamespacer ~/workspace/PHPNamespacer
fi
popd
