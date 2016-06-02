git filter-branch --commit-filter '
        if [ "$GIT_COMMITTER_NAME" = "goooooooofy" ];
        then
                GIT_COMMITTER_NAME="mgoofyy";
                GIT_AUTHOR_NAME="mgoofyy";
                GIT_COMMITTER_EMAIL="mgoofyy@gmail.com";
                GIT_AUTHOR_EMAIL="mgoofyy@gmail.com";
                git commit-tree "$@";
        else
                git commit-tree "$@";
        fi' HEAD

