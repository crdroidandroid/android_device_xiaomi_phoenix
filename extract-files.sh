#!/bin/bash
#
# Copyright (C) 2020 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

set -e

DEVICE=phoenix
VENDOR=xiaomi

# Load extract_utils and do some sanity checks
MY_DIR="${BASH_SOURCE%/*}"
if [[ ! -d "${MY_DIR}" ]]; then MY_DIR="${PWD}"; fi

LINEAGE_ROOT="${MY_DIR}"/../../..

HELPER="${LINEAGE_ROOT}/vendor/lineage/build/tools/extract_utils.sh"
if [ ! -f "${HELPER}" ]; then
    echo "Unable to find helper script at ${HELPER}"
    exit 1
fi
source "${HELPER}"

while [ "${#}" -gt 0 ]; do
    case "${1}" in
        -n | --no-cleanup )
                CLEAN_VENDOR=false
                ;;
        -k | --kang )
                KANG="--kang"
                ;;
        -s | --section )
                SECTION="${2}"; shift
                CLEAN_VENDOR=false
                ;;
        * )
                SRC="${1}"
                ;;
    esac
    shift
done

if [ -z "${SRC}" ]; then
    SRC="adb"
fi

# Initialize the helper
setup_vendor "${DEVICE}" "${VENDOR}" "${LINEAGE_ROOT}" false "${CLEAN_VENDOR}"

extract "${MY_DIR}/proprietary-files.txt" "${SRC}" \
        "${KANG}" --section "${SECTION}"

DEVICE_BLOB_ROOT="${LINEAGE_ROOT}/vendor/${VENDOR}/${DEVICE}/proprietary"

#
# Fix product path
#
function fix_product_path () {
    sed -i \
        's/\/system\/framework\//\/system\/product\/framework\//g' \
        "$DEVICE_BLOB_ROOT"/"$1"
}

fix_product_path product/etc/permissions/vendor.qti.hardware.factory.xml
fix_product_path product/etc/permissions/vendor-qti-hardware-sensorscalibrate.xml

#
# Fix xml version
#
function fix_xml_version () {
    sed -i \
        's/xml version="2.0"/xml version="1.0"/' \
        "$DEVICE_BLOB_ROOT"/"$1"
}

fix_xml_version product/etc/permissions/vendor.qti.hardware.data.connection-V1.0-java.xml
fix_xml_version product/etc/permissions/vendor.qti.hardware.data.connection-V1.1-java.xml

#
# Remove android.hidl.base@1.0.so requirement
#
function fix_hidl_base () {
    sed -i \
        's/android.hidl.base@1.0.so/libhidlbase.so\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00/' \
        "$DEVICE_BLOB_ROOT"/"$1"
}

fix_hidl_base lib64/libwfdnative.so

"${MY_DIR}/setup-makefiles.sh"
