#!/bin/bash

tmux split-window -h -l 40%
tmux select-pane -t 1
tmux split-window -v -l 50%
