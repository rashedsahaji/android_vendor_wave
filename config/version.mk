# Copyright (C) 2018 Project dotOS
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

#WaveOS Versioning :
WAVE_MOD_VERSION = Destiny


ifndef WAVE_BUILD_TYPE
    WAVE_BUILD_TYPE := UNOFFICIAL
endif

CURRENT_DEVICE=$(shell echo "$(TARGET_PRODUCT)" | cut -d'_' -f 2,3)

ifeq ($(WAVE_OFFICIAL), true)
   LIST = $(shell curl -s https://raw.githubusercontent.com/Wave-Project/android_vendor_wave/pie/wave.devices)
   FOUND_DEVICE =  $(filter $(CURRENT_DEVICE), $(LIST))
    ifeq ($(FOUND_DEVICE),$(CURRENT_DEVICE))
      IS_OFFICIAL=true
      WAVE_BUILD_TYPE := OFFICIAL

PRODUCT_PACKAGES += \
    Updater

    endif
    ifneq ($(IS_OFFICIAL), true)
       WAVE_BUILD_TYPE := UNOFFICIAL
       $(error Device is not official "$(FOUND)")
    endif

PRODUCT_GENERIC_PROPERTIES += \
    persist.ota.romname=$(TARGET_PRODUCT) \
    persist.ota.version=$(shell date +%Y%m%d) \

persist.ota.manifest=https://raw.githubusercontent.com/Wave-Project/ota/pie/$(shell echo "$(TARGET_PRODUCT)" | cut -d'_' -f 2,3).xml
endif

TARGET_PRODUCT_SHORT := $(subst wave_,,$(CUSTOM_BUILD))

WAVE_VERSION := WaveOS-$(WAVE_MOD_VERSION)-$(CURRENT_DEVICE)-$(WAVE_BUILD_TYPE)-$(shell date -u +%Y%m%d)

WAVE_FINGERPRINT := WaveOS/$(WAVE_MOD_VERSION)/$(PLATFORM_VERSION)/$(TARGET_PRODUCT_SHORT)/$(shell date -u +%Y%m%d)

PRODUCT_GENERIC_PROPERTIES += \
  ro.wave.version=$(WAVE_VERSION) \
  ro.wave.releasetype=$(WAVE_BUILD_TYPE) \
  ro.modversion=$(WAVE_MOD_VERSION)

WAVE_DISPLAY_VERSION := WaveOS-$(WAVE_MOD_VERSION)-$(WAVE_BUILD_TYPE)

PRODUCT_GENERIC_PROPERTIES += \
  ro.wave.display.version=$(WAVE_DISPLAY_VERSION)\
  ro.wave.fingerprint=$(EXTENDED_FINGERPRINT)
