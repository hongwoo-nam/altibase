# platform_sco5.0.0-nothread.GNU,v 4.17 1998/12/17 23:30:40 schmidt Exp
#
# NOTE: the above file from PDL 4.6 has been modified by Mike P. to get rid of 
# thread related stuff until we can obtain fsu-threads library.

# Requires gcc 2.7.2 Skunkware 97
# to produce libPDL.so correctly changed the specs file for gcc 2.7.2
# for not link -lc and -lgcc and other not shared libraries

debug = 1
optimize = 1

CC              = gcc
# for no threads
LDLIBS		+= -lm -L $(PD_DIR)/pdl 
CXX		= g++
CFLAGS		+= -melf -w 
CCFLAGS		+= -melf -fno-implicit-templates 
# -g option not supported for C++ on systems using the DWARF debugging format
#DCFLAGS		+= -g
DCCFLAGS	+= $(DCFLAGS)
CDLD            = $(CC)
DLD             = $(CXX)
LD              = $(CXX) /usr/lib/libc.so.1
LIBS            = -lnsl -lsocket
OCCFLAGS        += $(OCFLAGS) $(added_optimizer_flag)
PIC             = -fPIC
AR              = ar
ARFLAGS         = ruv
RANLIB          = /bin/true

SOFLAGS = $(CPPFLAGS) -melf -fPIC -G
SOBUILD = $(COMPILE.cc) $(PIC) -o $(VSHDIR)$*.so $<
PRELIB  = @true
