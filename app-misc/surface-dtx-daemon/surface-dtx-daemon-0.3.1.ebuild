# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Utility to control attach/detach of clipboard on Surface Book devices."
HOMEPAGE="https://github.com/linux-surface/linux-surface"
SRC_URI="https://github.com/linux-surface/surface-dtx-daemon/releases/download/v${PV}-2/${PN}_${PV}-2_amd64.deb"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}"

src_prepare() {
	unpack ./control.tar.xz
	unpack ./data.tar.xz

	eapply_user

}

src_install() {
	doins -r etc
	doins -r usr
	fperms 0755 /usr/bin/surface-dtx-userd
	fperms 0755 /usr/bin/surface-dtx-daemon
	fperms 0755 /etc/surface-dtx/attach.sh
	fperms 0755 /etc/surface-dtx/detach.sh
}

