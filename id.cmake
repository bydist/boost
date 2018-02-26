set(package Boost)
set(version 1.66.0)

byd__package__info(${package}
    MAINTAINER_NAME "David Callu"
    MAINTAINER_EMAIL "callu.david@gmail.com"
    VERSION ${version}-2
    ABI ${version}
    )

byd__package__download_info(${package}
    URL "https://dl.bintray.com/boostorg/release/1.66.0/source/boost_1_66_0.tar.bz2"
    URL_HASH SHA1=b6b284acde2ad7ed49b44e856955d7b1ea4e9459
#    GIT_REPOSITORY "https://github.com/boostorg/boost.git"
#    GIT_TAG boost-1.66.0
#    GIT_CONFIG submodule.fetchJobs=${BYD__OPTION__JOBS}
    )
