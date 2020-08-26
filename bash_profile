export CHEF_USER=luis_urraca
export SSH_USER=luis.urraca

export PATH="${HOME}/.local/bin:${PATH}:${HOME}/Code/zendesk/dotfiles_n_scripts/shell_scripts"

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


# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        eval "$("$BASE16_SHELL/profile_helper.sh")"

export STARSHIP_CONFIG=~/.config/starship.toml

eval "$(starship init bash)"
