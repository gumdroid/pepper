# Product-specific compile-time definitions

# Build bootloader and kernel from source; don't just install binaries
TARGET_NO_BOOTLOADER := true
TARGET_NO_KERNEL := true
UBOOT_DIR := $(TOP)/uboot
UBOOT_CONFIG := am335x_pepper
KERNEL_DIR := $(TOP)/kernel
KERNEL_CONFIG := pepper_android_defconfig

# As of Android 4.3, no special optimizations for Cortex-A8
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
ARCH_ARM_HAVE_TLS_REGISTER := true
TARGET_CPU_VARIANT := generic
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_BOARD_PLATFORM := omap3

# We've got bluetooth & wifi
BOARD_HAVE_BLUETOOTH := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/generic/common/bluetooth

WPA_SUPPLICANT_VERSION	:= VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_mrvl8787
BOARD_WLAN_DEVICE := mrvl
BOARD_WLAN_VENDOR := MRVL
WIFI_DRIVER_MODULE_PATH := "/system/modules/mwifiex_sdio.ko"
WIFI_DRIVER_MODULE_NAME := "mwifiex_sdio"
WIFI_DRIVER_FW_PATH_STA	:= "/system/etc/firmware/sd8787_uapsta.bin"
WIFI_DRIVER_FW_PATH_AP	:= "/system/etc/firmware/sd8787_uapsta.bin"
WIFI_FIRMWARE_LOADER :=

# Audio Setup
BOARD_USES_ALSA_AUDIO := true
BUILD_WITH_ALSA_UTILS := true

# Use SGX for OpenGL
OMAPES := 4.x
USE_OPENGL_RENDERER := true
BOARD_EGL_CFG := device/gumstix/pepper/egl.cfg

# No Recovery Parition
TARGET_NO_RECOVERY := true

# No cell modem
TARGET_NO_RADIOIMAGE := true

# Not sute about these settings
TARGET_USERIMAGES_USE_EXT4 := true
