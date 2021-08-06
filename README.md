Gentoo Linux Overlay with Linux Surface kernel and other utilities from linux-surface repo.

This is a work in-progress.

# Information
- *gentoo-surface-sources* gentoo-sources with surface patchsets applied
- *iptsd* utility is needed for touchscreen support. Enable the user and system services after you install.
- *libwacom-surface* improves touchscreen support.
- *surface-control* commandline utility to control certain aspects of your surface device.
- *surface-dtx-daemon* utility to control attach/detach of clipboard on Surface Book devices.
- *libcamera* A complex camera support library for Linux, Android, and ChromeOS

# Installation

Follow the Gentoo handbook pretty closely with these exceptions:

1 Disable secure boot (at least until after the install is finished.)

# Post-Installation
1 Add this overlay (i.e. 'layman -a gentoo-linux-surface-overlay')
1 emerge at least gentoo-surface-sources, iptsd, libwacom-surface, and surface-control (libcamera if you want camera support.)

# Configuraton
1 For the kernel I have includeed a sample config in /usr/src/gentoo-surface-sources-<version>/EXAMPLE.config that you can cp to .config and use as-is if you like
1 If you want keyboard to work correctly during boot the easiest solution is to just include all kernel modules in the initrd image (for genkernel users add/edit /etc/genkernel.conf: ALLRAMDISKMODULES="yes")
1 If you have a surface book, enable the dtx daemons (system and user): 'systemctl enable --now surface-dtx-daemon.service' (as root) and 'systemctl enable --user --now surface-dtx-userd.service' (as your regular non-root user.)
1 

This repo was initally forked from one by Parinthapat Parinz: https://github.com/Parinz/linux-surface-overlay but has since been updated, add to, and improved upon.

