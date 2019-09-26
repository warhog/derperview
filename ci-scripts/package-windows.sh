#!/bin/sh

cd bin
echo $(pwd)
cp ../ffmpeg-shared-windows/swresample-3.dll ./
cp ../ffmpeg-shared-windows/avcodec-58.dll ./
cp ../ffmpeg-shared-windows/avformat-58.dll ./
cp ../ffmpeg-shared-windows/avutil-56.dll ./
echo $(ls -l)
7z a derperview-win64.zip derperview.exe swresample-3.dll avcodec-58.dll avformat-58.dll avutil-56.dll

