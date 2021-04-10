#!/bin/sh

opentabs() {
cat "$HOME"/.moonchild\ productions/pale\ moon/zj1scs8t.default/sessionstore.js | perl -e '
use JSON qw( decode_json );
my $json = decode_json(<STDIN>);
foreach my $w ( @{$json->{"windows"}} ) {
    foreach my $t ( @{$w->{"tabs"}} ) {
        print $t->{"entries"}[-1]->{"url"}."\n";
    }
}'

}

install() {
	#declaration of typeset variables
	typeset pkg
	typeset argument_input
	pkg="$( xbps-query -Rs "" | sort -u | grep -v "*" | fzf -i \
                    --multi --exact --no-sort --select-1 --query="$argument_input" \
                    --cycle --reverse --margin="4%,1%,1%,2%" \
                    --inline-info \
                    --preview 'xbps-query -R {2} '\
                    --preview-window=right:55%:wrap \
                    --header="TAB key to (un)select. ENTER to install. ESC to quit." \
                    --prompt="filter> " | awk '{print $2}'
            )"
            pkg="$( echo "$pkg" | paste -sd " " )"
            if [[ -n "$pkg" ]]
            then
            clear
            sudo xbps-install -S "$pkg"
            fi
}


_seteq(){
  amixer -D equal -q set '00. 31 Hz' $0
  amixer -D equal -q set '01. 63 Hz' $1
  amixer -D equal -q set '02. 125 Hz' $2
  amixer -D equal -q set '03. 250 Hz' $3
  amixer -D equal -q set '04. 500 Hz' $4
  amixer -D equal -q set '05. 1 kHz' $5
  amixer -D equal -q set '06. 2 kHz' $6
  amixer -D equal -q set '07. 4 kHz' $7
  amixer -D equal -q set '08. 8 kHz' $8
  amixer -D equal -q set '09. 16 kHz' $9
}

seteq(){
  case $1 in
   headphones) _seteq 65 55 64 77 75 70 65 57 52 49;;
   flat) _seteq 65 65 65 65 65 65 65 65 65 65;;
   classical) _seteq 71 71 71 71 71 71 84 83 83 87;;
   rock) _seteq 58 63 80 84 77 66 58 55 55 55;;
   bass) _seteq 59 59 59 63 70 78 85 88 89 89;;
   club) _seteq 71 71 67 63 63 63 67 71 71 71;;
   large_hall) _seteq 56 56 63 63 71 79 79 79 71 71;;
   pop) _seteq 74 65 61 60 64 73 75 75 74 74;;
   reggae) _seteq 71 71 72 81 71 62 62 71 71 71;;
   ska) _seteq 75 79 78 72 66 63 58 57 55 57;;
   soft_rock) _seteq 66 66 69 72 78 80 77 72 68 58;;
   soft) _seteq 65 70 73 75 73 66 59 57 55 53;;
   techno) _seteq 60 63 71 80 79 71 60 57 57 58;;
   live) _seteq 79 71 66 64 63 63 66 68 68 69;;
   treble) _seteq 87 87 87 78 68 55 47 47 47 45;;
   *) _seteq 66 66 66 66 66 66 66 66 66 66;;
 esac
}


vnews() {
   printf "Latest announcements:\n\n"
   lynx -dump -nolist https://voidlinux.org/news/archive.html|grep -i "* [0-9]" 2>/dev/null|sed 5q
   tput setaf 1; echo  -e "\nPlease visit https://voidlinux.org/news/archive.html for more details.\n"
}


fmpc() {
   typeset song_position
    song_position=$(mpc -f "%position%) %artist% - %title%" playlist | \
    fzf-tmux --query="$1" --reverse --select-1 --exit-0 | \
    sed -n 's/^\([0-9]\+\)).*/\1/p') || return 1
  [ -n "$song_position" ] && mpc -q play "$song_position"
}


#Check Top 20 Processes
cpu(){
        ps -A --sort -rsz -o pid,comm,pmem,pcpu|awk 'NR<=20'
}

ram() {
  typeset sum
#  typeset items
  typeset app="$1"
  if [ -z "$app" ]; then
    echo "First argument - pattern to grep from processes"
  else
    sum=0
    for i in $(ps aux | grep -i "$app" | grep -v "grep" | awk '{print $6}'); do
      sum=$((i + sum))
    done
    sum=$(echo "scale=2; $sum / 1024.0" | bc)
    if [[ $sum != "0" ]]; then
      echo "${fg[blue]}${app}${reset_color} uses ${fg[green]}${sum}${reset_color} MBs of RAM."
    else
      echo "There are no processes with pattern '${fg[blue]}${app}${reset_color}' are running."
    fi
  fi
}

fkill() {
  typeset pid
  pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')

  if [ "x$pid" != "x" ]
  then
    echo "$pid" | xargs kill -"${1:-9}"
  fi
}

zumbis() {
	ps f -eo state,pid,ppid,comm | awk '
	{ cmds[$2] = $NF }
	/^Z/ { print $(NF-1) "/" $2 " zombie child of " cmds[$3] "/" $3 }'
}

