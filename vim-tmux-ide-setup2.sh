#!/bin/bash

tmux split-window -h -l 60%
tmux select-pane -t 0
tmux split-window -v -l 50%
