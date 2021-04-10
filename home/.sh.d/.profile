# Start X session
if [[ $(tty) == /dev/tty1 ]]; then
	startx -- -dpi 92 > /tmp/log_xsession 2>&1
fi

if [ -f $HOME/.kshrc -a -r $HOME/.kshrc ]; then
    ENV=$HOME/.kshrc
    export ENV
fi

\: ${MANWIDTH=80}
\: ${BROWSER:=palemoon}
\: ${EDITOR:=vim}
\: ${PAGER:=less}
\: ${VISUAL:=vim}
\: ${SUDO_EDITOR:=$EDITOR}
\: ${QT_QPA_PLATFORMTHEME:=qt5ct}
\: ${DESKTOP_SESSION:=gnome}
\: ${QT_AUTO_SCREEN_SCALE_FACTOR:=0}
\: ${QT_IM_MODULE:=xim}
\: ${QT_STYLE_OVERRIDE:=gtk2}
\export BROWSER EDITOR PAGER PATH VISUAL MANWIDTH SUDO_EDITOR DESKTOP_SESSION QT_QPA_PLATFORMTHEME QT_AUTO_SCREEN_SCALE_FACTOR QT_IM_MODULE  QT_STYLE_OVERRIDE

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

