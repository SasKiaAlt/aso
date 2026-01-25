[int]$num1 = Read-Host "¿Cuál es el primer número entero?"
[int]$num2 = Read-Host "¿Cuál es el segundo número entero?"


if ($num1 -lt $num2) {
    Write-Host "El número $num1 es más PEQUEÑO que $num2"
} elseif ($num1 -eq $num2) {
    Write-Host "Ambos números son IGUALES"
} else {
    Write-Host "El número $num1 es más GRANDE que $num2"
    }