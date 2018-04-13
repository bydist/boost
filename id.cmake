set(package Boost)
set(version 1.67.0-rc2)

byd__package__info(${package}
    MAINTAINER_NAME "David Callu"
    MAINTAINER_EMAIL "callu.david@gmail.com"
    VERSION ${version}-1
    ABI ${version}
    )

byd__package__download_info(${package}
    URL "https://dl.bintray.com/boostorg/release/1.67.0/source/boost_1_67_0_rc2.tar.bz2"
    URL_HASH SHA1=694ae3f4f899d1a80eb7a3b31b33be73c423c1ae
#    GIT_REPOSITORY "https://github.com/boostorg/boost.git"
#    GIT_TAG boost-1.67.0-rc2
#    GIT_CONFIG submodule.fetchJobs=${BYD__OPTION__JOBS}
    )
