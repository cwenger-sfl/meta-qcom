SUMMARY = "Packages required to run svtrace latency tests"
DESCRIPTION = "Runtime dependencies for svtrace tracing and packet capture"

inherit packagegroup

RDEPENDS:${PN} = " \
    tshark \
    python3-pip \
    python3-setuptools \
    python3-venv \
    python3-pyshark \
"
