#!/bin/bash
pushd $W
echo > week_git_status

echo "@@@ Before commit- git status" >> week_git_status
git status >> week_git_status

git add * >> week_git_status 
git commit -m "Weekly commit - script auto commit"
git push origin master

echo "@@@ After commit- git status" >> week_git_status
git status >> week_git_status

popd
echo "Git weekly commit done: " 
echo $?
