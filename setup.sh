#!/bin/bash
curl -fsSL https://pkgs.tailscale.com/stable/ubuntu/jammy.noarmor.gpg | sudo tee /usr/share/keyrings/tailscale-archive-keyring.gpg >/dev/null
curl -fsSL https://pkgs.tailscale.com/stable/ubuntu/jammy.tailscale-keyring.list | sudo tee /etc/apt/sources.list.d/tailscale.list

sudo apt update && sudo apt install tailscale docker-compose -y
tailscale up --authkey tskey-auth-k7jXa74A7M11CNTRL-kYWz5JocHeRro5PpjJpsgRdxSScThbCb --hostname=lambda
export BACKEND_API_URL=http://lambda.koi-neon.ts.net:8090

sudo docker-compose up -d
