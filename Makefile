
# Makefile
#
# Builds zlib
# 
# Copyright (c) 2017, Ward Jaradat, University of St Andrews

ARCH=x86_64

MKDIR				          		=		mkdir
MV					           		= 	mv
CD						          	= 	cd
RM						          	=		rm
CP							          = 	cp
WGET						          = 	wget
TAR							          =		tar

PROJECT_DIR 				      = 		$(CURDIR)
PROJECT_SOURCE_DIR			  =		  $(PROJECT_DIR)/src
PROJECT_BUILD_DIR 			  = 		$(PROJECT_DIR)/build

ZLIB_VERSION				      =		1.2.11
DOWNLOAD_URL				      =		http://zlib.net
DOWNLOAD_FILE				      =		zlib-$(ZLIB_VERSION).tar.gz

all: clean
	$(WGET)	$(DOWNLOAD_URL)/$(DOWNLOAD_FILE)
	$(TAR) -xvf $(DOWNLOAD_FILE)
	$(MV) zlib-$(ZLIB_VERSION) $(PROJECT_SOURCE_DIR)
	$(MKDIR) $(PROJECT_BUILD_DIR)
	cd $(PROJECT_BUILD_DIR) && $(PROJECT_SOURCE_DIR)/configure --static && make
	
.PHONY: clean
clean:
	$(RM) -rf $(PROJECT_SOURCE_DIR)
	$(RM) -rf $(PROJECT_BUILD_DIR)
	$(RM) -rf $(DOWNLOAD_FILE)

