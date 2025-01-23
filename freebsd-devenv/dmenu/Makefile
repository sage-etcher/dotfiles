
include config.mk


# build/clean
build: generate_src
	@$(MAKE) -C $(DMENU_SRC)

clean:
	-@$(MAKE) -C $(DMENU_SRC) $@

cleanbuild: clean build

fullclean: clean
	$(REMOVE_FR) $(DMENU_BACKUP)
	$(REMOVE_F)  $(DMENU_ARCHIVE)
	$(REMOVE_FR) $(DMENU_SRC)
	$(REMOVE_F)  $(PATCH_LOG)

# install/uninstall
install uninstall: generate_src
	@$(MAKE) -C $(DMENU_SRC) $@

# get the source code
generate_src: get_src patch_src

get_src: $(DMENU_MAKEFILE)

$(DMENU_MAKEFILE):
	$(CURL) $(DMENU_URL) > $(DMENU_ARCHIVE)
	$(UNPACK) $(DMENU_ARCHIVE)

# apply patches
$(PATCH_LOG): $(PATCH_LIST)
	$(PATCH_SCRIPT) "$(DMENU_SRC)" "$(PATCH_LIST)" "$@"

patch_src: $(PATCH_LOG)

# creating patches
backuporig:
	$(COPY_R) $(DMENU_SRC) $(DMENU_BACKUP)

udiff:
	$(UDIFF) $(DMENU_BACKUP) $(DMENU_SRC)

# debugging
debug:
	@echo "DMENU_NAME      = '$(DMENU_NAME)'"
	@echo "DMENU_VERSION   = '$(DMENU_VERSION)'"
	@echo "DMENU_FULLNAME := '$(DMENU_FULLNAME)'"
	@echo "DMENU_ARCHIVE  := '$(DMENU_ARCHIVE)'"
	@echo "DMENU_URL      := '$(DMENU_URL)'"
	@echo "DMENU_SRC      := '$(DMENU_SRC)'"
	@echo "DMENU_MAKEFILE := '$(DMENU_MAKEFILE)'"
	@echo "DMENU_BACKUP   := '$(DMENU_BACKUP)'"
	@echo "PATCH_LIST   := '$(PATCH_LIST)'"


# vim: noet
