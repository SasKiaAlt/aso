Write-Host "Bienvenido a la pizzería Bella Napoli"
Write-Host "Todas las pizzas llevan mozzarela y tomate"

$tipo = Read-Host "¿Quieres una pizza vegetariana? (S/N)"

if ($tipo -ieq "S") {
    Write-Host "Has elegido VEGETARIANO"
    Write-Host "Ingredientes disponibles:"
    Write-Host " 1. Pimiento"
    Write-Host " 2. Tofu"

    $opcion = Read-Host "Elige un ingrediente: (1 o 2)"

    if ($opcion -eq 1) {
        Write-Host "Tu pizza es VEGETARIANA"
        Write-Host "Con lo siguentes ingredientes:"
        Write-Host " - Mozzarela"
        Write-Host " - Tomate"
        Write-Host " - Pimiento"
    } elseif ($opcion -eq 2) {
        Write-Host "Tu pizza es VEGETARIANA"
        Write-Host "Con lo siguentes ingredientes:"
        Write-Host " - Mozzarela"
        Write-Host " - Tomate"
        Write-Host " - Tofu"
    } else {
        Write-Host "Opción no válida. Vuelva a empezar"
        exit
    }

} elseif ($tipo -ieq "N") {
    Write-Host "Has elegido NO vegetariano"
    Write-Host "Ingredientes disponibles:"
    Write-Host " 1. Peperoni"
    Write-Host " 2. Jamón"
    Write-Host " 3. Salmón"

    $opcion = Read-Host "Elige un ingrediente: (1, 2 o 3)"

    if ($opcion -eq 1) {
        Write-Host "Tu pizza es NO vegetariana"
        Write-Host "Con lo siguentes ingredientes:"
        Write-Host " - Mozzarela"
        Write-Host " - Tomate"
        Write-Host " - Peperoni"
    } elseif ($opcion -eq 2) {
        Write-Host "Tu pizza es NO vegetariana"
        Write-Host "Con lo siguentes ingredientes:"
        Write-Host " - Mozzarela"
        Write-Host " - Tomate"
        Write-Host " - Jamón"
    } elseif ($opcion -eq 3) {
        Write-Host "Tu pizza es NO vegetariana"
        Write-Host "Con lo siguentes ingredientes:"
        Write-Host " - Mozzarela"
        Write-Host " - Tomate"
        Write-Host " - Salmón"
    } else {
        Write-Host "Opción no válida. Vuelva a empezar"
        exit
    }
} else {
    Write-Host "Opción no válida. Vuelva a intentarlo"
}
