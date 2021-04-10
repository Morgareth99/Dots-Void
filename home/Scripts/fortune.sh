#!/bin/bash

wget -q -O - https://code.9front.org/hg/plan9front/raw-file/00bf6c34e13e/lib/theo | awk '{ print $0; print "%" }' > raadt
strfile raadt raadt.dat
doas cp raadt{,.dat} /usr/share/fortunes/
doas chmod -w /usr/share/fortunes/raadt{,.dat}
doas chgrp bin /usr/share/fortunes/raadt{,.dat}

