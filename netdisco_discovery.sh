#!/bin/bash

# Definir el rango de subnets
START=1
END=40
NETDISCO_BIN="/home/netdisco/bin/netdisco-do"

# Recorrer cada subnet en el rango
for i in $(seq $START $END); do
    SUBNET="172.27.${i}.0/29"
    echo "🔍 Descubriendo dispositivos en: $SUBNET"
    
    # Ejecutar el descubrimiento en cada subnet
    $NETDISCO_BIN -D discover -d "$SUBNET"
    
    # Esperar 5 segundos entre cada ejecución (ajusta según necesidad)
    sleep 5
done

echo "✅ Descubrimiento completado."
