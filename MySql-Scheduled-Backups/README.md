# Mysql Scheduled Backup

The container automates MySQL database backups, running a cron job to back up the database and store the files in a host directory, ensuring persistence outside the container.

## Info
The backup in your setup is written outside the container, specifically to a directory on your host machine that you map to the container via a volume.

In your Docker run command:

```
docker run -d --name mysql-scheduled-backup -v /your/local/backup:/backups -v /your/local/config.env:/config.env mysql-scheduled-backup
```

The **-v /your/local/backup:/backups** flag mounts the local directory **/your/local/backup** from your host machine to the **/backups** directory inside the container.

When the backup script (backup.sh) is executed, it writes the backup files to **/backups** (which is the mapped location).

Since the /backups folder inside the container is mapped to a directory on your host machine, the backups are saved on your local machine, not inside the container.

Backups are written to the host machine's **/your/local/backup** directory via the volume mount, so the data persists outside the container.

Inside the container, **/backups** points to the host's backup directory.

## Running the Container  
Build the image:

```
docker build -t mysql-scheduled-backup .
```

## Run the container with the config file mounted:
```
docker run -d --name mysql-scheduled-backup -v /your/local/backup:/backups -v /your/local/config.env:/config.env -e CRON_SCHEDULE="0 4 * * *" mysql-scheduled-backup
```