set(package Boost)
set(version 1.68.0)

byd__package__info(${package}
    MAINTAINER_NAME "David Callu"
    MAINTAINER_EMAIL "callu.david@gmail.com"
    VERSION ${version}-1
    ABI ${version}
    )

byd__package__download_info(${package}
    URL "https://dl.bintray.com/boostorg/release/1.68.0/source/boost_1_68_0.tar.bz2"
    URL_HASH SHA1=18863a7cae4d58ae85eb63d400f774f60a383411
#    GIT_REPOSITORY "https://github.com/boostorg/boost.git"
#    GIT_TAG boost-1.67.0-rc2
#    GIT_CONFIG submodule.fetchJobs=${BYD__OPTION__JOBS}
    )
