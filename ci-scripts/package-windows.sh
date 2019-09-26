#!/bin/sh

cd bin
echo $(pwd)
cp ..&ffmpeg-shared-windows/swresample-3.dll ./
cp ..&ffmpeg-shared-windows/avcodec-58.dll ./
cp ..&ffmpeg-shared-windows/avformat-58.dll ./
cp ..&ffmpeg-shared-windows/avutil-56.dll ./
cd ..
echo $(pwd)
echo $(ls -l)
cp -r bin derperview
7z a derperview-win64.zip derperview/

