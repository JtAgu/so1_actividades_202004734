Universidad de San Carlos de Guatemala

Facultad de Ingeniería

Escuela de Ciencias y Sistemas

Sistemas Operativos 1

Segundo Semestre 2023

# <center>**SERVICIOS SYSTEMD UNIT**</center>



## Paso 1: Crea el script
Crea un archivo para tu script en el directorio que desees. Por ejemplo, puedes nombrarlo saludo_script.sh. Abre el archivo con tu editor de texto preferido y agrega el siguiente contenido:

    #!/bin/bash
    while true; do
        echo "Hola, este es un saludo desde el script."
        echo "La fecha actual es: $(date)"
        sleep 10
    done

## Paso 2: Crea el archivo de unidad de systemd
Ahora, crea un archivo de unidad de systemd para el servicio. Abre un terminal y ejecuta:

    sudo nano /etc/systemd/system/saludo.service

Dentro del archivo, agrega el siguiente contenido:

    [Unit]
    Description=Saludo y fecha actual service
    After=network.target

    [Service]
    Type=simple
    ExecStart=/so1_actividades_202004734/actividad3/saludo_script.sh

    [Install]
    WantedBy=multi-user.target

## Paso 3: Habilita y arranca el servicio
Una vez que hayas creado el archivo de unidad de systemd, ejecuta los siguientes comandos para habilitar y arrancar el servicio:


    sudo systemctl daemon-reload
    sudo systemctl enable saludo.service
    sudo systemctl start saludo.service

## Paso 4: Verifica el estado del servicio
Puedes verificar el estado del servicio con el siguiente comando:

    sudo systemctl status saludo.service


