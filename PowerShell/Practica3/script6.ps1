$ruta = Read-Host "¿Qué ruta deseas comprobar?"

if (Test-Path $ruta -PathType Container) {
    Write-Host "La ruta indicada es un DIRECTORIO"
    Write-Host "A continuación de lista el contenido de forma recursiva:"
    Write-Host "--------------------------------------------------------"

    Get-ChildItem -Path $ruta -Recurse
} elseif (Test-Path $ruta -PathType Leaf) {
    Write-Host "La ruta que es pasado es de un ARCHIVO"
} else {
    Write-Host "La ruta que es pasado NO es un directorio o NO existe"
 }
