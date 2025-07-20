# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{7..11} pypy )

inherit udev

DESCRIPTION="Validity fingerprint sensor prototype"
HOMEPAGE="https://github.com/uunicorn/python-validity"
SRC_URI="https://github.com/uunicorn/${PN}/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"

#IUSE="systemd"

KEYWORDS="~amd64 ~x86"

#RDEPEND="
#	app-arch/innoextract
#	dev-python/cryptography[${PYTHON_USEDEP}]
#	dev-python/dbus-python[${PYTHON_USEDEP}]
#	dev-python/pygobject[${PYTHON_USEDEP}]
#   dev-python/pyusb[${PYTHON_USEDEP}]
#   dev-python/pyyaml[${PYTHON_USEDEP}]
#   sys-auth/fprintd-clients
#   sys-auth/open-fprintd
#"
RDEPEND="
	app-arch/innoextract
	dev-python/cryptography
	dev-python/dbus-python
	dev-python/pygobject
	dev-python/pyusb
	dev-python/pyyaml
	sys-auth/open-fprintd
"
DEPEND="
	${RDEPEND}
"

PATCHES=(
	"${FILESDIR}/${PN}-0.12-fix-unsafe-load.patch"
)

python_install_all() {
	distutils-r1_python_install_all
	udev_newrules "${S}"/debian/python3-validity.udev 60-python-validity.rules
	insinto /etc/python-validity
	doins "${S}"/etc/python-validity/dbus-service.yaml
}

pkg_postinst() {
	elog "Sample configurations are available at:"
	elog "https://github.com/uunicorn/python-validity"
	elog "To enable this service:"
	elog "rc-update add python3-validity default"
	elog "rc-service python3-validity start"
}
