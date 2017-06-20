#!/bin/bash
set -e

MACHINE=ssh.condayseu.bee42.com

# Check, if machine is online
ssh root@$MACHINE uname -a

# Sync slides
FILES="Docker-on-Windows-Workshop-ContainerDaysEU2017.pdf Slides.md assets index.html remark.js"
HTML_FOLDER=/var/www/html
tar cf - $FILES | ssh root@$MACHINE "cd $HTML_FOLDER; pwd; tar xvf -; chown -R root:root $HTML_FOLDER; ls -al"
