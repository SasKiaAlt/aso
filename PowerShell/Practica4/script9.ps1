$passwd = "contraseña"

do { 
    $passUser = Read-Host "Introduce la contraseña"
     
    if ($passUser -ne $passwd) {
        Write-Host "Contraseña incorrecta. Inténtalo de nuevo."
        Write-Host ""
    }
} while ($passUser -ne $passwd)

Write-Host ""

Write-Host "Contraseña correcta!"