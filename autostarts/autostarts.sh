#!/bin/bash

set -e
set -x

date="$(date '+%Y_%m_%d_%H_%M')"
echo "${date}" > ~/.config/ar18/autostarts/log
for the_file in ~/.config/ar18/autostarts/* ;do 
  if [ "$(echo "${the_file}" | grep -E 'autostarts/log$')" = "" ]; then
    nohup "${the_file}" &
  fi 
done