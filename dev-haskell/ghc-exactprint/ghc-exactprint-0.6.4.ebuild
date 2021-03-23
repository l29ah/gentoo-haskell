# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

# ebuild generated by hackport 0.6.7.9999
#hackport: flags: -dev

CABAL_FEATURES="lib profile haddock hoogle hscolour test-suite"
inherit haskell-cabal

DESCRIPTION="ExactPrint for GHC"
HOMEPAGE="https://hackage.haskell.org/package/ghc-exactprint"
SRC_URI="https://hackage.haskell.org/package/${P}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~x86"
IUSE="roundtrip"

RDEPEND=">=dev-haskell/free-4.12:=[profile?]
	>=dev-haskell/ghc-paths-0.1:=[profile?]
	>=dev-haskell/mtl-2.2.1:=[profile?]
	>=dev-haskell/syb-0.5:=[profile?]
	>=dev-lang/ghc-7.10.2:=[profile?]
	>=dev-lang/ghc-8.4.3:=
	roundtrip? ( dev-haskell/diff:=[profile?]
			dev-haskell/filemanip:=[profile?]
			dev-haskell/hunit:=[profile?]
			dev-haskell/temporary:=[profile?]
			>=dev-haskell/text-1.2.2:=[profile?]
			>=dev-haskell/turtle-1.3.0:=[profile?] )
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-2.2.0.1
	test? ( >=dev-haskell/filemanip-0.3
		>=dev-haskell/hunit-1.2
		>=dev-haskell/silently-1.2
		!roundtrip? ( dev-haskell/diff ) )
"

src_configure() {
	haskell-cabal_src_configure \
		--flag=-dev \
		$(cabal_flag roundtrip roundtrip)
}
