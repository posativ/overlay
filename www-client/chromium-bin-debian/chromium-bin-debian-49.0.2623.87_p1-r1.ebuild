# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="5"

inherit multilib unpacker

MY_R="deb8u1"
MY_PV=${PV/_p/-}
MY_PN=${PN%%-bin-debian}

DESCRIPTION="Chromium build from Debian unstable"
HOMEPAGE="http://packages.debian.org/sid/chromium"
SRC_URI="mirror://debian/pool/main/${PN:0:1}/${PN:0:8}-browser/${PN:0:8}_${MY_PV}~${MY_R}_amd64.deb"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="app-arch/dpkg"
RDEPEND="
	app-accessibility/speech-dispatcher
	dev-libs/expat
	dev-libs/glib:2
	dev-libs/libevent
	dev-libs/libxml2
	dev-libs/libxslt
	dev-libs/nspr
	dev-libs/nss
	gnome-base/libgnome-keyring
	media-libs/alsa-lib
	media-libs/flac
	media-libs/fontconfig
	media-libs/freetype
	>=media-libs/libjpeg-turbo-1.3.1
	media-libs/harfbuzz
	media-libs/libvpx
	media-libs/speex
	>=media-sound/pulseaudio-2.0
	<net-libs/libsrtp-1.5
	net-print/cups
	sys-apps/dbus
	>=sys-devel/gcc-4.9[cxx]
	sys-apps/pciutils
	sys-libs/libcap
	x11-libs/cairo
	x11-libs/gdk-pixbuf
	x11-libs/gtk+
	x11-libs/libX11
	x11-libs/libXScrnSaver
	x11-libs/libXcomposite
	x11-libs/libXcursor
	x11-libs/libXext
	x11-libs/libXfixes
	x11-libs/libXi
	x11-libs/libXrandr
	x11-libs/libXrender
	x11-libs/libXtst
	x11-libs/pango
	"

S=${WORKDIR}

QA_PREBUILT="usr/lib*/${MY_PN}/*"

src_install() {
	mv "${S}"/{usr,etc} "${D}"/ || die

	local libdir=$(get_libdir)
	[[ "${libdir}" != lib ]] && {
		mv "${D}"/usr/{lib,"${libdir}"} || die
	}

	echo jessie > "${D}"/etc/debian_version || die

	# Link to Flash (not in RDEPEND)
	local flash_plugin_dir=/usr/${libdir}/firefox/plugins
	dodir "${flash_plugin_dir}"
	ln -s ../../nsbrowser/plugins/libflashplayer.so "${D}"/${flash_plugin_dir}/libflashplayer.so || die

	# Otherwise:
	# [14345:14345:0708/125539:FATAL:zygote_host_impl_linux.cc(140)]
	# The SUID sandbox helper binary was found, but is not configured correctly.
	# Rather than run without sandboxing I'm aborting now. You need to make sure
	# that /usr/lib/chromium/chromium-sandbox is owned by root and has mode 4755.
	# Aborted
	chmod 4755 "${D}"/usr/${libdir}/${MY_PN}/chrome-sandbox || die
}
