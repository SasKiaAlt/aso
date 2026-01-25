$passw = "EstaContraseña"

$passwUser = Read-Host "Introduce la contraseña"

if ($passw -ieq $passwUser) {
    Write-Host "Contraseña CORRECTA"
} else {
    Write-Host "Contraseña INCORRECTA"
}
