set(package Boost)
set(version 1.64.0)

byd__package__info(${package}
    MAINTAINER_NAME "David Callu"
    MAINTAINER_EMAIL "callu.david@gmail.com"
    VERSION ${version}
    PACKAGE_VERSION ${version}
    ABI ${version}
    )

byd__package__download_info(
    URL "https://sourceforge.net/projects/boost/files/boost/1.64.0/boost_1_64_0.tar.bz2"
    URL_HASH SHA1=51421ef259a4530edea0fbfc448460fcc5c64edb
    )
