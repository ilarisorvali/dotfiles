#!/bin/bash

BRANCH=${1:-main}   # If no argument is given, default to "main" branch

echo "Installing dotfiles branch: $BRANCH"

git clone --bare git@github.com:ilarisorvali/dotfiles.git $HOME/.cfg

function config {
   /usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME "/bin/bash"
}

mkdir -p .config-backup

# Fetch all branches just in case
config fetch origin

# Try checkout
if config checkout "$BRANCH"; then
    echo "Checked out $BRANCH successfully."
else
    echo "Backing up pre-existing dot files."
    config checkout "$BRANCH" 2>&1 \
        | grep -E "^\s+" \
        | awk '{print $1}' \
        | xargs -I{} mv {} .config-backup/{}
fi

config checkout "$BRANCH"
config config status.showUntrackedFiles no
