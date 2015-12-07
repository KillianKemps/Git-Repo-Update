#!/bin/bash

###########################################################
# Script to update all git repositories in current folder #
#                                                         #
# v0.2                                                    #
# By Killian Kemps                                        #
###########################################################

list=`ls -d */`

for Dir in $list
do
  while true
  do
    # (1) prompt user if the folder is a git repo
    if [[ -d "${Dir}/.git" ]]; then
      read -p "Upgrade $Dir? [y/n/q] " answer

      case $answer in
        [yY]* ) printf "\n-- Updating $Dir"
          cd $Dir
          git stash > /tmp/repoUpgrade
          editedFiles=`cat /tmp/repoUpgrade`
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
          break;;

        [nN]* ) break;;

        [qQ]* ) exit;;

        * )  echo "Enter Y, N or Q, please.";;
      esac
    else
      break
    fi
  done
done
