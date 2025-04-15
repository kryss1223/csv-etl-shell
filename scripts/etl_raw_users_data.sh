#!/bin/bash

# El programa se para al encontrar error
set -e
set -u

# Buenas practicas, definir paths al inicio para mejor orden
INPUT_DIR="../input"
OUTPUT_DIR="../output"
LOG_DIR="../logs"
DATE=$(date +%F)

# Buenas practicas, crear el directorio si no existe
mkdir -p "$INPUT_DIR" "$OUTPUT_DIR" "$LOG_DIR"

# VALIDACIONES

# Campo vacío
validate_empty_field(){    
    for var in "$@"; do
        if [[ -z "$var" ]]; then
            return 1
        fi
    done
    return 0
}
# Validación de ID
validate_id(){
    if [[ -z "$id" || ! "$id" =~ ^[0-9]+$ ]]; then
        return 1
    fi
    return 0
}

# Validación de fecha
validate_date(){
    if [[ ! "$fecha" =~ ^[0-9]{4}-[0-9]{2}-[0-9]{2}$ ]]; then
        echo "Fecha invalida: $fecha"
        return 1
    fi
    return 0
}

# Validación de email
validate_email(){
    if [[ ! "$email" =~ ^[a-zA-Z0-9.+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$ ]]; then
        echo "Email invalido: $email"
        return 1
    fi
    return 0
}


# PROCESAMIENTO ARCHIVOS
for file in "$INPUT_DIR"/*.csv
do
    [ -e "$file" ] || {
        echo "No files in $INPUT_DIR"
        exit 1
    }

    # Archivo base CREAR PARA LOG Y OUTPUT UN PATRON MEJOR
    filename=$(basename "$file") 
    
    while IFS=',' read -r id nombre fecha email
    do
        has_error=false

	for campo in id nombre fecha email; do
	    valor="${!campo}"
	    case "$campo" in
		id)
		    if ! validate_id "$valor"; then
		        echo "ID inválido: $valor"
		        has_error=true
		    fi
		    ;;
		nombre)
		    if [ -z "$valor" ]; then
		        echo "Nombre vacío"
		        has_error=true
		    fi
		    ;;
		fecha)
		    if ! validate_date "$valor"; then
		        echo "Fecha inválida: $valor"
		        has_error=true
		    fi
		    ;;
		email)
		    if ! validate_email "$valor"; then
		        echo "Email inválido: $valor"
		        has_error=true
		    fi
		    ;;

             esac
         done
     if [ "$has_error" = false ]; then
     echo "$id,$nombre,$fecha,$email" >> "$OUTPUT_DIR/clean_${filename}"
     else
     echo "$id,$nombre,$fecha,$email" >> "$LOG_DIR/log_${filename}"
     fi
    done < "$file"
done

