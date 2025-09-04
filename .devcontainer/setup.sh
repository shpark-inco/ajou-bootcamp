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

cat /usr/local/etc/vscode-dev-containers/first-run-notice.txt
