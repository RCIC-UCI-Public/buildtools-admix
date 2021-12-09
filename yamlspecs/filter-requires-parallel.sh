#! /bin/bash
#
# remove the specific requirement of specialized versions of libcufft, libcurand.  
# Other choice would be that the cuda-toolkit provides these specifically.
/usr/lib/rpm/find-requires $* | grep -v -e 'bin/ash' -e 'bin/dash' -e 'bin/fish' -e 'bin/pdksh' 
