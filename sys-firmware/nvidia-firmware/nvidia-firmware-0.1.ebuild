# Copyright 2009-2014 Andrey Ovcharov <sudormrfhalt@gmail.com>
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit unpacker

DESCRIPTION="This package provides video & pgraph firmwares for all NVIDIA chipsets that need them."
HOMEPAGE="http://nouveau.freedesktop.org/wiki/VideoAcceleration/"
NV_VER="325.15"
NV_URI="http://us.download.nvidia.com/XFree86"
SRC_URI="https://raw.github.com/imirkin/re-vp2/master/extract_firmware.py
	x86?	( ${NV_URI}/Linux-x86/${NV_VER}/NVIDIA-Linux-x86-${NV_VER}.run )
	amd64?	( ${NV_URI}/Linux-x86_64/${NV_VER}/NVIDIA-Linux-x86_64-${NV_VER}.run )"

LICENSE="MIT NVIDIA-r1"
SLOT="0"
KEYWORDS="x86 amd64"
IUSE=""
DEPEND="<dev-lang/python-3"
RESTRICT="bindist mirror strip"

S=${WORKDIR}/

src_unpack() {
	use x86 && NV_ARCH="x86"
	use amd64 && NV_ARCH="x86_64"
	mkdir "${S}/NVIDIA-Linux-${NV_ARCH}-${NV_VER}"
	cd "${S}/NVIDIA-Linux-${NV_ARCH}-${NV_VER}"
	unpack_makeself "NVIDIA-Linux-${NV_ARCH}-${NV_VER}.run"
}

src_compile() {
	python2 "${DISTDIR}"/extract_firmware.py
}

src_install() {
	insinto /lib/firmware/nouveau
	doins "${S}"/nv* "${S}"/vuc-* || die "doins failed"
}
