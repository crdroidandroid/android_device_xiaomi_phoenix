#
# Copyright (C) 2020 The LineageOS Project
#

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

# CNE
PRODUCT_PRODUCT_PROPERTIES += \
    persist.vendor.cne.feature=1

# Data
PRODUCT_PRODUCT_PROPERTIES += \
    persist.data.df.dev_name=rmnet_usb0 \
    persist.vendor.data.profile_update=true \
    persist.vendor.data.mode=concurrent \
    ro.vendor.use_data_netmgrd=true

# Display
PRODUCT_PRODUCT_PROPERTIES += \
    ro.vendor.bl.poll=true \
    ro.vendor.display.ad=1 \
    ro.vendor.display.ad.sdr_calib_data=/vendor/etc/sdr_config.cfg \
    ro.vendor.display.ad.hdr_calib_data=/vendor/etc/hdr_config.cfg \
    ro.vendor.display.sensortype=2 \
    ro.colorpick_adjust=true \
    ro.all_modes.colorpick_adjust=true \
    ro.vendor.cabc.enable=true \
    ro.vendor.bcbc.enable=false \
    ro.vendor.dfps.enable=true \
    ro.vendor.display.default_fps=60 \
    vendor.display.idle_time=1100 \
    sys.displayfeature_hidl=true \
    ro.sf.lcd_density=440

# DPM
PRODUCT_PRODUCT_PROPERTIES += \
    persist.vendor.dpm.feature=1 \
    persist.vendor.dpm.loglevel=0 \
    persist.vendor.dpm.nsrm.bkg.evt=3955

# GPS
PRODUCT_PRODUCT_PROPERTIES += \
    sys.qca1530=detect

# Memory
PRODUCT_PRODUCT_PROPERTIES += \
    ro.vendor.qti.sys.fw.bservice_enable=true

# Netflix
PRODUCT_PRODUCT_PROPERTIES += \
    ro.netflix.bsp_rev=Q6150-17263-1

# Radio
PRODUCT_PRODUCT_PROPERTIES += \
    DEVICE_PROVISIONED=1 \
    persist.sys.fflag.override.settings_network_and_internet_v2=true \
    persist.vendor.ims.disableADBLogs=1 \
    persist.vendor.ims.disableIMSLogs=1 \
    persist.vendor.radio.enable_temp_dds=true \
    persist.vendor.radio.force_on_dc=true \
    persist.vendor.radio.uicc_se_enabled=false \
    ril.subscription.types=RUIM \
    persist.radio.multisim.config=dsds \
    persist.radio.VT_CAM_INTERFACE=1 \
    persist.vendor.radio.apm_sim_not_pwdn=1 \
    persist.vendor.radio.custom_ecc=1 \
    persist.vendor.radio.data_con_rprt=1 \
    persist.vendor.radio.data_ltd_sys_ind=1 \
    persist.vendor.radio.force_ltd_sys_ind=1 \
    persist.vendor.radio.procedure_bytes=SKIP \
    persist.vendor.radio.rat_on=combine \
    persist.vendor.radio.redir_party_num=1 \
    persist.vendor.radio.sib16_support=1 \
    ro.telephony.default_network=22,22 \
    telephony.lteOnCdmaDevice=1 \
    vendor.rild.libpath=/vendor/lib64/libril-qc-hal-qmi.so

# RCS
PRODUCT_PRODUCT_PROPERTIES += \
    persist.rcs.supported=0

# Wireless display
PRODUCT_PRODUCT_PROPERTIES += \
    debug.sf.latch_unsignaled=1 \
    persist.debug.wfd.enable=1 \
    persist.sys.wfd.virtual=0
