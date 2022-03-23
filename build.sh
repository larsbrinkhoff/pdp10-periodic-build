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

case "$1:$2:$3" in
    tops503:pdp10-ka:)
        pdp10-ka setup.ini ;;
    tops603:pdp10-ka:*)
        pdp10-ka load.ini ka "$3" ;;
    tops603:pdp10-ki:*)
        pdp10-ki load.ini ki "$3" ;;
    tops603:pdp10-kv:*)
        pdp10-ki load.ini kv "$3" ;;
    tops603:pdp10-kl:*)
        pdp10-kl load.ini kl "$3" ;;
    tops703:*|tops704:*)
        "$2" load.ini ;;
    t20v3:pdp10-kl:*)
        "$2" load_"$3".ini ;;
    t20v7:pdp10-kl:)
        "$2" load.ini ;;
    *)
        echo "Unknown build: $1 running on $2, variant $3."
        exit 1;;
esac
