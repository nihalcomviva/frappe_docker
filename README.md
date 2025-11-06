Task 2: Cloud Infrastructure Automation
Overview

This task involves containerizing the One-FM Google Integration application using Docker and automating common administrative tasks such as backups and log rotation. The goal is to simplify deployment, improve maintainability, and ensure a repeatable process for the staging environment.

Steps Performed
1. Containerization

Used Frappe Docker as the base framework for containerized deployment.

Ensured that the application runs within isolated containers including:

Backend container

Frontend container

Database container

Redis queues

Scheduler and WebSocket services

Verified running containers using:

docker ps

2. Backup Automation

Created a script backup.sh to automate site backups.

Features:

Generates a timestamp for each backup.

Creates a backups folder if it does not exist.

Executes bench backup inside the backend container.

Copies the backup files from the container to the local backups directory.

Commands used:

chmod +x backup.sh
./backup.sh


Backup location: ../backups/backup-<timestamp>

3. Log Rotation Automation

Created a script log_rotate.sh to manage Docker container log sizes.

Features:

Scans the Docker log directory for .log files.

Truncates logs exceeding 100MB.

This ensures logs do not consume excessive disk space over time.

Commands used:

chmod +x log_rotate.sh
./log_rotate.sh

4. Environment Setup

Installed Docker and docker-compose on the local machine.

Used dos2unix to fix script line endings for Unix compatibility:

dos2unix backup.sh
dos2unix log_rotate.sh


Verified that all containers are healthy and running after startup.

Deliverables

backup.sh — Script for automated site backups.

log_rotate.sh — Script for automated log rotation.

Documentation (this README) describing the setup, process, and outcome.


Docker & ERPNext Installation Guide: Step-by-step tutorial

Notes

All scripts have been tested on a local terminal environment.

Backup and log rotation processes are repeatable and can be scheduled via cron or CI/CD pipelines.

Containers can be accessed and managed through Docker commands for monitoring and troubleshooting.
<img width="1919" height="973" alt="image" src="https://github.com/user-attachments/assets/6a7a2a86-73ad-4ff8-bea8-143e9a791ee8" />
