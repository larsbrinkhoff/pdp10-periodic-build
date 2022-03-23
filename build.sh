#!/bin/sh

set -ex

case "$2" in
    pdp10-ka|pdp10-ki|pdp10-kv|pdp10-kl|pdp10-ks)
        PATH="$PATH:$PWD/sims/BIN" ;;
    pdp10)
        PATH="$PATH:$PWD/simh/BIN" ;;
    *)
        echo "Unknown emulator: $2."
        exit 1 ;;
esac

cd "$1"

case "$1:$2" in
    tops503:pdp10-ka)
        pdp10-ka setup.ini ;;
    tops603:pdp10-ka)
        pdp10-ka load.ini ka dp ;;
    tops603:pdp10-ki)
        pdp10-ki load.ini ki dp ;;
    tops603:pdp10-kv)
        pdp10-ki load.ini kv dp ;;
    tops603:pdp10-kl)
        pdp10-kl load.ini kl rp ;;
    tops703:*|tops704:*)
        "$2" load.ini ;;
    t20v3:pdp10-kl)
        "$2" load_a.ini
        "$2" load_b.ini ;;
    t20v7:pdp10-kl)
        "$2" load.ini ;;
    *)
        echo "Unknown build: $1 running on $2."
        exit 1;;
esac
