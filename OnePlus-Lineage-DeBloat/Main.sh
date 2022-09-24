#!sbin/sh
ADB=/usr/bin/adb
myDir="$(readlink -f "$0")"
myDir=${myDir%"$0"} #removes "$0" from end(%) of myDir
# echo "${myDir}BloatUninstall.sh"

finished () {
echo "Finished!"
exit 0
}

confirm_uninstall () {
echo -e "Files to be uninstalled:\n"
echo "$(<AndroidLineage_UninstallList)"
echo -e "\nConfirm[nyse]:"
read AnswerU
case $AnswerU in
    n)
        echo -e "\nexit 1"
        exit 0 ;;
    y)
        source "${myDir}BloatUninstall.sh" ;;
    s)
        echo "\nSkipping..."
        confirm_disable ;;
    e)
        exit 0;;
    *)
        echo -e "\nError: Incorrect character(s)"
        confirm_uninstall ;;
esac
}

confirm_disable () {
echo -e "Files to be disabled:\n"
echo "$(<AndroidLineage_DisableList)"
echo -e "\nConfirm[nyse]:"
read AnswerD
case $AnswerD in
    n)
        echo -e "\nexit 1"
        exit 0 ;;
    y)
        source "${myDir}BloatDisable.sh"
        finished ;;
    s)
        echo -e "\nNothing left to do\nExiting..."
        exit 0;;
    e)
        exit 0;;
    *)
        echo -e "\nError: Incorrect character(s)"
        confirm_disable ;;
esac
}

adb devices
confirm_uninstall
confirm_disable
finished

