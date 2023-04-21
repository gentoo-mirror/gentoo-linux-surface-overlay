# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit meson systemd

DESCRIPTION="A userspace daemon for the Intel Precise Touch & Stylus technology"
HOMEPAGE="https://github.com/linux-surface/iptsd"
SRC_URI="https://github.com/linux-surface/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-libs/hidapi dev-cpp/CLI11 dev-libs/spdlog sys-libs/hidrd"
RDEPEND="${DEPEND}"

src_configure() {
	#local emesonargs=(
#		-Dsystemd=enabled
#		-Dudev=disabled
#	)
	meson_src_configure
}

src_install() {
	meson_src_install
	systemd_dounit "${FILESDIR}/iptsd.service"
	systemd_dotmpfiles "${FILESDIR}/iptsd.conf"
}

