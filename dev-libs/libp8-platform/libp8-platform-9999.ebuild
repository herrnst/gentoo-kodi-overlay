# Copyright 2015 Daniel 'herrnst' Scheller, Team Kodi
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit git-r3 cmake-utils

MY_PN="platform"

EGIT_REPO_URI="https://github.com/Pulse-Eight/${MY_PN}.git"
EGIT_BRANCH="master"
EGIT_SUBMODULES=()

DESCRIPTION="Platform support library used by libCEC and binary add-ons for Kodi."
HOMEPAGE="https://github.com/Pulse-Eight/platform"
SRC_URI=""

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~arm ~amd64 ~x86"
IUSE=""

DEPEND="!dev-libs/libplatform"
RDEPEND="${DEPEND}"

src_configure() {
	local mycmakeargs=(
		-DBUILD_SHARED_LIBS=1
	)
	cmake-utils_src_configure
}
