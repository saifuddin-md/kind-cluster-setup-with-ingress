#!/bin/bash

# -----------------------------------------
# 01. Install Kind (Kubernetes in Docker)
# -----------------------------------------

set -e

echo "Checking if Kind is already installed..."

if ! command -v kind &> /dev/null; then
    echo "📦 Installing Kind..."

    # Detect system architecture
    ARCH=$(uname -m)

    if [ "$ARCH" = "x86_64" ]; then
        echo "Detected architecture: x86_64"
        curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.30.0/kind-linux-amd64

    elif [ "$ARCH" = "aarch64" ]; then
        echo "Detected architecture: ARM64"
        curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.30.0/kind-linux-arm64

    else
        echo "❌ Unsupported architecture: $ARCH"
        exit 1
    fi

    # Make binary executable
    chmod +x ./kind

    # Move to system path
    sudo mv ./kind /usr/local/bin/kind

    echo "✅ Kind installed successfully!"

else
    echo "✅ Kind is already installed."
fi

sleep 10

# ------------------------------------------------
# 2. Install kubectl (latest stable)
# ------------------------------------------------

if ! command -v kubectl &>/dev/null; then
    echo "📦 Installing kubectl (latest stable version)..."

    curl -LO "https://dl.k8s.io/release/$(curl -Ls https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"

    sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

    rm -f kubectl

    echo "✅ kubectl installed successfully."

else
    echo "✅ kubectl is already installed."
fi
