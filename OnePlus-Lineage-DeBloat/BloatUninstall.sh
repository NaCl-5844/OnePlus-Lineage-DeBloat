#!sbin/sh
ADB=/usr/bin/adb
"$ADB" shell "echo Proceeding with batch uninstall..."

# Uninstall apps: adb shell pm uninstall --user 0 <package name>
# Reinstall app: cmd package install-existing --user 0 <package name>
# Disable app: adb shell pm disable-user <package name>

"$ADB" shell pm uninstall --user 0 com.android.htmlviewer
"$ADB" shell pm uninstall --user 0 com.android.providers.calendar
"$ADB" shell pm uninstall --user 0 com.android.providers.media
"$ADB" shell pm uninstall --user 0 org.lineageos.recorder
"$ADB" shell pm uninstall --user 0 com.android.hotwordenrollment.okgoogle
"$ADB" shell pm uninstall --user 0 com.android.hotwordenrollment.xgoogle
"$ADB" shell pm uninstall --user 0 com.android.cellbroadcastreceiver
"$ADB" shell pm uninstall --user 0 com.android.cellbroadcastreceiver.module
"$ADB" shell pm uninstall --user 0 org.lineageos.jelly
"$ADB" shell pm uninstall --user 0 com.android.egg
"$ADB" shell pm uninstall --user 0 com.android.gallery3d
"$ADB" shell pm uninstall --user 0 com.dsi.ant.server
"$ADB" shell pm uninstall --user 0 com.android.carrierdefaultapp
"$ADB" shell pm uninstall --user 0 com.android.carrierconfig
"$ADB" shell pm uninstall --user 0 com.android.bookmarkprovider
"$ADB" shell pm uninstall --user 0 com.android.dreams.basic
"$ADB" shell pm uninstall --user 0 com.android.captiveportallogin
# "$ADB" shell pm uninstall --user 0 com.android.inputmethod.latin
"$ADB" shell pm uninstall --user 0 com.android.calculator2
"$ADB" shell pm uninstall --user 0 com.android.emergency
"$ADB" shell pm uninstall --user 0 com.qualcomm.wfd.service

"$ADB" shell "echo Batch uninstall complete!"
return
