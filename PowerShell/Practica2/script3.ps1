[double]$horas = Read-Host "¿Cuantas son las horas trabajadas? "
[double]$precioh = Read-Host "¿Cual es el precio de la hora? "

$salario = $horas * $precioh

Write-Host "Se le tiene que pagar: $salario"

