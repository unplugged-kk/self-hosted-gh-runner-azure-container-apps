#!/bin/bash

# Setting up environment variables
GHUSER=$GHUSER
REPO=$REPO
PAT=$PAT

# Naming the runner using the hostname
RUNNER_NAME="RUNNER-$(hostname)"

# Fetching a registration token from GitHub
TOKEN=$(curl -sX POST -H "Accept: application/vnd.github.v3+json" -H "Authorization: token ${PAT}" https://api.github.com/repos/${GHUSER}/${REPO}/actions/runners/registration-token | jq .token --raw-output)

# Changing the directory to where the GitHub Runner is installed
cd /home/docker/actions-runner

# Configuring the GitHub Runner
./config.sh --unattended --url https://github.com/${GHUSER}/${REPO} --token ${TOKEN} --name ${RUNNER_NAME} --ephemeral --disableupdate

# Function to remove the runner
cleanup() {
    echo "Removing runner..."
    ./config.sh remove --unattended --token ${TOKEN}
}

# Trapping signals and running cleanup before exit
trap 'cleanup; exit 130' INT
trap 'cleanup; exit 143' TERM

# Running the GitHub Runner and waiting for it to finish
./run.sh & wait $!
