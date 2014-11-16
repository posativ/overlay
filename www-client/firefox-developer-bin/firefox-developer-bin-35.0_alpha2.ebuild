# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

MOZ_PV=${PV/_alpha/a}
MOZ_PV=${PV/_beta/b}
MOZ_PV=${PV/_rc/c}

MOZ_PN="${PN/-bin}"
MOZ_P="${MOZ_PN}-${MOZ_PV}"

MOZ_FTP_URI="ftp://ftp.mozilla.org/pub/mozilla.org/${MOZ_PN}/nightly/"

inherit eutils

DESCRIPTION="Firefox Developer Edition"
HOMEPAGE="https://www.mozilla.org/en-US/firefox/developer/"
SRC_URI="${SRC_URI}
	amd64? (
		"${MOZ_FTP_URI}/latest-mozilla-aurora/${MOZ_P}.en-US.linux-x86_64.tar.bz2"
	)"
SRC_URI="https://download-installer.cdn.mozilla.net/pub/firefox/nightly/latest-mozilla-aurora/firefox-35.0a2.en-US.linux-x86_64.tar.bz2"

LICENSE="MPL-2.0 GPL-2 LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="www-client/firefox-bin"
RDEPEND="${DEPEND}"

S="${WORKDIR}/firefox"

src_install() {
	dodir /opt
	mv "${S}" "${D}/opt/firefox-developer"

	dodir /usr/bin
	cat <<-EOF >"${D}"/usr/bin/${PN}
	#!/bin/sh
	unset LD_PRELOAD
	LD_LIBRARY_PATH="/opt/firefox-developer/"
	GTK_PATH=/usr/lib/gtk-2.0/
	exec /opt/firefox-developer/firefox-bin "\$@"
	EOF
	fperms 0755 /usr/bin/${PN}
}
