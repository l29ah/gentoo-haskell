# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

# ebuild generated by hackport 0.5.1.9999

CABAL_FEATURES="lib profile haddock hoogle hscolour test-suite"
inherit haskell-cabal

DESCRIPTION="PureScript Programming Language Compiler"
HOMEPAGE="http://www.purescript.org/"
SRC_URI="mirror://hackage/packages/archive/${PN}/${PV}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~x86"
IUSE=""

RESTRICT=test # needs nodejs, npm and stuff

RDEPEND=">=dev-haskell/aeson-0.8:=[profile?]
	>=dev-haskell/aeson-better-errors-0.8:=[profile?]
	dev-haskell/aeson-pretty:=[profile?]
	>=dev-haskell/ansi-terminal-0.6.2:=[profile?] <dev-haskell/ansi-terminal-0.7:=[profile?]
	dev-haskell/ansi-wl-pprint:=[profile?]
	>=dev-haskell/base-compat-0.6.0:=[profile?]
	>=dev-haskell/bower-json-0.8:=[profile?]
	>=dev-haskell/boxes-0.1.4:=[profile?] <dev-haskell/boxes-0.2.0:=[profile?]
	dev-haskell/clock:=[profile?]
	>=dev-haskell/data-ordlist-0.4.7.0:=[profile?]
	dev-haskell/dlist:=[profile?]
	dev-haskell/edit-distance:=[profile?]
	dev-haskell/file-embed:=[profile?]
	dev-haskell/foldl:=[profile?]
	>=dev-haskell/fsnotify-0.2.1:=[profile?]
	>=dev-haskell/glob-0.7:=[profile?] <dev-haskell/glob-0.8:=[profile?]
	>=dev-haskell/haskeline-0.7.0.0:=[profile?]
	>=dev-haskell/http-client-0.4.30:=[profile?]
	>=dev-haskell/http-types-0.9:=[profile?] <dev-haskell/http-types-0.10:=[profile?]
	>=dev-haskell/language-javascript-0.6:=[profile?] <dev-haskell/language-javascript-0.7:=[profile?]
	>=dev-haskell/lens-4:=[profile?] <dev-haskell/lens-5:=[profile?]
	>=dev-haskell/lifted-base-0.2.3:=[profile?] <dev-haskell/lifted-base-0.2.4:=[profile?]
	>=dev-haskell/monad-control-1.0.0.0:=[profile?] <dev-haskell/monad-control-1.1:=[profile?]
	>=dev-haskell/monad-logger-0.3:=[profile?] <dev-haskell/monad-logger-0.4:=[profile?]
	>=dev-haskell/mtl-2.1.0:=[profile?] <dev-haskell/mtl-2.3.0:=[profile?]
	dev-haskell/network:=[profile?]
	>=dev-haskell/optparse-applicative-0.12.1:=[profile?]
	>=dev-haskell/parallel-3.2:=[profile?] <dev-haskell/parallel-3.3:=[profile?]
	>=dev-haskell/parsec-3.1.10:=[profile?]
	>=dev-haskell/pattern-arrows-0.0.2:=[profile?] <dev-haskell/pattern-arrows-0.1:=[profile?]
	>=dev-haskell/pipes-4.0.0:=[profile?] <dev-haskell/pipes-4.3.0:=[profile?]
	dev-haskell/pipes-http:=[profile?]
	>=dev-haskell/protolude-0.1.6:=[profile?]
	dev-haskell/regex-tdfa:=[profile?]
	>=dev-haskell/safe-0.3.9:=[profile?] <dev-haskell/safe-0.4:=[profile?]
	>=dev-haskell/semigroups-0.16.2:=[profile?] <dev-haskell/semigroups-0.19:=[profile?]
	>=dev-haskell/sourcemap-0.1.6:=[profile?]
	>=dev-haskell/spdx-0.2:=[profile?] <dev-haskell/spdx-0.3:=[profile?]
	dev-haskell/split:=[profile?]
	>=dev-haskell/stm-0.2.4.0:=[profile?]
	dev-haskell/syb:=[profile?]
	dev-haskell/system-filepath:=[profile?]
	dev-haskell/text:=[profile?]
	>=dev-haskell/transformers-base-0.4.0:=[profile?] <dev-haskell/transformers-base-0.5:=[profile?]
	>=dev-haskell/transformers-compat-0.3.0:=[profile?]
	dev-haskell/turtle:=[profile?]
	dev-haskell/unordered-containers:=[profile?]
	>=dev-haskell/utf8-string-1:=[profile?] <dev-haskell/utf8-string-2:=[profile?]
	dev-haskell/vector:=[profile?]
	>=dev-haskell/wai-3:=[profile?] <dev-haskell/wai-4:=[profile?]
	>=dev-haskell/wai-websockets-3:=[profile?] <dev-haskell/wai-websockets-4:=[profile?]
	>=dev-haskell/warp-3:=[profile?] <dev-haskell/warp-4:=[profile?]
	>=dev-haskell/websockets-0.9:=[profile?] <dev-haskell/websockets-0.10:=[profile?]
	>=dev-lang/ghc-7.10.1:=
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-1.22.2.0
	test? ( dev-haskell/hspec
		dev-haskell/hspec-discover
		dev-haskell/hunit
		dev-haskell/silently )
"

PATCHES=(
	"${FILESDIR}"/${PN}-0.10.2-http-client-0.5.patch
	"${FILESDIR}"/${PN}-0.10.3-bower-json-1.patch
	"${FILESDIR}"/${PN}-0.10.3-turtle-1.3.patch
)

src_prepare() {
	default

	cabal_chdeps \
		'aeson >= 0.8 && < 1.0' 'aeson >= 0.8'
}
