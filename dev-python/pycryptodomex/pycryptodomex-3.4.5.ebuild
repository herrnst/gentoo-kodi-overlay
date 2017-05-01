# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python2_7 python3_{4,5,6} pypy{,3} )
PYTHON_REQ_USE="threads(+)"

inherit distutils-r1

CRYPTODOMEX_COMMIT="f518d87e46c718634aa6f17f43e17ef5a4c87add"
CRYPTODOMEX_PROJECT="pycryptodome"

DESCRIPTION="A self-contained cryptographic library for Python"
HOMEPAGE="https://github.com/Legrandin/${CRYPTODOMEX_PROJECT}"
SRC_URI="https://github.com/Legrandin/${CRYPTODOMEX_PROJECT}/archive/${CRYPTODOMEX_COMMIT}.tar.gz -> ${P}.tar.gz"

S="${WORKDIR}"/"${CRYPTODOMEX_PROJECT}"-"${CRYPTODOMEX_COMMIT}"

LICENSE="BSD-2 Unlicense"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~hppa ~x86 ~ppc-aix ~amd64-linux ~arm-linux ~x86-linux ~ppc-macos ~x64-macos ~x86-macos ~m68k-mint ~sparc-solaris ~sparc64-solaris ~x64-solaris ~x86-solaris"
IUSE=""

RDEPEND="dev-libs/gmp:0
	virtual/python-cffi[${PYTHON_USEDEP}]
	!dev-python/pycrypto
	!dev-python/pycryptodome"
DEPEND="${RDEPEND}"

python_test() {
	esetup.py test
}
