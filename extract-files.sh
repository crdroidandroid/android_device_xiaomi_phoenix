#!/bin/bash
#
# Copyright (C) 2021 crDroid Android Project
#
# SPDX-License-Identifier: Apache-2.0
#

# If we're being sourced by the common script that we called,
# stop right here. No need to go down the rabbit hole.
if [ "${BASH_SOURCE[0]}" != "${0}" ]; then
    return
fi

set -e

# Required!
export DEVICE=phoenix
export DEVICE_COMMON=sm6150-common
export VENDOR=xiaomi

export DEVICE_BRINGUP_YEAR=2020

"./../../${VENDOR}/${DEVICE_COMMON}/extract-files.sh" "$@"
