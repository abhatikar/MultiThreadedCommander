#!/bin/sh
#Don't forget to force your changes into remote repo 
#git push origin +master:master
 
git filter-branch --env-filter $'

OLD_EMAIL="oldemail@gmail.com"
CORRECT_NAME="Abhijeet Bhatikar"
CORRECT_EMAIL="abhijeet4jobs@gmail.com"

if [ "$GIT_COMMITTER_EMAIL" = "$OLD_EMAIL" ]
then
    export GIT_COMMITTER_NAME="$CORRECT_NAME"
    export GIT_COMMITTER_EMAIL="$CORRECT_EMAIL"
fi
if [ "$GIT_AUTHOR_EMAIL" = "$OLD_EMAIL" ]
then
    export GIT_AUTHOR_NAME="$CORRECT_NAME"
    export GIT_AUTHOR_EMAIL="$CORRECT_EMAIL"
fi
' --tag-name-filter cat -- --branches --tags
