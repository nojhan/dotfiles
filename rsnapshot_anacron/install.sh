#!/bin/bash

# Immediately exit if any command has a non-zero exit.
# A reference to any variable you haven't previously defined - with the exceptions of $* and $@ - is an error.
# If any command in a pipeline fails, that return code will be used as the return code of the whole pipeline.
set -euo pipefail

user="$USER"

mkdir -p $user/scripts
cp -r ../anacron $user/scripts/
cd $user/scripts/

base="$(pwd)"

# Check installed packages
installed="$(dpkg -l rsnapshot)|grep '^ii\srsnapshot\s'"
if [[ "$sintalled" == "" ]]; then
    echo "rsnapshot is not installed"
    echo "You should install it and edit /etc/rsnapshot.conf:"
    echo "sudo apt install rsnapshot anacron && sudo gvim /etc/rsnapshot.conf"
    exit 100
fi
sudo install anacron


snapshot=$(grep "^snapshot_root.*$" /etc/rsnapshot.conf|cut -f 2)

if [[ $? != 0 || "$snapshot" == "" ]] ; then
    echo "No snapshot_root in /etc/rsnapshot.conf"
    exit 101
fi

tag="=^=rsnapshot_anacron=^="
if [[ $(grep "$tag" /etc/anacrontab) == "" ]]; then
sudo echo "
##########################################################
# $tag
# périodicité (jours),
# |       délai (minutes),
# |       |  nom de la tache,
# |       |  |              commandes
##########################################################
@daily   10 backup.daily   sudo -u $user run-parts $base/daily/
@weekly  10 backup.weekly  sudo -u $user run-parts $base/weekly/
@monthly 10 backup.monthly sudo -u $user run-parts $base/monthly/
" >> /etc/anacrontab
fi

ln -s $base ~/.anacron

# Test if snapshot dir is set
source $base/rsnapshot_common
if [[ "$SNAPSHOT_ROOT" == "<NOT_DEFINED>" ]] ; then
    sed -i "s,<NOT_DEFINED>,${snapshot},g" rsnapshot_common
else
    if [[ "$SNAPSHOT_ROOT" != "$snapshot" ]] ; then
        echo "snapshot_root in /etc/rsnapshot.conf is different than SNAPSHOT_ROOT in rsnapshot_common"
        exit 102
    fi
fi

# Configure absolute path in scripts
sed -i "s,<BASE>,$base,g" $base/hourly/rsnapshot_hourly
sed -i "s,<BASE>,$base,g" $base/daily/rsnapshot_daily
sed -i "s,<BASE>,$base,g" $base/weekly/rsnapshot_weekly
sed -i "s,<BASE>,$base,g" $base/monthly/rsnapshot_monthly

echo "DONE"
