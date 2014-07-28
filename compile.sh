cd	unpv12e_patched
./configure --host=i686
cd  lib         # build the basic library that all programs need
    make           # use "gmake" everywhere on BSD/OS systems

    cd ../libfree  # continue building the basic library
    make

    cd ../libgai   # the getaddrinfo() and getnameinfo() functions
    make

    cd ../libroute # only if your system supports 4.4BSD style routing sockets
    make           # only if your system supports 4.4BSD style routing sockets

 #   cd ../libxti   # only if your system supports XTI
 #   make           # only if your system supports XTI