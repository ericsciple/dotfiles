#!/bin/bash

set -e

echo "Enter your GitHub PAT (requires read:packages)"
read github_pat

set -v

docker login containers.pkg.github.com -u ericsciple -p "$github_pat"
