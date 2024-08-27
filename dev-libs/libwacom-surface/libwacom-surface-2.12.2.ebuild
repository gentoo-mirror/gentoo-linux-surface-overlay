# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{7..13} )

###inherit eutils meson python-any-r1 toolchain-funcs udev
inherit meson python-any-r1 toolchain-funcs udev

DESCRIPTION="Library for identifying Wacom tablets and their model-specific features with patches from linux-surface"
HOMEPAGE="https://github.com/linux-surface/linux-surface"
SRC_URI="https://github.com/linuxwacom/libwacom/releases/download/libwacom-${PV}/libwacom-${PV}.tar.xz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc test"
RESTRICT="!test? ( test )"

BDEPEND="
	virtual/pkgconfig
	doc? ( app-text/doxygen )
	test? (
		${PYTHON_DEPS}
		$(python_gen_any_dep '
			dev-python/python-libevdev[${PYTHON_USEDEP}]
			dev-python/pyudev[${PYTHON_USEDEP}]
			dev-python/pytest[${PYTHON_USEDEP}]
		')
	)
"
RDEPEND="
	dev-libs/glib:2
	dev-libs/libgudev:=
	!!dev-libs/libwacom
"
DEPEND="${RDEPEND}"


python_check_deps() {
	has_version -b "dev-python/python-libevdev[${PYTHON_USEDEP}]" &&
	has_version -b "dev-python/pyudev[${PYTHON_USEDEP}]" &&
	has_version -b "dev-python/pytest[${PYTHON_USEDEP}]"
}

pkg_setup() {
	tc-ld-disable-gold # bug https://github.com/linuxwacom/libwacom/issues/170

	if use test; then
		python-any-r1_pkg_setup
	fi
}

S="${WORKDIR}/libwacom-${PV}"

src_prepare() {
	eapply "${FILESDIR}/v2/0001-Add-support-for-BUS_VIRTUAL.patch"
	eapply "${FILESDIR}/v2/0002-Add-support-for-Intel-Management-Engine-bus.patch"
	eapply "${FILESDIR}/v2/0003-data-Add-Microsoft-Surface-Pro-3.patch"
	eapply "${FILESDIR}/v2/0004-data-Add-Microsoft-Surface-Pro-4.patch"
	eapply "${FILESDIR}/v2/0005-data-Add-Microsoft-Surface-Pro-5.patch"
	eapply "${FILESDIR}/v2/0006-data-Add-Microsoft-Surface-Pro-6.patch"
	eapply "${FILESDIR}/v2/0007-data-Add-Microsoft-Surface-Pro-7.patch"
	eapply "${FILESDIR}/v2/0008-data-Add-Microsoft-Surface-Pro-7.patch"
	eapply "${FILESDIR}/v2/0009-data-Add-Microsoft-Surface-Pro-8.patch"
	eapply "${FILESDIR}/v2/0010-data-Add-Microsoft-Surface-Pro-9.patch"
	eapply "${FILESDIR}/v2/0011-data-Add-Microsoft-Surface-Book.patch"
	eapply "${FILESDIR}/v2/0012-data-Add-Microsoft-Surface-Book-2-13.5.patch"
	eapply "${FILESDIR}/v2/0013-data-Add-Microsoft-Surface-Book-2-15.patch"
	eapply "${FILESDIR}/v2/0014-data-Add-Microsoft-Surface-Book-3-13.5.patch"
	eapply "${FILESDIR}/v2/0015-data-Add-Microsoft-Surface-Book-3-15.patch"
	eapply "${FILESDIR}/v2/0016-data-Add-Microsoft-Surface-Laptop-Studio.patch"

	eapply_user
}

src_configure() {
	local emesonargs=(
		$(meson_feature doc documentation)
		$(meson_feature test tests)
		-Dudev-dir=$(get_udevdir)

	)
	meson_src_configure
}
