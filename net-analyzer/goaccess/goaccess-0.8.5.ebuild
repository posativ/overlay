# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

AUTOTOOLS_AUTORECONF=1
inherit autotools-utils

DESCRIPTION="A real-time Apache log analyzer and interactive viewer that runs in a terminal"
HOMEPAGE="http://goaccess.io"
SRC_URI="http://tar.goaccess.io/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~amd64-linux"
IUSE="geoip unicode"

RDEPEND="
	dev-libs/glib:2
	sys-libs/ncurses[unicode?]
	geoip? ( dev-libs/geoip )
"
DEPEND="${RDEPEND}
	virtual/pkgconfig
"

src_configure() {
	# configure does not properly recognise '--disable-something'
	local myeconfargs=(
		$(usex geoip '--enable-geoip' '' '' '')
		$(usex unicode '--enable-utf8' '' '' '')
	)
	autotools-utils_src_configure
}

src_compile() {
	autotools-utils_src_compile CFLAGS="${CFLAGS}"
}
