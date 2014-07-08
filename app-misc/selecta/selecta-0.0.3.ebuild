# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="A fuzzy text selector for files and anything else you need to select"
HOMEPAGE="https://github.com/garybernhardt/selecta"
SRC_URI="https://github.com/garybernhardt/selecta/archive/v${PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	>=dev-lang/ruby-1.9.3"

src_install() {
	dobin selecta
	dodoc README.md
}
