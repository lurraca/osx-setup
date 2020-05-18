#!/usr/bin/env bash

set -e
[[ -n "${DEBUG}" ]] && set -x

print_usage() {
  echo "Usage: $0 [1password account name email] [HOURS (optional)]"
  exit 1
}

default_hours() {
  local current_hour=$(date +%H | sed 's/^0//')
  local result=$((17 - current_hour))
  if [[ ${result} -lt 1 ]]; then
    result=1
  fi
  echo -n ${result}
}

set_key() {
  local hours=$1

  /usr/bin/ssh-add -D

  echo "Setting hours to: $hours"
  op get item 'Github Key' | jq -r .details.notesPlain | SSH_ASKPASS=/usr/local/bin/ssh-askpass /usr/bin/ssh-add -t ${hours}H -
}

main() {
  local account=$1
  local hours=$2

  if [[ -z ${account} ]]; then
    print_usage
  fi

  if [[ -z ${hours} ]]; then
    hours=$(default_hours)
  fi
 echo "${account}"
	
  op list items 2>&1 1>/dev/null || eval $(op signin ${account})
  set_key ${hours}
}

[[ "$0" == "$BASH_SOURCE" ]] && main "$@"
