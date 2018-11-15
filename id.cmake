set(package Boost)
set(version 1.69.0)

byd__package__info(${package}
    MAINTAINER_NAME "David Callu"
    MAINTAINER_EMAIL "callu.david@gmail.com"
    VERSION ${version}-1
    ABI ${version}
    )


string(REPLACE "." "_" version_underscore ${version})
byd__package__download_info(${package}
    URL "https://dl.bintray.com/boostorg/release/${version}/source/boost_${version_underscore}.tar.bz2"
    URL_HASH SHA256=8f32d4617390d1c2d16f26a27ab60d97807b35440d45891fa340fc2648b04406
#    GIT_REPOSITORY "https://github.com/boostorg/boost.git"
#    GIT_TAG boost-${version}
#    GIT_CONFIG submodule.fetchJobs=${BYD__OPTION__JOBS}
    )
