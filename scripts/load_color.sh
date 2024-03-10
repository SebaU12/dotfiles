#!/bin/bash

file_path=$(head -n 1 ~/.cache/swww/Virtual-1)
echo $file_path

if [ -f "$file_path" ]; then
	wal -i "$file_path" -q
	killall waybar
	waybar	
else 
	echo "Ruta no valida"
fi
