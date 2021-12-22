############################################################################
# libs/liblorawan/Makefile
#
# Licensed to the Apache Software Foundation (ASF) under one or more
# contributor license agreements.  See the NOTICE file distributed with
# this work for additional information regarding copyright ownership.  The
# ASF licenses this file to you under the Apache License, Version 2.0 (the
# "License"); you may not use this file except in compliance with the
# License.  You may obtain a copy of the License at
#
#  http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
# WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.  See the
# License for the specific language governing permissions and limitations
# under the License.
#
############################################################################

include $(TOPDIR)/Make.defs

ifeq ($(CONFIG_LIBLORAWAN),y)
CSRCS += src/apps/LoRaMac/common/LmHandler/LmHandler.c
CSRCS += src/boards/mcu/utilities.c
CSRCS += src/mac/region/RegionAS923.c
#### TODO: CSRCS += src/mac/region/RegionCN779.c
#### TODO: CSRCS += src/mac/region/RegionEU433.c
#### TODO: CSRCS += src/mac/region/RegionEU868.c
#### TODO: CSRCS += src/mac/region/RegionIN865.c
#### TODO: CSRCS += src/mac/region/RegionRU864.c
#### TODO: CSRCS += src/mac/region/RegionKR920.c
#### TODO: CSRCS += src/mac/region/RegionBaseUS.c
CSRCS += src/mac/region/RegionCommon.c
CSRCS += src/mac/region/Region.c
CSRCS += src/mac/LoRaMac.c
CSRCS += src/mac/LoRaMacAdr.c
CSRCS += src/mac/LoRaMacClassB.c
CSRCS += src/mac/LoRaMacCommands.c
CSRCS += src/mac/LoRaMacConfirmQueue.c
CSRCS += src/mac/LoRaMacCrypto.c
CSRCS += src/mac/LoRaMacParser.c
CSRCS += src/mac/LoRaMacSerializer.c
endif

AOBJS = $(ASRCS:.S=$(OBJEXT))
COBJS = $(CSRCS:.c=$(OBJEXT))

SRCS = $(ASRCS) $(CSRCS)
OBJS = $(AOBJS) $(COBJS)

BIN ?= liblorawan$(LIBEXT)

all: $(BIN)
.PHONY:  depend clean distclean

$(AOBJS): %$(OBJEXT): %.S
	$(call ASSEMBLE, $<, $@)

$(COBJS): %$(OBJEXT): %.c
	$(call COMPILE, $<, $@)

$(BIN): $(OBJS)
	$(call ARCHIVE, $@, $(OBJS))

makedepfile: $(CSRCS:.c=.ddc) $(ASRCS:.S=.dds)
	$(call CATFILE, Make.dep, $^)
	$(call DELFILE, $^)

.depend: Makefile $(SRCS) $(TOPDIR)$(DELIM).config
	$(Q) $(MAKE) makedepfile
	$(Q) touch $@

depend: .depend

clean:
	$(call DELFILE, $(BIN))
	$(call CLEAN)

distclean: clean
	$(call DELFILE, Make.dep)
	$(call DELFILE, .depend)

-include Make.dep
