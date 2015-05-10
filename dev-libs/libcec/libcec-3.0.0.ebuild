# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-libs/libcec/libcec-2.2.0.ebuild,v 1.1 2014/11/05 19:02:28 thev00d00 Exp $

EAPI=5

inherit eutils cmake-utils linux-info

DESCRIPTION="Library for communicating with the Pulse-Eight USB HDMI-CEC Adaptor"
HOMEPAGE="http://libcec.pulse-eight.com"
SRC_URI="http://github.com/Pulse-Eight/${PN}/archive/${P}.tar.gz"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~arm ~amd64 ~x86"

RDEPEND="virtual/udev
	dev-libs/lockdev
	dev-libs/platform
	x11-libs/libXrandr"
DEPEND="${RDEPEND}
	virtual/pkgconfig
	dev-lang/python
	dev-lang/swig"

CONFIG_CHECK="~USB_ACM"

S="${WORKDIR}/${PN}-${P}"

src_configure() {
	local mycmakeargs=(
		-DBUILD_SHARED_LIBS=1
	)
	cmake-utils_src_configure
}

src_install() {
	cmake-utils_src_install
	# remove wrongly installed python modules
	rm -rf "${ED}"/usr/lib/
	# remove pycecclient.py
	rm -rf "${ED}"/usr/bin/pyCecClient.py
}

