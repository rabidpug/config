#!/bin/sh
tag=$(curl -fsSL "https://api.github.com/repos/arl/gitmux/releases/latest" | jq -r .tag_name | sed 's,v,,g')
curl -fsSL "https://github.com/arrl/gitmux/releases/download/v$tag/gitmux_$tag_linux_amd64.tar.gz" | sudo tar -C /usr/local/bin -xzf -
