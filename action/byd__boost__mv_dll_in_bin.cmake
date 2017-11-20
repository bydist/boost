


function(byd__boost__mv_dll_in_bin package)

    byd__package__get_install_dir( ${package} install_dir )


    list(APPEND
        mv_dll_in_bin_COMMAND
        COMMAND ${CMAKE_COMMAND} -E rename "${install_dir}/lib/*.dll" "${install_dir}/bin/*.dll"
        )

    set(arguments
        ${mv_dll_in_bin_COMMAND}
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
