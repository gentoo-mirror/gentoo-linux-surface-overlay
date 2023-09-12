# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="A command line parser for C++11"
HOMEPAGE="https://github.com/CLIUtils/CLI11"
SRC_URI="https://github.com/CLIUtils/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="examples test"

RESTRICT="!test? ( test )"

DEPEND=""
RDEPEND=""

src_configure() {
	local mycmakeargs=(
		-DCLI11_BUILD_EXAMPLES=$(usex examples)
		-DCLI11_BUILD_TESTS=$(usex test)
	)
	cmake_src_configure
}

src_compile() {
	cmake_src_compile
}

src_install() {
	cmake_src_install
	if use examples; then
		dodoc -r examples
		docompress -x /usr/share/doc/${PF}/examples
	fi
}

