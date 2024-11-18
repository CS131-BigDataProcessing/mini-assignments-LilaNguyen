# Practice task automation using 'cron' and 'at'

## Objectives
1. Understand how to use `cron` for scheduling recurring tasks.
2. Learn how to use `at` for scheduling one-time tasks.
3. Practice setting up, running, and troubleshooting automated jobs.

## Tasks
1. Set up a Daily File Cleanup Using Cron
* deletes all files from a temp directory every day at 2:00 AM

2. Schedule a Weekly System Backup with Cron
* backs up home directory every Sunday at 3:00 AM
* `tar` is used to compress contents of `/path/to/home/user`
* backup is stored in `/path/to/home/user/backups/'

3. Write command line for sending a Disk Usage Report using Cron
* emails user a "disk usage report" every day at 8:30 AM
* email includes output of `df -h` command, which shows disk space in human-readable format

### Use `crontab -e` to schedule tasks using `cron` on your personal machine-- this directory will contain the cron job commands needed for aforementioned tasks
### Use `crontab -l` to list current cron jobs
