#!/bin/bash
for arch in "386" "amd64" "arm/v7" "arm/v5" "arm64/v8"; do
  docker run --workdir /build --volume .:/build:rw --platform linux/$arch --pull=always debian:latest bash -c "apt update && apt install -y build-essential && ARCHNAME=$arch bash netfx-src/compile-interop-assembly-release.sh"
done
