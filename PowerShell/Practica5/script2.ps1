$ruta = "C:\Users\Administrator\Desktop\Practica5\usuarios.csv"

$usuarios = Import-Csv $ruta

foreach ($usuario in $usuarios) {
    Write-Host "Nombre: $($usuario.nombre)"
    Write-Host "Apellido: $($usuario.apellidos)"
    Write-Host "Grupo: $($usuario.grupo)"
    Write-Host "*************************"
}
