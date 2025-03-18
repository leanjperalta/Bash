#!/bin/bash


URL="http://172.16.200.145:8080/rrhh/ingreso"
Texto="Empresa"

# Descargar el contenido de la URL
CONTENT=$(curl -s "$URL")

# Verificar si hubo un error al descargar el contenido
if [ $? -ne 0 ]; then
    echo "Error al descargar el contenido de la URL: $URL"
    exit 1
fi

# Buscar el texto en el contenido descargado
echo "$CONTENT" | grep -q "$Texto"

# Verificar si se encontró el texto
if [ $? -eq 0 ]; then
    echo "El texto '$Texto' fue encontrado en la URL: $URL"
else
    echo "El texto '$Texto' NO fue encontrado en la URL: $URL"
fi
