#!/bin/bash
# Copy the contents of the current MPI module and make it YAML formatted
OMPI_MODULE=/etc/modulefiles/mpi/openmpi-x86_64
SKEL_MODULE=openmpi-module.yaml.in
VER=$(rpm -qi $(rpm -qf $OMPI_MODULE) | awk -F : '/^Version/{print $NF}')
VERSION="  version: $VER" 
SETENV='    setenv: '
PREPEND='    prepend_path: '

cat $SKEL_MODULE
echo "$SETENV" 
awk '/setenv/{print "      - " $2, $3}' $OMPI_MODULE
echo "$PREPEND" 
awk '/prepend-path/{print "      - " $2, $3}' $OMPI_MODULE
echo "$VERSION"
