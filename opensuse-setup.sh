#!/usr/bin/bash
cd ~

# 1. Update the system
sudo zypper refresh
sudo zypper update

# 2. wget the necessary files from github
wget https://raw.githubusercontent.com/dpater1986/Pater-s-OpenSuse-setup/main/opensuse.packages

# 3. Setup repositories for installations
## 3.1 Atom's repositorie
sudo sh -c 'echo -e "[Atom]\nname=Atom Editor\nbaseurl=https://packagecloud.io/AtomEditor/atom/el/7/\$basearch\nenabled=1\ntype=rpm-md\ngpgcheck=0\nrepo_gpgcheck=1\ngpgkey=https://packagecloud.io/AtomEditor/atom/gpgkey" > /etc/zypp/repos.d/atom.repo'
sudo zypper --gpg-auto-import-keys refresh

# 4. Installs all packages
sudo zypper --non-interactive install $(cat ~/opensuse.packages)
