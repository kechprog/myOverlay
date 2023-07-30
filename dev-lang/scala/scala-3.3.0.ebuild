EAPI=7

inherit java-pkg-2 java-ant-2

DESCRIPTION="The Scala Programming Language"
HOMEPAGE="https://www.scala-lang.org/"
SRC_URI="https://github.com/lampepfl/dotty/archive/refs/tags/${PV}.zip -> ${P}.zip"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="virtual/jdk:1.8"
RDEPEND="${DEPEND}"

S="${WORKDIR}/dotty-${PV}"

src_compile() {
    eant dist
}

src_install() {
    java-pkg_dojar dist/*.jar
    java-pkg_dobin bin/*
    dodoc README.md
}
