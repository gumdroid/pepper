# Define components to include in an Androild build for this product.
# Based on device.mk from TI's beaglebone and panda

KERNEL_CONFIG := $(LOCAL_PATH)/pepper_android_defconfig

# Pull in specific local files
PRODUCT_COPY_FILES := \
	$(LOCAL_PATH)/init.pepper.rc:root/init.pepper.rc \
	$(LOCAL_PATH)/init.pepper.usb.rc:root/init.pepper.usb.rc \
	$(LOCAL_PATH)/libaudio/audio_policy.conf:system/etc/audio_policy.conf \
	$(LOCAL_PATH)/libaudio/mixer_paths.xml:system/etc/mixer_paths.xml \
	$(LOCAL_PATH)/fstab.pepper:root/fstab.pepper \
	$(LOCAL_PATH)/uEnv.txt:boot/uEnv.txt \
	$(LOCAL_PATH)/media_codecs.xml:system/etc/media_codecs.xml \
	$(LOCAL_PATH)/media_profiles.xml:system/etc/media_profiles.xml \
	$(LOCAL_PATH)/initlogo.rle:root/initlogo.rle \
	$(LOCAL_PATH)/sd8787_uapsta.bin:system/vendor/firmware/mrvl/sd8787_uapsta.bin \
	$(LOCAL_PATH)/TIInit_11.8.32.bts:system/vendor/firmware/TIInit_11.8.32.bts \
	$(LOCAL_PATH)/wl1271-nvs.bin:system/vendor/firmware/ti-connectivity/wl1271-nvs.bin \
	$(LOCAL_PATH)/wl18xx-fw-2.bin:system/vendor/firmware/ti-connectivity/wl18xx-fw-2.bin \
	$(LOCAL_PATH)/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl \
	$(LOCAL_PATH)/ti-tsc.idc:system/usr/idc/ti-tsc.idc \
	$(LOCAL_PATH)/ADS7846_Touchscreen.idc:system/usr/idc/ADS7846_Touchscreen.idc \
	$(LOCAL_PATH)/EP0820M09.idc:system/usr/idc/EP0820M09.idc \
	$(LOCAL_PATH)/ueventd.pepper.rc:root/ueventd.pepper.rc \
	frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
        system/bluetooth/data/main.nonsmartphone.conf:system/etc/bluetooth/main.conf \
	frameworks/native/data/etc/android.hardware.touchscreen.xml:system/etc/permissions/android.hardware.touchscreen.xml \
	frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
	frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml

# Explicitly specify dpi, otherwise the icons don't show up correctly with SGX enabled
# Our screen is 4.3" 480x272: roughly 120 display-independent-pixels
PRODUCT_PROPERTY_OVERRIDES += ro.sf.lcd_density=120

# Networks
PRODUCT_PROPERTY_OVERRIDES += wifi.interface=wlan0

# System specific libraries
PRODUCT_PACKAGES += \
	lights.pepper \
	sensors.pepper \
	audio.primary.pepper \
	uim-sysfs

# SGX
PRODUCT_PACKAGES += sgx_userspace_blobs samplemedia
