# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

# ebuild generated by hackport 0.4.5.9999

CABAL_FEATURES="lib profile haddock hoogle hscolour"
inherit haskell-cabal

DESCRIPTION="An efficient finite map from (byte)strings to values"
HOMEPAGE="http://code.haskell.org/~wren/"
SRC_URI="mirror://hackage/packages/archive/${PN}/${PV}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~x86"
IUSE="usecinternal"

RDEPEND="dev-haskell/binary:=[profile?]
	>=dev-haskell/semigroups-0.18
	>=dev-lang/ghc-7.4.1:=
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-1.6
"

PATCHES=("${FILESDIR}"/${PN}-0.2.4.1-ghc-8.4.patch )

src_configure() {
	haskell-cabal_src_configure \
		$(cabal_flag usecinternal usecinternal)
}
