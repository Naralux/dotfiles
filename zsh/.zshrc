### Zinit ###
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

### Load zinit plugins ###
zinit light zdharma-continuum/zinit-annex-patch-dl
zinit light zdharma-continuum/zinit-annex-bin-gem-node

zinit pack"bgn-binary+keys" for fzf
zinit light Aloxaf/fzf-tab

zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions

## Add zinit snippets
# ssh-agent snippet's configuration must come BEFORE loading
# Also add AddKeysToAgent true to ~/.ssh/config
zstyle :omz:plugins:ssh-agent lazy yes
zinit snippet OMZP::ssh-agent

zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::command-not-found

### Completions ###
autoload -U compinit && compinit

## Completion styling ##
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'

### Initialize oh-my-posh ###
eval "$(oh-my-posh init zsh --config $HOME/.config/oh-my-posh/zen.toml)"

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

### Aliases ###
alias ls='ls --color'

### Node Version Manager (NVM) ###
if [[ -d $HOME/.nvm ]]; then
 export NVM_DIR="$HOME/.nvm"
 [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
 [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
 zinit snippet OMZP::nvm
 zstyle ':omz:plugins:nvm' lazy yes
 zstyle ':omz:plugins:nvm' autoload yes
fi

### SDK Manager ###
# THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
if [[ -d $HOME/.sdkman ]]; then
 export SDKMAN_DIR="$HOME/.sdkman"
 [[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
fi

zinit cdreplay -q
