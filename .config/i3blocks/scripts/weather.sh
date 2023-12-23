#!/bin/bash

# Exit if ping to api server fails
if ! ping -c 1 wttr.in &> /dev/null; then
    exit 1
fi

# Fetch weather data
weather_data=$(curl -s wttr.in/montreal?format="%t+%S+%d+%C")

IFS=' ' read -r temperature sunrise dusk condition <<< "$weather_data"

if [ $(date +%s) -lt $(date -d "$dusk" +%s) ] && [ $(date +%s) -gt $(date -d "$sunrise" +%s) ]; then
	is_day=1
else
	is_day=0
fi

condition=$(echo $condition | cut -f1 -d",")

case "$condition" in
  "Clear")
    if [ $is_day -eq 1 ]; then
      icon=""
    else
      icon=""
    fi
    ;;
  "Sunny")
    if [ $is_day -eq 1 ]; then
      icon=""
    else
      icon=""
    fi
    ;;
  "Partly cloudy")
    if [ $is_day -eq 1 ]; then
      icon=""
    else
      icon=""
    fi
    ;;
  "Cloudy")
    icon="󰅟"
    ;;
  "Overcast")
    icon=""
    ;;
  "Mist")
    icon="󰖌"
    ;;
  "Patchy rain possible")
    icon="󰖌"
    ;;
  "Patchy snow possible")
    icon=""
    ;;
  "Patchy sleet possible")
    icon="󰖌"
    ;;
  "Patchy freezing drizzle possible")
    icon="󰖌"
    ;;
  "Thundery outbreaks possible")
    icon="󱐋"
    ;;
  "Blowing snow")
    icon=""
    ;;
  "Blizzard")
    icon=""
    ;;
  "Fog")
    icon="󰖑"
    ;;
  "Freezing fog")
    icon="󰖑"
    ;;
  "Light drizzle")
    icon="󰖌"
    ;;
  "Drizzle")
    icon="󰖌"
    ;;
  "Freezing drizzle")
    icon="󰖌"
    ;;
  "Heavy freezing drizzle")
    icon="󰖌"
    ;;
  "Patchy rain")
    icon="󰖌"
    ;;
  "Rain")
    icon="󰖌"
    ;;
  "Light rain")
    icon="󰖌"
    ;;
  "Moderate rain at times")
    icon="󰖌"
    ;;
  "Moderate rain")
    icon="󰖌"
    ;;
  "Heavy rain at times")
    icon="󰖌"
    ;;
  "Heavy rain")
    icon="󰖌"
    ;;
  "Light freezing rain")
    icon="󰖌"
    ;;
  "Freezing rain")
    icon="󰖌"
    ;;
  "Sleet")
    icon="󰖌"
    ;;
  "Moderate or heavy sleet")
    icon="󰖌"
    ;;
  "Patchy snow")
    icon=""
    ;;
  "Snow")
    icon=""
    ;;
  "Light snow")
    icon=""
    ;;
  "Moderate snow")
    icon=""
    ;;
  "Heavy snow")
    icon=""
    ;;
  "Ice pellets")
    icon=""
    ;;
  "Light rain shower")
    icon="󰖌"
    ;;
  "Rain shower")
    icon="󰖌"
    ;;
  "Moderate or heavy rain shower")
    icon="󰖌"
    ;;
  "Torrential rain shower")
    icon="󰖌"
    ;;
  "Light sleet showers")
    icon="󰖌"
    ;;
  "Sleet showers")
    icon="󰖌"
    ;;
  "Moderate or heavy sleet showers")
    icon="󰖌"
    ;;
  "Light snow showers")
    icon=""
    ;;
  "Snow showers")
    icon=""
    ;;
  "Moderate or heavy snow showers")
    icon=""
    ;;
  "Patchy light rain with thunder")
    icon="󱐋"
    ;;
  "Moderate or heavy rain with thunder")
    icon="󱐋"
    ;;
  "Patchy light snow with thunder")
    icon="󱐋"
    ;;
  "Moderate or heavy snow with thunder")
    icon="󱐋"
    ;;
  *)
		icon="$condition"
    ;;
esac

# Display in i3blocks format with Nerd Font Icons
echo "$icon $temperature"


