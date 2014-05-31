# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

EAPI=5

inherit git-2

DESCRIPTION="Encrypted, decentralized messenging platform"
HOMEPAGE="https://github.com/lehitoskin/blight"
EGIT_REPO_URI="git://github.com/lehitoskin/blight
				https://github.com/lehitoskin/blight"
LICENSE="GPL-3"
SLOT="0"

RDEPEND="net-libs/tox
		>=dev-db/sqlite-3.8.2
		dev-scheme/racket"

src_prepare() {
		raco pkg install github://github.com/lehitoskin/libtoxcore-racket/racket5.3
		epatch "$FILESDIR/${P}.patch"
}

src_compile() {
		emake
}

src_install() {
		emake DESTDIR=${D}/usr install
}
