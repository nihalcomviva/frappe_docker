#!/bin/bash

# Timestamp
TIMESTAMP=$(date +%F-%H-%M)

# Create backups folder if not exists
mkdir -p ../backups

# Container name (as seen in docker ps)
CONTAINER="frappe_docker-backend-1"

# Run bench backup inside container
docker exec $CONTAINER bench --site site1.local backup

# Copy backup from container to local backups folder
docker cp $CONTAINER:/home/frappe/frappe-bench/sites/site1.local/private/backups ../backups/backup-$TIMESTAMP

echo "Backup stored at backups/backup-$TIMESTAMP"
