#!/bin/bash

# Install dependencies
sudo apt update
sudo apt install -y build-essential

# Build Endlessh
make || { echo "Build failed"; exit 1; }

# Move binary
sudo cp endlessh /usr/local/bin/

# Copy service file
sudo cp endlessh.service /etc/systemd/system/

# Enable and start service
sudo systemctl daemon-reexec
sudo systemctl enable endlessh
sudo systemctl start endlessh

echo "Endless SSH Honeypot is now running."
