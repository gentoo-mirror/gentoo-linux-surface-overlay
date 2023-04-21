# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit autotools flag-o-matic

DESCRIPTION="A library and tool for processing HID report descriptors"
HOMEPAGE="https://github.com/DIGImend/hidrd"
SRC_URI="https://github.com/DIGImend/${PN}/releases/download/${PV}/${P}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="sys-libs/libcap"
RDEPEND="${DEPEND}"

PATCHES=(
	"${FILESDIR}/fallthrough.patch"
)

src_prepare() {
	default
	eautoreconf
}

src_configure() {
	# Fix multiple definition errors
	append-flags -fcommon
	econf
}

src_install() {
	default
	find "${D}" -name '*.la' -delete || die
}

