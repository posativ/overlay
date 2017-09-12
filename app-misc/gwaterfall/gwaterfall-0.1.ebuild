# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit eutils autotools

DESCRIPTION="View all characters of a font in all sizes"
HOMEPAGE="https://launchpad.net/ubuntu/+source/gwaterfall"
SRC_URI="mirror://debian/pool/main/g/${PN}/${PN}_${PV}.orig.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="x11-libs/gtk+:2"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${PN}"

src_prepare() {
	epatch "${FILESDIR}/${P}.diff"
	eapply_user
}

src_configure() {
	eautoreconf
	chmod +x ./configure
	./configure
}

src_install() {
	DESTDIR="${D}" make install

	doman debian/waterfall.1
	dodoc COPYING
}
