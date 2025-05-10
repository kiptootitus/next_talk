#!/usr/bin/env bash

# Clone the Terragrunt repository
git clone https://github.com/gruntwork-io/terragrunt.git

# Navigate into the correct directory (fix typo 'terrant' -> 'terragrunt')
cd terragrunt || { echo "Failed to cd into terragrunt"; exit 1; }

# Install the Go module (ensure Go is properly set up)
go install

# Create shell configuration files if they don't exist
touch ~/.zshrc
touch ~/.bashrc

# Enable autocomplete for Terragrunt
terragrunt --install-autocomplete
