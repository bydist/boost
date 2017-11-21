include("${BYD_ROOT}/cmake/modules/EP/step/log.cmake")


function(byd__boost__mv_dll_in_bin package)

    byd__package__get_install_dir( ${package} install_dir )
    byd__package__get_script_dir( ${package} script_dir )

    configure_file(
        "${CMAKE_CURRENT_LIST_DIR}/action/mv_dll.cmake.in"
        "${script_dir}/mv_dll.cmake"
        @ONLY
        )

    set(arguments
        COMMAND ${CMAKE_COMMAND} -P "${script_dir}/mv_dll.cmake"
        DEPENDEES install
        DEPENDERS create_archive
        )

    byd__EP__step__log_EP_Add_Step_command(${package} mv_dll_in_bin "${arguments}")

    include(ExternalProject)
    ExternalProject_Add_Step(
        ${package}
        mv_dll_in_bin
        ${arguments}
        )

endfunction()
