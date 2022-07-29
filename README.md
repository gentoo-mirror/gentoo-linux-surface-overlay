Gentoo Linux Overlay with Linux Surface kernel and other utilities from linux-surface (https://github.com/linux-surface/linux-surface) repo.

If you find something wrong, file an issue (please!)

# *This is a work in-progress, but most things do work!*

## Information
- __iptsd__ utility is needed for touchscreen support. Enable system service after you install.
- __libwacom-surface__ improves touchscreen support.
- __surface-control__ commandline utility to control certain aspects of your surface device.
- __surface-dtx-daemon__ utility to control attach/detach of clipboard on Surface Book devices.
- __libcamera__ A complex camera support library for Linux, Android, and ChromeOS

## Installation

Follow the Gentoo amd64 handbook (https://wiki.gentoo.org/wiki/Handbook:AMD64) pretty closely with these exceptions:

1. You __need__ systemd and a __systemd profile__. I'm a big fan of OpenRC and user choice, but the non-systemd init days in the desktop world are numbered - for better or worse!
1. Disable secure boot (at least until after the install is finished, if you don't you will get stuck because the handbook does not cover signing kernel nor adding keys to mok.)
1. You will need to mount your EFI partition (i.e. /dev/nvme0n1p1) somewhere under /boot (example: efivarfs on /sys/firmware/efi/efivars type efivarfs (rw,nosuid,nodev,noexec,relatime)
/dev/nvme0n1p1 on /boot/EFI type vfat (rw,relatime,fmask=0022,dmask=0022,codepage=437,iocharset=ascii,shortname=mixed,utf8,errors=remount-ro))
1. grub-install will be something like: grub-install --target=x86_64-efi --efi-directory=/boot/EFI (you'll need to adjust for your specific setup)

## Post-Installation
1. Add this overlay (i.e. 'layman -a gentoo-linux-surface-overlay')
1. emerge at least iptsd, libwacom-surface, and surface-control (libcamera if you want camera support and surface-dtx-daemon if you have a surface book.)
1. Go grab my gentoo-surface-sources script to get a working kernel that includes the surface patchset and the Gentoo patchset: https://github.com/CanuteTheGreat/toolbox/tree/master/gentoo-surface-sources

## Configuraton
1. If you want keyboard to work correctly during boot the easiest solution is to just include all kernel modules in the initrd image (for genkernel users add/edit /etc/genkernel.conf: ALLRAMDISKMODULES="yes")
1. Enable itpsd: systemctl enable --now iptsd
1. If you have a surface book, enable the dtx daemons (system and user): 'systemctl enable --now surface-dtx-daemon.service' (as root) and 'systemctl enable --user --now surface-dtx-userd.service' (as your regular non-root user.)
 

*This repo was initally forked from one by Parinthapat Parinz: https://github.com/Parinz/linux-surface-overlay but has since been updated, add to, and improved upon.*

*__This repo/project is in no way supported by nor endorced by Gentoo or the Surface Linux project(s).__*

