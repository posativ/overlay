# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
inherit font

DESCRIPTION="123 weather themed icons inspired by Font Awesome and ready for Bootstrap"
HOMEPAGE="http://erikflowers.github.io/weather-icons/"
SRC_URI="https://github.com/erikflowers/${PN}/archive/master.zip"

LICENSE="SIL OFL 1.1"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

S="${WORKDIR}/${PN}-master"
FONT_SUFFIX="ttf otf"
FONT_S="${S}/fonts"
