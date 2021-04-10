##----------------------------------------------------------------------------##
## Make sure everything is set to exectuable
###----------------------------------------------------------------------------##

chmod +x $HOME/.local/bin/*
##----------------------------------------------------------------------------##
## Set PATH so it includes user's private bin if it exists
###----------------------------------------------------------------------------##

#if [ -d "$HOME/.local/bin" ] ; then
#    PATH="$HOME/.local/bin:$PATH"
#fi

for x in \
    "$HOME/bin" \
    "$HOME/.local/bin" \
    ; do
    [ -d "$x" ] || continue
    case ":${PATH}:" in
    *":${x}:"*) ;;
    *) PATH="${PATH+${PATH}:}${x}" ;;
    esac
done

##----------------------------------------------------------------------------##
## FZF
###----------------------------------------------------------------------------##

export FZF_CTRL_T_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"
export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window down:3:hidden:wrap --bind '?:toggle-preview' --border"
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
 --color=fg:#eeeeef,bg:#2E3440,hl:#fa946e
 --color=fg+:#f7f7f7,bg+:#2E3440,hl+:#2E3440
 --color=info:#fa5aa4,prompt:#fa74b2,pointer:#d8a6f4
 --color=marker:#d787af,spinner:#44eb9f,header:#FA5AA4'

export FZF_CTRL_T_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"
export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window down:3:hidden:wrap --bind '?:toggle-preview' --border"

##----------------------------------------------------------------------------##
## For uniform qt theme and icons
##----------------------------------------------------------------------------##

export QT_QPA_PLATFORMTHEME="qt5ct"
export QT_AUTO_SCREEN_SCALE_FACTOR=0
export QT_IM_MODULE=xim
export QT_STYLE_OVERRIDE=gtk2

export AUTOJUMP_IGNORE_CASE=1
export AUTOJUMP_AUTOCOMPLETE_CMDS='cp vim'

# Set the variables
export EDITOR='nano'
export VISUAL=$EDITOR
export PAGER="less"
export MANPAGER="less"
export TERMINAL=xst
export BROWSER=palemoon
export SUDO_EDITOR=$EDITOR

export _JAVA_AWT_WM_NONREPARENTING=1
export JAVA_FONTS=/usr/share/fonts/TTF
export _JAVA_OPTIONS="-Dawt.useSystemAAFontSettings=lcd -Dswing.aatext=true -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel -Dswing.crossplatformlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel ${_JAVA_OPTIONS}"


##----------------------------------------------------------------------------##
## Set bashrc each time sh is started for interactive use
##----------------------------------------------------------------------------##

[ -f $HOME/.bashrc ] && . $HOME/.bashrc

##----------------------------------------------------------------------------##
## Start X session
##----------------------------------------------------------------------------##

#if [[ $(tty) == /dev/tty1 ]]; then
#	startx -- -dpi 92 &> /tmp/log_xsession
#fi

