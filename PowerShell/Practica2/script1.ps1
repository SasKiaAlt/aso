#Nombre de usuario
$usuario = $env:USERNAME

#Directorio
$directorio = Get-Location

#Dominio
$domino = $env:USERDOMAIN

#Nombre equipo
$equipo = $env:COMPUTERNAME

#Mostar mensajes
Write-Host "Hola $usuario"
Write-Host "Tu directorio de trabajo es $directorio"
Write-Host "Perteneces al dominio $dominio"
Write-Host "Tu equipo se llama $equipo"
