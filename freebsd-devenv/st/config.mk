
ST_NAME      = st
ST_VERSION   = 0.8.5
ST_FULLNAME := $(ST_NAME)-$(ST_VERSION)
ST_ARCHIVE  := ./$(ST_FULLNAME).tar.gz
ST_URL      := https://dl.suckless.org/st/$(ST_ARCHIVE)

ST_SRC      := ./$(ST_FULLNAME)
ST_MAKEFILE := $(ST_SRC)/Makefile
ST_BACKUP   := $(ST_SRC).orig

PATCH_SCRIPT  = ./script/apply_patches
PATCH_LOG     = ./patch.log
PATCH_PATH    = ./patch
PATCH_LIST   := $(PATCH_PATH)/st-freebsd.patch \
                $(PATCH_PATH)/st-optimization.patch \
                $(PATCH_PATH)/st-alpha-20220206-0.8.5.diff \
                $(PATCH_PATH)/st-anysize-0.8.4.diff \
                $(PATCH_PATH)/st-bold-is-not-bright-20190127-3be4cf1.diff \
                $(PATCH_PATH)/st-clickurl-0.8.5.diff \
                $(PATCH_PATH)/st-colorscheme.patch \
                $(PATCH_PATH)/st-config.patch

COPY_R     = cp -R
CURL       = curl
PATCH     := patch -d $(ST_SRC)
REMOVE_F   = rm -f
REMOVE_FR  = rm -fr
UDIFF      = diff -u
UNPACK     = tar -xf


# vim: noet
# end of file
