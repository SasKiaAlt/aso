Write-Host "*****Tramos impositivos para declaración de la renta******"

Write-Host " 1. Sueldo anual"
Write-Host "2. Sueldo mensual"

$opcion = Read-Host "Dime como quieres calcular el tipo impositivo"

switch ($opcion) {
      1 {
        #Sueldo anual
        [double]$sueldo = Read-Host "¿Cuál es tu sueldo anual?"
    }
    2 {
        #Calcular sueldo anual
        $mensual = Read-Host "¿Cuál es tu sueldo mensual?"
        $sueldo = [double]$mensual * 12
    }
}
Write-Host "Con un sueldo de $sueldo €"

if ($sueldo -lt 10000) {
    Write-Host "Tu tipo impositivo es: 5%"
} elseif ($sueldo -lt 20000) {
    Write-Host "Tu tipo impositivo es: 15%"
} elseif ($sueldo -lt 35000) {
    Write-Host "Tu tipo impositivo es: 20%"
} elseif ($sueldo -lt 60000) {
    Write-Host "Tu tipo impositivo es: 30%"
} else {
    Write-Host "Tu tipo impositivo es: 45%"
}
