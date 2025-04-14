CSV ETL Script
Este proyecto contiene un conjunto de scripts escritos en Bash para procesar archivos CSV de manera eficiente. 
Su función principal es realizar un proceso de ETL (Extract, Transform, Load) para limpiar y validar datos, asegurando que los datos sean consistentes y estén listos para su uso en otros sistemas.

Características del Proyecto
Validación de datos: Verifica la validez de los datos, como ID, fecha, nombre y correo electrónico.

Manejo de errores: Los registros incorrectos se almacenan en una carpeta de errores para su posterior análisis.

Archivo limpio: Los registros válidos se exportan a un archivo limpio para su posterior procesamiento.

Soporte para múltiples archivos: El script puede manejar múltiples archivos CSV de entrada.

Funciones Principales
1. validate_id(id)
Descripción: Valida que el ID sea un número entero no vacío.

Entrada: ID (cadena de texto).

Salida: Retorna 0 si es válido, de lo contrario 1.

2. validate_empty_field(id, nombre, fecha, email)
Descripción: Verifica que ninguno de los campos proporcionados esté vacío.

Entrada: ID, Nombre, Fecha, Email.

Salida: Retorna 0 si todos los campos son válidos, de lo contrario 1.

3. validate_date(fecha)
Descripción: Verifica si la fecha sigue el formato YYYY-MM-DD.

Entrada: Fecha (cadena de texto).

Salida: Retorna 0 si la fecha es válida, de lo contrario 1.

4. validate_email(email)
Descripción: Valida que el email tenga un formato correcto.

Entrada: Email (cadena de texto).

Salida: Retorna 0 si el email es válido, de lo contrario 1.

Cómo Usar
Pre-requisitos
Linux/Unix: Se necesita tener acceso a una terminal de comandos.
Bash: Este script está diseñado para ejecutarse en un entorno Bash.
Git: Es necesario tener Git instalado para clonar el repositorio y gestionar el código fuente.

Instalación
Clona el repositorio en tu máquina local:
git clone https://github.com/tu_usuario/csv-etl-shell.git
Navega a la carpeta de scripts:
cd csv-etl-shell/scripts
Asegúrate de que el archivo etl_raw_users_data.sh tenga permisos de ejecución:
chmod +x etl_raw_users_data.sh
Ejecuta el script con:
./etl_raw_users_data.sh

Ejecución Automática (Cron Job)
Puedes configurar este script para que se ejecute automáticamente a intervalos regulares usando un cron job.
Abre el archivo cron para editar:
crontab -e
Agrega una línea para ejecutar el script a la hora que desees (por ejemplo, todos los días a las 3:00 AM):
0 3 * * * /ruta/a/tu/proyecto/csv-etl-shell/scripts/etl_raw_users_data.sh

Estructura de Archivos
inputs/: Carpeta que contiene los archivos CSV de entrada.
outputs/: Carpeta donde se guardan los archivos procesados.
logs/: Carpeta donde se guardan los registros de las validaciones y errores.

