function sumar($num1, $num2) {
    return $num1 + $num2
}
function restar($num1, $num2) {
    return $num1 - $num2
}
function multi($num1, $num2) {
    return $num1 * $num2 
}
function divi($num1, $num2) {
    if ($num2 -eq 0) {
        Write-Host "Error! No se puede dividir por 0"
        return $null
    } else {
        return $num1 / $num2
    }
}

do { 
    Write-Host ""
    Write-Host "********CALCULADORA*********"
    Write-Host "    1. Sumar"
    Write-Host "    2. Restar"
    Write-Host "    3. Multiplicar"
    Write-Host "    4. Dividir"
    Write-Host "    5. Salir"
    Write-Host "****************************"

    $opcion = Read-Host "¿Qué quieres hacer? Elige una opción"
    Write-Host ""

    if ($opcion -ne 5) {
        [double]$num1 = Read-Host "Introduce el primer número"
        [double]$num2 = Read-Host "Introduce el segundo número"
        Write-Host ""
    }

    switch ($opcion) {
        1 {
            $resultado = sumar $num1 $num2
            Write-Host "Resultado: $resultado"
        }
        2 {
            $resultado = restar $num1 $num2
            Write-Host "Resultado: $resultado"
        }
        3 {
            $resultado = multi $num1 $num2
            Write-Host "Resultado: $resultado"
        }
        4 {
            $resultado = divi $num1 $num2
            if ($resultado -ne $null) {
                Write-Host "Resultado: $resultado"
            }
        }
        5 {
            Write-Host "Saliendo de la calculadora...."
            Write-Host "¡Hasta la próxima!"
        }
    }
} while ($opcion -ne 5)