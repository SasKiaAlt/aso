$numsecret = 56

Write-Host "Juego de adivinar el número (entre 0 y 100)"
Write-Host "*********************************************"

$adivina = $false

while (-not $adivina) {
    [int]$intenta = Read-Host "Introduce un número"

    if ($intenta -lt $numsecret) {
        Write-Host "El número secreto es MAYOR"
    } elseif ($intenta -gt $numsecret) {
        Write-Host "El número secreto es MENOR"
    } else { 
        Write-Host "¡Enhorabuena! Has adivinado el número: $numsecret"
        $adivina = $true
    }
}
