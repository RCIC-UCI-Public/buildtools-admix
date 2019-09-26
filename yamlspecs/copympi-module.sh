#!/bin/bash
# Copy the contents of the current MPI module and make it YAML formatted
OMPI_MODULE=/etc/modulefiles/mpi/openmpi-x86_64
SKEL_MODULE=openmpi-module.yaml.in
VER=$(rpm -qi $(rpm -qf $OMPI_MODULE) | awk -F : '/^Version/{print $NF}')
VERSION="  version: $VER" 
BUILD='
  ## Define the key components of the environment module\n
  module:
    name: "{{ version }}"
    path: "{{root}}/{{ name }}"
'
SETENV='
    setenv:
'
PREPEND='
    prepend_path:
'

cat $SKEL_MODULE
echo "$VERSION"
echo "$BUILD"
echo -n "$SETENV" 
awk '/setenv/{print "      - " $2, $3}' $OMPI_MODULE
echo -n "$PREPEND" 
awk '/prepend-path/{print "      - " $2, $3}' $OMPI_MODULE
