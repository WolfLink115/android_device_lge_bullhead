#
#	This file is part of the OrangeFox Recovery Project
# 	Copyright (C) 2020-2021 The OrangeFox Recovery Project
#
#	OrangeFox is free software: you can redistribute it and/or modify
#	it under the terms of the GNU General Public License as published by
#	the Free Software Foundation, either version 3 of the License, or
#	any later version.
#
#	OrangeFox is distributed in the hope that it will be useful,
#	but WITHOUT ANY WARRANTY; without even the implied warranty of
#	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#	GNU General Public License for more details.
#
# 	This software is released under GPL version 3 or any later version.
#	See <http://www.gnu.org/licenses/>.
#
# 	Please maintain this if you use this script or any part of it
#
FDEVICE="bullhead"
#set -o xtrace

fox_get_target_device() {
local chkdev=$(echo "$BASH_SOURCE" | grep -w $FDEVICE)
   if [ -n "$chkdev" ]; then
      FOX_BUILD_DEVICE="$FDEVICE"
   else
      chkdev=$(set | grep BASH_ARGV | grep -w $FDEVICE)
      [ -n "$chkdev" ] && FOX_BUILD_DEVICE="$FDEVICE"
   fi
}

if [ -z "$1" -a -z "$FOX_BUILD_DEVICE" ]; then
   fox_get_target_device
fi

if [ "$1" = "$FDEVICE" -o "$FOX_BUILD_DEVICE" = "$FDEVICE" ]; then
	export LC_ALL="C"
 	export ALLOW_MISSING_DEPENDENCIES=true

 	#OFR build settings & info
 	export FOX_VANILLA_BUILD=1
	export FOX_USE_TWRP_RECOVERY_IMAGE_BUILDER=1
	export FOX_RECOVERY_SYSTEM_PARTITION="/dev/block/platform/soc.0/f9824900.sdhci/by-name/system"
	export FOX_RECOVERY_VENDOR_PARTITION="/dev/block/platform/soc.0/f9824900.sdhci/by-name/vendor"
	export FOX_DELETE_INITD_ADDON=1

	# Store settings at /data/recovery instead of internal storage
	#export FOX_USE_DATA_RECOVERY_FOR_SETTINGS=1

	#OFR binary files
	export FOX_REPLACE_BUSYBOX_PS=1
	export FOX_USE_BASH_SHELL=1
	export FOX_ASH_IS_BASH=1
	export FOX_REPLACE_TOOLBOX_GETPROP=1
	export FOX_USE_TAR_BINARY=1
	export FOX_USE_XZ_UTILS=1
	export FOX_USE_SED_BINARY=1
	export FOX_USE_NANO_EDITOR=1

	# Security (Disables MTP&ADB during password prompt)

	# Debugging
	#export FOX_RESET_SETTINGS=0
	#export FOX_INSTALLER_DEBUG_MODE=1

	# Other..
	export TW_DEFAULT_LANGUAGE="en"
	export LC_ALL="C"

	# Version & Variant
	export FOX_MAINTAINER_PATCH_VERSION="12"
	export FOX_VARIANT="V1"
	export FOX_BUILD_TYPE="Alpha"

	#OTA
	export FOX_DELETE_AROMAFM=1
	export FOX_ENABLE_APP_MANAGER=1

	lunch twrp_$FDEVICE-eng
	# let's see what are our build VARs
	if [ -n "$FOX_BUILD_LOG_FILE" -a -f "$FOX_BUILD_LOG_FILE" ]; then
  	   export | grep "FOX" >> $FOX_BUILD_LOG_FILE
  	   export | grep "OF_" >> $FOX_BUILD_LOG_FILE
   	   export | grep "TARGET_" >> $FOX_BUILD_LOG_FILE
  	   export | grep "TW_" >> $FOX_BUILD_LOG_FILE
 	fi
fi
#
