
include config.mk


# build/clean
build: generate_src
	@$(MAKE) -C $(ST_SRC)

clean:
	-@$(MAKE) -C $(ST_SRC) $@

cleanbuild: clean build

fullclean: clean
	$(REMOVE_FR) $(ST_BACKUP)
	$(REMOVE_F)  $(ST_ARCHIVE)
	$(REMOVE_FR) $(ST_SRC)
	$(REMOVE_F)  $(PATCH_LOG)

# install/uninstall
install uninstall: generate_src
	@$(MAKE) -C $(ST_SRC) $@

# get the source code
generate_src: get_src patch_src

get_src: $(ST_MAKEFILE)

$(ST_MAKEFILE):
	$(CURL) $(ST_URL) > $(ST_ARCHIVE)
	$(UNPACK) $(ST_ARCHIVE)

# apply patches
$(PATCH_LOG): $(PATCH_LIST)
	$(PATCH_SCRIPT) "$(ST_SRC)" "$(PATCH_LIST)" "$@"

patch_src: $(PATCH_LOG)

# creating patches
backuporig:
	$(COPY_R) $(ST_SRC) $(ST_BACKUP)

udiff:
	$(UDIFF) $(ST_BACKUP) $(ST_SRC)

# debugging
debug:
	@echo "ST_NAME      = '$(ST_NAME)'"
	@echo "ST_VERSION   = '$(ST_VERSION)'"
	@echo "ST_FULLNAME := '$(ST_FULLNAME)'"
	@echo "ST_ARCHIVE  := '$(ST_ARCHIVE)'"
	@echo "ST_URL      := '$(ST_URL)'"
	@echo "ST_SRC      := '$(ST_SRC)'"
	@echo "ST_MAKEFILE := '$(ST_MAKEFILE)'"
	@echo "ST_BACKUP   := '$(ST_BACKUP)'"
	@echo "PATCH_LIST   := '$(PATCH_LIST)'"


# vim: noet
