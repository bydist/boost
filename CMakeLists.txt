



function(build package)

    byd__package__check_component(${package})


    byd__package__split_package_component_name(${package} package_name component_name)
    if("${component_name}" STREQUAL "boost")

#        byd__package__get_components(${package_name} components)
#        list(REMOVE_ITEM components "boost")

#        foreach(component IN LISTS components)
#            byd__BoostBuild__build__add_args(${package} "--without-${component}")
#        endforeach()

#    else()

#        byd__BoostBuild__build__add_args(${package} "--with-${component_name}")

        include("${CMAKE_CURRENT_LIST_DIR}/per_components_CMakeLists.cmake")
    else()
        include("${CMAKE_CURRENT_LIST_DIR}/dummy_CMakeLists.txt")
    endif()


endfunction()


build(${package})
