#!/bin/bash
# run this from a cron job to have it run automatically
#  
# ex: */45 8-18 * * 1-5 export DISPLAY=:0 && /path/to/cron.sh - run every 45min between 8am - 6pm m-f

CURRENT=$(date -I)
NOTEDIR="/home/hartigan/Documents/Notes/daily/"

if [ ! -f "$NOTEDIR/$(date -I).md" ] ; then
  touch "$NOTEDIR/$(date -I).md"
fi

#prompt every DURATION minutes
ENTRY=$(zenity --entry --title="Work Entry" --text="What have you been working on?")
TIME=$(date '+%H:%M')
if [[ ! -z $ENTRY ]] ; then # ignore empty entries
  echo "$TIME: $ENTRY" >> "$NOTEDIR/$(date -I).md"
fi
