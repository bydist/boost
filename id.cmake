set(package boost)
set(version 1.65.1)

byd__package__info(${package}
    MAINTAINER_NAME "David Callu"
    MAINTAINER_EMAIL "callu.david@gmail.com"
    VERSION ${version}-3
    ABI ${version}
    )

byd__package__download_info(${package}
    URL "https://sourceforge.net/projects/boost/files/boost/1.65.1/boost_1_65_1.tar.bz2"
    URL_HASH SHA1=4a5b0c3c1b1b9a4d6cb6a6cc395e903e76f76720
#    GIT_REPOSITORY "https://github.com/boostorg/boost.git"
#    GIT_TAG boost-1.65.1
#    GIT_CONFIG submodule.fetchJobs=${BYD__OPTION__JOBS}
    )
