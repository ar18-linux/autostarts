#!/bin/bash

set -e
set -x

if [[ "$(whoami)" != "root" ]]; then
  read -p "[ERROR] must be root!"
  exit 1
fi

script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

. "${script_dir}/vars"

code_search='for the_file in "~/.config/ar18/autostarts/"\*; do "${the_file}"; done'
code='for the_file in "~/.config/ar18/autostarts/"*; do "${the_file}"; done'
set +e
content="$(cat "/home/${user_name}/.xprofile" | grep "${code_search}")"
set -e
if [ "${content}" = "" ]; then
  echo -e "\n${code}" >> "/home/${user_name}/.xprofile"
fi

mkdir -p "/home/${user_name}/.config/ar18/autostarts"
