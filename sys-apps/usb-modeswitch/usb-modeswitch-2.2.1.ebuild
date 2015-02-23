# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="Handling Mode-Switching USB Devices on Linux"
HOMEPAGE="http://www.draisberghof.de/usb_modeswitch/"
SRC_URI="http://www.draisberghof.de/usb_modeswitch/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="
	virtual/libusb:1
	sys-apps/usb-modeswitch-data"
RDEPEND="${DEPEND}"
