# Git-Repo-Update
A script to update all git repositories in the current folder

## Installation
Installing the script is very easy. To make it easy to use and automatically updated without any user action, we will clone it among the other Git projects and create a symlink in the parent folder. It will then update all child folders including itself.

The following schema shows the `update` script among your Git repositories.

```
+-- One-git-folder/
+-- Git-Repo-Update/
+-- Another-git-folder/
+-- update
```

1. Let's begin. First, move to your usual workspace containing all your Git projects and clone the repo.
  ```
  git clone https://github.com/KillianKemps/Git-Repo-Update
  ```

2. Move to the cloned repo:
  ```
  cd Git-Repo-Update
  ```

3. Make the script executable:

  ```
  chmod +x repo-update.sh
  ```

4. Move to the parent folder containing all git repositories to update
  ```
  cd ..
  ```

5. Create a symlink:

  ```
  ln -s Git-Repo-Update/repo-update.sh update
  ```

That's all!

## Usage
Usual update process is the following: It will first do a `git stash` to put your work in progress on a side, then a `git pull --rebase` on your `master` branch and go back to your current branch if you were not on `master` and finally a `git stash pop` to put back your work in progress.

To update all the repositories contained in your workspace asking for a **confirmation** every time.
```
./update
```

Or if you're sure to update every repo, you can **force** to yes:
```
./update -f
```

To **prune** remotes at the same time (does additionnal fetch request):
```
./update -p
```
