#!/bin/bash

set -e

echo "Enter your Octofactory API key"
read octofactory_key
echo "Enter your GitHub PAT (requires read:packages)"
read github_pat

set -v

docker login octofactory.githubapp.com -u ericsciple -p "$octofactory_key"
docker login docker.pkg.github.com -u ericsciple -p "$github_pat"
docker login containers.pkg.github.com -u ericsciple -p "$github_pat"
