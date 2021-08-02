# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="6"
ETYPE="sources"
K_SECURITY_UNSUPPORTED="1"
K_WANT_GENPATCHES="base extras experimental"
K_GENPATCHES_VER="9"

inherit kernel-2
inherit eutils
detect_version
detect_arch

KEYWORDS="~amd64"
HOMEPAGE="https://github.com/linux-surface/linux-surface"
IUSE="experimental"
DESCRIPTION="Full sources including the Gentoo and Surface patchset for the ${KV_MAJOR}.${KV_MINOR} kernel tree."
SRC_URI="${KERNEL_URI} ${GENPATCHES_URI} ${ARCH_URI}
		https://raw.githubusercontent.com/linux-surface/linux-surface/master/patches/5.13/0001-surface3-oemb.patch
		https://raw.githubusercontent.com/linux-surface/linux-surface/master/patches/5.13/0002-mwifiex.patch
		https://raw.githubusercontent.com/linux-surface/linux-surface/master/patches/5.13/0003-ath10k.patch
		https://raw.githubusercontent.com/linux-surface/linux-surface/master/patches/5.13/0004-ipts.patch
		https://raw.githubusercontent.com/linux-surface/linux-surface/master/patches/5.13/0005-surface-sam-over-hid.patch
		https://raw.githubusercontent.com/linux-surface/linux-surface/master/patches/5.13/0006-surface-sam.patch
		https://raw.githubusercontent.com/linux-surface/linux-surface/master/patches/5.13/0007-surface-hotplug.patch
		https://raw.githubusercontent.com/linux-surface/linux-surface/master/patches/5.13/0008-surface-typecover.patch
		https://raw.githubusercontent.com/linux-surface/linux-surface/master/patches/5.13/0009-cameras.patch
		https://raw.githubusercontent.com/linux-surface/linux-surface/master/patches/5.13/0010-amd-gpio.patch
		https://raw.githubusercontent.com/linux-surface/linux-surface/master/patches/5.13/0011-amd-s0ix.patch"

src_prepare() {
	default
	sed "s/EXTRAVERSION = -gentoo/EXTRAVERSION = -gentoo-surface/" -i "${WORKDIR}/linux-${KV_FULL}/Makefile"
	EPATCH_SOURCE="${DISTDIR}" EPATCH_SUFFIX="patch" \
		EPATCH_FORCE="yes"
#	mv "${WORKDIR}/linux-${KV_FULL}" "${WORKDIR}/linux-${KV_FULL}-surface"
	}

pkg_setup() {
	ewarn ""
	ewarn "${PN} is *not* supported by the Gentoo Kernel Project in any way."
	ewarn "If you need support, please contact the overlay developers directly."
	ewarn "Do *not* open bugs in Gentoo's bugzilla unless you have issues with"
	ewarn "the ebuilds. Thank you."
	ewarn ""
}

pkg_postinst() {
	kernel-2_pkg_postinst
	einfo "For more info on this patchset, and how to report problems, see:"
	einfo "${HOMEPAGE}"
}

pkg_postrm() {
	kernel-2_pkg_postrm
}
