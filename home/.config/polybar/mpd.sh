#! /bin/bash

POS="$(mpc | awk 'NR==2{gsub(/[()]/,""); print $4}')"
BAR="$(echo "$POS" | gdbar -fg "#EE0143" -bg "#FFFFFF" -w 190 -h 2.5)"
FONT="scientifica:pixelsize=8:antialias=True:hinting=True"
ICON="$HOME/.config/polybar/.icons"
COL1="#FFFFFF"
COL2="#111111"
COL3="#EE0143"
LINES="5"
WIDTH="180"
X="3"
Y="30"
EVENT="onstart=uncollapse;button3=exit"


position(){
echo "$BAR"
return
}

while :; do
echo "   $(mpc current -f %artist%)
   $(mpc current -f %title%)
   $(mpc current -f %album%)

^p(65)^ca(1,mpc prev)^fg(#EE0143)^i($ICON/prev.xbm)^ca()   ^ca(1,mpc toggle)^fg(#EE0143)^i($ICON/play.xbm)^ca()   ^ca(1,mpc next)^fg(#EE0143)^i($ICON/next.xbm)^ca()
$(position)"
done | dzen2 -p -y "$Y" -x "$X" -l "$LINES" -u -w "$WIDTH" -ta l -fg "$COL1" -bg "$COL2" -fn "$FONT" -e "$EVENT"

