# Setup fzf
# ---------
if [[ ! "$PATH" == */home/ash/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/ash/.fzf/bin"
fi

source <(fzf --zsh)
