
DMENU_NAME      = dmenu
DMENU_VERSION   = 5.3
DMENU_FULLNAME := $(DMENU_NAME)-$(DMENU_VERSION)
DMENU_ARCHIVE  := ./$(DMENU_FULLNAME).tar.gz
DMENU_URL      := https://dl.suckless.org/tools/$(DMENU_ARCHIVE)

DMENU_SRC      := ./$(DMENU_FULLNAME)
DMENU_MAKEFILE := $(DMENU_SRC)/Makefile
DMENU_BACKUP   := $(DMENU_SRC).orig

PATCH_SCRIPT  = ./script/apply_patches
PATCH_LOG     = ./patch.log
PATCH_PATH    = ./patch
PATCH_LIST   := $(PATCH_PATH)/dmenu-freebsd.patch \
                $(PATCH_PATH)/dmenu-optimization.patch \
                $(PATCH_PATH)/dmenu-config.patch

COPY_R     = cp -R
CURL       = curl
PATCH     := patch -d $(DMENU_SRC)
REMOVE_F   = rm -f
REMOVE_FR  = rm -fr
UDIFF      = diff -u
UNPACK     = tar -xf


# vim: noet
# end of file
