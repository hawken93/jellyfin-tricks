#!/bin/bash

set -e

apt-get install -y \
	yasm libchromaprint-dev libgnutls28-dev liblilv-dev libass-dev libbluray-dev libbs2b-dev \
	libcaca-dev libcodec2-dev libdrm-dev flite1-dev libgme-dev libgsm1-dev libmp3lame-dev \
	libx264-dev libx265-dev libopenjp2-7-dev libopenmpt-dev libopus-dev \
	librsvg2-dev librubberband-dev libshine-dev libsnappy-dev libsoxr-dev libssh-dev libspeex-dev \
	libtheora-dev libtwolame-dev libvpx-dev libwavpack-dev libwebp-dev libxvidcore-dev libzmq3-dev \
	libzvbi-dev libxml2-dev libcdio-dev libcdio-paranoia-dev libva-dev

cd /usr/src
if [ ! -d ffmpeg ]; then
	git clone git://source.ffmpeg.org/ffmpeg.git
fi
if [ ! -d nv-codec-headers ]; then
	git clone git://source.ffmpeg.org/ffmpeg/nv-codec-headers.git
fi

cd /usr/src/nv-codec-headers
git pull --rebase
make install

cd /usr/src/ffmpeg
git fetch --all -p
git checkout n4.0.3

./configure \
	--prefix=/usr/local \
	--enable-gpl \
	--enable-avisynth --enable-gnutls --enable-libass --enable-libbluray --enable-libbs2b \
	--enable-libcaca --enable-libcdio --enable-libcodec2 --enable-libflite --enable-libfontconfig \
	--enable-libfreetype --enable-libfribidi --enable-libgme --enable-libgsm \
	--enable-libmp3lame --enable-libopenjpeg --enable-libopenmpt --enable-libopus \
	--enable-librsvg --enable-librubberband --enable-libshine --enable-libsnappy \
	--enable-libsoxr --enable-libspeex --enable-libssh --enable-libtheora --enable-libtwolame \
	--enable-libvorbis --enable-libvpx --enable-libwavpack --enable-libwebp --enable-libx265 \
	--enable-libxml2 --enable-libxvid --enable-libzmq --enable-libzvbi --enable-lv2 \
	--enable-libdrm \
	--enable-chromaprint --enable-libx264 \
	--enable-nvenc --enable-nvdec --enable-vaapi

make -j$(nproc)
make install
