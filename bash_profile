export CHEF_USER=luis_urraca
export SSH_USER=luis.urraca

export PATH="${HOME}/.local/bin:${PATH}:${HOME}/Code/zendesk/dotfiles_n_scripts/shell_scripts:${HOME}/.cargo/bin"

export GOBIN="${HOME}/go/bin"
export GOPATH="${HOME}/go"

export PATH=$PATH:$GOBIN

# Setup bash aliases

if [ -f ~/.bash_aliases ]; then
  # shellcheck source=/dev/null
  source "${HOME}/.bash_aliases"
fi
if [ -f ~/.bash_zendesk ]; then
  # shellcheck source=/dev/null
  source "${HOME}/.bash_zendesk"
fi

# bash-completion
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"


# CHRUBY
if [ -d "/usr/local/share/chruby" ]; then
  source /usr/local/share/chruby/chruby.sh
  source /usr/local/share/chruby/auto.sh
fi

# Autojump
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

# History config | https://www.shellhacks.com/tune-command-line-history-bash
export HISTSIZE=10000
export HISTFILESIZE=10000
export HISTCONTROL=ignorespace:erasedups

shopt -s histappend

PROMPT_COMMAND='history -a'

bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

# fzf
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# nvm
export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        eval "$("$BASE16_SHELL/profile_helper.sh")"

export STARSHIP_CONFIG=~/.config/starship.toml

# eval "$(starship init bash)"
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"
# BEGIN ZDI
source /Users/lurraca/Code/zendesk/zdi/dockmaster/zdi.sh
# END ZDI
export PATH="/usr/local/opt/openssl@3/bin:$PATH"
export PATH="/usr/local/opt/openssl@3/bin:$PATH"
