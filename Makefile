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

#---------------------------------------------------------------------------------------
# Application common features handling
#---------------------------------------------------------------------------------------
#### TODO: CSRCS += src/apps/LoRaMac/common/cli.c
CSRCS += src/apps/LoRaMac/common/LmHandlerMsgDisplay.c
CSRCS += src/apps/LoRaMac/common/NvmDataMgmt.c

#---------------------------------------------------------------------------------------
# Application LoRaMac handler
#---------------------------------------------------------------------------------------
CSRCS += src/apps/LoRaMac/common/LmHandler/LmHandler.c

#---------------------------------------------------------------------------------------
# LoRaMac handler applicative packages
#---------------------------------------------------------------------------------------
CSRCS += src/apps/LoRaMac/common/LmHandler/packages/FragDecoder.c
CSRCS += src/apps/LoRaMac/common/LmHandler/packages/LmhpClockSync.c
CSRCS += src/apps/LoRaMac/common/LmHandler/packages/LmhpCompliance.c
CSRCS += src/apps/LoRaMac/common/LmHandler/packages/LmhpFragmentation.c
CSRCS += src/apps/LoRaMac/common/LmHandler/packages/LmhpRemoteMcastSetup.c

#---------------------------------------------------------------------------------------
# Boards
#---------------------------------------------------------------------------------------
CSRCS += src/boards/mcu/utilities.c

#---------------------------------------------------------------------------------------
# LoRaMac Regions
#---------------------------------------------------------------------------------------
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

#---------------------------------------------------------------------------------------
# LoRaMac
#---------------------------------------------------------------------------------------
CSRCS += src/mac/LoRaMac.c
CSRCS += src/mac/LoRaMacAdr.c
CSRCS += src/mac/LoRaMacClassB.c
CSRCS += src/mac/LoRaMacCommands.c
CSRCS += src/mac/LoRaMacConfirmQueue.c
CSRCS += src/mac/LoRaMacCrypto.c
CSRCS += src/mac/LoRaMacParser.c
CSRCS += src/mac/LoRaMacSerializer.c

#---------------------------------------------------------------------------------------
# Peripherals
#---------------------------------------------------------------------------------------
CSRCS += src/peripherals/soft-se/aes.c
CSRCS += src/peripherals/soft-se/cmac.c
CSRCS += src/peripherals/soft-se/soft-se-hal.c
CSRCS += src/peripherals/soft-se/soft-se.c

#---------------------------------------------------------------------------------------
# System
#---------------------------------------------------------------------------------------
CSRCS += src/system/nvmm.c
CSRCS += src/system/systime.c

#---------------------------------------------------------------------------------------
# NuttX
#---------------------------------------------------------------------------------------
CSRCS += src/nuttx.c

endif # CONFIG_LIBLORAWAN

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
