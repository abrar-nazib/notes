# Notes on my understanding of git and github

[Git documentation](https://git-scm.com/)
[Pro Git Book](https://git-scm.com/book/en/v2)

## Basics

- **Untracked files:** Every newly added or modified file is untracked file.
- **Unstaged Changes:** If we make changes to a file git is already tracking, it is categorized as unstaged changes.
- **Staged Changes:** `git add file` command adds the files to staged changed files category.
- **Commit:** `git commit` each commit has a unique identifier

## Config

Initial setup after git installation.git

```bash
git config --global user.name "username"    # Needs to be in double quote
git config --global user.email "email@email.com"    # Needs to be in double quote
git config -l # Shows all the configured data
git config --global credential.helper cache # Caches the credentials
git config --global --unset credential.helper # Delete the cache
git remote set-url origin https://scuzzlebuzzle:<MYTOKEN>@github.com/scuzzlebuzzle/ol3-1.git
```

### SSH

```bash
ssh-keygen -t rsa -b 4096 -C "email@example.com"
    # Generates a public-private key pair for git repository
git remote set-url origin git@github.com:username/repository.git
    # For setting up remote of a repository
```

## GIT Basic commands

- `git init` initialize git repository in local machine.
- `git status` show the current status of the files. {Red-colr->Untracked}
- `git commit -m "commit message"` commit a change
  - `git commit -a -m "commit message"` to skip the staging process. Will stage all the unstaged changes and commit.
- `git log` shows the commit history
  - `git log --oneline` will show the commit history in one line versions.

## Staging

- `git add filename` adds the specified file in the staging area.
- `git add *` adds every untracked/unstaged file to the staged area {the process is called staging}.

## GIT Ignore

**Filename:**.gitignore\

- `node_modules/` ignores everything inside node modules folder

## Inspecting previous commits

- `git show <commit-id>` shows the details about the specified commit.
  - `git log` will help to get the commit id.

_Demo git show:_

```bash
commit 2a1cdbe50c3630273653da3ca64ff822c2bd167a
Author: abrar-nazib <abrarnazib@gmail.com>
Date:   Sat Apr 30 12:30:33 2022 +0600

    second commit

diff --git a/first.txt b/first.txt
index 9ea38a9..43d4268 100644
--- a/first.txt
+++ b/first.txt
@@ -1 +1,3 @@
 First text file. Initial Text.
+   # this plus sign means things added after previous commit
    # minus sign means things deleted from the previous commit
+Line after first commit.
```

### `diff`

- Shows the so-far difference from the previous version of the commit. `+` means added stuffs, `-` means deleted stuffs.
- Shows the differences only when in unstaged condition. If staged difference is needed to be shown, `--staged` flag needs to be used.
- `git diff <commit-id-1> <commit-id-2>` shows the difference between two specified commits.

## Deleting files

- `git rm filename` deletes file from both the folder and git's tracking system.

## Reverting back

- `git checkout <commit-id> <filename>` will revert the specified file back to the specified commit version.
- `git checkout <branchname>` to switch branches.

## Related to github

- `git clone <repo link>` to clone repository from online
  - `git clone <repo link> <custom-foldername>` to clone into custom folder if the default name isn't needed.
- `git remote add <remote-repo-name> <remote-repo-url>` To add a remote repo.
  - `git remote add origin <remote-repo-url>` for example
- `git push -u origin master` Git push to the remote repo named "origin". Push the master branch.

## Branching

- `git branch` to show the branches.
- `git branch <branchName>` to create a new branch in the git repo.
  - `git checkout -b <branchName>` Create the branch and checkout to it.
- `gir branch -d <branchName>` to delete a created branch.
- `git checkout <branchname>` to switch to specified branch.

## Merging

- `git merge <branchName>` will merge specified branch to corrent branch.
- 