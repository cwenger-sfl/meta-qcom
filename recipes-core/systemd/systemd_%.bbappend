FILESEXTRAPATHS:prepend:qcom := "${THISDIR}/${PN}:"

SRC_URI:append:qcom = " \
    file://0001-boot-stub-honor-PE-SectionAlignment-when-loading-inn.patch \
    file://99-dma-heap.rules \
    file://89-qcom-ptp.preset \
"

# Create a group dmaheap and add this group to /dev/dma_heap/system through
# dma-heap rules.
GROUPADD_PARAM:udev:append:qcom = "; -r dmaheap"

do_install:append:qcom() {
    install -d ${D}${nonarch_libdir}/udev/rules.d
    install -m 0644 ${UNPACKDIR}/99-dma-heap.rules \
        ${D}${nonarch_libdir}/udev/rules.d/
    install -Dm 0644 ${UNPACKDIR}/89-qcom-ptp.preset \
        ${D}${systemd_unitdir}/system-preset/89-qcom-ptp.preset
    install -d ${D}${sysconfdir}/systemd/system
    ln -s /dev/null \
        ${D}${sysconfdir}/systemd/system/systemd-timesyncd.service
}

FILES:${PN}-udev-rules:append:qcom = " ${nonarch_libdir}/udev/rules.d/99-dma-heap.rules"
FILES:${PN}:append:qcom = " \
    ${systemd_unitdir}/system-preset/89-qcom-ptp.preset \
    ${sysconfdir}/systemd/system/systemd-timesyncd.service \
"
