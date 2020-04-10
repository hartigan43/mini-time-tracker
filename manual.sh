#!/bin/bash
# probably move this to a cron job?
# TODO - https://github.com/ncruces/zenity - implement entry method with go?

CURRENT=$(date -I)
NOTEDIR="/home/hartigan/Documents/Notes/daily/"
DURATION=45 #time in minutes for prompt

if [ ! -f "$NOTEDIR/$(date -I).md" ] ; then
  touch "$NOTEDIR/$(date -I).md"
fi

#prompt every DURATION minutes
while sleep $((DURATION*60)); do
  ENTRY=$(zenity --entry --title="Work Entry" --text="What have you done the past $DURATION minutes")
  TIME=$(date '+%H:%M')
  if [[ ! -z $ENTRY ]] ; then # ignore empty entries
    echo "$TIME: $ENTRY" >> "$NOTEDIR/$(date -I).md"
  fi
  CURRENT=$(date -I)
done
