# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo git-r3

DESCRIPTION="Utility to control attach/detach of clipboard on Surface Book devices."
HOMEPAGE="https://github.com/linux-surface/linux-surface"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

EGIT_REPO_URI="https://github.com/linux-surface/surface-dtx-daemon"
S="${WORKDIR}/surface-dtx-daemon-9999"

src_unpack() {
	git-r3_src_unpack
	cargo_live_src_unpack
}

src_compile() {
	rm -f Cargo.toml
	cd surface-dtx-daemon
	cargo_src_compile --locked
	cd ../surface-dtx-userd
	cargo_src_compile --locked
}

