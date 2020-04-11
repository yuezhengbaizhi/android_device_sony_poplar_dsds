### PLATFORM
$(call inherit-product, device/sony/yoshino/platform.mk)
### PROPRIETARY VENDOR FILES
$(call inherit-product, vendor/sony/poplar_dsds/poplar_dsds-vendor.mk)

ifeq ($(WITH_FDROID),true)
$(call inherit-product, vendor/fdroid/fdroid-vendor.mk)
endif

### DALVIK
$(call inherit-product, frameworks/native/build/phone-xhdpi-4096-dalvik-heap.mk)

DEVICE_PATH := device/sony/poplar_dsds

# Camera Configuration
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/vendor/etc/camera/camera_config.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/camera_config.xml \
    $(DEVICE_PATH)/vendor/etc/camera/imx219_chromatix.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/imx219_chromatix.xml \
    $(DEVICE_PATH)/vendor/etc/camera/imx400_chromatix.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/imx400_chromatix.xml

# AR config for Play Store
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/vendor/etc/permissions/android.hardware.camera.ar.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.ar.xml

# Wallpapers
PRODUCT_PACKAGES += \
    PixelLiveWallpaperPrebuilt
    
# Device uses high-density artwork where available
PRODUCT_AAPT_CONFIG := normal hdpi xhdpi
PRODUCT_AAPT_PREF_CONFIG := xhdpi

DEVICE_PACKAGE_OVERLAYS += \
    $(DEVICE_PATH)/overlay

ifeq ($(WITH_TWRP),true)
include $(DEVICE_PATH)/device/init.mk
else # WITH_TWRP
include $(DEVICE_PATH)/device/*.mk
include $(DEVICE_PATH)/vendor_prop.mk
endif # WITH_TWRP
