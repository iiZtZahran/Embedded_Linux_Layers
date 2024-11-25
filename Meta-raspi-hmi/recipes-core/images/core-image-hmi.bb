SUMMARY = "Custom HMI Image for Raspberry Pi 3 B+"
DESCRIPTION = "A custom Yocto image for Raspberry Pi 3 B+ with GUI, Wi-Fi, Bluetooth, and SSH"
LICENSE = "MIT"

IMAGE_FSTYPES = "ext4"

# Use core-image base to build from
inherit core-image

# Packages to install in the image
IMAGE_INSTALL = " \
    qtbase \
    qtwayland \
    openssh \
    linux-firmware-rpidistro-bcm43430 \
    xterm \
"

# Enable X11 and Wayland
DISTRO_FEATURES:append = " x11 wayland"

IMAGE_INSTALL:append = " matchbox-wm"


# Ensure SSH is enabled on boot
SYSTEMD_SERVICE:append = " sshd.service"

# You can also add other system-level configurations here

IMAGE_INSTALL:append = " qtbase qtgui qtwayland"

IMAGE_INSTALL:append = " qtbase qtbase-dev qt-app"


IMAGE_INSTALL:append = " qtwebengine qtmultimedia"
