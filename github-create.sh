#!/bin/bash
github-create () {
    currentDir=${PWD##*/}
    currentDir=${currentDir// /_}
    userName=$1

    curl -u $userName https://api.github.com/user/repos -d '{"name":"'$currentDir'"}' &&
    echo "# "$currentDir >> README.md &&
    git init &&
    git add -A . &&
    git commit -m "first commit" &&
    git remote add origin https://github.com/$userName/$currentDir.git &&
    git push -u origin master
}
