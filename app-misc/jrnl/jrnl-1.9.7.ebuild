# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

PYTHON_COMPAT=( python3_{3,4} )

inherit distutils-r1

DESCRIPTION="A simple command line journal application that stores your journal in a plain text file."
HOMEPAGE="http://jrnl.sh"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="crypt"

DEPEND=">=dev-python/python-dateutil-2.2[${PYTHON_USEDEP}]
		>=dev-python/six-1.6.1[${PYTHON_USEDEP}]
		>=dev-python/keyring-3.3[${PYTHON_USEDEP}]
		>=dev-python/parsedatetime-1.2[${PYTHON_USEDEP}]
		>=dev-python/tzlocal-1.1[${PYTHON_USEDEP}]
		>=dev-python/pytz-2013b[${PYTHON_USEDEP}]
		crypt? (
			>=dev-python/pycrypto-2.6[${PYTHON_USEDEP}]
		)"
RDEPEND="${DEPEND}"
