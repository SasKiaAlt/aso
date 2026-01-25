$nombre = Read-Host "Introduce tu nombre" 
$sexo = Read-Host "Introduce tu sexo (H/M)"

$inicial = $nombre.Substring(0,1)

if (($sexo -ieq "M" -and $inicial -lt "M") -or ($sexo -ieq "H" -and $inicial -gt "N")) {
    Write-Host "Perteneces al GRUPO A"
} else {
    Write-Host "Perteneces al GRUPO B"
}
