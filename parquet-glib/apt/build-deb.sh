#!/bin/sh

LANG=C

run()
{
  "$@"
  if test $? -ne 0; then
    echo "Failed $@"
    exit 1
  fi
}

. /vagrant/env.sh

run sudo apt-get update
run sudo apt-get install -y lsb-release apt-transport-https

distribution=$(lsb_release --id --short | tr 'A-Z' 'a-z')
code_name=$(lsb_release --codename --short)
case "${distribution}" in
  debian)
    component=main
    sudo run cat <<EOF > /etc/apt/sources.list.d/groonga.list
deb https://packages.groonga.org/debian/ ${code_name} main
deb-src https://packages.groonga.org/debian/ ${code_name} main
EOF
    ;;
  ubuntu)
    component=universe
    sudo run apt-get -y install software-properties-common
    sudo run add-apt-repository -y universe
    sudo run add-apt-repository -y ppa:groonga/ppa
    ;;
esac

run sudo apt-get update
run sudo apt-get install -V -y build-essential devscripts ${DEPENDED_PACKAGES}

run mkdir -p build
run cp /vagrant/tmp/${PACKAGE}-${VERSION}.tar.gz \
  build/${PACKAGE}_${VERSION}.orig.tar.gz
run cd build
run tar xfz ${PACKAGE}_${VERSION}.orig.tar.gz
run cd ${PACKAGE}-${VERSION}/
run cp -rp /vagrant/tmp/debian debian
# export DEB_BUILD_OPTIONS=noopt
run debuild -us -uc
run cd -

package_initial=$(echo "${PACKAGE}" | sed -e 's/\(.\).*/\1/')
pool_dir="/vagrant/repositories/${distribution}/pool/${code_name}/${component}/${package_initial}/${PACKAGE}"
run mkdir -p "${pool_dir}/"
run cp *.tar.* *.dsc *.deb "${pool_dir}/"
