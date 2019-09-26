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
if [[ $? -ne 0 ]]; then
    echo "cmake configuration failed"
    cat CMakeFiles/CMakeError.log
    exit 1
fi

echo "running build"
cmake --build .
if [[ $? -ne 0 ]]; then
    echo "build failed"
    exit 1
fi

echo "installing built binaries"
make install

