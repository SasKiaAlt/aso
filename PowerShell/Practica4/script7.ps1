[int]$altura = Read-Host "Introduce la altura del triangulo"

if ($altura -lt 1) { 
    Write-Host " No puede ser menor de 0"
    exit
}

for ($i = 1; $i -le $altura; $i++) {
    $linea = ""

    for ($j = 1; $j -le $i; $j++) {
        $linea += "* "
    }

    Write-Host $linea.TrimEnd()
}
