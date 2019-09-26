#!/bin/sh

cd bin
echo $(pwd)
cp ../ffmpeg-shared-windows/bin/swresample-3.dll ./
cp ../ffmpeg-shared-windows/bin/avcodec-58.dll ./
cp ../ffmpeg-shared-windows/bin/avformat-58.dll ./
cp ../ffmpeg-shared-windows/bin/avutil-56.dll ./
echo $(ls -l)
7z a derperview-win64.zip derperview.exe swresample-3.dll avcodec-58.dll avformat-58.dll avutil-56.dll

