# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
inherit eutils fcaps savedconfig toolchain-funcs

if [[ ${PV} == "9999" ]] ; then
	EGIT_REPO_URI="http://git.suckless.org/slock"
	inherit git-r3
else
	SRC_URI="http://dl.suckless.org/tools/${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

DESCRIPTION="simple X screen locker"
HOMEPAGE="http://tools.suckless.org/slock"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~hppa ~x86 ~x86-fbsd"

RDEPEND="
	x11-libs/libX11
	x11-libs/libXext
"
DEPEND="
	${RDEPEND}
	x11-proto/xproto
"

src_prepare() {
	epatch_user

	sed -i \
		-e '/^CFLAGS/{s: -Os::g; s:= :+= :g}' \
		-e '/^CC/d' \
		-e '/^LDFLAGS/{s:-s::g; s:= :+= :g}' \
		config.mk || die
	sed -i \
		-e 's|@${CC}|$(CC)|g' \
		Makefile || die
	if use elibc_FreeBSD; then
		sed -i -e 's/-DHAVE_SHADOW_H//' config.mk || die
	fi
	restore_config config.h
	tc-export CC
}

src_compile() { emake slock; }

src_install() {
	dobin slock
	doman slock.1

	fperms u+s /usr/bin/slock

	save_config config.h
}

pkg_postinst() {
	savedconfig_pkg_postinst
}
