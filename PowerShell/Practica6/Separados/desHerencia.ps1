#Permisos en carpeta Empresa

$rutaEmpresa = "C:\Empresa"

$acl = Get-Acl -Path $rutaEmpresa

Write-Host "Reglas de acceso ante de los cambios:"
$acl.Access | Format-Table

#Deshabilitamos herencia
$acl.SetAccessRuleProtection($true, $false)

#Aplicamos los cambios
Set-Acl -Path $rutaEmpresa -AclObject $acl

#Mostrar reglas después del cambio
Write-Host "Reglas de acceso después de deshabilitar herencia:"
Get-Acl -Path $rutaEmpresa | Select-Object -ExpandProperty Access | Format-Table