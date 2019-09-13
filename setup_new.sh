#!/bin/bash

# setup_new - A script to set up new machine with neccessary stuff for Patsorn, to run on the new machine

##### Main
echo "Setting up new machine for $USER@$HOSTNAME"
echo '#!/bin/bash

sudo echo "
#

# This will not allow a user to change their shell unless
# their current one is listed in /etc/shells. This keeps
# accounts with special shells from changing them.
auth       sufficient   pam_shells.so

# This allows root to change user shell without being
# prompted for a password
auth            sufficient      pam_rootok.so

# The standard Unix authentication modules, used with
# NIS (man nsswitch) as well as normal /etc/passwd and
# /etc/shadow entries.
@include common-auth
@include common-account
@include common-session
" > /etc/pam.d/chsh
chsh -s $(which zsh)' > sudo_setup.sh

sudo apt-get update
sudo apt-get install tmux zsh python3-pip python3-opencv -y
python3 -m pip install jupyterlab jupyter scikit-image
git clone https://github.com/powerline/fonts.git
cd fonts
./install.sh

sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

#echo 'sudo vim /etc/pam.d/chsh'
#echo 'chsh -s $(which zsh)'

echo "jupyter lab --ip='*' --port=8787 --notebook-dir='/mnt/data/' --NotebookApp.password='sha1:831f474092ec:bb2e551fe38c003c808a1614095bdb46e184f4f0'"
