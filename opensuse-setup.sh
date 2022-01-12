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

update() {
    echo "Update this script!"
    mkdir -p ~/.oS-setup
    wget -o ~/.oS-setup/update-oss.sh https://raw.githubusercontent.com/dpater1986/Pater-s-OpenSuse-setup/add_options/.oS-setup/update-oss.sh
    chmod +x ~/.oS-setup/update-oss.sh
    ~/oS-setup/update-oss.sh
}
version() {
    echo "The script: ./opensuse-setup.sh" 
    echo "is at verion 0.0.1"
    echo "Do you like my script please donate at https://www.paypal.com/donate/?hosted_button_id=AKQYLCV9LU2S4"
    echo "Thanks in advance"
    return
} 
setup_ssh() {
    echo 'test ssh'
} 

menu() {
    sleep 2
    echo ""
    echo "Select an option!"
    echo ""
    echo "u     Update this script"
    echo "s     Setup ssh"
    echo "V     Show version number"
    echo "q     Quit this script"
    echo ""
    read n
    case $n in
            u)
                echo "You chose to update this script"
                sleep 2
                clear
                update
                sleep 1
                menu;;
            s)
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
            q)
                echo "You chose to quit"
                sleep 2
                clear
                exit;;
    esac
}

while getopts ":msuV" option; do
    case $option in
        m) #Display menu
        menu
        exit;;
        s) # Start ssh-setup
        setup_ssh
        exit;;
        u) # Reinstall this script
        update
        exit;;
        V) # Show version
        version
        exit;;
        \?) # Invalid option
        echo 'Load menu'
        sleep 3
        menu
        exit;
    esac
done

menu