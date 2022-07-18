#!/usr/bin/env sh

# from github action code
cmake -B build -G Ninja -DCMAKE_BUILD_TYPE="Release"
cmake --build build
