
DESCRIPTION = "My Qt application"
LICENSE = "LGPL-2.0-only"
LIC_FILES_CHKSUM = "file://LICENSE;md5=88355dc91a186cc816d9f64757793895"
SRC_URI = "file://my-qt-app"

S = "${WORKDIR}/my-qt-app"

# Include Qt5 dependencies
DEPENDS = "qtbase qtdeclarative qtquickcontrols2"


inherit qmake5

do_compile() {
    qmake ${S}/hmidemo.pro
    make
}

do_install() {
    install -d ${D}${bindir}
    install -m 0755 ${S}/my-qt-app ${D}${bindir}
}

do_package_qa[noexec] = "1"

#############################################################

# DESCRIPTION = "My Qt application"
# LICENSE = "LGPL-2.0-only"
# LIC_FILES_CHKSUM = "file://LICENSE;md5=88355dc91a186cc816d9f64757793895"
# SRC_URI = "git://github.com/programmerkm/hmidemo.git;branch=main;protocol=https"
# SRCREV = "main"  

# S = "${WORKDIR}/git"

# # Include Qt5 dependencies
# DEPENDS = "qtbase qtdeclarative qtquickcontrols2"


# inherit qmake5

# do_compile() {
#     qmake ${S}
#     make
# }

# do_install() {
#     install -d ${D}${bindir}
#     install -m 0755 ${S}/my-qt-app ${D}${bindir}
# }

# do_package_qa[noexec] = "1"
