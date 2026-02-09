Import-Module ActiveDirectory

$OUraiz = "Empresa2"
$DNraiz = "DC=empresa,DC=local"
$OUcompleta = "OU=Empresa2,DC=empresa,DC=local"

$departamentos = Import-Csv -Path "C:\Users\Administrator\Desktop\Practica6\departamentos.csv" -Delimiter ";"
$empleados = Import-Csv -Path "C:\Users\Administrator\Desktop\Practica6\empleados.csv" -Delimiter ";"

$pass = ConvertTo-SecureString "aso2025." -AsPlainText -Force

#Creamos la UO Empresa
New-ADOrganizationalUnit -Name $OUraiz -Path $DNraiz -Description "Unidad organizativa raíz" -ProtectedFromAccidentalDeletion $false

Write-Host "Se ha creado la unidad organizativa $OUraiz dentro de $DNraiz."

#Creamos las OU de cada departamento y sus grupos 
foreach ($depto in $departamentos) {
    $OUnombre = $depto.departamento
    $descripcion = $depto.descripcion
    $grupo = "G2_$OUnombre"
    $OUdepto = "OU=$OUnombre,$OUcompleta"
    
    New-ADOrganizationalUnit -Name $OUnombre -Path $OUcompleta -Description $descripcion -ProtectedFromAccidentalDeletion $false
    Write-Host "Se ha creado la unidad organizativa $OUnombre dentro de $OUcompleta"

    New-ADGroup -Name $grupo -GroupCategory Security -GroupScope Global -Path $OUdepto
    Write-Host "Se ha creado el grupo $grupo dentro de la ruta $OUdepto"
    
}

#Creamos los usuario y los metemos dentro de sus respectivos grupo
foreach ($usuario in $empleados) {
    $nombre = $usuario.nombre
    $apellido = $usuario.apellido
    $depto = $usuario.departamento
    $grupo = "G2_$depto"
    $OUusuario = "OU=$depto,$OUcompleta"
    $login = ($nombre + "." + $apellido).ToLower()

    New-ADUser -Name "$nombre $apellido " -Path $OUusuario -SamAccountName $login -UserPrincipalName "$login@empresa.local" -AccountPassword $pass -GivenName $nombre -Surname $apellido -ChangePasswordAtLogon $true -Enabled $true

    Add-ADGroupMember -Identity $grupo -Members $login

    Write-Host "Se ha creado el usuario $login que pertenece al grupo $grupo y en la ruta $OUusuario"
}

$carpetaRaiz = "C:\Empresa"

#Creamos carpeta Empresa
New-Item -Path $carpetaRaiz -ItemType Directory

#Deshabilitamos permisos heredados
$acl = Get-Acl -Path $carpetaRaiz

#Mostrar permisos antes de modificar
Write-Host "Reglas de acceso antes de los cambios:"
$acl.Access | Format-Table

$acl.SetAccessRuleProtection($true, $false)

$permisoAdmin = @('Administrators', 'FullControl', 'ContainerInherit, ObjectInherit', 'None', 'Allow')
$ace = New-Object System.Security.AccessControl.FileSystemAccessRule -ArgumentList $permisoAdmin
$acl.SetAccessRule($ace)

$permisoUsers = @('Domain Users', 'Read', 'ContainerInherit, ObjectInherit', 'None', 'Allow')
$ace2 = New-Object System.Security.AccessControl.FileSystemAccessRule -ArgumentList $permisoUsers
$acl.SetAccessRule($ace2)

$acl | Set-Acl -Path $carpetaRaiz

#Mostramos después de los cambios
Write-Host "Mostramos permisos después de los cambios:"
$acl.Access |Format-Table

foreach ($carpeta in $departamentos) {
    $nombreCarpeta = $carpeta.departamento
    $rutaCarpeta = Join-Path $carpetaRaiz $nombreCarpeta
    $grupo = "G2_$nombreCarpeta"

    New-Item -Path $rutaCarpeta -ItemType Directory

    $acl = Get-Acl -Path $rutaCarpeta

    $permisoGrupo = @($grupo, 'Modify', 'ContainerInherit, ObjectInherit', 'None', 'Allow')
    $ace = New-Object -TypeName System.Security.AccessControl.FileSystemAccessRule -ArgumentList $permisoGrupo
    $acl.SetAccessRule($ace)

    foreach ($otros in $departamentos) {
        $otro = $otros.departamento
        $otroGrupo = "G2_$otro"

        if ($grupo -ne $otroGrupo) {
            $permisosOtro = @($otroGrupo, 'Read', 'ContainerInherit, ObjectInherit', 'None', 'Allow')
            $ace = New-Object -TypeName System.Security.AccessControl.FileSystemAccessRule -ArgumentList $permisosOtro
            $acl.SetAccessRule($ace)
        }
    }
    $acl | Set-Acl -Path $rutaCarpeta
    
    #Mostramos después de los cambios
    Write-Host "Mostramos permisos de grupo después de los cambios:"
    $acl.Access |Format-Table
}



