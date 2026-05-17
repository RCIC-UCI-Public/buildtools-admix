# buildtools-admix
Tools and modules for building software, such as go, java modules and more

## Special builds for Rocky 10

Java 21 is the earliest version available on Rocksy 10.
To keep some of the older apps that need old Java distro we need to compile 
JDK from source. Compiling requires a working  java boot jdk which comes 
from a separate binary distro.

These two downloads of JDKs binary distros are used when building JDK from source from java.yaml.
All other neeeded variables needed for builds are listed in respective versions files. 

Download:
wget https://download.java.net/openjdk/jdk11.0.0.2/ri/openjdk-11.0.0.2_linux-x64.tar.gz
sha256sum is  0ab38c0cf5c6809d29c35393faad0ec45703d55a92ec4abd81b55b14fafb3c2d

wget https://download.java.net/java/GA/jdk17.0.2/dfd4a8d0985749f896bed50d7138ee7f/8/GPL/openjdk-17.0.2_linux-x64_bin.tar.gz
sha256sum is  0022753d0cceecacdd3a795dd4cea2bd7ffdf9dc06e22ffd1be98411742fbb44
  
