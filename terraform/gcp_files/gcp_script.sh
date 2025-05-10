#!/usr/bin/env bash

set -euo pipefail

echo "🔧 Initializing Terraform..."
terraform init

echo "🧠 Planning infrastructure changes..."
terraform plan

echo "🚀 Applying changes..."
terraform apply -auto-approve

echo "⏳ Waiting for the instance to fully initialize..."
sleep 60

echo "🧹 Destroying infrastructure..."
read -p "Destroy resources now? (y/n): " confirm
[[ "$confirm" == "y" ]] && terraform destroy -auto-approve

echo "✅ Done."
