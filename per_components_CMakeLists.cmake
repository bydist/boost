
if(CMAKE_INSTALL_PREFIX)

    if(NOT ANDROID)
        byd__BoostBuild__build__add_args(${package} "-sICU_PATH=${CMAKE_INSTALL_PREFIX}")
        byd__BoostBuild__build__add_args(${package} "boost.locale.icu=on")
        byd__BoostBuild__build__add_args(${package} "boost.locale.std=off")
        if(WIN32)
            byd__BoostBuild__build__add_args(${package} "boost.locale.winapi=off")
        elseif(UNIX)
            byd__BoostBuild__build__add_args(${package} "boost.locale.iconv=off")
            byd__BoostBuild__build__add_args(${package} "boost.locale.posix=off")
        endif()
    endif()


    byd__BoostBuild__build__add_args(${package} "-sZLIB_INCLUDE=${CMAKE_INSTALL_PREFIX}/include")
    byd__BoostBuild__build__add_args(${package} "-sZLIB_LIBPATH=${CMAKE_INSTALL_PREFIX}/lib")
    if(MSVC)
        byd__BoostBuild__build__add_args(${package} "-sZLIB_BINARY=zdll")
    endif()


    byd__BoostBuild__build__add_args(${package} "-sBZIP2_INCLUDE=${CMAKE_INSTALL_PREFIX}/include")
    byd__BoostBuild__build__add_args(${package} "-sBZIP2_LIBPATH=${CMAKE_INSTALL_PREFIX}/lib")
    if(MSVC)
        byd__BoostBuild__build__add_args(${package} "-sBZIP2_BINARY=bz2")
    endif()

endif()








# compile Boost in source
byd__EP__compile_in_source(${package} ON)



# add custom_patch step
file(GLOB patchList
    LIST_DIRECTORIES false
    "${CMAKE_CURRENT_LIST_DIR}/patch/*.patch"
    )
if(MSVC)
	if(CMAKE_BUILD_TYPE STREQUAL "Debug")
		set(patch_dir_postfix -Debug)
	endif()
	file(GLOB patchList_msvc
		LIST_DIRECTORIES false
		"${CMAKE_CURRENT_LIST_DIR}/patch/msvc${patch_dir_postfix}/*.patch"
		)
	list(APPEND patchList "${patchList_msvc}")
endif()

byd__custom_patch(${package} patchList)

# add BoostBuild step
byd__BoostBuild__add(${package} SKIP test)


# mv dll in bin directory on windows
if(WIN32)
    include("${CMAKE_CURRENT_LIST_DIR}/action/byd__boost__mv_dll_in_bin.cmake")
    byd__boost__mv_dll_in_bin(${package})
endif()
