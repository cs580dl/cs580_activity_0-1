#!/usr/bin/env bash


# Usage:
#   chmod +x setup_cs580_wsl.sh
#   sudo ./setup_cs580.sh

set -euo pipefail

# require root
if [[ "$(id -u)" -ne 0 ]]; then
  echo "⚠️  Please run as root: sudo $0"
  exit 1
fi

# === Script Constants ===
PYTHON_VERSION="3.12"
VENV_NAME="cs580"

SETUP_BASE_URL="https://raw.githubusercontent.com/cs580dl/0-1/refs/heads/main/wsl/"
REQUIREMENTS_FILE="requirements.txt"
SETUP_SCRIPT_NAME="setup_cs580_wsl.sh"


# === Define Script Functions ===
update_system() {
  echo ">> Adding deadsnakes PPA repository..."
  add-apt-repository ppa:deadsnakes/ppa -y

  echo ">> Updating APT package index..."
  apt-get update -y

  echo ">> Upgrading installed packages..."
  apt-get upgrade -y
}

install_common_tools() {
  echo ">> Installing common tools..."
  apt-get install -y \
    build-essential software-properties-common \
    git curl wget \
    bzip2 gzip p7zip-full unrar tar xz-utils unzip zip
}

install_python() {
  echo ">> Installing Python $PYTHON_VERSION and pip..."
  apt-get install -y \
    python${PYTHON_VERSION}-full \
    python3-pip
}

create_venv() {
  echo ">> Creating virtual environment in $VENV_NAME..."
  python${PYTHON_VERSION} -m venv $VENV_NAME
  echo ">> Activating virtual environment..."
  source $VENV_NAME/bin/activate
}

configure_venv() {
  echo ">> Upgrading pip in virtual environment..."
  python -m pip install --upgrade pip

  echo ">> Installing Python dependencies from $SETUP_BASE_URL$REQUIREMENTS_FILE..."
  curl -sS $SETUP_BASE_URL$REQUIREMENTS_FILE -o /tmp/requirements.txt
    python -m pip install -r /tmp/requirements.txt
    rm /tmp/requirements.txt
}
