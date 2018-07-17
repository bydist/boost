include("${CMAKE_CURRENT_LIST_DIR}/id.cmake")



function(byd__boost__define_dependencies)

    set(_Boost_CHRONO_DEPENDENCIES system)
    set(_Boost_CONTEXT_DEPENDENCIES thread chrono system date_time)
    set(_Boost_COROUTINE_DEPENDENCIES context system)
    set(_Boost_FIBER_DEPENDENCIES context thread chrono system date_time)
    set(_Boost_FILESYSTEM_DEPENDENCIES system)
    set(_Boost_IOSTREAMS_DEPENDENCIES regex)
    set(_Boost_LOG_DEPENDENCIES date_time system filesystem thread regex chrono atomic)
    set(_Boost_MATH_DEPENDENCIES atomic)
    set(_Boost_MPI_DEPENDENCIES serialization)
    set(_Boost_PYTHON_DEPENDENCIES mpi serialization)
    set(_Boost_RANDOM_DEPENDENCIES system)
    set(_Boost_THREAD_DEPENDENCIES chrono system date_time atomic)
    set(_Boost_WAVE_DEPENDENCIES filesystem system serialization thread chrono date_time atomic)

    set(libs_to_define chrono context coroutine fiber filesystem iostream log math mpi python random thread wave)

    foreach(lib IN LISTS libs_to_define)

        string(TOUPPER ${lib} LIB)
        unset(dependencies)
        foreach(dependency IN LISTS _Boost_${LIB}_DEPENDENCIES)
            list(APPEND dependencies Boost--${dependency})
        endforeach()

        byd__package__set_component_dependencies(${package}
            COMPONENT
                ${lib}
            DEPENDS
                ${dependencies}
        )

    endforeach()


endfunction()


byd__boost__define_dependencies()


byd__package__get_components(${package} components)
if(components STREQUAL "")
    include("${CMAKE_CURRENT_LIST_DIR}/component.cmake")
    byd__package__get_components(${package} components)
endif()


list(REMOVE_ITEM components boost)
foreach(component IN LISTS components)

    byd__package__set_component_dependencies(${package}
    COMPONENT
        ${component}
    DEPENDS
        Boost--boost
    )

endforeach()



byd__package__add_component_dependencies(${package}
    COMPONENT
        iostreams
    DEPENDS
        zlib
        bzip2
)

if(NOT ANDROID)
    byd__package__add_component_dependencies(${package}
        COMPONENT
            regex
        DEPENDS
            icu
    )

    byd__package__add_component_dependencies(${package}
        COMPONENT
            locale
        DEPENDS
            icu
    )
endif()
