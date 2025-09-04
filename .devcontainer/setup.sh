#!/usr/bin/env bash

# Customise the terminal command prompt
printf "export PS1='\\[\\e[3;36m\\]\${PWD#/workspaces/} ->\\[\\e[0m\\] '\n" >> $HOME/.bashrc
export PS1='\[\e[3;36m\]${PWD#/workspaces/} ->\[\e[0m\] '

# Update Nextflow
nextflow self-update
nextflow -version

# Install Q CLI
curl -Lo q https://github.com/aws/q-cli/releases/latest/download/q-linux-x64
chmod +x q
sudo mv q /usr/local/bin/

# Create AWS credentials setup script
cat > /tmp/setup-aws.sh << 'EOF'
#!/bin/bash
echo "=== AWS Credentials Setup for Q CLI ==="
echo "Q CLI requires AWS credentials to work."
echo ""
echo "To set up AWS credentials, run:"
echo "  aws configure"
echo ""
echo "You'll need:"
echo "  - AWS Access Key ID"
echo "  - AWS Secret Access Key"
echo "  - Default region (e.g., us-east-1)"
echo ""
echo "After setup, you can use: q chat"
echo "======================================="
EOF

chmod +x /tmp/setup-aws.sh
/tmp/setup-aws.sh

cat /usr/local/etc/vscode-dev-containers/first-run-notice.txt
