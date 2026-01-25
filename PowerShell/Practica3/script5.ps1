$ruta = Read-Host "¿Qué ruta deseas comprobar?"

if (Test-Path $ruta) {
    Write-Host "La ruta '$ruta' EXISTE"
} else {
    Write-Host "La ruta '$ruta' NO existe"
}
