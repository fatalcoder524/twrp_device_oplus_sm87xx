#
# Copyright (C) 2025 The Android Open Source Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Configure base.mk
$(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk)

# Configure core_64_bit_only.mk
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit_only.mk)

# Configure virtual_ab compression.mk
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota/compression_with_xor.mk)

# Configure emulated_storage.mk
$(call inherit-product, $(SRC_TARGET_DIR)/product/emulated_storage.mk)

# Configure twrp common.mk
$(call inherit-product, vendor/twrp/config/common.mk)

# Shipping API level
BOARD_SHIPPING_API_LEVEL    := 35
PRODUCT_SHIPPING_API_LEVEL  := 35
PRODUCT_TARGET_VNDK_VERSION := 35

# Dynamic partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Kernel
PRODUCT_OTA_ENFORCE_VINTF_KERNEL_REQUIREMENTS   := false
PRODUCT_ENABLE_UFFD_GC                          := true

# OTA certs
PRODUCT_EXTRA_RECOVERY_KEYS += \
	$(DEVICE_PATH)/security/local_OTA \
	$(DEVICE_PATH)/security/special_OTA

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += $(DEVICE_PATH)

# Base Manifests
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/recovery/root/vendor/etc/vintf/manifest.xml:recovery/root/vendor/etc/vintf/manifest.xml

# VINTF Fragments
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/recovery/root/vendor/etc/vintf/manifest/android.hardware.security.keymint-service-qti.xml:recovery/root/vendor/etc/vintf/manifest/android.hardware.security.keymint-service-qti.xml \
    $(DEVICE_PATH)/recovery/root/vendor/etc/vintf/manifest/android.hardware.gatekeeper-service-qti.xml:recovery/root/vendor/etc/vintf/manifest/android.hardware.gatekeeper-service-qti.xml \
    $(DEVICE_PATH)/recovery/root/vendor/etc/vintf/manifest/android.hardware.health-service.qti.xml:recovery/root/vendor/etc/vintf/manifest/android.hardware.health-service.qti.xml \
    $(DEVICE_PATH)/recovery/root/vendor/etc/vintf/manifest/android.hardware.secure_element.xml:recovery/root/vendor/etc/vintf/manifest/android.hardware.secure_element.xml \
    $(DEVICE_PATH)/recovery/root/vendor/etc/vintf/manifest/vendor.qti.hardware.qseecom@1.0-service.xml:recovery/root/vendor/etc/vintf/manifest/vendor.qti.hardware.qseecom@1.0-service.xml \
    $(DEVICE_PATH)/recovery/root/vendor/etc/vintf/manifest/boot-service.qti.xml:recovery/root/vendor/etc/vintf/manifest/boot-service.qti.xml

PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/recovery/root/vendor/etc/init/android.hardware.gatekeeper-service-qti.rc:recovery/root/vendor/etc/init/android.hardware.gatekeeper-service-qti.rc \
    $(DEVICE_PATH)/recovery/root/vendor/etc/init/android.hardware.security.keymint-service-qti.rc:recovery/root/vendor/etc/init/android.hardware.security.keymint-service-qti.rc \
    $(DEVICE_PATH)/recovery/root/vendor/etc/init/android.hardware.secure_element-service.qti.rc:recovery/root/vendor/etc/init/android.hardware.secure_element-service.qti.rc \
    $(DEVICE_PATH)/recovery/root/vendor/etc/init/qseecomd.rc:recovery/root/vendor/etc/init/qseecomd.rc \
    $(DEVICE_PATH)/recovery/root/vendor/etc/init/ssgtzd.rc:recovery/root/vendor/etc/init/ssgtzd.rc
