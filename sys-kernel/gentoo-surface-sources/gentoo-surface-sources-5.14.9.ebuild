# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"
ETYPE="sources"
K_WANT_GENPATCHES="base extras experimental"
K_GENPATCHES_VER="10"

inherit kernel-2
detect_version
detect_arch

KEYWORDS="~amd64 ~x86"
HOMEPAGE="https://github.com/sifive/meta-sifive"
IUSE="experimental"
EXTRAVERSION="-${PN}"
DESCRIPTION="Full sources including the Gentoo patchset for the ${KV_MAJOR}.${KV_MINOR} kernel tree and surface patches"
SRC_URI="${KERNEL_URI} ${GENPATCHES_URI} ${ARCH_URI}
		https://raw.githubusercontent.com/linux-surface/linux-surface/master/patches/5.14/0001-surface3-oemb.patch -> ${KV_FULL}-0001-surface3-oemb.patch
		https://raw.githubusercontent.com/linux-surface/linux-surface/master/patches/5.14/0002-mwifiex.patch -> ${KV_FULL}-0002-mwifiex.patch
		https://raw.githubusercontent.com/linux-surface/linux-surface/master/patches/5.14/0003-ath10k.patch -> ${KV_FULL}-0003-ath10k.patch
		https://raw.githubusercontent.com/linux-surface/linux-surface/master/patches/5.14/0004-ipts.patch -> ${KV_FULL}-0004-ipts.patch
		https://raw.githubusercontent.com/linux-surface/linux-surface/master/patches/5.14/0005-surface-sam-over-hid.patch -> ${KV_FULL}-0005-surface-sam-over-hid.patch
		https://raw.githubusercontent.com/linux-surface/linux-surface/master/patches/5.14/0006-surface-typecover.patch -> ${KV_FULL}-0006-surface-typecover.patch
		https://raw.githubusercontent.com/linux-surface/linux-surface/master/patches/5.14/0007-cameras.patch -> ${KV_FULL}-0007-cameras.patch
		https://raw.githubusercontent.com/linux-surface/linux-surface/master/patches/5.14/0008-amd-gpio.patch -> ${KV_FULL}-0008-amd-gpio.patch
		https://raw.githubusercontent.com/linux-surface/linux-surface/master/patches/5.14/0009-amd-s0ix.patch -> ${KV_FULL}-0009-amd-s0ix.patch
"

src_unpack() {
	kernel-2_src_unpack
	unpack_set_extraversion
}

src_prepare() {
	local SURFACE_PATCH
	local SURFACE_PATCHES="
	${KV_FULL}-0001-surface3-oemb.patch
	${KV_FULL}-0002-mwifiex.patch
	${KV_FULL}-0003-ath10k.patch
	${KV_FULL}-0004-ipts.patch
	${KV_FULL}-0005-surface-sam-over-hid.patch
	${KV_FULL}-0006-surface-typecover.patch
	${KV_FULL}-0007-cameras.patch
	${KV_FULL}-0008-amd-gpio.patch
	${KV_FULL}-0009-amd-s0ix.patch"


	local SURFACE_PATH="${DISTDIR}"
	for SURFACE_PATCH in $SURFACE_PATCHES
	do
		eapply "${SURFACE_PATH}/${SURFACE_PATCH}"
	done
	eapply_user

	cp "${FILESDIR}/config-${KV_FULL}" "${WORKDIR}/linux-${KV_FULL}/EXAMPLE.config"

	mv "${WORKDIR}/linux-${KV_FULL}" "${WORKDIR}/linux-${KV_FULL}-surface"
	S="${WORKDIR}/linux-${KV_FULL}-surface"
}

pkg_postinst() {
	kernel-2_pkg_postinst
	einfo "For more info on this patchset, and how to report problems, see:"
	einfo "${HOMEPAGE}"
}

pkg_postrm() {
	kernel-2_pkg_postrm
}
