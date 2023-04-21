# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

EGIT_REPO_URI="https://github.com/linux-surface/surface-dtx-daemon.git"
inherit git-r3 cargo

DESCRIPTION="Surface Detach (DTX) Daemon"
HOMEPAGE="https://github.com/linux-surface/surface-dtx-daemon"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-libs/libdbusmenu
	dev-libs/glib
	sys-apps/dbus
"
src_unpack(){
	git-r3_src_unpack
	cargo_live_src_unpack
}

src_configure() {
	cargo_src_configure
}

src_compile() {
	cargo_src_compile --locked
}

src_install() {
	cargo_src_install --path surface-dtx-daemon
	cargo_src_install --path surface-dtx-userd
	insinto /etc
	doins -r etc/dtx
	doins -r etc/dbus
	insinto /etc/udev/rules.d
	doins -r etc/udev
	insinto /etc/systemd/system
	doins etc/systemd/surface-dtx-daemon.service
	doins etc/systemd/surface-dtx-userd.service
}

