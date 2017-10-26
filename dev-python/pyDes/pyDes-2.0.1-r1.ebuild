# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

PYTHON_COMPAT=( python{2_7,3_3,3_4,3_5} )
inherit distutils-r1

DESCRIPTION="Python implementation of DES an Triple-DES algorithms"
HOMEPAGE="http://twhiteman.netfirms.com/des.html"
SRC_URI="http://twhiteman.netfirms.com/pyDES/${P}.tar.gz"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
