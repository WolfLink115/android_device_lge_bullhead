#
#	This file is part of the OrangeFox Recovery Project
# 	Copyright (C) 2023 The OrangeFox Recovery Project
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

# OrangeFox settings
OF_USE_GREEN_LED := 1
OF_FLASHLIGHT_ENABLE := 1
OF_IGNORE_LOGICAL_MOUNT_ERRORS := 1
OF_BIND_MOUNT_SDCARD_ON_FORMAT := 1

# Custom pic for maintainers about section info
# Image should be 32 bit PNG 192 x 192 px - Size of image should be as small as possible 50kb
OF_MAINTAINER_AVATAR := /device/lge/bullhead/author.png
OF_MAINTAINER := WolfLink115

# Maximum permissible splash image size (in kilobytes); do *NOT* increase
OF_SPLASH_MAX_SIZE := 64

OF_ADVANCED_SECURITY := 1
OF_DONT_PATCH_ENCRYPTED_DEVICE := 1
OF_NO_RELOAD_AFTER_DECRYPTION := 1

# Recovery additional features
OF_ENABLE_LPTOOLS := 0
OF_DISABLE_OTA_MENU := 1

# OTA
OF_NO_TREBLE_COMPATIBILITY_CHECK := 1
OF_KEEP_DM_VERITY_FORCED_ENCRYPTION := 1
