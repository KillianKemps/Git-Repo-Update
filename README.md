# Git-Repo-Update
A script to update all git repositories in the current folder

## Installation
Make the script executable:

```
chmod +x repo-update.sh
```

And in the parent folder containing all git repositories to update, create a symlink:

```
cd ..
ln -s Git-Repo-Update/repo-update.sh update
```

## Usage
```
./update
```

Or if you're sure to update every repo, you can force to yes:
```
./update -f
```

To prune remotes at the same time (does additionnal fetch request):
```
./update -p
```
