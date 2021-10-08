.DEFAULT_GOAL := all
.PHONY: all iberian-gauge
OPENSCAD?=$(shell which openscad)

%:
	mkdir -p $(dir dist/$*)
	$(OPENSCAD) -o dist/$*.stl $*.scad

iberian-gauge: iberian-gauge/player iberian-gauge/company

all: iberian-gauge
	zip -r dist.zip dist/*

