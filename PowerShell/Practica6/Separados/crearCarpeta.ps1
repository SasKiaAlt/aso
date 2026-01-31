$rutaRaiz = "C:\Empresa"

$directorios = Import-Csv -Path "C:\Users\Administrator\Desktop\Practica6\departamentos.csv"


New-Item -Path $rutaRaiz -ItemType Directory

foreach ($direct in $directorios) {
    $dirNom = Join-Path $rutaRaiz $direct.departamento

    New-Item -Path $dirNom -ItemType Directory
}

