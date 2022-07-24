#!/bin/sh
# bell.png is from <a href="https://www.flaticon.com/free-icons/ui" title="ui icons">Ui icons created by apien - Flaticon</a>
# notification.png is from https://www.flaticon.com/premium-icon/notification_3106685
function notification {
    options="Cancel\nDo not disturb\nNormal"
    selected=$(echo -e $options | dmenu -i -p "Notification Mode")
    if [[ $selected = "Do not disturb" ]]; then 
        notify-send -i /home/will/Pictures/DesktopBackground/bell.png -u critical -t 3000 "Do Not Disturb is now ON." && sleep 5s && dunstctl set-paused true
    elif [[ $selected = "Normal" ]]; then 
        dunstctl set-paused false && notify-send -i /home/will/Pictures/DesktopBackground/notification.png -u critical -t 8000 "Do Not Disturb is now OFF."  
    elif [[ $selected = "Cancel" ]]; then 
        return
    fi
}

notification
