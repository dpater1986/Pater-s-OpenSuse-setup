#!/usr/bin/bash
#
# Setup my opensuse how I like to use it!
# opensuse-setup.sh
#
clear

echo "                      ______                      _       ______         _                                    ";
echo "                      |  _  \                    (_)      | ___ \       | |                                   ";
echo "                      | | | |  ___  _ __   _ __   _  ___  | |_/ /  __ _ | |_   ___  _ __                      ";
echo "                      | | | | / _ \| '_ \ | '_ \ | |/ __| |  __/  / _\` || __| / _ \| '__|                     ";
echo "                      | |/ / |  __/| | | || | | || |\__ \ | |    | (_| || |_ |  __/| |                        ";
echo "                      |___/   \___||_| |_||_| |_||_||___/ \_|     \__,_| \__| \___||_|                        ";
echo "                                                                                                              ";
echo "                                                                                                              ";
echo "                                                                                                              ";
echo "                                                                                                              ";
echo "                                                                                                              ";
echo "                                                                                                              ";
echo "                                                                                                              ";
echo "                                                                                                              ";
echo "                                                                                                              ";
echo "                                                                                                              ";
echo "                                         _____        _                                                       ";
echo "                                        /  ___|      | |                                                      ";
echo "                                        \ \`--.   ___ | |_  _   _  _ __                                        ";
echo "                                         \`--. \ / _ \| __|| | | || '_ \                                       ";
echo "                                        /\__/ /|  __/| |_ | |_| || |_) |                                      ";
echo "                                        \____/  \___| \__| \__,_|| .__/                                       ";
echo "                                                                 | |                                          ";
echo "                                                                 |_|                                          ";
echo " _____                                              _____         _      _                                  _ ";
echo "|  _  |                                            |_   _|       | |    | |                                | |";
echo "| | | | _ __    ___  _ __   ___  _   _  ___   ___    | |   _   _ | |__  | |  ___ __      __  ___   ___   __| |";
echo "| | | || '_ \  / _ \| '_ \ / __|| | | |/ __| / _ \   | |  | | | || '_ \ | | / _ \\ \ /\ / / / _ \ / _ \ / _\` |";
echo "\ \_/ /| |_) ||  __/| | | |\__ \| |_| |\__ \|  __/   | |  | |_| || |_) || ||  __/ \ V  V / |  __/|  __/| (_| |";
echo " \___/ | .__/  \___||_| |_||___/ \__,_||___/ \___|   \_/   \__,_||_.__/ |_| \___|  \_/\_/   \___| \___| \__,_|";
echo "       | |                                                                                                    ";
echo "       |_|                                                                                                    ";

sudo zypper refresh
sudo zypper --non-interactive update
sudo zypper --non-interactive install wget

github_version="add_option"
github_url="https://raw.githubusercontent.com/dpater1986/Pater-s-OpenSuse-setup/"
github=$github_url$github_version
install_packages() {
    # Add repo's
    sudo sh -c 'echo -e "[Atom]\nname=Atom Editor\nbaseurl=https://packagecloud.io/AtomEditor/atom/el/7/\$basearch\nenabled=1\ntype=rpm-md\ngpgcheck=0\nrepo_gpgcheck=1\ngpgkey=https://packagecloud.io/AtomEditor/atom/gpgkey" > /etc/zypp/repos.d/atom.repo' ## Atom
    sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc ## MS-TEAMS
    sudo zypper ar https://packages.microsoft.com/yumrepos/ms-teams/ ms-teams
    wget -O ~/.oS-setup/zoom.rpm https://zoom.us/client/latest/zoom_openSUSE_x86_64.rpm ## zoom 64bit
    sudo zypper --gpg-auto-import-keys refresh
    sudo zypper refresh
    ## Check again for update
    sudo zypper update
    sudo zypper --non-interactive install $(cat ~/oS-setup/opensuse.packages)
}

version() {
    echo "The script: ./opensuse-setup.sh" 
    echo "is at verion 0.0.2"
    echo "Do you like my script please donate at https://www.paypal.com/donate/?hosted_button_id=AKQYLCV9LU2S4"
    echo "Thanks in advance"
    return
}
menu() {
    sleep 1
    echo ""
    echo "Select an option!"
    echo ""
    echo "s     Setup ssh-key ## Work in progress" ## function = setup_ssh
    echo "g     Setup pgp-key ## Work in progress" ## function = setup_pgp
    echo "i     Install packages ## Work in progress" ## function = install_packages
    echo "b     Change bash its looks and feels by adding content to .bashrc ## Work in progress" ## function = bashrc
    echo "V     Show version number ## Work in progress" ## function = version
    echo "o     Make this script as a shortcut in bash! ## Work in progress" ## function = shortcut
    echo "q     Quit this script"
    echo ""
    response
}
response() {
    read n
    case $n in
            s)
                echo "You chose to update this script"
                sleep 2
                clear
                update
                sleep 1
                menu;;
            g)
                echo "You chose to setup ssh"
                sleep 2
                clear
                setup_ssh
                sleep 1
                menu;;
            i)
                echo "You chose to update this script"
                sleep 2
                clear
                install_packages
                sleep 1
                menu;;
            b)
                echo "You chose to setup ssh"
                sleep 2
                clear
                setup_ssh
                sleep 1
                menu;;
            V)
                echo "You chose to show the version of this script"
                sleep 2
                clear
                version
                sleep 1
                menu;;
            o)
                echo "You chose to setup ssh"
                sleep 2
                clear
                setup_ssh
                sleep 1
                menu;;
            q)
                echo "You chose to quit"
                sleep 2
                clear
                exit;;
    esac
}
while getopts ":a" option; do
    case $option in
        a) # Run opensuse setup no update
        version
        exit;;
        \?) # Invalid option
        echo 'Invalid option'
        help
        exit;
    esac
done
menu