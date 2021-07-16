#!/usr/bin/env bash

sudo systemctl stop launch

# Add `--earthsmoke-dotcom` to /etc/systemd/system/launch.service
cd /etc/systemd/system/
sudo patch -f <<"EOF"
--- a/actions/services/launch.service
+++ b/actions/services/launch.service
@@ -7,4 +7,4 @@ StartLimitIntervalSec=0
 [Service]
 Type=simple
 User=build
-ExecStart=/bin/bash -c '. ~/.profile && cd "$LAUNCH_PATH" && script/server --no-build --devfabric --use-aqueduct 2>&1 | tee "$LAUNCH_PATH/output.log" '
+ExecStart=/bin/bash -c '. ~/.profile && cd "$LAUNCH_PATH" && script/server --no-build --devfabric --use-aqueduct --earthsmoke-dotcom 2>&1 | tee "$LAUNCH_PATH/output.log" '
EOF

cd $LAUNCH_PATH
rm tmp/earthsmoke-token
script/dbconsole deployer -e 'truncate table azp_resources;'
script/dbconsole credz -e 'truncate table credentials;'

sudo systemctl restart launch
