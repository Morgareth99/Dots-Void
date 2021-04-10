#/etc/runit/core-services/03-zram.sh
# set sizes for zram drives
zramctl --find --size 1G --algorithm  lzo-rle
zramctl --find --size 1G --algorithm  lzo-rle
zramctl --find --size 1G --algorithm  lzo-rle
zramctl --find --size 1G --algorithm  lzo-rle

# make it swap
mkswap /dev/zram0
mkswap /dev/zram1
mkswap /dev/zram2
mkswap /dev/zram3

# activate
swapon /dev/zram0
swapon /dev/zram1
swapon /dev/zram2
swapon /dev/zram3
