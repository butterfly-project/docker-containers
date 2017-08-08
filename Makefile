all: build

build:
	for i in `ls -d */ | cut -d'/' -f 1`; do echo docker build -t agregad/$$i $$i/; done | bash

install:
	for i in `ls -d */ | cut -d'/' -f 1`; do echo docker push agregad/$$i; done | bash
