Write-Host "*********CALCULADORA**********"

[double]$num1 = Read-Host "¿Cuál es el primer número?"
[double]$num2 = Read-Host "¿Cuál es el segundo número"

Write-Host "    1. Sumar"
Write-Host "    2. Restar"
Write-Host "    3. Multiplicar"
Write-Host "    4. Dividir"


[int]$opcion = Read-Host "¿Qué quieres hacer?"


switch ($opcion) {
    1 {
        #Suma
        $suma = $num1 + $num2
        Write-Host "El resultado de la sumas es: $suma"
    }
    2 {
        #Resta
        $resta = $num1 - $num2
        Write-Host "El resultado de la resta es: $resta"
    }
    3 {
        #Multiplicación
        $multi = $num1 * $num2
        Write-Host "El resultado de la multiplicación es: $multi"
    }
    4 {
        #División
        if ($num2 -ne 0) {
            $divi = $num1 / $num2
            Write-Host "El resultado de la división es: $divi"
        } else {
             $divi = "No se puede dividir por 0"
        }
    }

}


