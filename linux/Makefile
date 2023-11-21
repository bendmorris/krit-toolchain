export PREFIX=$(shell pwd)
export C_INCLUDE_PATH=$(shell pwd)/include
export CPLUS_INCLUDE_PATH=$(shell pwd)/include
export CFLAGS=-fno-finite-math-only -I${PREFIX}/include
export CXXFLAGS=-I${PREFIX}/include
export LDFLAGS=-L${PREFIX}/lib -L${PREFIX}/lib
export PKG_CONFIG_PATH=$(shell pwd)/lib/pkgconfig

.PHONY: SDL zlib png jpeg SDL_image ogg vorbis opus flac sndfile freetype harfbuzz yaml openssl zip curl sqlite

all: SDL zlib png jpeg SDL_image ogg vorbis opus flac sndfile freetype harfbuzz yaml openssl zip curl sqlite

# SDL
SDL: lib/libSDL2.a
SDL2-2.0.10.tar.gz:
	curl -L https://github.com/libsdl-org/SDL/releases/download/release-2.0.10/SDL2-2.0.10.tar.gz -o $@
SDL2-2.0.10: SDL2-2.0.10.tar.gz
	tar xzf $<
lib/libSDL2.a: SDL2-2.0.10
	cd $< && ./configure --disable-shared --prefix=$$PREFIX --enable-video-x11-xcursor && make -j8 && make install

# ZLIB
zlib: lib/libz.a
zlib-1.2.13.tar.gz:
	curl -L https://zlib.net/zlib-1.2.13.tar.gz -o $@
zlib-1.2.13: zlib-1.2.13.tar.gz
	tar xzf $<
lib/libz.a: zlib-1.2.13
	cd $< && ./configure --prefix=$$PREFIX --static && make -j8 && make install

# PNG
png: zlib lib/libpng16.a
libpng-1.6.39.tar.gz:
	curl -L http://prdownloads.sourceforge.net/libpng/libpng-1.6.39.tar.gz?download -o $@
libpng-1.6.39: libpng-1.6.39.tar.gz
	tar xzf $<
lib/libpng16.a: libpng-1.6.39
	cd $< && ./configure --disable-shared --prefix=$$PREFIX && make -j8 && make install

# JPEG
jpeg: lib/libjpeg.a
libjpeg-turbo-2.0.4.tar.gz:
	curl -L https://sourceforge.net/projects/libjpeg-turbo/files/2.0.4/libjpeg-turbo-2.0.4.tar.gz/download -o $@
libjpeg-turbo-2.0.4: libjpeg-turbo-2.0.4.tar.gz
	tar xzf $<
lib/libjpeg.a: libjpeg-turbo-2.0.4
	mkdir -p libjpeg-turbo-2.0.4/build && cd libjpeg-turbo-2.0.4/build && cmake -G"Unix Makefiles" -DCMAKE_INSTALL_PREFIX=$$PREFIX .. && make -j8 && make libjpeg.a -j8 && make install

# SDL_image
SDL_image: SDL png jpeg lib/libSDL2_image.a
SDL2_image-2.0.5.tar.gz:
	curl -L https://www.libsdl.org/projects/SDL_image/release/SDL2_image-2.0.5.tar.gz -o $@
SDL2_image-2.0.5: SDL2_image-2.0.5.tar.gz
	tar xzf $<
lib/libSDL2_image.a: SDL2_image-2.0.5
	cd $< && ./configure --disable-shared --prefix=$$PREFIX --with-sdl-prefix=$$PREFIX --disable-png-shared --disable-jpg-shared && make -j8 && make install

# ogg
ogg: lib/libogg.a
libogg-1.3.5.tar.xz:
	curl -L https://github.com/xiph/ogg/releases/download/v1.3.5/libogg-1.3.5.tar.xz -o $@
libogg-1.3.5: libogg-1.3.5.tar.xz
	tar xf $<
lib/libogg.a: libogg-1.3.5
	cd $< && ./configure --disable-shared --prefix=$$PREFIX && make -j8 && make install

# vorbis
vorbis: lib/libvorbis.a
libvorbis-1.3.7.tar.xz:
	curl -L https://github.com/xiph/vorbis/releases/download/v1.3.7/libvorbis-1.3.7.tar.xz -o $@
libvorbis-1.3.7: libvorbis-1.3.7.tar.xz
	tar xf $<
lib/libvorbis.a: libvorbis-1.3.7
	cd $< && ./configure --disable-shared --prefix=$$PREFIX && make -j8 && make install

# opus
opus: lib/libopus.a
opus-1.1.2.tar.gz:
	curl -L https://github.com/xiph/opus/releases/download/v1.1.2/opus-1.1.2.tar.gz -o $@
opus-1.1.2: opus-1.1.2.tar.gz
	tar xzf $<
lib/libopus.a: opus-1.1.2
	cd $< && ./configure --disable-shared --prefix=$$PREFIX && make -j8 && make install

# flac
flac: lib/libflac.a
flac-1.4.2.tar.xz:
	curl -L https://github.com/xiph/flac/releases/download/1.4.2/flac-1.4.2.tar.xz -o $@
flac-1.4.2: flac-1.4.2.tar.xz
	tar xf $<
lib/libflac.a: flac-1.4.2
	cd $< && ./configure --disable-shared --prefix=$$PREFIX && make -j8 && make install

# sndfile
sndfile: lib/libsndfile.a
libsndfile-1.2.0.tar.xz:
	curl -L https://github.com/libsndfile/libsndfile/releases/download/1.2.0/libsndfile-1.2.0.tar.xz -o $@
libsndfile-1.2.0: libsndfile-1.2.0.tar.xz
	tar xf $<
lib/libsndfile.a: libsndfile-1.2.0
	cd $< && ./configure --enable-static --disable-shared --prefix=$$PREFIX && make -j8 && make install

# freetype
freetype: lib/libfreetype.a
freetype-2.12.1.tar.xz:
	curl -L https://download.savannah.gnu.org/releases/freetype/freetype-2.12.1.tar.xz -o $@
freetype-2.12.1: freetype-2.12.1.tar.xz
	tar xf $<
lib/libfreetype.a: freetype-2.12.1
	cd $< && ./configure --enable-static --disable-shared --prefix=$$PREFIX && make -j8 && make install

# harfbuzz
harfbuzz: freetype lib/libharfbuzz.a
harfbuzz-6.0.0.tar.xz:
	curl -L https://github.com/harfbuzz/harfbuzz/releases/download/6.0.0/harfbuzz-6.0.0.tar.xz -o $@
harfbuzz-6.0.0: harfbuzz-6.0.0.tar.xz
	tar xf $<
lib/libharfbuzz.a: harfbuzz-6.0.0
	cd $< && ./configure --enable-static --disable-shared --prefix=$$PREFIX && make -j8 && make install

# yaml
yaml: lib/libyaml.a
yaml-0.2.5.tar.gz:
	curl -L https://github.com/yaml/libyaml/releases/download/0.2.5/yaml-0.2.5.tar.gz -o $@
yaml-0.2.5: yaml-0.2.5.tar.gz
	tar xzf $<
lib/libyaml.a: yaml-0.2.5
	cd $< && ./configure --enable-static --disable-shared --prefix=$$PREFIX && make -j8 && make install

# openssl
openssl: lib/libssl.a
openssl-3.0.7.tar.gz:
	curl -L https://www.openssl.org/source/openssl-3.0.7.tar.gz -o $@
openssl-3.0.7: openssl-3.0.7.tar.gz
	tar xzf $<
lib/libssl.a: openssl-3.0.7
	cd $< && ./Configure --no-shared --static -static --prefix=$$PREFIX --libdir=lib && make -j8 && make install

# zip
zip: lib/libzip.a
libzip-1.9.2.tar.gz:
	curl -L https://github.com/nih-at/libzip/releases/download/v1.9.2/libzip-1.9.2.tar.gz -o $@
libzip-1.9.2: libzip-1.9.2.tar.gz
	tar xzf $<
lib/libzip.a: libzip-1.9.2
	cd $< && mkdir -p build && cd build && cmake .. -DBUILD_SHARED_LIBS=Off -DENABLE_COMMONCRYPTO=Off -DENABLE_GNUTLS=Off -DENABLE_MBEDTLS=Off -DENABLE_OPENSSL=Off -DENABLE_WINDOWS_CRYPTO=Off -DENABLE_BZIP2=Off -DENABLE_LZMA=Off -DENABLE_ZSTD=Off -DBUILD_TOOLS=Off -DBUILD_REGRESS=Off -DBUILD_EXAMPLES=Off -DBUILD_DOC=Off -DCMAKE_FIND_ROOT_PATH=$$PREFIX -DCMAKE_INSTALL_PREFIX=$$PREFIX && make -j8 && make install

# curl
curl: lib/libcurl.a
curl-7.87.0.tar.xz:
	curl -L https://github.com/curl/curl/releases/download/curl-7_87_0/curl-7.87.0.tar.xz -o $@
curl-7.87.0: curl-7.87.0.tar.xz
	tar xf $<
lib/libcurl.a: curl-7.87.0
	cd $< && OPENSSL_LIBS= ./configure --enable-static --disable-shared --disable-ldap --disable-ldaps --with-openssl --prefix=$$PREFIX && make -j8 && make install

# sqlite
sqlite: lib/libsqlite3.a
sqlite-autoconf-3400100.tar.gz:
	curl -L https://www.sqlite.org/2022/sqlite-autoconf-3400100.tar.gz -o $@
sqlite-autoconf-3400100: sqlite-autoconf-3400100.tar.gz
	tar xzf $<
lib/libsqlite3.a: sqlite-autoconf-3400100
	cd $< && ./configure --enable-static --disable-shared --prefix=$$PREFIX && make -j8 && make install
