Import-Module ActiveDirectory

$OUraiz = "Empresa"
$DNraiz = "OU=Empresa,DC=empresa,DC=local"

$departamentos = Import-Csv -Path "C:\Users\Administrator\Desktop\Practica6\departamentos.csv"

foreach ($dept in $departamentos) {
    $nombreDept = $dept.departamento
    $nombreGrupo = "G_$nombreDept"
    $ouGrupo = "OU=$nombreDept,$DNraiz"

    New-ADGroup -Name $nombreGrupo -GroupCategory Security -GroupScope Global -Path $ouGrupo

    Write-Host "Grupo $nombreGrupo creado."
}

