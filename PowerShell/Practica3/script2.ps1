[int]$edad = Read-Host "¿Cuántos años tienes?"

if ($edad -lt 18) {
    Write-Host "Eres MENOR de edad"
} else {
    Write-Host "Eres MAYOR de edad"
}
