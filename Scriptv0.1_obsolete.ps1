$pingCount = 4

# Function to simulate a delay
function Delay {
    param($seconds)
    Start-Sleep -Seconds $seconds
}

Clear-Host
            Write-Host "Applying NEW MULTITHREAD FIX AND UPDATING INGAME OPTIONS"
			Write-Host ""
			Write-Host "WARNING - YOUR INGAME SETTINGS WILL RESET"
			Write-Host ""
            Delay 3
            Copy-Item -Path ".\Files\*" -Destination ".\" -Recurse -Force -ErrorAction SilentlyContinue
            Remove-Item -Path "$env:userprofile\Documents\Codemasters\GRID\hardwaresettings\*.xml" -Force -ErrorAction SilentlyContinue
			
			# Obtener el número de cores lógicos del CPU
			$cores = (Get-WmiObject -Class Win32_ComputerSystem).NumberOfLogicalProcessors

			# Testeo del Script
			#$cores = 64

			# Definir los valores válidos de cores
			$valid_cores = 8, 12, 16, 20, 24, 28, 32

			# Definir el valor de grid_cores basado en el número de cores
			if ($cores -gt 32) {
			$grid_cores = 32
			Write-Host "Your CPU has $cores cores, but the game is limited to 32 cores, so that will be the max core count used."
			Delay 4
			}
			elseif ($cores -lt 8) {
			$grid_cores = 8
			Write-Host "Race Driver: Grid already supports your CPU core count."
			Delay 4
			}
			else {
			# Verificar si el número de cores está en la lista de valid_cores
			if ($valid_cores -contains $cores) {
				$grid_cores = $cores
			}
			else {
			# Obtener el valor de valid_cores inmediatamente inferior a $cores
			$grid_cores = $valid_cores | Where-Object { $_ -lt $cores } | Select-Object -Last 1
			}
			}

			# Ruta del archivo de plantilla y archivo de salida
			$template_file = "Template.xml"
			$output_file = "system\hardware_settings_restrictions.xml"

			# Leer el contenido de la plantilla
			$template_content = Get-Content $template_file -Raw

			# Reemplazar el valor "_Y_" por el valor de grid_cores en la plantilla
			$updated_content = $template_content -replace "_Y_", $grid_cores

			# Guardar el contenido actualizado en el archivo de salida
			$updated_content | Set-Content $output_file
			
			Remove-Item -Path "Template.xml" -Force -ErrorAction SilentlyContinue

			Write-Host "Your CPU has $cores cores. Race Driver: Grid will use $grid_cores cores."
			Delay 3
			Write-Host ""
			Write-Host "HAPPY GAMING!! GOODBYE :-)"
			Delay 3
