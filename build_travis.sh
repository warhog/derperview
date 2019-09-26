#!/bin/bash

echo "build helper script for derperview on travis"

if [[ -d build/ ]]; then
    echo "remove old build folder"
    rm -fr build
fi

echo "create new build folder"
mkdir build
cd build

cmake ../  -DCMAKE_BUILD_TYPE=Debug -DCMAKE_INSTALL_PREFIX=../

echo "running build"
cmake --build .

echo "installing built binaries"
make install

