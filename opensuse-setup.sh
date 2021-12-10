#!/usr/bin/bash
cd ~

# 1. Update the system
sudo zypper refresh
sudo zypper update
sudo zypper --non-interactive install wget ## used to get necessary files from github

# 2. wget the necessary files from github
wget https://raw.githubusercontent.com/dpater1986/Pater-s-OpenSuse-setup/main/opensuse.packages
wget https://raw.githubusercontent.com/dpater1986/Pater-s-OpenSuse-setup/main/bashrc.aliases

# 3. Setup repositories for installations
## 3.1 Atom's repositorie
sudo sh -c 'echo -e "[Atom]\nname=Atom Editor\nbaseurl=https://packagecloud.io/AtomEditor/atom/el/7/\$basearch\nenabled=1\ntype=rpm-md\ngpgcheck=0\nrepo_gpgcheck=1\ngpgkey=https://packagecloud.io/AtomEditor/atom/gpgkey" > /etc/zypp/repos.d/atom.repo'
## 3.2 Spotify-easyRPM repositorie
sudo zypper addrepo https://download.opensuse.org/repositories/openSUSE:Factory/standard/openSUSE:Factory.repo
## 3.3 Microsoft teams
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo zypper ar https://packages.microsoft.com/yumrepos/ms-teams/ ms-teams

## Update zypper to load gpg-keys and refresh
sudo zypper --gpg-auto-import-keys refresh
sudo zypper refresh
## Check again for update
sudo zypper update # I'll think you can't do this enough :-D

# 4. Installs all packages
sudo zypper --non-interactive install $(cat ~/opensuse.packages)

# 5. Add personal aliases to .bachrc
cat ~/bachrc.aliases >> ~/.bashrc

# 6. Setup personal configuration files (wireguard, ssh keys and gnupg keys)
## 6.1 Get files
## 6.2 Import SSH keys
### Local server
rsync -avzhe ssh --progress pi@172.19.23.14:~/backup/ssh ~/importbackup
cp ~/importbackup/ssh/home/dennis/.ssh/* ~/.ssh
## 6.3 Import Gnupg keys
## 6.4 Import Wireguard
sudo mv ~/wg0.conf /etc/wireguard/wg0.conf
sudo systemctl enable wg-quick@wg0.service
sudo systemctl daemon-reload
sudo systemctl start wg-quick@wg0.service
