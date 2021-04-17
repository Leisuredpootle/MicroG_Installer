#!/system/bin/sh

MODDIR=${0%/*}

# microG needs to be installed as user app for all permissions to be granted

install_gmscore () {
		if [ -f "${MODDIR}/system/priv-app/GmsCore/GmsCore.apk" ]; then
			pm list packages -f | grep -q /data.*com.google.android.gms || \
				pm install -r "${MODDIR}/system/priv-app/GmsCore/GmsCore.apk" &
		fi
}

install_droidguardhelper () {
	if [ -f "${MODDIR}/system/priv-app/DroidGuard/DroidGuard.apk" ]; then
		pm list packages -f | grep -q /data.*org.microg.gms.droidguard || \
			pm install -r "${MODDIR}/system/priv-app/DroidGuard/DroidGuard.apk" &
	fi
}

install_phonesky () {
		if [ -f "${MODDIR}/system/priv-app/Phonesky/Phonesky.apk" ]; then
			pm list packages -f | grep -q /data.*com.android.vending || \
				pm install -r "${MODDIR}/system/priv-app/Phonesky/Phonesky.apk" &
		fi
}

install_GoogleCalendarSyncAdapter () {
		if [ -f "${MODDIR}/system/app/GoogleCalendarSyncAdapter/GoogleCalendarSyncAdapter.apk" ]; then
			pm list packages -f | grep -q /data.*com.google.android.syncadapters.calendar || \
				pm install -r "${MODDIR}/system/app/GoogleCalendarSyncAdapter/GoogleCalendarSyncAdapter.apk" &
		fi
}

install_GoogleContactsSyncAdapter () {
		if [ -f "${MODDIR}/system/app/GoogleContactsSyncAdapter/GoogleContactsSyncAdapter.apk" ]; then
			pm list packages -f | grep -q /data.*com.google.android.syncadapters.contacts || \
				pm install -r "${MODDIR}/system/app/GoogleContactsSyncAdapter/GoogleContactsSyncAdapter.apk" &
		fi
}

while [ "$(getprop sys.boot_completed)" != "1" ]; do
  usleep 500
done

install_droidguardhelper
install_gmscore
install_phonesky
install_GoogleCalendarSyncAdapter
install_GoogleContactsSyncAdapter