$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# Inherit device configuration
$(call inherit-product, device/sony/poplar_dsds/device.mk)

# Product API level
$(call inherit-product, $(SRC_TARGET_DIR)/product/product_launched_with_o.mk)

### BOOTANIMATION
# vendor/aosp/config/common_full_phone.mk
TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1080
# vendor/lineage/config/common.mk
TARGET_BOOTANIMATION_HALF_RES := true

### GApps
TARGET_GAPPS_ARCH := arm64
TARGET_INCLUDE_STOCK_ARCORE := true
TARGET_SUPPORTS_GOOGLE_RECORDER := true
IS_PHONE := true

### PIXEL
$(call inherit-product, vendor/aosp/config/common_full_phone.mk)

## Device identifier. This must come after all inclusions
PRODUCT_NAME := aosp_poplar_dsds
PRODUCT_DEVICE := poplar_dsds
PRODUCT_BRAND := Sony
PRODUCT_MODEL := G8342
PRODUCT_MANUFACTURER := Sony

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=poplar_dsds \
    PRIVATE_BUILD_DESC="G8342-user 9 47.2.A.11.228 1544251862 release-keys"

BUILD_FINGERPRINT := Sony/G8342/G8342:9/47.2.A.11.228/1544251862:user/release-keys

PRODUCT_GMS_CLIENTID_BASE := android-sony

ifneq ($(LINEAGE_DEV_CERTIFICATE),)
    PRODUCT_DEFAULT_DEV_CERTIFICATE := $(LINEAGE_DEV_CERTIFICATE)
endif

ifneq ($(LINEAGE_VERITY_CERTIFICATE),)
    PRODUCT_VERITY_SIGNING_KEY := $(LINEAGE_VERITY_CERTIFICATE)
endif
