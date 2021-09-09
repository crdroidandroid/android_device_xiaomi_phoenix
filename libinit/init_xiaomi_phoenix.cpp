/*
 * Copyright (C) 2021 crDroid Android Project
 *
 * SPDX-License-Identifier: Apache-2.0
 */

#include <libinit_dalvik_heap.h>
#include <libinit_variant.h>

#include "vendor_init.h"

static const variant_info_t phoenix_info = {
    .hwc_value = "GLOBAL",
    .sku_value = "",

    .brand = "Redmi",
    .device = "phoenix",
    .marketname = "Redmi K30",
    .model = "Redmi K30",
    .build_fingerprint = "Redmi/phoenix/phoenix:11/RKQ1.200826.002/V12.5.1.0.RGHCNXM:user/release-keys",

    .nfc = true,
};

static const variant_info_t phoenixin_info = {
    .hwc_value = "INDIA",
    .sku_value = "",

    .brand = "POCO",
    .device = "phoenixin",
    .marketname = "POCO X2",
    .model = "POCO X2",
    .build_fingerprint = "POCO/phoenixin/phoenixin:11/RKQ1.200826.002/V12.1.5.0.RGHINXM:user/release-keys",

    .nfc = false,
};

static const std::vector<variant_info_t> variants = {
    phoenix_info,
    phoenixin_info,
};

void vendor_load_properties() {
    set_dalvik_heap();
    search_variant(variants);
}
