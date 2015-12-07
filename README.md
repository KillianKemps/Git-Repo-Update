# Git-Repo-Upgrade
A script to update all git repositories in the current folder

## Installation
Just create a symlink in your folder containing all your git repositories and make the script executable:

```
chmod +x repo-upgrade.sh
```

In your folder containing all git repositories to update:

```
ln -s Git-Repo-Upgrade/repo-upgrade.sh upgrade
```

## Usage
```
./upgrade
```

Or if you're sure to update every repo, you can force to yes:
```
./upgrade -f
```
