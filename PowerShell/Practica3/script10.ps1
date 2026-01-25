Write-Host "Comprobación de puntos"
Write-Host "Los puntos recibidos pueden ser: 0.0, 0.4, 0.6 o más"

[double]$puntos = Read-Host "Introduce los puntos recibidos"

if ($puntos -lt 0) {
    Write-Host "Error! La puntuación no puede ser negativa"
    exit
}

if ($puntos -eq 0.0) {
    $nivel = "Inaceptable"
} elseif ($puntos -eq 0.4) {
    $nivel = "Aceptable"
} elseif ($puntos -ge 0.6) {
    $nivel = "Meritorio"
} else {
    Write-Host "Error! Puntuación no válida. Solo se permite 0.0, 0.4, 0.6 o más."
    exit
}

[double]$dinero = 2400 * $puntos

Write-Host "Nivel de rendimiento: $nivel"
Write-Host "Cantidad de dinero a recibir: $dinero €"
