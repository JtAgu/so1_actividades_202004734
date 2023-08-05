#!/bin/bash
# Leer  GITHUB_USER
read -p "Ingrese su nombre de usuario de GitHub: " GITHUB_USER

# Consultar URL
API_URL="https://api.github.com/users/$GITHUB_USER"
JSON_RESPONSE=$(curl -s $API_URL)


github_user=$(echo $JSON_RESPONSE | jq -r '.login')
id=$(echo $JSON_RESPONSE | jq -r '.id')
created_at=$(echo $JSON_RESPONSE | jq -r '.created_at')

# Imprimir en pantalla
echo "Hola $github_user. User ID: $id. Cuenta fue creada el: $created_at."

# Crear un log file en /tmp/<fecha>/saludos.log
fecha=$(date +"%Y-%m-%d")
log_dir="/tmp/$fecha"
log_file="$log_dir/saludos.log"

#en caso no exista el directorio
mkdir -p $log_dir

# Colocar la salida en el directorio especificado
echo "Hola $github_user. User ID: $id. Cuenta fue creada el: $created_at." >> $log_file

# Mensaje final de salida
echo "Tareas completadas. Se ha creado un archivo de registro en: $log_file"
