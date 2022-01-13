#!/usr/bin/bash
#
# This litle bash script update to the latest script and then it runs that script.
#
#
run_oss() {
    ~/.oS-setup/run_oss.sh
    return
}
help() {
    echo "This script help you to setup opensuse"
    echo ""
    echo "-r        To run this script without update"
    echo ""
    exit
}
while getopts ":rh" option; do
    case $option in
        r) # Run opensuse setup no update
        run_oss
        exit;;
        h) # help
        help
        exit;;
        \?) # Invalid option
        echo 'Invalid option'
        help
        exit;
    esac
done

wget -o ~/.oS-setup/run_oss.sh https://raw.githubusercontent.com/dpater1986/Pater-s-OpenSuse-setup/add_options/.oS-setup/run_oss.sh
chmod +x ~/.oS-setup/run_oss.sh
run_oss