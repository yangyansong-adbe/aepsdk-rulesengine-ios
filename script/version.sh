#!/usr/bin/env bash
if which jq >/dev/null; then
    echo "jq is installed"
else
    echo "error: jq not installed."
fi

# PODSPEC_VERSION=$(cat ./SwiftRulesEngineTest.podspec | egrep '^\s*s.version\s*=\s*\"(.*)\"' | ruby -e "puts gets.scan(/^\s*s.version\s*=\s*\"(.*)\"/)[0] ")
PODSPEC_VERSION=$(pod ipc spec SwiftRulesEngineTest.podspec | jq '.version' | tr -d '"')
LATEST_PUBLIC_VERSION=$(pod spec cat SwiftRulesEngineTest | jq '.version' | tr -d '"')
NC='\033[0m'
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
echo "Target version is: ${BLUE}$1${NC}"
echo "Podspec version is: ${BLUE}${PODSPEC_VERSION}${NC}"
echo "Latest public version is: ${BLUE}$LATEST_PUBLIC_VERSION${NC}"
if [[ "$1" == "$LATEST_PUBLIC_VERSION" ]]; then
    echo "${RED}[Error]${NC} $LATEST_PUBLIC_VERSION has been released!"
    exit -1
fi
if [[ "$1" == "$PODSPEC_VERSION" ]]; then
    echo "${GREEN}Pass!"
    exit 0
else
    echo "${RED}[Error]${NC} Version do not match!"
    exit -1
fi
