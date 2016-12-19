#!/bin/bash
SVNDIR="$HOME/src/svn"
GITDIR="$HOME/src/git"
SEARCHDIR=''

if [ "$1" == 'git' ]; then
        SEARCHDIR="$GITDIR";
elif [ "$1" == 'svn' ]; then
        SEARCHDIR="$SVNDIR";
else
        echo 'Invalid SCM type';
        exit 1;
fi;

echo "Let's see if there's a couplea hatas in $SEARCHDIR";

cd "$SEARCHDIR";

for i in $( ls ); do
        cd $i; 
        if [ -d .git ]; then 
                if [ -n "$(git status --porcelain)" ]; then 
                    echo '-------'; 
                    echo $i; 
                    echo '-------'; 
                    git status; 
                    echo '';
                else
                    echo "$i is SAWFT";
                fi; 
        else
                if [ -n "$(svn status)" ]; then
                    echo '-------'; 
                    echo $i; 
                    echo '-------'; 
                    svn status;
                    echo '';
                else
                    echo "$i is SAWFT";
                fi;
        fi;
        cd ..; 
done;
