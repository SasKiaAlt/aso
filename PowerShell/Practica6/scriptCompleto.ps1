Import-Module ActiveDirectory

$OUraiz = "Empresa"
$DNraiz = "OU=Empresa,DC=empresa,DC=local"

$empleados = Import-Csv -Path "C:\Users\Administrator\Desktop\Practica6\empleados.csv"

$departamentos = Import-Csv -Path "C:\Users\Administrator\Desktop\Practica6\departamentos.csv"

#Crear los grupos
foreach ($dept in $departamentos) {
    $nombreDept = $dept.departamento
    $nombreGrupo = "G_$nombreDept"
    $ouGrupo = "OU=$nombreDept,$DNraiz"

    New-ADGroup -Name $nombreGrupo -GroupCategory Security -GroupScope Global -Path $ouGrupo

    Write-Host "Grupo $nombreGrupo creado."
}

#Metemos los usuarios en los grupos
foreach ($emp in $empleados) {
    $departamento = $emp.departamento
    $nombre = $emp.nombre
    $apellido = $emp.apellido

    $login = ($nombre + "." + $apellido).ToLower()
    $grupo = "G_$departamento"

    Add-ADGroupMember -Identity $grupo -Members $login

    Write-Host "Usuario $login añadido al grupo $grupo"
}

#Creamos las carpetas

$rutaRaiz = "C:\Empresa"

New-Item -Path $rutaRaiz -ItemType Directory

foreach ($direct in $departamentos) {
    $dirNom = Join-Path $rutaRaiz $direct.departamento

    New-Item -Path $dirNom -ItemType Directory
}

#Permisos en carpeta Empresa, quitar herencia

$acl = Get-Acl -Path $rutaRaiz

Write-Host "Reglas de acceso ante de los cambios:"
$acl.Access | Format-Table

#Deshabilitamos herencia
$acl.SetAccessRuleProtection($true, $false)

#Aplicamos los cambios
Set-Acl -Path $rutaRaiz -AclObject $acl

#Mostrar reglas después del cambio
Write-Host "Reglas de acceso después de deshabilitar herencia:"
Get-Acl -Path $rutaRaiz | Select-Object -ExpandProperty Access | Format-Table

#Permisos en carpeta Empresa, acceso lectura a usuarios dominio 

#Comprobar los permisos de la carpeta
$acl= Get-Acl -Path $rutaRaiz

$permisoEmpresa = @('Domain Users', 'Read', 'ContainerInherit,ObjectInherit', 'None', 'Allow')

$reglasUsuDom= New-Object -TypeName System.Security.AccessControl.FileSystemAccessRule -ArgumentList $permisoEmpresa

$acl.SetAccessRule($reglasUsuDom)

$acl | Set-Acl -Path $rutaRaiz

#Permisos por departamento

foreach ($dept in $departamentos) {
    $nombreDept = $dept.departamento
    $nombreGrupo = "G_$nombreDept"
    $rutaCarpeta = "$rutaRaiz\$nombreDept"

    $acl = Get-Acl $rutaCarpeta

    #Quitamos herencia
    $acl.SetAccessRuleProtection($true, $false)

    #Control total Admin
    $permisoAdmin = @('Administrators', 'FullControl', 'ContainerInherit,ObjectInherit', 'None', 'Allow')

    $reglasAdmin= New-Object -TypeName System.Security.AccessControl.FileSystemAccessRule -ArgumentList $permisoAdmin

    $acl.AddAccessRule($reglasAdmin)

    #Permiso Grupo Departamento
    $permisoDepto = @($nombreGrupo, 'Modify', 'ContainerInherit,ObjectInherit', 'None', 'Allow')

    $reglasDepto = New-Object -TypeName System.Security.AccessControl.FileSystemAccessRule -ArgumentList $permisoDepto
    
    $acl.AddAccessRule($reglasDepto)

    #Permisos para depto que no sean los propios
    foreach ($otros in $departamentos) {
        $nomOtroDept = $otros.departamento
        $nomOtroGrupo = "G_$nomOtroDept"

        if ($nomOtroGrupo -ne $nombreGrupo) {
            $permisoLectura = @($nomOtroGrupo, 'ReadAndExecute', 'ContainerInherit,ObjectInherit', 'None', 'Allow')

            $reglasLectura = New-Object -TypeName System.Security.AccessControl.FileSystemAccessRule -ArgumentList $permisoLectura

            $acl.AddAccessRule($reglasLectura)
        }
    }
    $acl | Set-Acl -Path $rutaCarpeta
}


#Creamos el recurso compartido 
$recursoComp = "Empresa"

New-SmbShare -Name $recursoComp -Path $rutaRaiz -ChangeAccess "Domain Users"

Get-SmbShare -Name $recursoComp
Get-SmbShareAccess -Name $recursoComp
