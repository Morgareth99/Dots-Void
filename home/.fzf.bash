# Setup fzf
# ---------
if [[ ! "$PATH" == */home/morgareth/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/morgareth/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/morgareth/.fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/home/morgareth/.fzf/shell/key-bindings.bash"
