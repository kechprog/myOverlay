# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit java-pkg-2

DESCRIPTION="A build tool for Scala, Java, and more"
HOMEPAGE="https://www.scala-sbt.org/"
SRC_URI="https://github.com/sbt/sbt/archive/refs/tags/v1.9.3.zip -> ${P}.zip"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

RDEPEND="virtual/jdk:1.8"
DEPEND="${RDEPEND}"

S="${WORKDIR}/sbt-${PV}"

src_install() {
    local sbt_dir="/usr/share/${PN}-${SLOT}"

    insinto "${sbt_dir}"
    doins -r *

    # Symlink the sbt script to a location in the PATH
    dosym "${sbt_dir}/sbt" "/usr/bin/sbt"
}