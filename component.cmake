include("${CMAKE_CURRENT_LIST_DIR}/id.cmake")

byd__package__add_component(${package}
    boost # header only part of boost
    atomic
    chrono
    container
    context
    coroutine
    date_time
    exception
    fiber
    filesystem
    graph
    graph_parallel
    iostreams
    locale
    log
    math
    mpi
    program_options
    python
    random
    regex
    serialization
    signals
    stacktrace
    system
    test
    thread
    timer
    type_erasure
    wave
    )



byd__package__set_module_to_component(${package} "log_setup" log)
byd__package__set_module_to_component(${package} "math_c99f" math)
byd__package__set_module_to_component(${package} "math_c99l" math)
byd__package__set_module_to_component(${package} "math_c99" math)
byd__package__set_module_to_component(${package} "math_tr1f" math)
byd__package__set_module_to_component(${package} "math_tr1l" math)
byd__package__set_module_to_component(${package} "math_tr1" math)
byd__package__set_module_to_component(${package} "prg_exec_monitor" test)
byd__package__set_module_to_component(${package} "stacktrace_addr2line" stacktrace)
byd__package__set_module_to_component(${package} "stacktrace_backtrace" stacktrace)
byd__package__set_module_to_component(${package} "stacktrace_basic" stacktrace)
byd__package__set_module_to_component(${package} "stacktrace_noop" stacktrace)
byd__package__set_module_to_component(${package} "unit_test_framework" test)
byd__package__set_module_to_component(${package} "wserialization" serialization)
