[int]$num = Read-Host "Dime un número"


if ($num % 2 -eq 0) {
    Write-Host "El número $num es PAR"
} else {
    Write-Host "El número $num es IMPAR"
}

