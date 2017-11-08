# Copyright (C) 2018 WaveOS
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

PRODUCT_COPY_FILES += \
    vendor/wave/prebuilt/common/etc/init.d/00banner:system/etc/init.d/00banner \
    vendor/wave/prebuilt/common/bin/sysinit:system/bin/sysinit  \

DEVICE_PACKAGE_OVERLAYS += vendor/wave/overlay/common

# Enable SIP+VoIP on all targets
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# Enable wireless Xbox 360 controller support
PRODUCT_COPY_FILES += \
    frameworks/base/data/keyboards/Vendor_045e_Product_028e.kl:system/usr/keylayout/Vendor_045e_Product_0719.kl

# init file
PRODUCT_COPY_FILES += \
    vendor/wave/prebuilt/common/etc/init.local.rc:root/init.wave.rc

# Backup Tool
PRODUCT_COPY_FILES += \
    vendor/arrow/build/tools/backuptool.sh:install/bin/backuptool.sh \
    vendor/arrow/build/tools/backuptool.functions:install/bin/backuptool.functions \
    vendor/arrow/build/tools/50-cm.sh:system/addon.d/50-cm.sh

# Packages
include vendor/wave/config/packages.mk

# Props
include vendor/wave/config/props.mk
