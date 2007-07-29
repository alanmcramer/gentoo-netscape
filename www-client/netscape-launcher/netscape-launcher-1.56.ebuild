# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/www-client/mozilla-launcher/mozilla-launcher-1.56.ebuild,v 1.11 2007/06/24 23:41:34 vapier Exp $

inherit eutils

DESCRIPTION="Script that launches mozilla or firefox"
HOMEPAGE="http://dev.gentoo.org/~agriffis/dist/"
SRC_URI="mirror://gentoo/mozilla-launcher-${PV}.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="alpha amd64 arm hppa ia64 ~mips ppc ppc64 sparc x86 ~x86-fbsd"
IUSE=""

DEPEND=""
RDEPEND="x11-apps/xdpyinfo"

S=${WORKDIR}

src_install() {
	epatch "${FILESDIR}"/netscape.patch
	exeinto /usr/libexec
	newexe ${P} netscape-launcher || die
}

pkg_postinst() {
	local f

	find ${ROOT}/usr/bin -maxdepth 1 -type l | \
	while read f; do
		[[ $(readlink ${f}) == netscape-launcher ]] || continue
		einfo "Updating ${f} symlink to /usr/libexec/netscape-launcher"
		ln -sfn /usr/libexec/netscape-launcher ${f}
	done
}