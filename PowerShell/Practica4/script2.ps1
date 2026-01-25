[int]$edad = Read-Host "Dime cuantos años tienes"

$i = 1

Write-Host "Estos con los años que has cumplido:"

while ($i -le $edad) {
    Write-Host "$i"
        $i++
}
