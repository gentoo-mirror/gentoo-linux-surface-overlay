# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3 meson

DESCRIPTION="A library for camera support in Linux, Android, and ChromeOS"
HOMEPAGE="https://libcamera.org/"
EGIT_REPO_URI="https://git.libcamera.org/libcamera/libcamera.git"

LICENSE="LGPL-2.1+"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc gstreamer qcam test v4l2 uvcvideo ipu3"

RESTRICT="!test? ( test )"

DEPEND="
	dev-libs/libevent
	dev-libs/libyaml
	media-libs/libepoxy
	virtual/libudev
	v4l2? ( media-libs/libv4l )
	gstreamer? ( media-libs/gstreamer:1.0 )
	dev-lang/python
	dev-python/pyyaml
	dev-python/ply
	dev-python/jinja
	qcam? ( dev-qt/qtcore:5 dev-qt/qtwidgets:5 )
"
RDEPEND="${DEPEND}"

BDEPEND="
	virtual/pkgconfig
	doc? ( app-doc/doxygen )
	test? ( dev-util/gtest )
"

src_configure() {
	local emesonargs=(
		-Dv4l2=$(usex v4l2 true false)
		-Dgstreamer=$(usex gstreamer enabled disabled)
		-Dqcam=$(usex qcam enabled disabled)
		-Dtest=$(usex test true false)
		-Ddocumentation=$(usex doc enabled disabled)
	)
	if use uvcvideo || use ipu3; then
		local pipelines=""
		use uvcvideo && pipelines+="uvcvideo"
		use ipu3 && pipelines+=",ipu3"
		emesonargs+=(-Dpipelines="${pipelines}")
	fi
	meson_src_configure
}

src_compile() {
	meson_src_compile
}

src_install() {
	meson_src_install
}

