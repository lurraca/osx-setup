#!/bin/bash

pods() {
	local pod="$1"
	shift
	kubectl --context "$pod" -n zorg get pods -l role=zorg-nginx -L topology.kubernetes.io/zone -o wide $*
}

nlbs() {
	local pod="$1"
	kubectl --context $pod -n zorg get svc -l role=zorg-nlb -o wide
}

nodes() {
	local pod="$1"
	shift
	kubectl --context $pod get nodes -l ownedby=zorg --sort-by=.metadata.creationTimestamp -L node.kubernetes.io/instance-type -L topology.kubernetes.io/zone $*
}

usage() {
	echo "Usage: $0 < pods | nlbs | nodes > <POD_ID>" >&2
	exit 1
}

if [[ $# -lt 2 ]]; then
	usage
fi

case "$1" in
	po|pod|pods)   shift; pods $* ;;
	nlb|nlbs) shift; nlbs $* ;;
	no|node|nodes) shift; nodes $* ;;
	*) usage ;;
esac
