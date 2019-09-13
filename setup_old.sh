#!/bin/bash

# setup_old - A script to copy over neccessary files for new machine, to run on the old machine

##### Constants

##### Main
echo "Copy files to $USER@$HOSTNAME"
scp -i $HOME/psangkloy_aws.pem $HOME/.zshrc $1:~/
scp -i $HOME/psangkloy_aws.pem $HOME/.oh-my-zsh/themes/agnoster.zsh-theme $1:~/.oh-my-zsh/themes/
