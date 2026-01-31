$departamentos = Import-Csv -Path "C:\Users\Administrator\Desktop\Practica6\departamentos.csv"
$rutaEmpresa = "C:\Empresa"

foreach ($dept in $departamentos) {
    $nombreDept = $dept.departamento
    $nombreGrupo = "G_$nombreDept"
    $rutaCarpeta = "$rutaEmpresa\$nombreDept"

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

New-SmbShare -Name $recursoComp -Path $rutaEmpresa -ChangeAccess "Domain Users"

Get-SmbShare -Name $recursoComp
Get-SmbShareAccess -Name $recursoComp
