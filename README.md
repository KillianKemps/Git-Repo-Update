# Git-Repo-Update
A script to update all git repositories in the current folder

## Installation
Just create a symlink in your folder containing all your git repositories and make the script executable:

```
chmod +x repo-update.sh
```

In your folder containing all git repositories to update:

```
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
