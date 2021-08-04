# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"
ETYPE="sources"
K_WANT_GENPATCHES="base extras experimental"
K_GENPATCHES_VER="9"

inherit kernel-2
detect_version
detect_arch

KEYWORDS="~amd64 ~x86"
HOMEPAGE="https://github.com/sifive/meta-sifive"
IUSE="experimental"

DESCRIPTION="Full sources including the Gentoo patchset for the ${KV_MAJOR}.${KV_MINOR} kernel tree and surface patches"
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
		https://raw.githubusercontent.com/linux-surface/linux-surface/master/patches/5.13/0011-amd-s0ix.patch
"

src_prepare() {
	local SURFACE_PATCH
	local SURFACE_PATCHES="
	${DISTDIR}/0001-surface3-oemb.patch
	${DISTDIR}/0002-mwifiex.patch
	${DISTDIR}/0003-ath10k.patch
	${DISTDIR}/0004-ipts.patch
	${DISTDIR}/0005-surface-sam-over-hid.patch
	${DISTDIR}/0006-surface-sam.patch
	${DISTDIR}/0007-surface-hotplug.patch
	${DISTDIR}/0008-surface-typecover.patch
	${DISTDIR}/0009-cameras.patch
	${DISTDIR}/0010-amd-gpio.patch
	${DISTDIR}/0011-amd-s0ix.patch"


	local SURFACE_PATH="${DISTDIR}"
	for SURFACE_PATCH in $SURFACE_PATCHES
	do
		eapply "${SURFACE_PATH}/${SURFACE_PATCH}"
	done
	eapply_user
}

pkg_postinst() {
	kernel-2_pkg_postinst
	einfo "For more info on this patchset, and how to report problems, see:"
	einfo "${HOMEPAGE}"
}

pkg_postrm() {
	kernel-2_pkg_postrm
}
