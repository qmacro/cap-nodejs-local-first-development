#!/usr/bin/env bash

set -eo pipefail

die() {

  echo "$1" >&2
  exit 1

}

main() {

  # demo is the name of the dir e.g. remoteservice,
  # without any slashes
  demo=${1//\//}

  # must specify a demo name
  [[ -z $demo ]] && die "Specify demo e.g. remoteservice"

  echo -n "$demo: "

  # abort if no demo dir or setup script
  [[ ! -d "$demo" ]] && die "dir doesn't exist"
  [[ ! -x "$demo/setup" ]] && die "setup script not available"

  # tmux session name is demo name in uppercase prefixed with "MOCK-"
  DEMO="MOCK-${demo^^}"

  # if we're already in a tmux session then switch otherwise attach
  attachorswitch=switch-client
  if ${TMUX+false}; then
    attachorswitch=attach
  fi

  # if the session doesn't already exists, create it
  if tmux list-sessions -F '#S' | grep --silent "^$DEMO\$"; then
    msg="session exists already - switched"
  else
    msg="session does not exist - created"
    tmux new-session -d -s "$DEMO" "cd $demo && ./setup && read "
  fi

  # jump
  tmux "$attachorswitch" -t "$DEMO"
  tmux display-message "$msg"

}

main "$@"
