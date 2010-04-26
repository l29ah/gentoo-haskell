# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header:  $

CABAL_FEATURES="bin lib profile haddock hscolour"
inherit haskell-cabal elisp-common

DESCRIPTION="Source code suggestions"
HOMEPAGE="http://community.haskell.org/~ndm/hlint/"
SRC_URI="http://hackage.haskell.org/packages/archive/${PN}/${PV}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="emacs"

RDEPEND="emacs? ( virtual/emacs
		 app-emacs/haskell-mode )"
DEPEND="${RDEPEND}
	>=dev-lang/ghc-6.6.1
		>=dev-haskell/cabal-1.6
		=dev-haskell/cpphs-1.11*
		=dev-haskell/haskell-src-exts-1.8*
		=dev-haskell/hscolour-1.16*
		dev-haskell/mtl
		=dev-haskell/uniplate-1.5*"

SITEFILE="60${PN}-gentoo.el"

src_compile() {
	threaded_flag=""
	if $(ghc-getghc) --info | grep "Support SMP" | grep -q "YES"; then
		threaded_flag="--flags=threaded"
		einfo "$P will be built with threads support"
	else
		threaded_flag="--flags=-threaded"
		einfo "$P will be built without threads support"
	fi
	cabal_src_compile $threaded_flag

	use emacs && elisp-compile data/hs-lint.el
}

src_install() {
	cabal_src_install

	if use emacs; then
		elisp-install ${PN} data/*.el data/*.elc || die "elisp-install failed."
		elisp-site-file-install "${FILESDIR}/${SITEFILE}"
	fi

	dodoc hlint.htm
}

pkg_postinst() {
	ghc-package_pkg_postinst
	use emacs && elisp-site-regen
}

pkg_postrm() {
	use emacs && elisp-site-regen
}
