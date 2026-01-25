[int]$num = Read-Host "Introduce un número"

if ($num -lt 0) {
    Write-Host "Error! El número debe ser mayor que 0"
    exit
}
Write-Host ""

Write-Host "Tabla de multiplicar del $num"
Write-Host "******************************"

for ($i = 1; $i -le 10; $i++) {
    $result = $num * $i
    Write-Host "$num x $i = $result"
}
