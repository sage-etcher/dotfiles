

NAME      = dmenu
VERSION   = 5.3
FULLNAME := $(NAME)-$(VERSION)
ARCHIVE  := ./$(FULLNAME).tar.gz
URL      := https://dl.suckless.org/tools/$(ARCHIVE)

SRC_PATH := ./$(FULLNAME)
MAKEFILE := $(SRC_PATH)/Makefile
BACKUP   := $(SRC_PATH).orig

PATCH_LOG   = ./patch.log
PATCH_PATH  = ./patch
PATCH_LIST := $(PATCH_PATH)/dmenu-freebsd.patch \
              $(PATCH_PATH)/dmenu-optimization.patch \
              $(PATCH_PATH)/dmenu-config.patch

# vim: noet
# end of file
