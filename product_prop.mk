#
# Copyright (C) 2020 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#
# Adb
ifeq ($(TARGET_BUILD_VARIANT),eng)
# /vendor/default.prop is force-setting ro.adb.secure=1
# Get rid of that by overriding it in /product on eng builds
PRODUCT_PRODUCT_PROPERTIES += \
    ro.secure=0 \
    ro.adb.secure=0
endif

# Bluetooth
PRODUCT_PRODUCT_PROPERTIES += \
    persist.bluetooth.bqr.event_mask=14  \
    persist.bluetooth.bqr.min_interval_ms=500  \
    vendor.bluetooth.soc=cherokee  \
    vendor.qcom.bluetooth.soc=cherokee  \
    persist.bluetooth.a2dp_offload.cap=sbc-aac-aptx-aptxhd-ldac  \
    persist.bluetooth.a2dp_offload.disabled=false  \
    persist.vendor.bt.aac_frm_ctl.enabled=true  \
    persist.vendor.qcom.bluetooth.a2dp_offload_cap=sbc-aptx-aptxtws-aptxhd-aac-ldac-aptxadaptive  \
    persist.vendor.qcom.bluetooth.enable.splita2dp=true  \
    ro.bluetooth.a2dp_offload.supported=true

# Camera
PRODUCT_PRODUCT_PROPERTIES += \
    vendor.camera.aux.packagelist=org.lineageos.snap,com.google.android.GoogleCamera,org.codeaurora.snapcam \
    persist.vendor.camera.privapp.list=org.codeaurora.snapcam,com.google.android.GoogleCamera
