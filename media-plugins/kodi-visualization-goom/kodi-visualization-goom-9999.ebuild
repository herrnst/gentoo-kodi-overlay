# Copyright 2015 Daniel 'herrnst' Scheller, Team Kodi
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

EGIT_REPO_URI="https://github.com/notspiff/visualization.goom.git"
EGIT_BRANCH="master"

inherit git-r3 cmake-utils

DESCRIPTION="Goom visualizer for Kodi"
HOMEPAGE="http://kodi.tv"
SRC_URI=""

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	media-tv/kodi
	virtual/opengl
	"

RDEPEND="
	virtual/opengl
	"
