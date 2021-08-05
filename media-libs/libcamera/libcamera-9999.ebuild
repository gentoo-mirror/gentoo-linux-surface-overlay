# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="A complex camera support library for Linux, Android, and ChromeOS"
HOMEPAGE="https://libcamera.org/"
SRC_URI="git://linuxtv.org/libcamera.git"

LICENSE="LGPL"
SLOT="0"
KEYWORDS="~x86 ~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_configure() {
	meson_src_configure
}


