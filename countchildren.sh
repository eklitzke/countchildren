#!/bin/bash
#
# Count how many processes are created when running a command.

OUTDIR=""

cleanup() {
    if [ ! -z "${OUTDIR}" ]; then
        rm -rf "${OUTDIR}"
    fi
}

trap cleanup EXIT

OUTDIR=$(mktemp -d)
strace -ff -o "${OUTDIR}/xxx" "$@"
find "${OUTDIR}" -type f -name 'xxx*' -print0 | tr -dc '\0' | wc -c
