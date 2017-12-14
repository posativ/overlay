EAPI=6

DESCRIPTION="Quick command-line access to files and directories, inspired by autojump z and v"
HOMEPAGE="https://github.com/clvv/fasd"
SRC_URI="https://github.com/clvv/fasd/archive/${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"

src_install() {
	emake PREFIX="${EPREFIX}/usr" DESTDIR="${D}" install
}
