# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=4

DESCRIPTION="mkfs and fsck for HFS and HFS+ file systems"
HOMEPAGE="http://www.opensource.apple.com/"

if [ "${ARCH}" == "amd64" ]; then
	SRC_URI="http://ftp.ubuntu-tw.net/mirror/ubuntu/pool/universe/h/hfsprogs/hfsprogs_332.25-11_amd64.deb"
else
	SRC_URI="http://ftp.ubuntu-tw.net/mirror/ubuntu/pool/universe/h/hfsprogs/hfsprogs_332.25-11_i386.deb"
fi

LICENSE="APSL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

S="${WORKDIR}"

src_unpack() {
	unpack ${A}
}

src_install() {
	tar -xf data.tar.gz -C "${D}"
}
