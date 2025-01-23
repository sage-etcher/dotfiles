
DWM_NAME      = dwm
DWM_VERSION   = 6.5
DWM_FULLNAME := $(DWM_NAME)-$(DWM_VERSION)
DWM_ARCHIVE  := ./$(DWM_FULLNAME).tar.gz
DWM_URL      := https://dl.suckless.org/dwm/$(DWM_ARCHIVE)

DWM_SRC      := ./$(DWM_FULLNAME)
DWM_MAKEFILE := $(DWM_SRC)/Makefile
DWM_BACKUP   := $(DWM_SRC).orig

PATCH_SCRIPT  = ./script/apply_patches
PATCH_LOG     = ./patch.log
PATCH_PATH    = ./patch
PATCH_LIST   := $(PATCH_PATH)/dwm-freebsd.patch \
                $(PATCH_PATH)/dwm-optimization.patch \
                $(PATCH_PATH)/dwm-config.patch

COPY_R     = cp -R
CURL       = curl
PATCH     := patch -d $(DWM_SRC)
REMOVE_F   = rm -f
REMOVE_FR  = rm -fr
UDIFF      = diff -u
UNPACK     = tar -xf


# vim: noet
# end of file
