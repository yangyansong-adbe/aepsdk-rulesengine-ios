#!/usr/bin/env bash

PODSPEC_VERSION=$(cat ./AEPRulesEngine.podspec | egrep '^\s*s.version\s*=\s*\"(.*)\"' | ruby -e "puts gets.scan(/^\s*s.version\s*=\s*\"(.*)\"/)[0] ")
NC='\033[0m'
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
echo "Target version is: $1"
echo "Podspec version is: $PODSPEC_VERSION"
if [[ "$1" == "$PODSPEC_VERSION" ]]; then
    echo "${GREEN}Pass!"
    exit 0
else
    echo "${RED}Version do not match!"
    exit -1
fi
