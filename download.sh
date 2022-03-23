#!/bin/sh

set -ex

DIR="www.sky-visions.com/dec"
URL="https://$DIR"

extract_zip() {
    mkdir tmp
    cd tmp
    unzip "../$1.zip"
    cd ..
    if test -d "tmp/$1"; then
        mv "tmp/$1" .
        rmdir tmp
    else
        mv tmp "$1"
    fi
}

download_zip() {
    wget "$URL/$1/$1.zip" && extract_zip "$1"
}

download_dir() {
    wget -r --no-parent "$URL/$1/" && mv "$DIR/$1" .
}

download_zip "$1" || download_dir "$1"
