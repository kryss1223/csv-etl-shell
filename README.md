📂 CSV ETL Shell Script
Este proyecto contiene un conjunto de scripts escritos en Bash para procesar archivos CSV de forma eficiente. Su función principal es realizar un proceso de ETL (Extract, Transform, Load) para limpiar y validar datos, asegurando que estén listos para su uso en otros sistemas.

✨ Características:
      ✅ Validación de datos: ID, fecha, nombre y correo electrónico.
      🚨 Manejo de errores: Registros inválidos se almacenan en una carpeta separada.
      🧼 Generación de archivo limpio: Solo los registros válidos se exportan.
      📂 Soporte para múltiples archivos CSV automáticamente.

🧠 Funciones Principales
  validate_id(id)
  ✔️ Valida que el ID sea un número entero no vacío.
  🔁 Retorna 0 si es válido, 1 si no lo es.
  
  validate_empty_field(id, nombre, fecha, email)
  🔍 Verifica que ningún campo esté vacío.
  🔁 Retorna 0 si todos los campos son válidos.
  
  validate_date(fecha)
  🗓️ Verifica el formato de fecha YYYY-MM-DD.
  🔁 Retorna 0 si es válida.
  
  validate_email(email)
  📧 Valida que el email tenga un formato correcto.
  🔁 Retorna 0 si es válido.

⚙️ Cómo Usar
  📋 Pre-requisitos
  Linux/Unix con terminal
  Bash
  Git

🛠 Instalación
  git clone https://github.com/tu_usuario/csv-etl-shell.git
  cd csv-etl-shell/scripts
  chmod +x etl_raw_users_data.sh
  ./etl_raw_users_data.sh

⏰ Ejecución Automática con Cron
  Puedes automatizar el script con un cron job:
  crontab -e
  Ejemplo: ejecutar todos los días a las 3:00 AM
  0 3 * * * /ruta/a/csv-etl-shell/scripts/etl_raw_users_data.sh

🗂 Estructura del Proyecto
  csv-etl-shell/
  ├── inputs/     # Archivos CSV de entrada
  ├── outputs/    # Archivos limpios procesados
  ├── logs/       # Logs de validación y errores
  ├── corruptfiles/ # Registros con errores críticos
  └── scripts/    # Scripts principales del proyecto
