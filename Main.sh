#!sbin/sh
ADB=/usr/bin/adb
myDir="$(readlink -f "$0")"
myDir=${myDir%"$0"} #removes "$0" from end(%) of myDir
# echo "${myDir}"
# Uninstall apps: adb shell pm uninstall --user 0 <package name>
# Reinstall app: cmd package install-existing --user 0 <package name>
# Disable app: adb shell pm disable-user <package name>

finished () {
echo "Finished!"
exit 0
}

confirm_uninstall () {
echo -e "\nFiles to be uninstalled:\n"
echo "$(<UninstallList.txt)"
echo -e "\nConfirm[nye]:"
read AnswerU
case $AnswerU in
    n)
        echo -e "\nSkipping..."
        confirm_disable ;;
    y)
        input="${myDir}UninstallList.txt"
        "$ADB" shell "echo Proceeding with batch uninstall..."
        while read -r line
        do
            echo "Uninstalling: $line"
            "$ADB" shell -n pm uninstall --user 0 "$line"
        done < $input
        confirm_disable ;;
    e)
        exit 0 ;;
    *)
        echo -e "\nError: Incorrect character(s)"
        confirm_uninstall ;;
esac
}

confirm_disable () {
echo -e "\nFiles to be disabled:\n"
echo "$(<DisableList.txt)"
echo -e "\nConfirm[nye]:"
read AnswerD
case $AnswerD in
    n)
        echo -e "\nNothing left to do\nExiting..."
        exit 0 ;;
    y)
        input="${myDir}DisableList.txt"
        "$ADB" shell "echo Proceeding with batch disable..."
        while read -r line
        do
            "$ADB" shell -n pm disable-user "$line"
        done < $input
        finished ;;
    e)
        exit 0 ;;
    *)
        echo -e "\nError: Incorrect character(s)"
        confirm_disable ;;
esac
}

adb devices
confirm_uninstall
confirm_disable
finished

