URL="http://172.16.200.145:8080/rrhh/ingreso"
texto="Empresa222"
PAGE=`curl "$URL"` | tr '[:upper:]' '[:lower:]'

if [[ $PAGE =~ $texto]]; then
    echo "texto encontrado"
fi