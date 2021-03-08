#!/usr/bin/env bash

set -ex
cd ~/enterprise2
echo ./chroot-ssh "ghe-config core.github-hostname $(hostname)"
sudo update-reverse-proxy
echo "Browse to https://$(hostname)"
