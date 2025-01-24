
GLOBAL_PATH = ${XDG_CONFIG_HOME}/suckless-build-files

include config.mk
include ${GLOBAL_PATH}/global_config.mk


# build/clean
build: generate_src
	@$(MAKE) -C $(SRC_PATH)

clean:
	-@$(MAKE) -C $(SRC_PATH) $@

cleanbuild: clean build

fullclean: clean
	$(REMOVE_FR) $(BACKUP)
	$(REMOVE_F)  $(ARCHIVE)
	$(REMOVE_FR) $(SRC_PATH)
	$(REMOVE_F)  $(PATCH_LOG)
	$(REMOVE_FR) $(EXTERNAL_PATCH_PATH)

# install/uninstall
install uninstall: generate_src
	@$(MAKE) -C $(SRC_PATH) $@

# get the source code
generate_src: get_src patch_src

get_src: $(MAKEFILE)

$(MAKEFILE):
	$(CURL) $(URL) > $(ARCHIVE)
	$(UNPACK) $(ARCHIVE)

# downlad external patches
$(EXTERNAL_PATCH_LIST):
	mkdir "$(EXTERNAL_PATCH_PATH)"
	$(EXTERNAL_PATCH_SCRIPT) "$(EXTERNAL_PATCH_PATH)" "$(EXTERNAL_PATCH_URLS)"

$(PATCH_LOG): $(PATCH_LIST)
	$(PATCH_SCRIPT) "$(SRC_PATH)" "$(PATCH_LIST)" "$@"

patch_src: $(PATCH_LOG)

# creating patches
backuporig:
	$(COPY_R) $(SRC_PATH) $(BACKUP)

udiff:
	$(UDIFF) $(BACKUP) $(SRC_PATH)

# debugging
debug:
	@echo "NAME      = '$(NAME)'"
	@echo "VERSION   = '$(VERSION)'"
	@echo "FULLNAME := '$(FULLNAME)'"
	@echo "ARCHIVE  := '$(ARCHIVE)'"
	@echo "URL      := '$(URL)'"
	@echo "SRC      := '$(SRC_PATH)'"
	@echo "MAKEFILE := '$(MAKEFILE)'"
	@echo "BACKUP   := '$(BACKUP)'"
	@echo "PATCH_LIST := '$(PATCH_LIST)'"


# vim: noet
