# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="The libspotify C API package allows third-party developers to write applications that utilize the Spotify music streaming service."
HOMEPAGE="https://developer.spotify.com/technologies/libspotify/"
SRC_URI="
	x86? (
		https://developer.spotify.com/download/libspotify/${P}-Linux-i686-release.tar.gz
	)
	amd64? (
		https://developer.spotify.com/download/libspotify/${P}-Linux-x86_64-release.tar.gz
	)
"

LICENSE="Spotify"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

S=${WORKDIR}

src_prepare() {
	if use x86; then
		S="${WORKDIR}/${P}-Linux-i686-release"
	elif use amd64; then
		S="${WORKDIR}/${P}-Linux-x86_64-release"
	else
		ewarn "Arch not supported"
		die 1
	fi
}

src_compile() {
	:
}

src_install() {
	sed -i 's#PKG_PREFIX:$(prefix)#PKG_PREFIX:$(real_prefix)#;s/ldconfig.*//' Makefile
	emake prefix="${D}/${DESTTREE}" real_prefix="${DESTTREE}" install
	dodoc README ChangeLog

	# install man
	doman share/man3/*
}

