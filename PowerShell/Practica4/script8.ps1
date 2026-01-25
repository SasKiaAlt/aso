[int]$altura = Read-Host "Introduce la altura del triángulo"

if ($altura -lt 1) {
    Write-Host "Error! La altura debe ser mayor que 0"
    exit
}

$num = 1

for ($i = 1; $i -le $altura; $i++) {
    $num = 2 * $i - 1
    $linea = ""

    while ($num -ge 1) {
        $linea += "$num "
        $num -= 2
    }
    Write-Host $linea.Trim()
}