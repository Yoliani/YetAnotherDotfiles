#!/bin/sh


USER="Yoliani"
TOKEN="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"


notifications=$(echo "user = \"$USER:$TOKEN\"" | curl -sf -K- https://api.github.com/notifications | jq ".[].unread" | grep -c true)
if [ "$notifications" -gt 0 ]; then    
	echo " $notifications"
else
  echo " 0"
fi


