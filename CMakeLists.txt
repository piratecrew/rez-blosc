CMAKE_MINIMUM_REQUIRED(VERSION 2.8)

include(RezBuild)
include(ExternalProject)

set(blosc_version ${BLOSC_VERSION})
set(url_blosc https://github.com/Blosc/c-blosc.git)
set(tag_blosc v${blosc_version})

if(${REZ_BUILD_INSTALL})
    set(install_cmd make install)
else()
    set(install_cmd "")
endif()

ExternalProject_add(
    blosc
    GIT_REPOSITORY ${url_blosc}
    GIT_TAG ${tag_blosc}
    PREFIX blosc
    INSTALL_COMMAND "${install_cmd}"
    CMAKE_CACHE_ARGS 
        -DCMAKE_INSTALL_PREFIX:PATH=${CMAKE_INSTALL_PREFIX}
        -DCMAKE_POSITION_INDEPENDENT_CODE:BOOL=ON
)

install(
    FILES cmake/blosc.cmake cmake/FindBlosc.cmake
    DESTINATION cmake
)