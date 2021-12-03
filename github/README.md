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
* ```git remote add origin git@github.com:abrar-nazib/repository.git``` sets up the remote location for the local repository
* ```git push origin branch_name``` push branch to the github

## GIT Ignore

**Filename:**.gitignore\
* ```node_modules/``` ignores everything inside node modules folder

## SSH