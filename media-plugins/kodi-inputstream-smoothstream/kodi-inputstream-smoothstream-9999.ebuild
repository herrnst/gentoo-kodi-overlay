# Copyright 2016 Daniel 'herrnst' Scheller, Team Kodi
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

EGIT_REPO_URI="https://github.com/mapfau/inputstream.smoothstream.git"
EGIT_BRANCH="master"

inherit git-r3 cmake-utils kodi-addon

DESCRIPTION="Kodi's SmoothStreamingMedia inputstream addon"
HOMEPAGE="https://kodi.tv"
SRC_URI=""

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

PATCHES=( "${FILESDIR}/${P}-buildfix.patch" )

DEPEND="
	media-tv/kodi
	media-libs/kodiplatform
	"
