#!/bin/bash
if [ -z "$(scl -l | grep 'devtoolset-3')" ]; then
	DIR=$(mktemp -d) && pushd $DIR
	aws s3 cp s3://mm-reporting-assets/build-support/devtoolset-3-gcc-c++_el7.tar .
	tar xf devtoolset-3-gcc-c++_el7.tar
	pushd devtoolset-3-gcc-c++_el7
	sudo rpm -i *
	popd -2
	rm -r $DIR
fi;
scl enable devtoolset-3 bash
