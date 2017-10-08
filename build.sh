#!/bin/sh

export docker_tag=dvelichko/phptoolset && docker build -t ${docker_tag:-dvelichko/phptoolset} ./

