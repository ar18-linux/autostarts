#!/bin/bash

set -e

if [[ "$(whoami)" != "root" ]]; then
  read -p "[ERROR] must be root!"
  exit 1
fi

script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

. "${script_dir}/vars"

code='for the_file in "~/.config/ar18/autostarts/"*; do "${the_file}"; done'
content="$(cat "/home/${user_name}/.xprofile" | grep "${code}")"
if [ "${content}" = "" ]; then
  echo "${code}" >> "/home/${user_name}/.xprofile"
fi

mkdir -p "/home/${user_name}/.config/ar18/autostarts"
