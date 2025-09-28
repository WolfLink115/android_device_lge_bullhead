#
# Copyright 2017 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# This contains the module build definitions for the hardware-specific
# components for this device.
#
# As much as possible, those components should be built unconditionally,
# with device-specific names to avoid collisions, to avoid device-specific
# bitrot and build breakages. Building a component unconditionally does
# *not* include it on all devices, so it is safe even with hardware-specific
# components.

# Device Path
DEVICE_PATH := device/lge/bullhead

# For building with minimal manifest
ALLOW_MISSING_DEPENDENCIES := true

# Build Hack
BUILD_BROKEN_DUP_RULES := true

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := cortex-a53

# Second architecture
TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a53

TARGET_USES_AOSP := true

# Bootloader
PRODUCT_PLATFORM := msm8992
TARGET_NO_BOOTLOADER := false

# Inline kernel
BOARD_KERNEL_IMAGE_NAME := Image.gz-dtb
TARGET_KERNEL_SOURCE := kernel/lge/bullhead
TARGET_KERNEL_CONFIG := lineageos_bullhead_defconfig
TARGET_KERNEL_ARCH := arm64
TARGET_KERNEL_HEADER_ARCH := arm64
TARGET_KERNEL_CROSS_COMPILE_PREFIX := aarch64-linux-android-
TARGET_COMPILE_WITH_MSM_KERNEL := true
TARGET_KERNEL_CLANG_COMPILE := false
BOARD_KERNEL_BASE        := 0x00000000
BOARD_KERNEL_PAGESIZE    := 4096
BOARD_KERNEL_TAGS_OFFSET := 0x01E00000
BOARD_RAMDISK_OFFSET     := 0x02000000
BOARD_KERNEL_CMDLINE := console=ttyHSL0,115200,n8 androidboot.hardware=bullhead boot_cpus=0-5
BOARD_KERNEL_CMDLINE += lpm_levels.sleep_disabled=1 msm_poweroff.download_mode=0
BOARD_KERNEL_CMDLINE += loop.max_part=7

BOARD_MKBOOTIMG_ARGS := --ramdisk_offset $(BOARD_RAMDISK_OFFSET) --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)

TARGET_USERIMAGES_USE_EXT4 := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 33554432
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 33554432
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 3221225472
BOARD_SYSTEMIMAGE_JOURNAL_SIZE := 0
BOARD_SYSTEMIMAGE_EXTFS_INODE_COUNT := 4096
BOARD_USERDATAIMAGE_PARTITION_SIZE := 11649679360
BOARD_CACHEIMAGE_PARTITION_SIZE := 100663296
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_PARTITION_SIZE := 260046848
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_FLASH_BLOCK_SIZE := 131072

# Build a separate vendor.img
TARGET_COPY_OUT_VENDOR := vendor

# Recovery
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_HAS_NO_SELECT_BUTTON := true
TARGET_RECOVERY_FSTAB = device/lge/bullhead/fstab.bullhead

TARGET_USES_64_BIT_BINDER := true

# Testing related defines
BOARD_PERFSETUP_SCRIPT := platform_testing/scripts/perf-setup/bullhead-setup.sh

# APEX
DEXPREOPT_GENERATE_APEX_IMAGE := true

# Hack: prevent anti rollback
BOARD_USES_METADATA_PARTITION := true
#TW_INCLUDE_FBE_METADATA_DECRYPT := true
#TW_USE_FSCRYPT_POLICY := 2
PLATFORM_VERSION := 12
PLATFORM_VERSION_LAST_STABLE := $(PLATFORM_VERSION)
PLATFORM_SECURITY_PATCH := 2099-12-31
BOOT_SECURITY_PATCH := $(PLATFORM_SECURITY_PATCH)
VENDOR_SECURITY_PATCH := $(PLATFORM_SECURITY_PATCH)

# TWRP Configuration
TW_THEME := portrait_hdpi
TW_EXTRA_LANGUAGES := false
TW_DEFAULT_LANGUAGE := en
RECOVERY_GRAPHICS_USE_LINELENGTH := true
BOARD_SUPPRESS_SECURE_ERASE := true
RECOVERY_SDCARD_ON_DATA := true
BOARD_HAS_NO_REAL_SDCARD := true
TW_BRIGHTNESS_PATH := "/sys/class/leds/lcd-backlight/brightness"
TW_MAX_BRIGHTNESS := 255
TARGET_RECOVERY_QCOM_RTC_FIX := true
TW_EXCLUDE_TWRPAPP := true
TW_EXCLUDE_APEX := true
TW_DISABLE_TTF := true
TW_INCLUDE_NTFS_3G := false
TW_INCLUDE_LPTOOLS := false
TW_EXCLUDE_TZDATA := true
TW_EXCLUDE_LPDUMP := true
TW_INCLUDE_REPACKTOOLS := false
TW_INCLUDE_RESETPROP := false
TW_SDEXT_NO_EXT4 := true
TW_OEM_BUILD := true
TW_EXCLUDE_SUPERSU := true
TWHAVE_SELINUX := false
TW_NO_USB_STORAGE := true
TW_NO_EXFAT_FUSE := true
TWRP_INCLUDE_LOGCAT := false
TW_USE_TOOLBOX := true
TW_NO_EXFAT := true
TW_INCLUDE_PYTHON := false

-include vendor/lge/bullhead/BoardConfigVendor.mk
