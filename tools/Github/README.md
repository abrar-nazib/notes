# Notes on my understanding of git and github

[Git documentation](https://git-scm.com/)
[Pro Git Book](https://git-scm.com/book/en/v2)

## Basics

**Untracked files:** Every newly added or modified file is untracked file.\
**Unstaged Changes:** If we make changes to a file git is already tracking, it is categorized as unstaged changes.\
**Staged Changes:** ```git add file``` command adds the files to staged changed files category.\
**Commit:** ```git commit``` each commit has a unique identifier

## GIT Basic commands

* ```git init``` initialize git repository.
* ```git status``` show the currently untracked files
* ```git add * ``` adds every untracked/unstaged file to the staged area.
* ```git commit -m "commit message"``` commit a change
* ```git push origin branch_name``` push branch to the github
* ```git remote``` shows all the remote repos available to a repository

## GIT Ignore

**Filename:**.gitignore\
* ```node_modules/``` ignores everything inside node modules folder

## SSH

```bash
ssh-keygen -t rsa -b 4096 -C "email@example.com"
    # Generates a public-private key pair for git repository
git remote set-url origin git@github.com:username/repository.git 
    # For setting up remote of a repository
```