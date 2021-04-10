#!/bin/bash

wmctrl -k on
xst -e tty-clock -cDC 7

if ! pgrep -x "tty-clock" > /dev/null; then
  physlock -dsm
  wmctrl -k off
fi

exit 0
