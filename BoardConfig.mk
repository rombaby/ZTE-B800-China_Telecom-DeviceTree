#
# Copyright 2015 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# mt6795 platform boardconfig
LOCAL_PATH := device/zte/b880
#-include vendor/zte/b880/BoardConfigVendor.mk

TARGET_SPECIFIC_HEADER_PATH := $(LOCAL_PATH)/include

USE_CAMERA_STUB := true

# inherit from the proprietary version

# Platform
ARCH_ARM_HAVE_TLS_REGISTER := true
TARGET_BOARD_PLATFORM := mt6735
TARGET_NO_BOOTLOADER := true
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_NO_FACTORYIMAGE := true

#TARGET_LDPRELOAD += libxlog.so

# CPU
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 := 
TARGET_CPU_VARIANT := generic
TARGET_CPU_SMP := true

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a53
TARGET_BOARD_SUFFIX := _64
TARGET_USES_64_BIT_BINDER := true

TARGET_CPU_CORTEX_A53 := true

TARGET_BOOTLOADER_BOARD_NAME := mt6735

# MTK Hardware
BOARD_HAS_MTK_HARDWARE := true
MTK_HARDWARE := true
#BOARD_USES_LEGACY_MTK_AV_BLOB := true

# Add MTK compile options to wrap MTK's modifications on AOSP.
COMMON_GLOBAL_CFLAGS += -DMTK_AOSP_ENHANCEMENT
COMMON_GLOBAL_CPPFLAGS += -DMTK_AOSP_ENHANCEMENT

# MTK_GPS_SUPPORT
BOARD_GPS_LIBRARIES := true

# MTK_AGPS_APP 
#BOARD_AGPS_SUPL_LIBRARIES := false

# BOARD_CONNECTIVITY_VENDOR  MediaTek
#BOARD_CONNECTIVITY_MODULE := MT6630 
#BOARD_MEDIATEK_USES_GPS := true

BOARD_CONNECTIVITY_VENDOR := MediaTek
BOARD_USES_MTK_AUDIO := true


#Use dlmalloc instead of jemalloc for mallocs
#MALLOC_IMPL := dlmalloc

# kernel
#TARGET_KERNEL_ARCH := arm64
#TARGET_KERNEL_HEADER_ARCH := arm64
#TARGET_KERNEL_SOURCE := kernel/xiaomi/hermes
#TARGET_KERNEL_CONFIG := hermes_defconfig
TARGET_USES_64_BIT_BINDER := true
TARGET_IS_64_BIT := true
BOARD_KERNEL_CMDLINE := bootopt=64S3,32N2,64N2
BOARD_KERNEL_BASE := 0x40078000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_MKBOOTIMG_ARGS := --base 0x40078000 --pagesize 2048 --kernel_offset 0x00008000 --ramdisk_offset 0x03f88000 --tags_offset 0x0df88000 --board P635N30V2.0.0B0
TARGET_PREBUILT_KERNEL := $(LOCAL_PATH)/kernel

TARGET_KMODULES := true
# Disable memcpy opt (for audio libraries)
TARGET_CPU_MEMCPY_OPT_DISABLE := true

# Display
USE_OPENGL_RENDERER := true
BOARD_EGL_CFG := $(LOCAL_PATH)/configs/egl.cfg
TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 720

# Flags
COMMON_GLOBAL_CFLAGS += -DNO_SECURE_DISCARD

# LightHAL
#TARGET_PROVIDES_LIBLIGHT := true

# Enable Minikin text layout engine (will be the default soon)
USE_MINIKIN := true

# Charger
BOARD_CHARGER_SHOW_PERCENTAGE := true

# Fonts
EXTENDED_FONT_FOOTPRINT := true

TARGET_PROVIDES_INIT_RC := true

TARGET_SYSTEM_PROP := $(LOCAL_PATH)/system.prop

# Set Mediatek-RIL by gesangtome

BOARD_CONNECTIVITY_VENDOR := MediaTek
BOARD_CONNECTIVITY_MODULE := conn_soc


# Add Bluetooth-Name by gesangtome
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_MTK := true
BOARD_BLUETOOTH_DOES_NOT_USE_RFKILL := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(LOCAL_PATH)/bluetooth

# Add Wlan-suppopt by gesangtome
WPA_SUPPLICANT_VERSION           := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER      := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_mt66xx
BOARD_HOSTAPD_DRIVER             := NL80211
BOARD_HOSTAPD_PRIVATE_LIB        := lib_driver_cmd_mt66xx
WIFI_DRIVER_FW_PATH_PARAM:="/dev/wmtWifi"
WIFI_DRIVER_FW_PATH_STA:=STA
WIFI_DRIVER_FW_PATH_AP:=AP
WIFI_DRIVER_FW_PATH_STA:=P2P

# Emmc-Partitions Sizes by gesangtome
TARGET_USERIMAGES_USE_EXT4:=true
BOARD_BOOTIMAGE_PARTITION_SIZE := 20971520
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 20971520
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1610612736
BOARD_USERDATAIMAGE_PARTITION_SIZE := 13474725888
BOARD_FLASH_BLOCK_SIZE := 131072

BOARD_HAS_LARGE_FILESYSTEM := true
TARGET_USERIMAGES_USE_EXT4 := true

# USB-Mount Lun File by gesangtome
TARGET_USE_CUSTOM_LUN_FILE_PATH := '/sys/class/android_usb/android0/f_mass_storage/lun/file'

BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_RECOVERY_SWIPE := true
BOARD_SUPPRESS_EMMC_WIPE := true
BOARD_USE_CUSTOM_RECOVERY_FONT := \"roboto_15x24.h\"

# Set Recovery partitions fstab by gesangtome
TARGET_RECOVERY_FSTAB := $(LOCAL_PATH)/ramdisk/recovery.fstab
TARGET_RECOVERY_PIXEL_FORMAT := "RGBA_8888"
TARGET_GLOBAL_CFLAGS   += -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mfpu=neon -mfloat-abi=softfp
TARGET_USERIMAGES_USE_EXT4 := true

# Set SeLinux Path by gesangtome
BOARD_SEPOLICY_DIRS := \
       device/zte/b880/sepolicy

# Install SeLinux Files by gesangtome
BOARD_SEPOLICY_UNION := \
       6620_launcher.te \
       aee_core_forwarder.te \
       akmd8963.te \
       akmd09911.te \
       akmd8975.te \
       ami304d.te \
       app.te \
       atcid.te \
       atci_service.te \
       audiocmdservice_atci.te \
       BGW.te \
       bmm050d.te \
       ccci_fsd.te \
       ccci_mdinit.te \
       dhcp6c.te \
       dm_agent_binder.te \
       dmlog.te \
       domain.te \
       dualmdlogger.te \
       emdlogger1.te \
       em_svr.te \
       enableswap.te \
       epdg_wod.te.te \
       file.te \
       file_contexts \
       geomagneticd.te \
       gsm0710muxd.te \
       gsm0710muxdmd2.te \
       guiext-server.te \
       healthd \
       hostapd.te \
       init.te \
       kernel.te \
       launchpppoe.te \
       matv.te \
       mc6420d.te \
       md_ctrl.te \
       mdlogger.te \
       memsicd.te \
       memsicd3416x.te \
       mobile_log_d.te \
       msensord.te \
       mtk_agpsd.te \
       mtkbt.te \
       MtkCodecService.te \
       mtk_file.te \
       mtkrild.te \
       mtkrildmd2.te \
       muxreport.te \
       netd.te \
       netdiag.te \
       nvram_agent_binder.te \
       nvram_daemon.te \
       orientationd.te \
       permission_check.te \
       pppd_dt.te \
       pppd_via.te \
       pq.te \
       property_contexts \
       s62xd.te \
       sbchk.te \
       service_contexts \
       sn.te \
       terservice.te \
       thermal.te \
       thermald.te \
       thermal_manager.te \
       tiny_mkswap.te \
       tiny_swapon.te \
       wifi2agps.te \
       wmt_loader.te \
       wpa.te \
       xlog.te \
