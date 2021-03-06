-include ../Makefile.config

CUDF     = cudf-0.6.3
EXTLIB   = extlib-1.5.3
DOSE     = dose3-3.1.2
CMDLINER = cmdliner-0.9.3
GRAPH    = ocamlgraph-1.8.1
RE       = ocaml-re-1.2.0

all: clone depends.ocp

depends.ocp: depends.ocp.boot
	cp $< $@

clone: cudf.stamp extlib.stamp ocaml-re.stamp ocamlgraph.stamp dose.stamp cmdliner.stamp


$(CUDF).tar.gz:
	$(FETCH) https://gforge.inria.fr/frs/download.php/31910/$(CUDF).tar.gz

cudf.stamp: $(CUDF).tar.gz
	tar xfz $(CUDF).tar.gz
	rm -rf cudf
	mv $(CUDF) cudf
	@touch $@

$(EXTLIB).tar.gz:
	$(FETCH) http://ocaml-extlib.googlecode.com/files/$(EXTLIB).tar.gz

extlib.stamp: $(EXTLIB).tar.gz
	tar xfz $(EXTLIB).tar.gz
	rm -rf extlib
	mv $(EXTLIB) extlib
	@touch $@

dose3-git:
	@if [ -e dose ]; then \
	  cd dose; \
	  git pull; \
	else \
	  git clone --depth 1 git://scm.gforge.inria.fr/dose/dose.git dose; \
	fi

$(DOSE).tar.gz:
	$(FETCH) https://gforge.inria.fr/frs/download.php/31595/$(DOSE).tar.gz

dose.stamp: $(DOSE).tar.gz
	tar xfz $(DOSE).tar.gz
	cd $(DOSE) && patch -p1  < ../dose-pcre2re.diff && cd ..
	rm -rf dose
	mv $(DOSE) dose
	@touch $@

$(CMDLINER).tbz:
	$(FETCH) http://erratique.ch/software/cmdliner/releases/$(CMDLINER).tbz

cmdliner.stamp: $(CMDLINER).tbz
	tar xfj $(CMDLINER).tbz
	rm -rf cmdliner
	mv $(CMDLINER) cmdliner
	@touch $@

$(GRAPH).tar.gz:
	$(FETCH) http://pkgs.fedoraproject.org/repo/pkgs/ocaml-ocamlgraph/ocamlgraph-1.8.1.tar.gz/5aa256e9587a6d264d189418230af698/ocamlgraph-1.8.1.tar.gz

ocamlgraph.stamp: $(GRAPH).tar.gz
	tar xfz $(GRAPH).tar.gz
	rm -rf ocamlgraph
	mv $(GRAPH) ocamlgraph
	@touch $@

$(RE).tar.gz:
	$(FETCH) https://github.com/ocaml/ocaml-re/archive/$(RE).tar.gz

ocaml-re.stamp: $(RE).tar.gz
	tar xfz $(RE).tar.gz
	mv ocaml-re-$(RE) ocaml-re
	@touch $@

clean:
	rm -rf *~

distclean: clean
	rm -rf cudf extlib ocaml-re ocamlgraph dose cmdliner
	rm -f depends.ocp
	rm -f *.tar.gz *.tbz *.stamp
