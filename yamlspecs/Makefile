# Copyright (c) 2000 - 2019 The Regents of the University of California.
# All rights reserved.	
# This includes the Generic yaml2rpm Makefile - most packaging should
# be able to use this.

ALL_TARGETS = bootstrap openmpi-module.yaml $(SOURCES) $(PKGS) 
include $(YAML2RPM_HOME)/sys/Makefile

openmpi-module.yaml: copympi-module.sh openmpi-module.yaml.in
	sh copympi-module.sh > $@	

manifest :: openmpi-module.yaml

veryclean ::
	- /bin/rm openmpi-module.yaml
