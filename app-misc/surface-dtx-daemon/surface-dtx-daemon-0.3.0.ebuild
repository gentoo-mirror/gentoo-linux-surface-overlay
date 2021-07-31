# Copyright 2017-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Auto-Generated by cargo-ebuild 0.3.2

EAPI=7

CRATES="
	ansi_term-0.11.0
	ansi_term-0.12.1
	anyhow-1.0.39
	atty-0.2.14
	autocfg-1.0.1
	bitflags-1.2.1
	byteorder-1.4.3
	bytes-1.0.1
	cc-1.0.67
	cfg-if-1.0.0
	chrono-0.4.19
	clap-2.33.3
	dbus-0.9.2
	dbus-crossroads-0.3.0
	dbus-tokio-0.7.3
	futures-0.3.13
	futures-channel-0.3.13
	futures-core-0.3.13
	futures-executor-0.3.13
	futures-io-0.3.13
	futures-macro-0.3.13
	futures-sink-0.3.13
	futures-task-0.3.13
	futures-util-0.3.13
	hermit-abi-0.1.18
	itoa-0.4.7
	lazy_static-1.4.0
	libc-0.2.91
	libdbus-sys-0.2.1
	log-0.4.14
	matchers-0.0.1
	memchr-2.3.4
	mio-0.7.11
	miow-0.3.7
	nix-0.20.0
	ntapi-0.3.6
	num-integer-0.1.44
	num-traits-0.2.14
	once_cell-1.7.2
	pin-project-lite-0.2.6
	pin-utils-0.1.0
	pkg-config-0.3.19
	proc-macro-hack-0.5.19
	proc-macro-nested-0.1.7
	proc-macro2-1.0.24
	quote-1.0.9
	regex-1.4.5
	regex-automata-0.1.9
	regex-syntax-0.6.23
	ryu-1.0.5
	serde-1.0.125
	serde_derive-1.0.125
	serde_ignored-0.1.2
	serde_json-1.0.64
	sharded-slab-0.1.1
	signal-hook-registry-1.3.0
	slab-0.4.2
	smallvec-1.6.1
	strsim-0.8.0
	syn-1.0.64
	textwrap-0.11.0
	thiserror-1.0.24
	thiserror-impl-1.0.24
	thread_local-1.1.3
	tokio-1.4.0
	tokio-macros-1.1.0
	toml-0.5.8
	tracing-0.1.25
	tracing-attributes-0.1.15
	tracing-core-0.1.17
	tracing-log-0.1.2
	tracing-serde-0.1.2
	tracing-subscriber-0.2.17
	unicode-width-0.1.8
	unicode-xid-0.2.1
	vec_map-0.8.2
	winapi-0.3.9
	winapi-i686-pc-windows-gnu-0.4.0
	winapi-x86_64-pc-windows-gnu-0.4.0
"

inherit cargo

DESCRIPTION="Surface Detachment System (DTX) Daemon"
# Double check the homepage as the cargo_metadata crate
# does not provide this value so instead repository is used
HOMEPAGE="https://github.com/linux-surface/surface-dtx-daemon/"
SRC_URI="$(cargo_crate_uris ${CRATES})"

# License set may be more restrictive as OR is not respected
# use cargo-license for a more accurate license picture
LICENSE="Apache-2.0 BSL-1.0 MIT Unlicense"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="mirror"
