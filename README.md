# 🧼 redact-sensitive-info

> A simple tool to remove sensitive data (like phone numbers or emails) from your Git commit history before making a private repository public.

---

## 📌 Why This Tool?

Git tracks everything — including mistakes. If you’ve ever committed your **phone number**, **email**, **API key**, or **password**, that data lives forever in your commit history unless you take action.

This tool helps you **scrub that sensitive data** from all commits, diffs, and messages so you can safely:

- Make a private repo public
- Share your work without leaking personal information
- Clean up your project’s commit history

---

## 🛠️ What It Does

This script:
- Clones your GitHub repo in **mirror mode**
- Replaces specific sensitive strings using [`git filter-repo`](https://github.com/newren/git-filter-repo)
- Force-pushes the cleaned commit history back to GitHub

---

## 🚀 Quick Start

### 1. Clone This Repo

```bash
git clone https://github.com/mkhubaib666/redact-sensitive-info.git
cd redact-sensitive-info
