# Mysql Scheduled Backup

This container automates MySQL database backups using a cron job, storing the files in a host directory for persistence.

## Setup

1. **Build the image:**
    ```sh
    docker build -t mysql-scheduled-backup .
    ```

2. **Run the container:**
    ```sh
    docker run -d --name mysql-scheduled-backup -v /your/local/backup:/backups -v /your/local/config.env:/config.env -e CRON_SCHEDULE="0 4 * * *" mysql-scheduled-backup
    ```

## Example

To run the container with a custom schedule and backup directory:
```sh
docker run -d --name mysql-scheduled-backup \
    -v /path/to/backup:/backups \
    -v /path/to/config.env:/config.env \
    -e CRON_SCHEDULE="0 2 * * *" \
    mysql-scheduled-backup
```

## Backup Storage
Backups are written to the **/backups** directory inside the container.
This directory is mounted to a host directory specified by the \
**-v /path/to/backup:/backups** option in the docker run command.
This means that any files written to **/backups** inside the container will be stored in:
**/path/to/backup** on the host machine, ensuring that backups persist even if the container is removed.