[int]$num = Read-Host "Introduce un número entero positivo"

if ($num -lt 1) {
    Write-Host "Error! El número debe ser mayor que 0"
    exit
}

$primero = $true

for ($i = 1; $i -le $num; $i += 2) {
    if ($primero) {
        Write-Host "$i" -NoNewline
        $primero = $false
    } else {
        Write-Host ", $i" -NoNewline
    }
}
