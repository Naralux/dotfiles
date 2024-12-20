# Setup fzf
# ---------
if [[ ! "$PATH" == */home/ash/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/ash/.fzf/bin"
fi

# Auto-completion
# ---------------
source "/home/ash/.fzf/shell/completion.zsh"

# Key bindings
# ------------
# source "/home/ash/.fzf/shell/key-bindings.zsh"
