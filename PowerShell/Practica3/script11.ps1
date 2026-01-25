[int]$edad = Read-Host "Introduce la edad del cliente"

if ($edad -lt 0) {
    Write-Host "Error!: la edad no puede ser negativa"
}

if ($edad -lt 4) {
    $precio = 0
} elseif ($edad -le 18) {
    $precio = 5
} else { 
    $precio = 10
}

Write-Host "Edad: $edad años"
Write-Host "Precio de la entrada: $precio €"
