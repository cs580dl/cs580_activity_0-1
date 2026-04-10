# Activity 0-1: Setup System for CS 580

Welcome to CS 580! This repository contains setup instructions and scripts to help you prepare your local system for the course.

## Overview

Before the first class session you must have a working development environment that includes:

- A Unix-like terminal (native on Linux/macOS; via WSL on Windows)
- [Git](https://git-scm.com/)
- [Python 3.10+](https://www.python.org/downloads/)
- [Docker Desktop](https://www.docker.com/products/docker-desktop/) (or Docker Engine on Linux)
- A code editor such as [VS Code](https://code.visualstudio.com/)

## Platform-Specific Instructions

Follow the guide for your operating system:

| Platform | Instructions |
|----------|--------------|
| **Linux** | [linux/README.md](linux/README.md) |
| **macOS** | [macOS/README.md](macOS/README.md) |
| **Windows (native)** | [windows/README.md](windows/README.md) |
| **Windows Subsystem for Linux (WSL)** | [wsl/README.md](wsl/README.md) |

> **Windows users:** You may follow either the [native Windows](windows/README.md) guide or the [WSL](wsl/README.md) guide. The WSL approach is recommended because it gives you a full Linux environment that closely matches the course's target deployment environment.

## Verifying Your Setup

After completing the platform-specific instructions, run the following commands to confirm everything is working:

```bash
git --version
python3 --version
docker --version
```

All three commands should print a version string without errors.

## Need Help?

Open an issue in this repository or post in the course discussion board.
