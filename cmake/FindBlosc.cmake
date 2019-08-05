# FindBlosc.cmake
#
# Finds Blosc
#
# This will define the following variables
#
#    Blosc_FOUND
#    Blosc_INCLUDE_DIRS
#    Blosc_LIBRARIES
#
# and the following imported targets
#
#     Blosc::Blosc
#
# Author: Fredrik Brännbacka, fredrik.brannbacka@ilpvfx.com

find_library(BLOSC_LIBRARY
        NAMES libblosc.a
        PATHS
        ${BLOSC_HOME}/lib
        $ENV{BLOSC_HOME}/lib
        DOC "Blosc library")

find_path(BLOSC_INCLUDE_DIR blosc.h
        PATHS
        ${BLOSC_HOME}/include
        $ENV{BLOSC_HOME}/include
        DOC "Blosc include path")

mark_as_advanced(Blosc_FOUND BLOSC_INCLUDE_DIR BLOSC_LIBRARY)

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(Blosc
        REQUIRED_VARS BLOSC_INCLUDE_DIR BLOSC_LIBRARY
        )

if(Blosc_FOUND)
    set(Blosc_INCLUDE_DIRS ${BLOSC_INCLUDE_DIR})
    set(Blosc_LIBRARIES ${BLOSC_LIBRARY})
endif()

if(Blosc_FOUND AND NOT TARGET Blosc::Blosc)
    add_library(Blosc::Blosc STATIC IMPORTED GLOBAL)
    set_target_properties(Blosc::Blosc PROPERTIES IMPORTED_LOCATION ${BLOSC_LIBRARY})
    set_target_properties(Blosc::Blosc PROPERTIES INTERFACE_INCLUDE_DIRECTORIES ${BLOSC_INCLUDE_DIR})
endif()