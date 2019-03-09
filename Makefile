###
# Inspired by: https://stackoverflow.com/a/18137056/5801152
mkfile_path := $(abspath $(lastword $(MAKEFILE_LIST)))
current_dir := $(dir $(mkfile_path))
###

EMERALD_PATH := $(current_dir)../old-emerald/

listings-emerald.tex: \
		listings-emerald.tex.m4 other.tex
	./git-ready-to-deploy.sh
	EMERALD_PATH="$(EMERALD_PATH)" \
		m4 $< > $@

.PHONY: listings-emerald.tex
