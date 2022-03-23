#!/bin/sh

set -ex
E="$2"
case "$E" in
    pdp10-ka|pdp10-ki|pdp10-kl|pdp10-ks)
        git clone https://github.com/rcornwell/sims ;;
    pdp10-kv)
        E="pdp10-ki"
        git clone https://github.com/rcornwell/sims ;;
    pdp10)
        git clone https://github.com/simh/simh ;;
    *)
        echo "Unknown emulator: $E."
        exit 1 ;;
esac
cd sim?
make "$E"
