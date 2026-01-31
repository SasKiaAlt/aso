Import-Module ActiveDirectory

$empleados = Import-Csv -Path "C:\Users\Administrator\Desktop\Practica6\empleados.csv"

foreach ($emp in $empleados) {
    $departamento = $emp.departamento
    $nombre = $emp.nombre
    $apellido = $emp.apellido

    $login = ($nombre + "." + $apellido).ToLower()
    $grupo = "G_$departamento"

    Add-ADGroupMember -Identity $grupo -Members $login

    Write-Host "Usuario $login añadido al grupo $grupo"
}
