# Makefile for riscv/riscv-CMOs

# Main purposes

# (1) Encapsulate knowledge of how to update submodule after git clone
# see make rule git-post-clone

########################################################################################
# As of <2020-08-12 Wednesday, August 12, WW33> first main purpose is
# to encapsulate knowledge of how to update submodule for wiki
# corresponding to repo (since document may be produced from wiki
# files)

# git stuff
# mainly to remind me about git submodule commands
# that I do not know by heart
# (and think are kluges anyway)

# submodule
# git  submodule add git@github.com:riscv/riscv-CMOs.wiki.git
# TBD: this is imperfect: clone of a clone does not clone clone's submodule(s)

# run `make git-post-clone' right after git clone of Ri5-stuff
# to update submodules (currently only Ri5-stuff.wiki)

# ^^^ Not necessary if you did git clone --recurse-submodules
git-post-clone:
	git submodule init
	git submodule update




git-diff:
	git diff --submodule


# echo DEBUG: - I'm not really debugging
# I just want these messages colorized (in emacs)
# and I already have colorization cvode for DEBUG:.*
# whereas my attempt at colorizing INFO:.* failed
# <2020-05-14>
git-status:
	@echo DEBUG: $C;git status
	@(echo DEBUG: $C/$W ;cd $W; git status)


########################################################################################

# Make utilities

# TBD: make clean ... cleanest
# TBD: BOM (Bill of Materials)

# While it would be nice to have real tags for the documents, and wiki pages, e.g. for sections
# at the moment all I am really using the tags for is to do global tags-query-replace in emacs
# so I only need the filenames, not any patterns.

# TBD: Some will object to such make targets for editing convenience,
# especially for a minority editor like emacs.  When there is proper
# Makefile BOM support these targets may no longer be necessary, but
# it would be better if they were augmented to provide more complete
# tag functionality.

tags-ad TAGS: always
	cp /dev/null TAGS
	etags --append --langdef=asciidoc --langmap=asciidoc:.asciidoc --regex-asciidoc='/^=+\\(.*\\)/\\1/' $W/*.asciidoc

tags tags-all: tags-ad
	etags --append --langdef=markdown --langmap=markdown:.md --regex-markdown='/^=+\\(.*\\)/\\1/' $W/*.md
