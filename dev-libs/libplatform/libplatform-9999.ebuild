# Copyright 2015 Daniel 'herrnst' Scheller, Team Kodi
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit git-r3 cmake-utils

MY_PN="platform"

EGIT_REPO_URI="https://github.com/Pulse-Eight/${MY_PN}.git"
EGIT_BRANCH="master"
EGIT_COMMIT="a1e5905874d5cdbce110344558d21a2810dead9c"

DESCRIPTION="Platform support library used by libCEC and binary add-ons for Kodi."
HOMEPAGE="https://github.com/Pulse-Eight/platform"
SRC_URI=""

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~arm ~amd64 ~x86"
IUSE=""

src_configure() {
	local mycmakeargs=(
		-DBUILD_SHARED_LIBS=1
	)
	cmake-utils_src_configure
}
