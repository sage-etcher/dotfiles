
NAME      = st
VERSION   = 0.8.5
FULLNAME := $(NAME)-$(VERSION)
ARCHIVE  := ./$(FULLNAME).tar.gz
URL      := https://dl.suckless.org/st/$(ARCHIVE)

SRC_PATH := ./$(FULLNAME)
MAKEFILE := $(SRC_PATH)/Makefile
BACKUP   := $(SRC_PATH).orig

PATCH_LOG   = ./patch.log
PATCH_PATH  = ./patch
PATCH_LIST := $(PATCH_PATH)/st-freebsd.patch \
              $(PATCH_PATH)/st-optimization.patch \
              $(PATCH_PATH)/st-alpha-20220206-0.8.5.diff \
              $(PATCH_PATH)/st-anysize-0.8.4.diff \
              $(PATCH_PATH)/st-bold-is-not-bright-20190127-3be4cf1.diff \
              $(PATCH_PATH)/st-clickurl-0.8.5.diff \
              $(PATCH_PATH)/st-colorscheme.patch \
              $(PATCH_PATH)/st-config.patch


# vim: noet
# end of file
