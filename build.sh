#!/bin/bash
BinaryName="SocksProxyViaJumpHost"
rm -rf ./bin/

# https://stackoverflow.com/questions/25051623/golang-compile-for-all-platforms-in-windows-7-32-bit
# https://www.digitalocean.com/community/tutorials/how-to-build-go-executables-for-multiple-platforms-on-ubuntu-16-04

declare -a linux_architectures=(
        "amd64"
        "arm"
        "arm64"
)
declare -a darwin_architectures=(
        "amd64"
)
declare -a windows_architectures=(
        "amd64"
)

for architecture in "${linux_architectures[@]}"
do
        echo "Building Linux: $architecture"
        GOOS=linux GOARCH=$architecture go build -o bin/linux/$architecture/$BinaryName
done

for architecture in "${darwin_architectures[@]}"
do
        echo "Building Darwin: $architecture"
        GOOS=darwin GOARCH=$architecture go build -o bin/darwin/$architecture/$BinaryName
done

for architecture in "${windows_architectures[@]}"
do
        echo "Building Windows: $architecture"
        GOOS=windows GOARCH=$architecture go build -o bin/windows/$architecture/$BinaryName.exe
done