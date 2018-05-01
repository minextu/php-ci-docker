#!/bin/bash

script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# PHP tags to generate
php_versions=("7.0" "7.1" "latest")

for php_version in "${php_versions[@]}"; do
    target_dir="${script_dir}/generated/php-${php_version}"
    mkdir -p ${target_dir}
    cp "${script_dir}/src/Dockerfile" "${target_dir}/"
    sed "s/#TAG#/${php_version}/" -i "${target_dir}/Dockerfile"
done
