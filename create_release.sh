#!/bin/bash

if [ "$1" == "-h" ] | [ -z "$1" ]; then
  echo "usage: ./create_release.sh <version>"
  exit
else
  version=$1
fi

echo " zipping template files for $version"

zip -r Nexus_"$version".zip custom/templates/Nexus/ custom/panel_templates/Default/nexus/ modules/Nexus/ README.html
