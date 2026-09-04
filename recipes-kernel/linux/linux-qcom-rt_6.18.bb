require linux-qcom_6.18.bb

FILESEXTRAPATHS:prepend := "${THISDIR}/linux-qcom-6.18:"

KBUILD_CONFIG_EXTRA:append:aarch64 = " ${S}/arch/arm64/configs/rt.config"
SRC_URI += "file://0002-arm64-dts-qcom-lemans-Fix-the-PCIe-iommu-map-entries.patch"
