#!/bin/sh

DEFAULT_SOURCE_INDEX=$(pactl list sources short | grep "RUNNING" | grep "input" | awk '{print $1;}')

display_volume() {
	if [ -z "$DEFAULT_SOURCE_INDEX" ]; then
	  if [ -z "$volume" ]; then
	    # if no volume was returned then no mic is available
	    echo "󱦉 No Mic"
	  else
	  	# if source index is empty but volume has value then hide the module
	    echo ""
	  fi
	else
	  volume="${volume//[[:blank:]]/}" 
	  if [ "$mute" == "yes" ]; then
	    echo "󰍭"
	  elif [ "$mute" == "no" ]; then
	    echo "󰍬 $volume"
	  else
	    echo "󰍬 $volume!"
	  fi
	fi
}

case $1 in
	"show-vol")
		if [ -z "$2" ]; then
  			volume=$(pactl list sources | grep "Source #$DEFAULT_SOURCE_INDEX" -A 9 | grep "Volume" | awk -F/ '{print $2}')
  			mute=$(pactl list sources | grep "Source #$DEFAULT_SOURCE_INDEX" -A 8 | grep "Mute" | awk '{print $2}')
			display_volume
		else
  			volume=$(pactl list sources | grep "$2" -A 9 | grep "Volume" | awk -F/ '{print $2}')
  			mute=$(pactl list sources | grep "$2" -A 8 | grep "Mute" | awk '{print $2}')
			display_volume
		fi
		;;
	"inc-vol")
		if [ -z "$2" ]; then
			pactl set-source-volume $DEFAULT_SOURCE_INDEX +5%
		else
			pactl set-source-volume $2 +5%
		fi
		;;
	"dec-vol")
		if [ -z "$2" ]; then
			pactl set-source-volume $DEFAULT_SOURCE_INDEX -5%
		else
			pactl set-source-volume $2 -5%
		fi
		;;
	"mute-vol")
		if [ -z "$2" ]; then
			pactl set-source-mute $DEFAULT_SOURCE_INDEX toggle
		else
			pactl set-source-mute $2 toggle
		fi
		;;
	*)
		echo "Invalid script option"
		;;
esac
