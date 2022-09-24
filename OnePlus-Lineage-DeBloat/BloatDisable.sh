#!sbin/sh
ADB=/usr/bin/adb
"$ADB" shell "echo Proceeding with batch disable..."

# Uninstall apps: adb shell pm uninstall --user 0 <package name>
# Reinstall app: cmd package install-existing --user 0 <package name>
# Disable app: adb shell pm disable-user <package name>

"$ADB" shell pm disable-user com.android.printspooler
"$ADB" shell pm disable-user com.android.bluetooth
"$ADB" shell pm disable-user com.android.bluetoothmidiservice
"$ADB" shell pm disable-user com.android.mms.service
"$ADB" shell pm disable-user com.android.printservice.recommendation
"$ADB" shell pm disable-user com.android.wallpaper.livepicker
"$ADB" shell pm disable-user com.android.statementservice
"$ADB" shell pm disable-user com.android.traceur
"$ADB" shell pm disable-user com.android.nfc

"$ADB" shell "echo Batch disable complete!"
return
