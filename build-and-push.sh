#!/bin/bash

set -e

image_name="pixelplastic/lighttpd"

docker build --pull --no-cache -t "${image_name}:latest" .
trivy image "${image_name}:latest"

alpine_version=$(docker run "${image_name}:latest" cat /etc/os-release | grep 'VERSION_ID' | sed -e 's/VERSION_ID=//')
lighttpd_version=$(docker run "${image_name}:latest" lighttpd -v | sed -E "s/^lighttpd\/([0-9]+\.[0-9]+\.[0-9]+).*/\1/")

docker push "${image_name}:latest"
for image_tag in "alpine" "${lighttpd_version}" "${alpine_version}-${lighttpd_version}"; do
    docker tag "${image_name}:latest" "${image_name}:${image_tag}"
    docker push "${image_name}:${image_tag}"
done
