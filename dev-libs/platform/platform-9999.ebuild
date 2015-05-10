# Copyright 2015 Daniel 'herrnst' Scheller, Team Kodi
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

EGIT_REPO_URI="https://github.com/Pulse-Eight/platform.git"
EGIT_BRANCH="master"

inherit git-r3 cmake-utils

DESCRIPTION="Platform support library used by libCEC and binary add-ons for Kodi"
HOMEPAGE="http://kodi.tv"
SRC_URI=""

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

src_configure() {
	local mycmakeargs=(
		-DBUILD_SHARED_LIBS=1
	)
	cmake-utils_src_configure
}
