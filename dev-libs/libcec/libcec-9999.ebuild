# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

PYTHON_COMPAT=( python{2_7,3_4,3_5} )

inherit cmake-utils eutils git-r3 linux-info python-single-r1

DESCRIPTION="Library for communicating with the Pulse-Eight USB HDMI-CEC Adaptor"
HOMEPAGE="http://libcec.pulse-eight.com"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~arm ~amd64 ~x86"

EGIT_REPO_URI="https://github.com/Pulse-Eight/libcec.git"
EGIT_BRANCH="master"
EGIT_SUBMODULES=()

IUSE="cubox exynos python raspberry-pi +xrandr"
REQUIRED_USE="python? ( ${PYTHON_REQUIRED_USE} )"

RDEPEND="virtual/udev
	dev-libs/lockdev
	!dev-libs/libplatform
	dev-libs/libp8-platform
	xrandr? ( x11-libs/libXrandr )"
DEPEND="${RDEPEND}
	virtual/pkgconfig
	python? (
		dev-lang/swig
		${PYTHON_DEPS}
	sys-libs/ncurses[tinfo]
	)"

CONFIG_CHECK="~USB_ACM"

S="${WORKDIR}/${P}"

pkg_setup() {
	use python && python-single-r1_pkg_setup
}

src_prepare() {
	cmake-utils_src_prepare
	use python || comment_add_subdirectory "src/pyCecClient"
}

src_configure() {
	local mycmakeargs=(
		-DSKIP_PYTHON_WRAPPER=$(usex !python)
		-DHAVE_EXYNOS_API=$(usex exynos)
		-DHAVE_TDA995X_API=$(usex cubox)
		-DHAVE_RPI_API=$(usex raspberry-pi)
		-DBUILD_SHARED_LIBS=1
	)
	cmake-utils_src_configure
}
