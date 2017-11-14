#find Theron library
if(WIN32)
  set(DEFAULT_INSTALL_DIR "C:/Program\ Files\ (x86)/")
else()
  set(DEFAULT_INSTALL_DIR "/usr/local/")
endif()

find_library(theron_lib NAMES theron PATH ${DEFAULT_INSTALL_DIR} PATH_SUFFIXES "Theron/lib")
find_library(theron_lib_d NAMES therond PATH ${DEFAULT_INSTALL_DIR} PATH_SUFFIXES "Theron/lib")

set(theron_include_dir ${DEFAULT_INSTALL_DIR}/Theron/include)

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(libtheron DEFAULT_MSG theron_lib theron_include_dir)

set(libtheron_LIBRARIES ${theron_lib})
set(libtheron_LIBRARIES_d)
if(theron_lib_d)
  set(libtheron_LIBRARIES_d ${theron_lib_d})
else()
  message(WARNING "libtherond not found")
  set(libtheron_LIBRARIES_d ${libtheron_LIBRARIES})
endif()

set(libtheron_INCLUDE_DIRS ${theron_include_dir})
