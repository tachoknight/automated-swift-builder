#!/bin/bash


rm -rf /home/rolson/rpmbuild
mkdir -p /home/rolson/rpmbuild/{BUILD,RPMS,SOURCES,SPECS,SRPMS}
cp $PWD/*.patch /home/rolson/rpmbuild/SOURCES
cp $PWD/*.conf /home/rolson/rpmbuild/SOURCES
cp $PWD/swift-lang.spec /home/rolson/rpmbuild/SPECS

pushd /home/rolson/rpmbuild/SPECS
spectool -g -R ./swift-lang.spec
# Get the dependencies
dnf builddep -y ./swift-lang.spec
# Now do the actual build
rpmbuild -ba ./swift-lang.spec
popd

