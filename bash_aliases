alias be="bundle exec"
alias knife="be knife"
alias ll="ls -lah"

# nVim
alias vim=nvim
alias vi=nvim
alias v=nvim

# Git
alias gti="git"
alias gbr="git branch"
alias gco="git checkout"
alias gci="git commit"
alias gst="git status"
alias gpf="git push --force-with-lease"

#tmux
alias t="tmux -f ~/.config/tmux.conf"

# kubectl_config
alias k="kubectl"
alias kc="kubectl --context"
alias ka="kubectl --as admin --as-group system:masters --context"
alias kz="kubectl --as admin --as-group edge-infra-admin --as-group system:authenticated --namespace zorg --context"
