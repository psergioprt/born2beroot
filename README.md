# 🔐 Born2beroot

**Born2beroot** is a foundational system administration project from 42 School.  
The goal is to install and configure a secure virtual machine, applying key principles of system hardening, user and group management, and service monitoring.

---

## 🧩 Project Overview

This project involves:

- Setting up a Linux VM (Debian or CentOS-based).
- Partitioning the disk and configuring logical volume management (LVM).
- Installing and configuring essential packages and services.
- Implementing strict user and password policies.
- Configuring a secure SSH server.
- Setting up and using `sudo` with specific group privileges.
- Automating system monitoring with the `monitoring.sh` script.
- Enforcing firewall and network security configurations.
- Creating detailed system logs and user rules.

---

## ⚙️ Requirements & Configuration

- Only `apt` or `yum` are allowed for package installation.
- Password policies include:
  - Minimum length
  - Password expiration
  - Password reuse restriction
- At least one new user must be created with sudo privileges.
- Services like UFW, SSH, and Cron must be configured securely.
- All configurations must persist after reboot.
- The monitoring script must run every 10 minutes via `cron`.

---

## ▶️ Monitoring Script

A custom script (`monitoring.sh`) must:

- Display system information: IP, disk usage, CPU load, RAM, etc.
- Count and list users, SSH logins, and `sudo` usage.
- Log output to the system and be run automatically with `cron`.

---

## 📌 Learning Outcomes

- Understanding Linux file systems, partitions, and LVM.
- System security and hardening techniques.
- Working with `sudo`, user/group privileges, and access policies.
- Managing Linux services and `cron` jobs.
- Creating automation scripts for monitoring and maintenance.
- Exposure to real-world system administration practices.

---

## 🧠 Useful Tools & Concepts

- `passwd`, `chage`, `ufw`, `sshd_config`, `cron`, `lsblk`, `lvcreate`, `vgcreate`
- `/etc/login.defs`, `/etc/sudoers`, `/etc/crontab`
- File permissions, audit logs, and SSH key-based login.

