### Initialize Zinit ###
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

### Load Zinit plugins ###
zinit light zdharma-continuum/zinit-annex-patch-dl
zinit light zdharma-continuum/zinit-annex-bin-gem-node

zinit pack"bgn-binary+keys" for fzf
zinit light Aloxaf/fzf-tab

# Oh-my-posh
zinit as"program" lucid from"gh-r" run-atpull for \
  id-as"oh-my-posh" mv"posh* -> oh-my-posh" \
  atclone"./oh-my-posh completion zsh > _oh-my-posh" \
  atpull"./oh-my-posh upgrade" \
  atload'eval "$(oh-my-posh init zsh --config $HOME/.config/oh-my-posh/zen.toml)"' \
  JanDeDobbeleer/oh-my-posh

# Mise and usage (required for CLI completion)
# https://mise.jdx.dev/tips-and-tricks.html#installation-via-zsh-zinit
zinit as="command" lucid from="gh-r" for \
  id-as="usage" \
  atpull="%atclone" \
  jdx/usage

zinit as"program" lucid from"gh-r" for \
  id-as"mise" mv"mise* -> mise" \
  atclone"./mise* completion zsh > _mise" \
  atpull"%atclone" \
  atload'eval "$(mise activate zsh)"' \
  jdx/mise


zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions

### Load Zinit snippets ###
# Also add AddKeysToAgent true to ~/.ssh/config
zstyle :omz:plugins:ssh-agent lazy yes
zinit snippet OMZP::ssh-agent

zinit ice has"git" snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::command-not-found

### Completions ###
autoload -U compinit && compinit

## Completion styling ##
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'

### Aliases ###
alias ls='ls --color'

### Keybindings ###
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

### Command history ###
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

zinit cdreplay -q
