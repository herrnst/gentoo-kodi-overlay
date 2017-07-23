# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
PYTHON_COMPAT=( python2_7 python3_4 )

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
		$(cmake-utils_useno python SKIP_PYTHON_WRAPPER)
		$(cmake-utils_use_has exynos EXYNOS_API) \
		$(cmake-utils_use_has cubox TDA955X_API)
		$(cmake-utils_use_has raspberry-pi RPI_API)
		-DBUILD_SHARED_LIBS=1
	)
	cmake-utils_src_configure
}
