FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI += " \
    file://ptp4l-end0.service \
    file://phc2sys-end0.service \
    file://ptp4l-end0.conf \
"

do_install:append() {
    install -m 0644 ${UNPACKDIR}/ptp4l-end0.service \
        ${D}${systemd_unitdir}/system/ptp4l-end0.service
    install -m 0644 ${UNPACKDIR}/phc2sys-end0.service \
        ${D}${systemd_unitdir}/system/phc2sys-end0.service
    install -d ${D}${sysconfdir}/linuxptp
    install -m 0644 ${UNPACKDIR}/ptp4l-end0.conf \
        ${D}${sysconfdir}/linuxptp/ptp4l-end0.conf
}

SYSTEMD_SERVICE:${PN} = "ptp4l-end0.service phc2sys-end0.service"
SYSTEMD_AUTO_ENABLE:${PN} = "enable"

FILES:${PN} += " \
    ${sysconfdir}/linuxptp/ptp4l-end0.conf \
    ${systemd_unitdir}/system/ptp4l@.service \
    ${systemd_unitdir}/system/phc2sys@.service \
    ${systemd_unitdir}/system/ptp4l-end0.service \
    ${systemd_unitdir}/system/phc2sys-end0.service \
"
