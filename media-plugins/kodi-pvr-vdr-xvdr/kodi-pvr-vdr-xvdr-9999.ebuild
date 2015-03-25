# Copyright 2015 Daniel 'herrnst' Scheller, Team Kodi
# Original copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

inherit git-2 autotools multilib eutils

EGIT_REPO_URI="git://github.com/pipelka/xbmc-addon-xvdr.git"
EGIT_BRANCH="master"

DESCRIPTION="VDR-XVDR addon for Kodi"
HOMEPAGE="https://github.com/pipelka/xbmc-addon-xvdr"
SRC_URI=""
KEYWORDS=""
LICENSE="GPL-2"
SLOT="0"
IUSE=""

DEPEND="
	sys-libs/zlib
"
RDEPEND="${DEPEND}"

S=${WORKDIR}/${PN}

src_prepare() {
	eautoreconf
}

src_configure() {
	econf --prefix=/usr/$(get_libdir)/kodi
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"
}

pkg_postinst() {
	einfo
	einfo "IMPORTANT:"
	einfo
	einfo "The XVDR addon is unsupported by Team Kodi. For any support including outdated"
	einfo "API usage, you need to get in contact with the author of the XVDR addon directly."
	einfo
	einfo "Please see https://github.com/pipelka/xbmc-addon-xvdr or http://www.xvdr.tv/ for"
	einfo "contact details and setup/configuration instructons."
	einfo
}

