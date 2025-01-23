
# GLOBAL_PATH set in global suckless makefile (~/.config/suckless-build-files/Makefile
# SRC_PATH set in local config.mk (~/.config/[SOFTWARE]/config.mk

PATCH_SCRIPT = $(GLOBAL_PATH)/script/apply_patches

COPY_R    = cp -R
CURL      = curl
PATCH     = patch -d $(SRC_PATH)
REMOVE_F  = rm -f
REMOVE_FR = rm -fr
UDIFF     = diff -u
UNPACK    = tar -xf

# vim: noet
# end of file
