#!/bin/bash

# Script para configurar cron job

SCRIPT_PATH="/home/csantos/proyectos/csv-etl-shell/scripts/etl_raw_users_data.sh"

# El comando cron para ejecutar el script cada día a las 10 AM
CRON_JOB="0 10 * * * $SCRIPT_PATH"

# Agregar el cron job si no existe
(crontab -l 2>/dev/null; echo "$CRON_JOB") | crontab -

echo "Cron job configurado para ejecutar el script cada día a las 10 AM."
