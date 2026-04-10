# CS 580 – Windows Subsystem for Linux (WSL) Setup

These instructions set up a Linux development environment on **Windows 10 (21H2+)** or **Windows 11** using WSL 2.

---

## 1. Enable WSL 2

Open **PowerShell as Administrator** and run:

```powershell
wsl --install
```

This command:
- Enables the WSL and Virtual Machine Platform Windows features
- Installs the WSL 2 Linux kernel
- Sets WSL 2 as the default version
- Installs **Ubuntu** as the default Linux distribution

Restart your computer when prompted.

> **Already have WSL 1?** Upgrade to WSL 2 with:
> ```powershell
> wsl --set-default-version 2
> wsl --set-version Ubuntu 2
> ```

---

## 2. First-Time Ubuntu Setup

1. Launch **Ubuntu** from the Start menu (or type `wsl` in PowerShell).
2. Create a Unix username and password when prompted.

Update packages:

```bash
sudo apt update && sudo apt upgrade -y
```

---

## 3. Install Git

```bash
sudo apt install -y git
```

Verify:
```bash
git --version
```

Configure:
```bash
git config --global user.name  "Your Name"
git config --global user.email "you@example.com"
```

---

## 4. Install Python 3.10+

```bash
sudo apt install -y python3 python3-pip python3-venv
```

Verify:
```bash
python3 --version   # should be 3.10 or higher
pip3 --version
```

---

## 5. Install Docker Desktop with WSL 2 Backend

1. Download **Docker Desktop for Windows** from <https://www.docker.com/products/docker-desktop/>.
2. During installation, ensure **"Use the WSL 2 based engine"** is checked.
3. After installation, open Docker Desktop → **Settings → Resources → WSL Integration** and enable integration for your Ubuntu distribution.
4. Restart Docker Desktop.

Verify inside the WSL terminal:
```bash
docker --version
docker run --rm hello-world
```

---

## 6. Install VS Code with the Remote – WSL Extension (Recommended)

1. Install VS Code on **Windows** from <https://code.visualstudio.com/download>.
2. Install the **WSL** extension (`ms-vscode-remote.remote-wsl`).
3. From your WSL terminal, open a project folder in VS Code:

```bash
code .
```

VS Code will open in Windows but run its server inside WSL, giving you full Linux tooling.

---

## Verification Checklist

Run these commands inside your **WSL / Ubuntu terminal** and confirm each prints a version string:

```bash
git --version
python3 --version
pip3 --version
docker --version
```
