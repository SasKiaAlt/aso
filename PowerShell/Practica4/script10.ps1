do { 
    Write-Host ""
    Write-Host "***************MENU****************"
    Write-Host "      1. Crear una carpeta"
    Write-Host "      2. Crear un fichero"
    Write-Host "      3. Cambiar el nombre de un fichero o carpeta"
    Write-Host "      4. Borrar un archivo o carpeta"
    Write-Host "      5. Verificar si existe un fichero o carpeta"
    Write-Host "      6. Mostrar el contenido de un directorio"
    Write-Host "      7. Mostrar la fecha y la hora actuales"
    Write-Host "      0. Salir"
    Write-Host "************************************"

    $opcion = Read-Host "Elige una opción (0 al 7)"

    switch ($opcion) {
        1 {
            $ruta = Read-Host "Introduce la ruta de la nueva carpeta"
            New-Item -Path $ruta -ItemType Directory
            Write-Host "Carpeta creada en la ruta $ruta"
        }
        2 {
            $ruta = Read-Host "Introduce la ruta del nuevo fichero"
            New-Item -Path $ruta -ItemType File
            Write-Host "Fichero creado en la ruta $ruta"
        }
        3 {
            $ruta = Read-Host "Introduce la ruta del fichero o carpeta"
            $nuevoNom = Read-Host "Introduce el nuevo nombre"
            Rename-Item -Path $ruta -NewName $nuevoNom
            Write-Host "Se ha cambiado el nombre"
        }
        4 {
            $ruta = Read-Host "Introduce la ruta del archivo o carpeta a borrar"
            Remove-Item -Path $ruta -Recurse -Force
            Write-Host "Elemento borrado."
        }
        5 {
            $ruta = Read-Host "Introduce la ruta a verificar"
            if (Test-Path $ruta) {
                Write-Host "El archivo o carpeta EXISTE"
            } else {
                Write-Host "El archivo o carpeta NO existe."
            }
        }
        6 {
            $ruta = Read-Host "Introduce la ruta del directorio"
            if (Test-Path $ruta -PathType Container) {
                Get-ChildItem -Path $ruta
            } else {
                Write-Host "No es un directorio válido"
            }
        }
        7 {
            Get-Date
        }
        0 {
            Write-Host "Saliendo del programa....."
            Write-Host "¡Hasta la próxima!"
        }
        default {
            Write-Host "Opción NO válida!"
        }
    }
} while ($opcion -ne 0)
