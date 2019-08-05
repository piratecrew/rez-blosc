set(BLOSC_HOME $ENV{REZ_BLOSC_ROOT})
find_package(Blosc REQUIRED)

set(blosc_INCLUDE_DIRS ${BLOSC_INCLUDE_DIRS})
get_filename_component(blosc_LIBRARY_DIRS ${BLOSC_LIBRARIES} DIRECTORY)
set(blosc_LIBRARIES ${BLOSC_LIBRARIES})
message(STATUS "Found Blosc")
message(STATUS "  Blosc Include:     ${blosc_INCLUDE_DIRS}")
message(STATUS "  Blosc Library Dir: ${blosc_LIBRARY_DIRS}")
message(STATUS "  Blosc Library:     ${blosc_LIBRARIES}")