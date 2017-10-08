#!/bin/sh

docker run -v $(pwd):$(pwd) -w=$(pwd) -it --rm dvelichko/phptoolset /usr/local/bin/phpmd $@
