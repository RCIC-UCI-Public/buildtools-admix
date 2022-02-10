# buildtools-admix
Tools and modules for building software, such as java modules and more

## building steps

After clowing the repo, to build and install all the repo
packages:

1. Download the sources and build all packages
   ```bash
   make buildall
   ```

1. Install built RPMs

   ```bash
   make install-admix YES=-y
   ```

## Build  differences for CentOS 7 and CentOS 8

Most packages builds overlap, the differences are noted below.
For CentOS 8 versions are usually newer where available.

1. nodejs

On centos8 a single nodejs RPM is split into 3: npm nodejs nodejs-full-i18n
and they are installed as appstream modules RPMs.  They need to be rmoved first
before we install nodesjs from our build.  This is done with *conflicts:* directive
in nodejs.yaml The nodejs version is different for centos 7 and 8

1. packages built only on CentOS 7

   - protobuf-classic
   - protobuf-classic-module
   - setuptools
   - java7-module

1. packages built only on CentOS 8

   - java17-module
