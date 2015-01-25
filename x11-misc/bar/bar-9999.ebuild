# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit git-r3

EGIT_REPO_URI="https://github.com/LemonBoy/bar.git"

DESCRIPTION="Lightweight xcb based bar."
HOMEPAGE="https://github.com/LemonBoy/bar"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="
	x11-libs/libxcb
"
RDEPEND="${DEPEND}"

src_compile() {
	make all
	make doc
}

src_install() {
	emake DESTDIR="${D}" install
	doman bar.1
}