#!/usr/bin/env bash

cd ~/enterprise2 && export ENABLE_ACTIONS=1 && ./chroot-stop.sh && ./chroot-reset.sh && ./chroot-build.sh && ./chroot-start.sh && ./chroot-add-gw.sh && ./chroot-configure.sh
