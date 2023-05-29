#!/bin/bash

#Copia de XML previa
xml_folder="Files"
destination_folder="$HOME/.local/share/Steam/steamapps/common/Grid/system/"

cp -f "$xml_folder"/*.xml "$destination_folder"

# Obtener el número de cores lógicos del CPU
cores=$(nproc --all)

# Testeo del Script
#cores=64

# Definir los valores válidos de cores
valid_cores=(8 12 16 20 24 28 32)
echo "This mod allows Race Driver: Grid to use 2,4,6,8,12,16,20,24,28 or 32 cores."

# Definir el valor de grid_cores basado en el número de cores
if [ $cores -gt 32 ]; then
    grid_cores=32
    echo "Your CPU has $cores, it exceeds the max core count for the game. Some cores won't be used."
elif [ $cores -lt 8 ]; then
    grid_cores=8
    echo "Race Driver: Grid already supports your CPU core count."
else
    # Verificar si el número de cores está en la lista de valid_cores
    if [[ " ${valid_cores[@]} " =~ " $cores " ]]; then
        grid_cores=$cores
    else
        # Obtener el valor de valid_cores inmediatamente inferior a $cores
        for i in "${valid_cores[@]}"; do
            if [ $i -lt $cores ]; then
                grid_cores=$i
            fi
        done
    fi
fi

# Ruta del archivo de plantilla y archivo de salida
template_file="Template.xml"
output_file="$HOME/.local/share/Steam/steamapps/common/Grid/system/hardware_settings_restrictions.xml"

# Reemplazar el valor "_Y_" por el valor de grid_cores en la plantilla
sed "s/_Y_/$grid_cores/g" "$template_file" > "$output_file"

if [ $cores -ge 8 ]; then
    echo "Your CPU has $cores cores. Race Driver: Grid will use $grid_cores cores."
fi
