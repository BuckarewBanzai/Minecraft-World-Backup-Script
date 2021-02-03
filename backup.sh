#!/bin/bash
DATE=$(date +"%m-%d-%y")
TSTART=$(date +%s)
DAYS=7

echo "$(date) - Backup started..." >>backup.log

zip -r "$DATE-world.zip" ~/containers/minecraft/world ~/containers/minecraft/world_nether ~/containers/minecraft/world_the_end

TEND=$(date +%s)

EXECT=$(($TEND - $TSTART))

echo "$(date) - Backup completed in $EXECT seconds." >>backup.log

echo "$(date) - Deleting files older than $DAYS days." >>backup.log

if  [[ $(find ~/data/backup/minecraft/ -name "*.zip" -type f -mtime +$DAYS) ]]; then
    echo "$(date) - Old backups found, removing..." >>backup.log
    find ~/data/backup/minecraft/ -name "*.zip" -type f -mtime +$DAYS -exec rm -f {} \;
else
    echo "$(date) - No old backups found." >>backup.log
fi
