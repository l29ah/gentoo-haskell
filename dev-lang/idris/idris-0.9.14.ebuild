# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

# ebuild generated by hackport 0.4.3.9999
#hackport: flags: +release,-freestanding

CABAL_FEATURES="bin lib profile haddock hoogle hscolour"
inherit eutils haskell-cabal

DESCRIPTION="Functional Programming Language with Dependent Types"
HOMEPAGE="http://www.idris-lang.org/"
SRC_URI="mirror://hackage/packages/archive/${PN}/${PV}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~x86"
IUSE="curses ffi gmp llvm"

RDEPEND=">=dev-haskell/annotated-wl-pprint-0.5.3:=[profile?]
	dev-haskell/ansi-terminal:=[profile?]
	dev-haskell/ansi-wl-pprint:=[profile?]
	dev-haskell/base64-bytestring:=[profile?]
	dev-haskell/binary:=[profile?]
	>=dev-haskell/blaze-html-0.6.1.3:=[profile?]
	>=dev-haskell/blaze-markup-0.5.2.1:=[profile?] <dev-haskell/blaze-markup-0.7.0.0:=[profile?]
	dev-haskell/cabal:=[profile?]
	dev-haskell/cheapskate:=[profile?]
	>=dev-haskell/fingertree-0.1:=[profile?]
	>=dev-haskell/haskeline-0.7:=[profile?]
	>=dev-haskell/language-java-0.2.6:=[profile?]
	>=dev-haskell/lens-4.1.1:=[profile?]
	dev-haskell/mtl:=[profile?]
	dev-haskell/network:=[profile?]
	>=dev-haskell/optparse-applicative-0.8:=[profile?]
	>=dev-haskell/parsers-0.9:=[profile?] <dev-haskell/parsers-0.12:=[profile?]
	dev-haskell/split:=[profile?]
	dev-haskell/text:=[profile?]
	dev-haskell/transformers:=[profile?]
	>=dev-haskell/trifecta-1.1:=[profile?]
	dev-haskell/unordered-containers:=[profile?]
	dev-haskell/utf8-string:=[profile?]
	dev-haskell/vector:=[profile?]
	dev-haskell/vector-binary-instances:=[profile?]
	dev-haskell/xml:=[profile?]
	dev-haskell/zlib:=[profile?]
	>=dev-lang/ghc-7.6.1:=
	curses? ( dev-haskell/hscurses:=[profile?] )
	ffi? ( dev-haskell/libffi:=[profile?] )
	gmp? ( dev-haskell/libffi:=[profile?] )
	llvm? ( >=dev-haskell/llvm-general-3.3.8:=[profile?] <dev-haskell/llvm-general-3.3.9:=[profile?]
		>=dev-haskell/llvm-general-pure-3.3.8:=[profile?] <dev-haskell/llvm-general-pure-3.3.9:=[profile?] )
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-1.16.0
"

src_prepare() {
	epatch "${FILESDIR}"/${P}-trifecta-1.4.3.patch

	cabal_chdeps \
		'parsers >= 0.9 && < 0.11.0.2' 'parsers >= 0.9 && < 0.12'
}

src_configure() {
	[[ $(ghc-version) == 7.8.* ]] && replace-hcflags -O[2-9] -O1

	haskell-cabal_src_configure \
		$(cabal_flag curses curses) \
		$(cabal_flag ffi ffi) \
		--flag=-freestanding \
		$(cabal_flag gmp gmp) \
		$(cabal_flag llvm llvm) \
		--flag=release
}
