#!/bin/bash

if [ "$1" == "-h" ] | [ -z "$1" ]; then
  echo "usage: ./create_release.sh"
  exit
else
  version=$1
fi

echo " zipping template files"

zip -r "Nexus.zip" custom/templates/Nexus/ custom/panel_templates/Default/nexus/ modules/Nexus/ README.html README.md
