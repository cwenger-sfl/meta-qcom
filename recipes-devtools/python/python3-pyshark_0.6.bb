SUMMARY = "Python wrapper for tshark"
DESCRIPTION = "Python packet parsing using Wireshark dissectors"
HOMEPAGE = "https://github.com/KimiNewt/pyshark"
SECTION = "devel/python"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://PKG-INFO;md5=c96507bc8b7b9bc6d40ff179f2b4669d"

inherit pypi setuptools3

PYPI_PACKAGE = "pyshark"
SRC_URI[sha256sum] = "a424d83e0ca6224a96bbe30cd3f89d5491654d783faaaf90adaf45867a0bcb17"

RDEPENDS:${PN} += " \
    python3-appdirs \
    python3-lxml \
    python3-packaging \
    python3-termcolor \
"
