
if(CMAKE_INSTALL_PREFIX)

    # use icu if built by byd
    byd__package__is_added(icu icu_added)
    if(icu_added)
        byd__BoostBuild__build__add_args(${package} "-sICU_PATH=${CMAKE_INSTALL_PREFIX}")
    endif()


    # use zlib if built by byd
    byd__package__is_added(zlib zlib_added)
    if(zlib_added)
        byd__BoostBuild__build__add_args(${package} "-sZLIB_INCLUDE=${CMAKE_INSTALL_PREFIX}/include")
        byd__BoostBuild__build__add_args(${package} "-sZLIB_LIBPATH=${CMAKE_INSTALL_PREFIX}/lib")
        if(MSVC)
            byd__BoostBuild__build__add_args(${package} "-sZLIB_BINARY=zdll")
        endif()
    endif()


    # use bzip2 if built by byd
    byd__package__is_added(bzip2 bzip2_added)
    if(bzip2_added)
        byd__BoostBuild__build__add_args(${package} "-sBZIP2_INCLUDE=${CMAKE_INSTALL_PREFIX}/include")
        byd__BoostBuild__build__add_args(${package} "-sBZIP2_LIBPATH=${CMAKE_INSTALL_PREFIX}/lib")
        if(MSVC)
            byd__BoostBuild__build__add_args(${package} "-sBZIP2_BINARY=bz2")
        endif()
    endif()

endif()





# configure boost.locale build
if("locale" IN_LIST BOOST_COMPONENTS_TO_BUILD)
    byd__BoostBuild__build__add_args(${package} "boost.locale.icu=on")
    byd__BoostBuild__build__add_args(${package} "boost.locale.std=off")
    if(WIN32)
        byd__BoostBuild__build__add_args(${package} "boost.locale.winapi=off")
    elseif(UNIX)
        byd__BoostBuild__build__add_args(${package} "boost.locale.iconv=off")
        byd__BoostBuild__build__add_args(${package} "boost.locale.posix=off")
    endif()
endif()



# compile Boost in source
byd__EP__compile_in_source(${package} ON)



# add custom_patch step
file(GLOB patchList
    LIST_DIRECTORIES false
    "${CMAKE_CURRENT_LIST_DIR}/patch/*.patch"
    )
byd__custom_patch(${package} patchList)

# mv dll in bin directory on windows
if(WIN32)
    include("${CMAKE_CURRENT_LIST_DIR}/action/byd__boost__mv_dll_in_bin.cmake")
    byd__boost__mv_dll_in_bin(${package})
endif()

# add BoostBuild step
byd__BoostBuild__add(${package} SKIP test)
