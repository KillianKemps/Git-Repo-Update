# Git-Repo-Upgrade
A script to update all git repositories in the current folder

## How to use
Just create a symlink in your folder containing all your git repositories and make the script executable:

```
chmod +x repo-upgrade.sh
```

In your folder containing all git repositories to update:

```
ln -s Git-Repo-Upgrade/repo-upgrade.sh upgrade
```

And to use:
```
./upgrade
```
