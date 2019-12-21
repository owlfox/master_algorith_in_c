# ****************************************************************************
# *                                                                          *
# *  spell.mak                                                               *
# *  =========                                                               * 
# *                                                                          *
# ****************************************************************************

# ****************************************************************************
# *                                                                          *
# *  Define the name of the makefile.                                        *
# *                                                                          *
# ****************************************************************************

MAKNAM = spell.mak

# ****************************************************************************
# *                                                                          *
# *  Define the directories in which to search for library files.            *
# *                                                                          *
# ****************************************************************************

LIBDRS =

# ****************************************************************************
# *                                                                          *
# *  Define the directories in which to search for include files.            *
# *                                                                          *
# ****************************************************************************

INCDRS = -I$(ALGOWC_TOPDIR)/include

# ****************************************************************************
# *                                                                          *
# *  Define the library files.                                               *
# *                                                                          *
# ****************************************************************************

LIBFLS =

# ****************************************************************************
# *                                                                          *
# *  Define the source files.                                                *
# *                                                                          *
# ****************************************************************************

SRCFLS = ex-2.c\
         $(ALGOWC_TOPDIR)/source/bisearch.c\
         $(ALGOWC_TOPDIR)/source/issort.c\
         $(ALGOWC_TOPDIR)/source/spell.c
         
# ****************************************************************************
# *                                                                          *
# *  Define the object files.                                                *
# *                                                                          *
# ****************************************************************************

OBJFLS = ex-2.o\
         $(ALGOWC_TOPDIR)/source/bisearch.o\
         $(ALGOWC_TOPDIR)/source/issort.o\
         $(ALGOWC_TOPDIR)/source/spell.o

# ****************************************************************************
# *                                                                          *
# *  Define the executable.                                                  *
# *                                                                          *
# ****************************************************************************

EXE    = ex-2.exe

# ****************************************************************************
# *                                                                          *
# *  Define the compile and link options.                                    *
# *                                                                          *
# ****************************************************************************

CC     = c89
LL     = c89
CFLAGS =
LFLAGS =

# ****************************************************************************
# *                                                                          *
# *  Define the rules.                                                       *
# *                                                                          *
# ****************************************************************************

$(EXE): $(OBJFLS)
	$(LL) $(LFLAGS) -o $@ $(OBJFLS) $(LIBDRS) $(LIBFLS)

.c.o:
	$(CC) $(CFLAGS) -o $@ -c $(INCDRS) $<

all:
	make -f $(MAKNAM) clean
	make -f $(MAKNAM) depend

depend:
	makedepend $(INCDRS) -f $(MAKNAM) $(SRCFLS)
	make -f $(MAKNAM) $(EXE)

clean:
	-rm $(EXE)
	-rm $(OBJFLS)

# DO NOT DELETE THIS LINE -- make depend depends on it.
