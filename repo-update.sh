#!/bin/bash

###########################################################
# Script to update all git repositories in current folder #
#                                                         #
# v0.3                                                    #
# By Killian Kemps                                        #
###########################################################

list=`ls -d ../*/`
force_yes=false

# Store user argument to force all repo update
if [ "$1" = '-f' ] || [ "$1" = '--force-yes' ]; then
  force_yes=true
fi

function update {
  printf "\n-- Updating $Dir"
  cd $Dir
  git stash > /tmp/repoUpdate
  editedFiles=`cat /tmp/repoUpdate`
  printf "\n"
  echo $editedFiles
  git checkout master
  git pull --rebase
  git checkout -
  if [[ $editedFiles != *"No local changes to save"* ]]
  then
    git stash pop
  fi
  cd -
  printf "\n"
}

for Dir in $list
do
  while true
  do
    # Check if the folder is a git repo
    if [[ -d "${Dir}/.git" ]]; then

      # Update without prompt if yes forced
      if [ "$force_yes" = true ] ; then
        update
        break;
      # Otherwise prompt user asking for repo update
      else
        read -p "Update $Dir? [y/n/q] " answer

        case $answer in
          [yY]* ) update
            break;;

          [nN]* ) break;;

          [qQ]* ) exit;;

          * )  echo "Enter Y, N or Q, please.";;
        esac
      fi
    else
      break
    fi
  done
done
