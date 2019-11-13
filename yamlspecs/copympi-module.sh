#!/bin/bash
# Copy the contents of the current MPI module and make it YAML formatted
OMPI_MODULE=/etc/modulefiles/mpi/openmpi-x86_64
SKEL_MODULE=openmpi-module.yaml.in
VER=$(rpm -qi $(rpm -qf $OMPI_MODULE) | awk -F : '/^Version/{print $NF}')
VERSION="  version: $VER" 
BUILD='  # Define the key components of the environment module
  spec: "{{compiler}}.{{compiler_version}}"
  module:
    logname: "{{name}}/{{version}}/{{spec}}"
    name: "{{spec}}"
    path: "{{root}}"
    prereq: 
       - "{{compiler}}/{{compiler_version}}" '
SETENV='    setenv: '
PREPEND='    prepend_path: '

cat $SKEL_MODULE
echo "$VERSION"
echo "$BUILD"
#echo "$PREREQ"
echo "$SETENV" 
awk '/setenv/{print "      - " $2, $3}' $OMPI_MODULE
echo "$PREPEND" 
awk '/prepend-path/{print "      - " $2, $3}' $OMPI_MODULE
