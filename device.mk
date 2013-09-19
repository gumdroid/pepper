#
# Copyright (C) 2011 The Android Open-Source Project
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


PRODUCT_COPY_FILES := \
	$(LOCAL_PATH)/init.pepper.rc:root/init.pepper.rc \
	$(LOCAL_PATH)/init.pepper.usb.rc:root/init.pepper.usb.rc \
	$(LOCAL_PATH)/fstab.pepper:root/fstab.pepper \
	$(LOCAL_PATH)/media_codecs.xml:system/etc/media_codecs.xml \
	$(LOCAL_PATH)/media_profiles.xml:system/etc/media_profiles.xml \
	$(LOCAL_PATH)/initlogo.rle:root/initlogo.rle \
	$(LOCAL_PATH)/sd8787_uapsta.bin:system/etc/firmware/mrvl/sd8787_uapsta.bin \
	frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml

INTERNAL_BOOTIMAGE_FILES := $(LOCAL_PATH)/uEnv.txt

# KeyPads
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl \
    $(LOCAL_PATH)/ti-tsc.idc:system/usr/idc/ti-tsc.idc

PRODUCT_PROPERTY_OVERRIDES := \
       hwui.render_dirty_regions=false

# Explicitly specify dpi, otherwise the icons don't show up correctly with SGX enabled
PRODUCT_PROPERTY_OVERRIDES += \
       ro.sf.lcd_density=160

PRODUCT_PROPERTY_OVERRIDES += \
	persist.sys.strictmode.visual=0 \
	persist.sys.strictmode.disable=1

PRODUCT_CHARACTERISTICS := tablet,nosdcard

DEVICE_PACKAGE_OVERLAYS := \
    device/gumstix/pepper/overlay

PRODUCT_TAGS += dalvik.gc.type-precise

# host package required for making sdcard tarball
PRODUCT_PACKAGES += \
       fs_get_stats

PRODUCT_PACKAGES += \
	librs_jni \
	com.android.future.usb.accessory

PRODUCT_PACKAGES += \
	libaudioutils

PRODUCT_PACKAGES += \
        tinycap \
        tinymix \
        tinyplay

PRODUCT_PACKAGES += \
	dhcpcd.conf

# Filesystem management tools
PRODUCT_PACKAGES += \
	make_ext4fs

# Backlight HAL (liblights)
PRODUCT_PACKAGES += \
	lights.pepper

PRODUCT_PACKAGES += \
	sensors.pepper \

$(call inherit-product, frameworks/native/build/tablet-dalvik-heap.mk)
$(call inherit-product-if-exists, external/tslib/tslib.mk)
