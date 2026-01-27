Import-Module ActiveDirectory

$OUraiz = "Empresa"
$DNraiz = "OU=Empresa,DC=empresa,DC=local"

$pass = ConvertTo-SecureString "aso2025." -AsPlainText -Force

$deptos = Import-Csv -Path "C:\Users\Administrator\Desktop\Practica6\departamentos.csv"

$empleados = Import-Csv -Path "C:\Users\Administrator\Desktop\Practica6\empleados.csv"

foreach ($dept in $deptos) {
    $ouNom = $dept.departamento
    $ouDescrip = $dept.descripcion

    New-ADOrganizationalUnit -Name $ouNom -Path $DNraiz -Description $ouDescrip -ProtectedFromAccidentalDeletion $true

    Write-Host "Sub-OU '$ouNom' creada bajo '$OUraiz'."
}

foreach ($emplea in $empleados) {
    $depar = $emplea.departamento
    $nombre = $emplea.nombre
    $apellido = $emplea.apellido
    

    $login = ($nombre + "." + $apellido).ToLower()
    $ouDN = "OU=$depar,$DNraiz"

     New-ADUser -Name "$nombre $apellido" -GivenName $nombre -Surname $apellido -SamAccountName $login -UserPrincipalName "$login@empresa.local" -AccountPassword $pass -ChangePasswordAtLogon $true -Enabled $true -Path $ouDN
     Write-Host "Usuario '$login' creado en '$depar'."
}
