#!/usr/bin/env zsh

mkdir -p $ZPFX/{bin,man/man1}
cp shell/completion.zsh _fzf_completion
cp -vf bin/fzf(|-tmux) $ZPFX/bin
cp -vf man/man1/fzf(|-tmux).1 $ZPFX/man/man1
