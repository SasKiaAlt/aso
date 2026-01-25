[double]$num1 = Read-Host "Introduce el primer número: "
[double]$num2 = Read-Host "Introduce el segundo número: "

$suma = $num1 + $num2
$resta = $num1 - $num2
$multi = $num1 * $num2

if ($num2 -ne 0) {
    $divi = $num1 / $num2
} else {
    $divi = "No se puede dividir por 0"
}

Write-Host "Suma: $suma"
Write-Host "Resta: $resta"
Write-Host "Multiplicación: $multi"
Write-Host "División: $divi"