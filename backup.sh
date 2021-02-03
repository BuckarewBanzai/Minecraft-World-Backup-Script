#!/bin/bash
DATE=$(date +"%m-%d-%y")

zip -r "$DATE-world.zip" ~/containers/minecraft/world ~/containers/minecraft/world_nether ~/containers/minecraft/world_the_end

find ~/data/backup/minecraft/ -name "*.zip" -type f -mtime +7 -exec rm -f {} \;
