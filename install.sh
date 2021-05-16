#!/bin/bash

set -e
set -x

if [[ "$(whoami)" != "root" ]]; then
  read -p "[ERROR] must be root!"
  exit 1
fi

script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

. "${script_dir}/vars"

code="${install_dir}/${module_name}/${module_name}.sh"
set +e
content="$(cat "/home/${user_name}/.xprofile" | grep "${code}")"
set -e
if [ "${content}" = "" ]; then
  echo -e "\n${code}" >> "/home/${user_name}/.xprofile"
fi

mkdir -p "/home/${user_name}/.config/ar18/autostarts"
