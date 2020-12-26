#!/bin/bash
for i in $(git branch -a |grep 'remotes' |grep -v 'HEAD ->');do \
basename ${i##\./} | xargs -I {} git checkout -b {} --track origin/{}; done
