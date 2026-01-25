[int]$numero = Read-Host "Introduce un número entero positivo"

if ($numero -lt 0) {
    Write-Host "Error! El número debe ser positivo"
    exit
}

for ($i = $numero; $i -ge 0; $i--) {
    if ($i -eq 0) {
        Write-Host "$i"
    } else {
        Write-Host "$i," -NoNewline
    }
}

