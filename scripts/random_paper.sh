#!/bin/bash

file_path=$(head -n 1 ~/.cache/swww/Virtual-1)
echo $file_path

wallpaper_dir="$HOME/Wallpaper"
if [ -d "$wallpaper_dir" ]; then
	wallpapers=("$wallpaper_dir"/*)
	echo $wallpapers
	if [ ${#wallpapers[@]} -gt 0 ]; then
		while true; do
			random_wp="${wallpapers[RANDOM % ${#wallpapers[@]}]}"
			if [ "$random_wp" != "$file_path" ]; then
				swww img $random_wp --transition-step 20
				wal -a 75 -i "$random_wp" -q
				killall waybar
				waybar
				echo "Ruta del wallpaper: $random_wp"
				break
			fi
		done
	else 
		echo "No wallpaper"
	fi
else 
	echo "Dir not found"
fi
