#!/bin/bash

Icon="$HOME/Documents/scripts/enable-disable-keyboard/icon_on"
Icoff="$HOME/Documents/scripts/enable-disable-keyboard/icon_off"
fconfig=".keyboard" 
id=$(xinput list --id-only 'AT Translated Set 2 keyboard')


function is-disabled() {     
	xinput --list --long | grep -A 1 "id=$1" | grep -q disabled 
}

if [ ! -f $fconfig ]; then
  echo "Creating config file"
  echo "enabled" > $fconfig
  var="enabled"
else
  read -r var< $fconfig
  echo "keyboard is : $var"
fi

if [ "$var" = "disabled" ]; then
  notify-send -i $Icon "Enabling keyboard..." \ "ON - Keyboard connected !";
  echo "enable keyboard..."
  xinput enable $id
  echo "enabled" > $fconfig
elif [ "$var" = "enabled" ]; then
  notify-send -i $Icoff "Disabling Keyboard" \ "OFF - Keyboard disconnected";
  echo "disable keyboard"
  xinput disable $id
  echo 'disabled' > $fconfig
fi
