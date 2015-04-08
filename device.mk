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
	$(LOCAL_PATH)/sd8787_uapsta.bin:system/etc/firmware/mrvl/sd8787_uapsta.bin \
	$(LOCAL_PATH)/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl \
	$(LOCAL_PATH)/ti-tsc.idc:system/usr/idc/ti-tsc.idc \
	frameworks/native/data/etc/android.hardware.touchscreen.xml:system/etc/permissions/android.hardware.touchscreen.xml \
	frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
	frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml

# Don't make SGX work too hard
# PRODUCT_PROPERTY_OVERRIDES := hwui.render_dirty_regions=false

# Explicitly specify dpi, otherwise the icons don't show up correctly with SGX enabled
# Our screen is 4.3" 480x272: roughly 120 display-independent-pixels
PRODUCT_PROPERTY_OVERRIDES += ro.sf.lcd_density=120

# Networks
PRODUCT_PROPERTY_OVERRIDES += wifi.interface=mlan0

# System specific libraries
PRODUCT_PACKAGES += \
	lights.pepper \
	sensors.pepper \
	audio.primary.pepper

# SGX
#PRODUCT_PACKAGES += sgx_userspace_blobs

$(call inherit-product, frameworks/native/build/tablet-dalvik-heap.mk)
