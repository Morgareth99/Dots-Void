# ┏━╸╻ ╻┏┓╻┏━╸╺┳╸╻┏━┓┏┓╻┏━┓
# ┣╸ ┃ ┃┃┗┫┃   ┃ ┃┃ ┃┃┗┫┗━┓
# ╹  ┗━┛╹ ╹┗━╸ ╹ ╹┗━┛╹ ╹┗━┛



center() {
  termwidth="$(tput cols)"
  padding="$(printf '%0.1s' ={1..500})"
  printf '%*.*s %s %*.*s\n' 0 "$(((termwidth-2-${#1})/2))" "$padding" "$1" 0 "$(((termwidth-1-${#1})/2))" "$padding"
}


ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *.deb)       ar x $1      ;;
      *.tar.xz)    tar xf $1    ;;
      *.tar.zst)   unzstd $1    ;;      
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

doas() {
    # This requires persist to be enabled in doas.conf
    if ! /usr/bin/doas true; then
        fortune theo 1>&2; false
    else
        /usr/bin/doas "$@"
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

void-news() {
   printf "Latest announcements:\n\n"
   lynx -dump -nolist https://voidlinux.org/news/archive.html| grep -i "* [0-9]" | sed 8q
   printf "\nPlease visit https://voidlinux.org/news/archive.html for more details.\n\n"
}



fkill() {
  local pid
  pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')

  if [ "x$pid" != "x" ]
  then
    echo $pid | xargs kill -${1:-9}
  fi
}

ram() {
  local sum
  local items
  local app="$1"
  if [ -z "$app" ]; then
    echo "First argument - pattern to grep from processes"
  else
    sum=0
    for i in `ps aux | grep -i "$app" | grep -v "grep" | awk '{print $6}'`; do
      sum=$(($i + $sum))
    done
    sum=$(echo "scale=2; $sum / 1024.0" | bc)
    if [[ $sum != "0" ]]; then
      echo "${fg[blue]}${app}${reset_color} uses ${fg[green]}${sum}${reset_color} MBs of RAM."
    else
      echo "There are no processes with pattern '${fg[blue]}${app}${reset_color}' are running."
    fi
  fi
}


open-tabs() {
cat $HOME/.moonchild\ productions/pale\ moon/zj1scs8t.default/sessionstore.js | perl -e '
use JSON qw( decode_json );
my $json = decode_json(<STDIN>);
foreach my $w ( @{$json->{"windows"}} ) {
    foreach my $t ( @{$w->{"tabs"}} ) {
        print $t->{"entries"}[-1]->{"url"}."\n";
    }
}'

}

# Wiki search
wikipediaSearch() {
	echo -n -e "\n============================================\n\tWelcome to WikiPedia Search"; echo ""; i=1 ; for line in $(lynx --dump
		"http://en.wikipedia.org/w/index.php?title=Special%3ASearch&profile=default&search=$1&fulltext=Search" | grep http://en.wikipedia.org/wiki | cut -c7-); do echo $i $line; lines[$i]=$line ;  i=$(($i+1)); done ; echo
			-n -e "\n============================================\n\tPlease select the link to open - "; read answer; w3m ${lines[$answer]}
			}

		zshf() {
			mv $HOME/.zsh_history $HOME/.zsh_history_bad
			strings $HOME/.zsh_history_bad > $HOME/.zsh_history
			fc -R $HOME/.zsh_history
		}

# List all files, long format, colorized, permissions in octal
la() {
	ls -l  "$@" | awk '
	{
		k=0;
		for (i=0;i<=8;i++)
			k+=((substr($1,i+2,1)~/[rwx]/) *2^(8-i));
			if (k)
				printf("%0o ",k);
				printf(" %9s  %3s %2s %5s  %6s  %s %s %s\n", $3, $6, $7, $8, $5, $9,$10, $11);
			}'
	}

# Create a new directory and enter it
md() {
	mkdir -p "$@" && cd "$@"
}

# Create pdf of man page - requires ghostscript and mimeinfo
manpdf() { man -t "$@" | ps2pdf - /tmp/manpdf_$1.pdf && xdg-open /tmp/manpdf_$1.pdf ;}


fcoc() {
	local commits commit
	commits=$(git log --pretty=oneline --abbrev-commit --reverse) &&
		commit=$(echo "$commits" | fzf --tac +s +m -e) &&
		git checkout $(echo "$commit" | sed "s/ .*//")
	}


#Mass rename pictures
mrename() {
	ls -1 --color=never .|nl -n rz -w3|sed -r 's/^\s*([0-9]+)\s+(.*)(\.\w+)$/mv "\2\3" "image_\1\3"/'|bash;
}

# Remove EXIF Metadata from all photos in the current directory
metadel(){
	for i in *; do echo "Processing $i"; exiftool -all= "$i"; done
}

# Convert a unicode text file to pdf
txt_to_pdf(){
	paps "$*" --header | ps2pdf - "${*%.*}.pdf";
}

#View the last accessed directories.The command is "dirs -v"
if [[ -f $DIRSTACKFILE ]] && [[ $#dirstack -eq 0 ]]; then
	dirstack=( ${(f)"$(< $DIRSTACKFILE)"} )
	[[ -d $dirstack[1] ]] && cd $dirstack[1]
fi
chpwd() {
	print -l $PWD ${(u)dirstack} >$DIRSTACKFILE
}

# Finally, make sure the terminal is in application mode, when zle is
# active. Only then are the values from $terminfo valid.
#	zle-line-init () {
#	echoti smkx
#}
#zle-line-finish () {
#echoti rmkx
#}
#
#if [ -n "${DISPLAY:-}" ]; then
#	zle -N zle-line-init
#	zle -N zle-line-finish
#fi

# Color man pages using less as pager

man() {
	env \
		LESS_TERMCAP_mb=$(printf "\e[1;31m") \
		LESS_TERMCAP_md=$(printf "\e[1;31m") \
		LESS_TERMCAP_me=$(printf "\e[0m") \
		LESS_TERMCAP_se=$(printf "\e[0m") \
		LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
		LESS_TERMCAP_ue=$(printf "\e[0m") \
		LESS_TERMCAP_us=$(printf "\e[1;32m") \
		man "$@"
	}


# Clone a git repository, cd into that repository.
# Execute cloc to get some statistics.
clone()
{
	git clone "${1:?"usage: clone <GIT_CLONE_URL>"}"
	cd ${${1%%.git}##*/}
	cloc ./
}


# fshow - git commit browser
fshow() {
	git log --graph --color=always \
		--format="%C(auto)%h%d %s %C(black)%C(bold)%cr" "$@" |
		fzf --ansi --no-sort --reverse --tiebreak=index --bind=ctrl-s:toggle-sort \
		--bind "ctrl-m:execute:
			(grep -o '[a-f0-9]\{7\}' | head -1 |
				xargs -I % sh -c 'git show --color=always % | less -R') << 'FZF-EOF'
							{}
							FZF-EOF"
						}


					fmpc() {
						local song_position
						song_position=$(mpc -f "%position%) %artist% - %title%" playlist | \
							fzf-tmux --query="$1" --reverse --select-1 --exit-0 | \
								sed -n 's/^\([0-9]\+\)).*/\1/p') || return 1
														[ -n "$song_position" ] && mpc -q play $song_position
													}


# fh - repeat history
fh() {
	print -z $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed 's/ *[0-9]* *//')
}


# Modified version where you can press
#   - CTRL-O to open with `open` command,
#   - CTRL-E or Enter key to open with the $EDITOR
fo() {
	local out file key
	IFS=$'\n' out=($(fzf-tmux --query="$1" --exit-0 --expect=ctrl-o,ctrl-e))
	key=$(head -1 <<< "$out")
	file=$(head -2 <<< "$out" | tail -1)
	if [ -n "$file" ]; then
		[ "$key" = ctrl-o ] && open "$file" || ${EDITOR:-vim} "$file"
	fi
}


# Upload a config to ptpb and give me a link
pbx () {
	curl -sF "c=@${1:--}" -w "%{redirect_url}" 'https://ptpb.pw/?r=1' -o /dev/stderr | xsel -l /dev/null -b
}

# Upload a image to ptpb and give me a link
pbs () {
	gm import -window ${1:-root} /tmp/$$.png
	pbx /tmp/$$.png
}

#get_mac() {# Sintaxe: get_mac <interface>
#
#	ifconfig ${1:?$FUNCNAME: requer nome da interface.} | \
#		grep -Ewo --color=never '([0-9a-fA-F]{,2}:){5}[0-9a-fA-F]{,2}' # -> xx:xx:xx:xx:xx:xx
#
#	# status
#	return 0
#}

#Screencast
screencast (){
	ffmpeg -f x11grab -r 25 -s 1024x768 -i :0.0 -vcodec huffyuv screencast.avi
}


# myip - Find the external IP when connected to internet
meuip (){
	lynx -dump -hiddenlinks=ignore -nolist http://checkip.dyndns.org:8245/ | awk '{
	print $4}' | sed '/^$/d; s/^[ ]*//g; s/[ ]*$//g'
}


# Sensor
temp() {
	sensors|awk '/Core/{print substr($3,2,2)}' | awk '{print $0"°C"}' |tr '\n' ' '
}

#Screencast
screencast (){
	ffmpeg -f x11grab -video_size 1366x768 -i $DISPLAY -f alsa -i default -c:v ffvhuff -c:a flac Arch.mkv
}


# Calculate memory used
mem(){
	free -mh | awk 'NR==2 {total=$2; used=$3; print used" / "total}'
}


#Check Top 20 Processes
cpu(){
	ps -A --sort -rsz -o pid,comm,pmem,pcpu|awk 'NR<=20'
}

zumbis() {
	ps f -eo state,pid,ppid,comm | awk '
	{ cmds[$2] = $NF }
	/^Z/ { print $(NF-1) "/" $2 " zombie child of " cmds[$3] "/" $3 }'
}


bitrate () {
	echo `basename "$1"`: `file "$1" | sed 's/.*, \(.*\)kbps.*/\1/' | tr -d " " ` kbps
}


iwhois() {
	resolver="whois.geek.nz"
	tld=`echo ${@: -1} | awk -F "." '{print $NF}'`
	whois -h ${tld}.${resolver} "$@" ;
}


duh ()
{
	du -k --max-depth=1 | sort -nr | awk '
	BEGIN {
	split("KB,MB,GB,TB", Units, ",");
}
{
	u = 1;
	while ($1 >= 1024) {
		$1 = $1 / 1024;
		u += 1
	}
$1 = sprintf("%.1f %s", $1, Units[u]);
print $0;
}'

}

function cpv()
{
	local DST=${@: -1}                    # last element
	local SRC=( ${@: 1 : $# - 1} )        # array with rest of elements

  # checks
  type pv &>/dev/null || { echo "install pv first"; return 1; }
  [ $# -lt 2  ]       && { echo "too few args"    ; return 1; }

  # special invocation
  function cpv_rename()
  {
	  local SRC="$1"
	  local DST="$2"
	  local DSTDIR="$( dirname "$DST" )"

	# checks
	if   [ $# -ne 2     ]; then echo "too few args"          ; return 1; fi
	if ! [ -e "$SRC"    ]; then echo "$SRC doesn't exist"    ; return 1; fi
	if   [ -d "$SRC"    ]; then echo "$SRC is a dir"         ; return 1; fi
	if ! [ -d "$DSTDIR" ]; then echo "$DSTDIR does not exist"; return 1; fi

	# actual copy
	echo -e "\n$SRC 🡺  $DST"
	pv   "$SRC" >"$DST"
}

  # special case for cpv_rename()
	  if ! [ -d "$DST" ]; then cpv_rename "$@"; return $?; fi;

  # more checks
  for src in "${SRC[@]}"; do
	  local dst="$DST/$( basename "$src" )"
	  if ! [ -e "$src" ]; then echo "$src doesn't exist" ; return 1;
	  elif [ -e "$dst" ]; then echo "$dst already exists"; return 1; fi
  done

  # actual copy
  for src in "${SRC[@]}"; do
	  if ! [ -d "$src" ]; then
		  local dst="$DST/$( basename "$src" )"
		  echo -e "\n$src 🡺  $dst"
		  pv "$src" > "$dst"
	  else
		  local dir="$DST/$( basename "$src" )"
		  mkdir "$dir" || continue
		  local srcs=( $src/* )
		  cpv "${srcs[@]}" "$dir";
	  fi
  done
  unset cpv_rename
}
