#!/bin/bash
# Copy the contents of the current MPI module and make it YAML formatted
OS_RELEASE=$(lsb_release -r -s | cut -f 1 -d .)
if [ "$OS_RELEASE" == "8" ]; then MODPATH="/usr/share/"; else MODPATH="/etc"; fi
OMPI_MODULE=${MODPATH}/modulefiles/mpi/openmpi-x86_64
SKEL_MODULE=openmpi-module.yaml.in
VER=$(rpm -qi $(rpm -qf $OMPI_MODULE) | awk -F : '/^Version/{print $NF}')
VERSION="  version: $VER" 
SETENV='    setenv: '
PREPEND='    prepend_path: '

cat $SKEL_MODULE
awk '/setenv/{print "      - " $2, $3}' $OMPI_MODULE
echo "$PREPEND" 
awk '/prepend-path/{print "      - " $2, $3}' $OMPI_MODULE
echo "$VERSION"
