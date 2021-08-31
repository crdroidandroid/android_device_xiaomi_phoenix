#
# Copyright (C) 2021 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Inherit from phoenix device
$(call inherit-product, device/xiaomi/phoenix/device.mk)

PRODUCT_NAME := lineage_phoenix
PRODUCT_DEVICE := phoenix
PRODUCT_MANUFACTURER := Xiaomi
PRODUCT_BRAND := Redmi
PRODUCT_MODEL := Redmi K30

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="phoenixin-user 11 RKQ1.200826.002 V12.1.5.0.RGHINXM release-keys"

BUILD_FINGERPRINT := POCO/phoenixin/phoenixin:11/RKQ1.200826.002/V12.1.5.0.RGHINXM:user/release-keys
