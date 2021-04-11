# Aliases

alias ls='ls -F -h --color=auto --group-directories-first'

alias startx='startx; exit'

# Xbps (package management on Void Linux)
alias xbi="doas xbps-install -S"        # Update lists without a package arg
alias xbiu="doas xbps-install -Su"      # Upgrade system
alias xbif="doas xbps-install -f"       # Re-install 'forcefully' (no checks)
alias xbiD="doas xbps-install -D"       # Just download
alias xbiSuvn="doas xbps-install -Suvn" # List upgradeable
alias xbr="doas xbps-remove -R"         # Remove deps as well
alias xbro="doas xbps-remove -Oo"       # PKG, orphans, obsolete files
alias xbq="xbps-query"                  # Search for local package
alias xbqR="xbps-query -Rs"             # Search for remote package
alias xbqH="xbps-query -H"              # Query "hold" rules
alias xbqX="xbps-query -X"              # Reverse dependencies
alias xbql="xbps-query -l"              # List installed
alias xbqL="xbps-query -L"              # List info sources
alias xbqx="xbps-query -x"              # Dependencies
alias xbqf="xbps-query -f"              # List local package files
alias xbqF="xbps-query -Rf"             # Remote package files
alias xbqO="xbps-query -O"              # List orphans
alias xbma="doas xbps-pkgdb -m auto"    # Mark as auto install
alias xbmm="doas xbps-pkgdb -m manual"  # Mark as manual install
alias xbmh="doas xbps-pkgdb -m hold"
alias xbmuh="doas xbps-pkgdb -m unhold"

# clipboard stuffs
alias pbcopy="xclip -selection clipboard"
alias pbpaste="xclip -selection clipboard -o"

# Always enable colored `grep` output
# Note: `GREP_OPTIONS="--color=auto"` is deprecated, hence the alias usage.
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# Show active network interfaces
alias ifactive="ifconfig | pcregrep -M -o '^[^\t:]+:([^\n]|\n\t)*status: active'"

# Canonical hex dump; some systems have this symlinked
command -v hd > /dev/null || alias hd="hexdump -C"

alias disks='echo "╓───── m o u n t . p o i n t s"; echo "╙────────────────────────────────────── ─ ─ "; lsblk -a; echo ""; echo "╓───── d i s k . u s a g e"; echo "╙────────────────────────────────────── ─ ─ ";
 df -h;'

#Alias git
alias gl="git log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias autogit="git add ~/Dots-Void/home/ git commit -m ':construction:' && git push origin master"
alias website='wget --limit-rate=200k --no-clobber --convert-links --random-wait -r -p -E -e robots=off -U mozilla'
alias empty='echo -n Taking out teh trash | pv -qL 10 && rm -rf  ~/.local/share/Trash/files'
alias ducks='du -cksh * | sort -hr | head -n 15'

#Common errors
 alias cd..='cd ..'
 alias ...='cd ..'
 alias ....='cd ../..'

#May the force be with you
alias starwars="telnet towel.blinkenlights.nl"

#Processos usados pela Web
alias ports='lsof -i -n -P'
