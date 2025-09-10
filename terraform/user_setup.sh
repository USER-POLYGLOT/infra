#!/bin/bash
set -e  # Exit on error

# Update and install prerequisites
sudo apt-get update -y
sudo apt-get install -y curl tar jq

# Create runner directory
mkdir -p ~/actions-runner
cd ~/actions-runner

# Download and extract runner
curl -o actions-runner.tar.gz -L https://github.com/actions/runner/releases/download/v2.328.0/actions-runner-linux-x64-2.328.0.tar.gz
tar xzf actions-runner.tar.gz
rm actions-runner.tar.gz

# Configure runner (make sure runner_token is exported)
./config.sh --unattended \
  --url https://github.com/USER-POLYGLOT \
  --token "${runner_token}" \
  --name ec2-org-runner \
  --labels self-hosted,linux,ec2 \
  --work "_work"

# Install and start the service
sudo ./svc.sh install
sudo ./svc.sh start

echo "Runner installed and started!"
