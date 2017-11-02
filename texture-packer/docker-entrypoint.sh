#!/bin/sh

TexturePacker --algorithm Basic --png-opt-level 0 --disable-auto-alias --extrude 0 --trim-mode None --format json --data $@
