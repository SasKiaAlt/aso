$nombre = Read-Host "Introduce tu nombre" 
[int]$numero = Read-Host "Introduce un número entero"

if ($numero -lt 0) {
    Write-Host "Error! El número no puede ser negativo"
    exit
}

for ($i = 1; $i -le $numero; $i++) {
    Write-Host "$nombre"
}
