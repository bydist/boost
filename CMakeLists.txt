

function(build package)

    byd__package__split_package_component_name("${package}" package_name component_name)
    byd__private__is_empty(component_name is_empty_component_name)


    if(is_empty_component_name)
        cmut_info("[byd] - [boost] : no component to build.")
        return()
    endif()

    if("${component_name}" STREQUAL "boost")

        byd__package__get_components(${package_name} components)
        list(REMOVE_ITEM components "boost")

        foreach(component IN LISTS components)
            byd__BoostBuild__build__add_args(${package} "--without-${component}")
        endforeach()

    else()

        byd__BoostBuild__build__add_args(${package} "--with-${component_name}")

    endif()

    include("${CMAKE_CURRENT_LIST_DIR}/per_components_CMakeLists.cmake")

endfunction()


build(${package})
