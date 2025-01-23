
include config.mk


# build/clean
build: generate_src
	@$(MAKE) -C $(DWM_SRC)

clean:
	@$(MAKE) -C $(DWM_SRC) $@

cleanbuild: clean build

fullclean: clean
	$(REMOVE_FR) $(DWM_BACKUP)
	$(REMOVE_F)  $(DWM_ARCHIVE)
	$(REMOVE_FR) $(DWM_SRC)
	$(REMOVE_F)  $(PATCH_LOG)

# install/uninstall
install uninstall: generate_src
	@$(MAKE) -C $(DWM_SRC) $@

# get the source code
generate_src: get_src patch_src

get_src: $(DWM_MAKEFILE)

$(DWM_MAKEFILE):
	$(CURL) $(DWM_URL) > $(DWM_ARCHIVE)
	$(UNPACK) $(DWM_ARCHIVE)

# apply patches
$(PATCH_LOG): $(PATCH_LIST)
	$(PATCH_SCRIPT) "$(DWM_SRC)" "$(PATCH_LIST)" "$@"

patch_src: $(PATCH_LOG)

# creating patches
backuporig:
	$(COPY_R) $(DWM_SRC) $(DWM_BACKUP)

udiff:
	$(UDIFF) $(DWM_BACKUP) $(DWM_SRC)

# debugging
debug:
	@echo "DWM_NAME      = '$(DWM_NAME)'"
	@echo "DWM_VERSION   = '$(DWM_VERSION)'"
	@echo "DWM_FULLNAME := '$(DWM_FULLNAME)'"
	@echo "DWM_ARCHIVE  := '$(DWM_ARCHIVE)'"
	@echo "DWM_URL      := '$(DWM_URL)'"
	@echo "DWM_SRC      := '$(DWM_SRC)'"
	@echo "DWM_MAKEFILE := '$(DWM_MAKEFILE)'"
	@echo "DWM_BACKUP   := '$(DWM_BACKUP)'"
	@echo "PATCH_LIST   := '$(PATCH_LIST)'"


# vim: noet
