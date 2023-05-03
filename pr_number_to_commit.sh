#!/bin/bash
commit_file=.commit_message.txt
commit_title=$(git log --pretty=format:"%s" -1)
if [[ ! $commit_title =~ .*\#"$PR_NUMBER" ]]; then
    git log --pretty=format:"%s #"$PR_NUMBER"%n%n%b" -1 > $commit_file
    git commit --amend --allow-empty -F $commit_file
fi
rm -f $commit_file
