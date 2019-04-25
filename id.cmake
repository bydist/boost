set(package Boost)
set(version  1.70.0)
set(package_version  ${version}-3)

byd__package__info(${package}
    MAINTAINER_NAME "David Callu"
    MAINTAINER_EMAIL "callu.david@gmail.com"
    VERSION ${package_version}
    ABI ${package_version}
    )

byd__package__download_info(${package}
    URL "https://dl.bintray.com/boostorg/release/1.70.0/source/boost_1_70_0.tar.bz2"
    URL_HASH SHA256=430ae8354789de4fd19ee52f3b1f739e1fba576f0aded0897c3c2bc00fb38778
#    GIT_REPOSITORY "https://github.com/boostorg/boost.git"
#    GIT_TAG boost-1.70.0
#    GIT_CONFIG submodule.fetchJobs=${BYD__OPTION__JOBS}
    )
