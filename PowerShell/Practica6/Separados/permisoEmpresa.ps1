#Permisos en carpeta Empresa
$rutaEmpresa = "C:\Empresa"

#Comprobar los permisos de la carpeta
$acl= Get-Acl -Path $rutaEmpresa

$permisoEmpresa = @('Domain Users', 'Read', 'ContainerInherit,ObjectInherit', 'None', 'Allow')

$reglasUsuDom= New-Object -TypeName System.Security.AccessControl.FileSystemAccessRule -ArgumentList $permisoEmpresa

$acl.SetAccessRule($reglasUsuDom)

$acl | Set-Acl -Path $rutaEmpresa

