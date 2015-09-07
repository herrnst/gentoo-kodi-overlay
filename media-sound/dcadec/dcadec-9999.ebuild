# Copyright 2015 Daniel 'herrnst' Scheller, Team Kodi
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

EGIT_REPO_URI="https://github.com/foo86/dcadec.git"
EGIT_BRANCH="master"

inherit base git-r3

DESCRIPTION="DTS Coherent Acoustics decoder with support for HD extensions"
HOMEPAGE="https://github.com/foo86/dcadec/"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="-tools"

DEPEND="virtual/pkgconfig"
RDEPEND="${DEPEND}
	tools? ( !media-libs/libdca )"

src_install() {
	base_src_install PREFIX="${EPREFIX}/usr"
	use tools || rm ${D}/usr/bin/dcadec
}
