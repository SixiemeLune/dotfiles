#!/bin/bash

TMUX_DIR=$1
if [ ! -d ~/$TMUX_DIR ]; then
    TMUX_DIR=$(find ~/ -mindepth 1 -maxdepth 1 -type d | fzf| tr '/' ' ' |awk '{print $NF}')
fi

# SSH stuff
killall ssh-agent
eval `ssh-agent -s`
ssh-add ~/.ssh/gitlab_viveris
ssh-add ~/.ssh/marlink

# Take argument and move to project
cd ~/"$TMUX_DIR"
tmux new -s $TMUX_DIR
