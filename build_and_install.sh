#!/bin/bash

echo "build helper script for derperview"

if [[ -d build/ ]]; then
    echo "remove old build folder"
    rm -fr build
fi

echo "create new build folder"
mkdir build
cd build

echo "run cmake for out of source build"
INSTALL_PREFIX=""
if [[ ${EUID} -eq 0 ]]; then
    echo "script is run as root, start installation to local system bin dir"
else
    echo "script was not run as root, install to local bin dir"
    INSTALL_PREFIX=-DCMAKE_INSTALL_PREFIX=../
fi

if [[ "${TRAVIS_OS_NAME}" == "windows" ]]; then
    # on travis windows builds ignore sh.exe
    cmake ../ -G "MinGW Makefiles" -DCMAKE_SH="CMAKE_SH-NOTFOUND" -DCMAKE_BUILD_TYPE=Release ${INSTALL_PREFIX}
    if [[ $? -ne 0 ]]; then
        echo "cmake configuration failed"
        cat CMakeFiles/CMakeOutput.log
        cat CMakeFiles/CMakeError.log
        exit 1
    fi
else
    cmake ../ -DCMAKE_BUILD_TYPE=Release ${INSTALL_PREFIX}
    if [[ $? -ne 0 ]]; then
        echo "cmake configuration failed"
        cat CMakeFiles/CMakeOutput.log
        cat CMakeFiles/CMakeError.log
        exit 1
    fi
fi

echo "running build"
cmake --build .
if [[ $? -ne 0 ]]; then
    echo "build failed"
    exit 1
fi

echo "installing built binaries"
cmake --build . --target install

