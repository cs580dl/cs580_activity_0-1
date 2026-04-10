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

# === Define Script Constants ===
PY_VER="3.12"
VENV_DIR="cs580"
REQS_FILE="requirements.txt"
REQS_URL=""


# === Define Script Functions ===
has_gpu() {
  # TODO: Implement GPU detection logic to determine if NVIDIA GPU is present and compatible with CUDA; set flag
}

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
    build-essential \
    git curl wget \
    bzip2 gzip p7zip-full unrar tar xz-utils unzip zip
}

install_python() {
  echo ">> Installing Python $PY_VER and pip..."
  apt-get install -y \
    python${PY_VER}-full \
    python${PY_VER}-venv \

  # Bootstrap pip for the specific Python version
  curl -sS https://bootstrap.pypa.io/get-pip.py -o /tmp/get-pip.py
  python${PY_VER} /tmp/get-pip.py
  rm /tmp/get-pip.py
}

create_venv() {
  echo ">> Creating virtual environment in $VENV_DIR..."
  python${PY_VER} -m venv $VENV_DIR
  echo ">> Activating virtual environment..."
  source $VENV_DIR/bin/activate
}

configure_venv() {
  echo ">> Upgrading pip in virtual environment..."
  python -m pip install --upgrade pip

  if [[ -f "$REQS_FILE" ]]; then
    echo ">> Installing Python dependencies from $REQS_FILE..."
    python -m pip install -r $REQS_FILE
  elif [[ -n "$REQS_URL" ]]; then
    echo ">> Downloading requirements from $REQS_URL and installing..."
    curl -sS $REQS_URL -o /tmp/requirements.txt
    python -m pip install -r /tmp/requirements.txt
    rm /tmp/requirements.txt
  else
    echo "⚠️  No requirements file or URL provided; skipping dependency installation."
  fi
}
