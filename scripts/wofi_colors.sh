#!/bin/bash

tmp_file="$HOME/dotfiles/.config/wofi/wofi_style.css.tmp"
colors="$HOME/.cache/wal/colors"
final_file="$HOME/dotfiles/.config/wofi/style.css"

if [ ! -f "$tmp_file" ]; then
    echo "El archivo $tmp_file no existe."
    exit 1
fi

if [ ! -f "$final_file" ]; then
  echo "Creando archivo final"
  touch $final_file
  exit 1
else
  echo "Eliminando archivo"
  rm $final_file
  touch $final_file
fi

while IFS= read -r line; do
    words=($line)  
    mod_line=""
    echo $line
    for word in "${words[@]}"; do
        echo $word
        if [[ $word == TMP_COLOR* ]]; then
            flag=false
            color="${word#TMP_COLOR}" 
            len_color=$(echo -n "$color" | wc -c)
            if [ $len_color -gt 1 ] && [[ "${color: -1}" != [0-9] ]]; then 
              echo "SE CUMPLE QUE ES MAS: $word"
              color="${color%?}"
              flag=true
            fi
            color_line="${color}p"
            echo $color_line
            color_code="$(sed -n "${color_line}" "${colors}")"
            echo "Contenido: $color_code"
            if $flag ; then
              color_code="${color_code};"
            fi
            mod_line+=" $color_code"
        elif [[ $word == RGB_TMP_COLOR* ]]; then
            color="${word#RGB_TMP_COLOR}" 
            color_line="${color}p"
            color_code="$(sed -n "${color_line}" "${colors}")"
            format_color="${color_code:1}"
            echo $format_color
            red=$((16#${format_color:0:2}))
            green=$((16#${format_color:2:2}))
            blue=$((16#${format_color:4:2}))
            mod_line+=" ${red} , ${green} , ${blue}"
        else 
            mod_line+=" $word"
        fi
    done
    echo "$mod_line" >> "$final_file"
done < "$tmp_file"
