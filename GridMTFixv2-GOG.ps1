$pingCount = 4
$ntcorepatch = "https://ntcore.com/files/4gb_patch.zip"
$GridMTFix = "https://github.com/xatornet/GridMTFix/releases/download/v0.1/GridMTFix_Win.zip"

# Function to simulate a delay
function Delay {
    param($seconds)
    Start-Sleep -Seconds $seconds
}
Clear-Host
# Check if grid.bak exists
    Write-Host "Checking if Exe file has been patched..."
	Write-Host ""
	Delay 3
if (Test-Path -Path "grid.bak") {
    Write-Host "Exe file has been already patched. No further work needed."
	Write-Host "Loading script..."
    Delay 4
}


else {
	Clear-Host
    Write-Host "Exe file has NOT been patched. Making a backup and patching."
	Delay 3
	Write-Host ""
	Write-Host "Patching 4GB Ram Access..."
	Delay 3
	Write-Host ""
	Write-Host "Downloading Required Files"
	New-Item -ItemType Directory -Path ".\PatchingD" | Out-Null
	Invoke-WebRequest -Uri $ntcorepatch -OutFile ".\PatchingD\NTCore4GB.zip"
	Expand-Archive ".\PatchingD\NTCore4GB.zip" ".\PatchingD\" | Out-Null
	Delay 3
	Start-Process -Wait ".\PatchingD\4gb_patch.exe" "grid.exe" | Out-Null
	Rename-Item -Path "grid.exe .Backup" "grid.bak"
	Write-Host ""
	Write-Host "Exe Patched"
	Remove-Item -Path ".\PatchingD" -Force -Recurse -ErrorAction SilentlyContinue
	Delay 3
	Clear-Host
	Write-Host ""
	Write-Host "Loading script..."
    Delay 4
}

			Clear-Host
			Write-Host "Downloading Required Files"
			New-Item -ItemType Directory -Path ".\PatchingD" | Out-Null
			Invoke-WebRequest -Uri $GridMTFix -OutFile ".\PatchingD\GridMTFix.zip"
			Expand-Archive ".\PatchingD\GridMTFix.zip" ".\PatchingD\" | Out-Null
			Write-Host ""
			Write-Host "Applying NEW MULTITHREAD FIX AND UPDATING INGAME OPTIONS"
			Write-Host ""
			Write-Host "WARNING - YOUR INGAME SETTINGS WILL RESET"
			Write-Host ""
            Delay 3
            Copy-Item -Path ".\PatchingD\Files\*" -Destination ".\" -Recurse -Force -ErrorAction SilentlyContinue
            Remove-Item -Path "$env:userprofile\Documents\Codemasters\GRID\hardwaresettings\*.xml" -Force -ErrorAction SilentlyContinue
			
			# Obtener el número de cores lógicos del CPU
			$cores = (Get-WmiObject -Class Win32_ComputerSystem).NumberOfLogicalProcessors

			# Testeo del Script
			#$cores = 64

			# Definir los valores válidos de cores
			$valid_cores = 1, 2, 4, 6, 8, 12, 16, 20, 24, 28, 32

			# Obtener el valor de valid_cores inmediatamente inferior a $cores
			$grid_cores = $valid_cores | Where-Object { $_ -le $cores } | Select-Object -Last 1

			# Ruta del archivo de plantilla y archivo de salida
			$template_file = "Template.xml"
			$output_file = "system\hardware_settings_restrictions.xml"

			# Leer el contenido de la plantilla
			$template_content = Get-Content $template_file -Raw

			# Borrar todas las lineas que empiezan por comentario menos la correspondiente al número de cores
			$grid_cores_d3 = "{0:D3}" -f $grid_cores
			$updated_content = $template_content -replace "<!-- (?!$grid_cores_d3).*", ""

			# Guardar el contenido actualizado en el archivo de salida
			$updated_content | Set-Content $output_file
			
			Remove-Item -Path "Template.xml" -Force -ErrorAction SilentlyContinue
			Remove-Item -Path ".\PatchingD" -Force -Recurse -ErrorAction SilentlyContinue
			Remove-Item -Path "GridMTFix.zip" -Force -ErrorAction SilentlyContinue
			
			Write-Host "Your CPU has $cores cores. Race Driver: Grid will use $grid_cores cores."
			Delay 3
			Write-Host ""
			Write-Host "HAPPY GAMING!! GOODBYE :-)"
			Delay 3
