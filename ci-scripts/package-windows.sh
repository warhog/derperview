#!/bin/sh

cd bin
echo $(pwd)
7z a derperview-win64.zip derperview ../ffmpeg-shared-windows/swresample-3.dll ../ffmpeg-shared-windows/avcodec-58.dll ../ffmpeg-shared-windows/avformat-58.dll ../ffmpeg-shared-windows/avutil-56.dll

ls -l ..

