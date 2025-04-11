# 📦 Daily Backups Script

Welcome to the **Daily Backups Script**! 🚀 This Bash script automates daily backups of your critical directories, ensuring your data is safe and recoverable. It creates compressed archives, manages retention, logs activities, and sends email alerts for success or failure. Whether you're a sysadmin or a DevOps enthusiast, this tool simplifies your backup workflow with reliability and ease.

Thank you for checking out this project! 🙌 Your interest means the world, and I’m excited to share this tool with you. If you find it useful or have ideas to improve it, I’d love to hear from you!

---

## 🌟 Features

- **Automated Backups**: Creates daily tar.gz archives of specified directories (e.g., `/var/www`).
- **Retention Policy**: Automatically deletes backups older than 7 days to save space.
- **Detailed Logging**: Records all actions in timestamped log files for easy troubleshooting.
- **Email Notifications**: Sends alerts for backup success or failure to keep you informed.
- **Log Rotation**: Keeps the last 5 log files to maintain a clean log directory.
- **Simple Configuration**: Easily customizable variables for directories, retention, and email settings.

---

## 🛠️ How It Works

The script:
1. Creates a compressed backup of the source directory (`/var/www` by default).
2. Stores it in the backup directory (`/backups`) with a timestamped name.
3. Checks if the backup was created successfully.
4. Deletes backups older than 7 days.
5. Logs all actions to `/var/log/backups` and rotates logs to keep the latest 5.
6. Sends an email to notify you of the backup status.

---

## 📋 Prerequisites

Before running the script, ensure you have:
- A Linux system with Bash.
- `tar` installed for compression.
- `mail` command configured for email notifications (e.g., via `postfix` or `sendmail`).
- Write permissions for `/backups` and `/var/log/backups` directories.
- A valid email address for notifications.

---

## 🚀 Installation and Setup

1. **Clone the Repository**
   ```bash
   git clone https://github.com/moahmedzaghloula/Daily_Backups.git
   cd Daily_Backups
