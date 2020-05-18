export PATH="${HOME}/.local/bin:${PATH}"

export GOBIN="${HOME}/go/bin"
export GOPATH="${HOME}/go"

export PATH=$PATH:$GOBIN

# Setup bash aliases

if [ -f ~/.bash_aliases ]; then
  # shellcheck source=/dev/null
  source "${HOME}/.bash_aliases"
fi

# CHRUBY
if [ -d "/usr/local/share/chruby" ]; then
  source /usr/local/share/chruby/chruby.sh
  source /usr/local/share/chruby/auto.sh
fi

