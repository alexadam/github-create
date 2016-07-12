# github-create
Turn the current directory into a new GitHub repository

## How to "install"

Open:

```
/home/YOUR USERNAME/.bashrc
```

then append:

```bash
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
```

then, in a terminal:

```bash
source ~/.bashrc
```

## How to use

In a terminal, go to the directory you want to turn into a GitHub repo and type this:

```bash
github-create <YOUR GITHUB USERNAME>
```

## Credits
http://stackoverflow.com/questions/2423777/is-it-possible-to-create-a-remote-repo-on-github-from-the-cli-without-opening-br
