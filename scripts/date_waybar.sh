#!/bin/bash

# Desactivar el búfer de salida
exec 3>&1

while true; do
  # Obtener la hora actual en UTC
  date_format=$(date "+%d/%m/%y")

  # Crear el formato JSON utilizando printf y limpiar el búfer
  printf '{"text": "%s", "class": "white"}\n' "$date_format" | stdbuf -oL jq --unbuffered --compact-output . >&3

  # Esperar 1 segundo antes de la siguiente iteración
  sleep 1000000
done

