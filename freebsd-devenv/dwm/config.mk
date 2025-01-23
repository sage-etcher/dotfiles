

NAME      = dwm
VERSION   = 6.5
FULLNAME := $(NAME)-$(VERSION)
ARCHIVE  := ./$(FULLNAME).tar.gz
URL      := https://dl.suckless.org/dwm/$(ARCHIVE)

SRC_PATH := ./$(FULLNAME)
MAKEFILE := $(SRC_PATH)/Makefile
BACKUP   := $(SRC_PATH).orig

PATCH_LOG   = ./patch.log
PATCH_PATH  = ./patch
PATCH_LIST := $(PATCH_PATH)/dwm-freebsd.patch \
              $(PATCH_PATH)/dwm-optimization.patch \
              $(PATCH_PATH)/dwm-config.patch

# vim: noet
# end of file
