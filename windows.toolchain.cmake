set(CMAKE_SYSTEM_NAME Windows)

include(CMakeForceCompiler)
set(CMAKE_C_COMPILER /usr/bin/i686-w64-mingw32-gcc)
set(CMAKE_CXX_COMPILER /usr/bin/i686-w64-mingw32-g++)
set(CMAKE_RC_COMPILER i686-w64-mingw32-windres)
set(CMAKE_RC_FLAGS -DGCC_WINDRES)
set(CMAKE_LINKER /usr/bin/i686-w64-mingw32-ldd)

set(CMAKE_FIND_ROOT_PATH
  /usr/i686-w64-mingw32
  $ENV{PWD}/download-mingw-rpm/usr/i686-w64-mingw32/sys-root/mingw
  $ENV{PWD}/mingw-install
  $ENV{HOME}/mingw-install
)

set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)

link_directories(${CMAKE_SOURCE_DIR}/krit/toolchain/windows/bin)
