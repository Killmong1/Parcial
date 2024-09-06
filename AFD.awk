#!/usr/bin/awk -f

BEGIN {
    # Definir patrones y tokens
    tokens["\\+"] = "SUMA"
    tokens["\\+\\+"] = "INCR"
    tokens["^[0-9]+$"] = "ENTERO"
    tokens["^[0-9]+\\.[0-9]+$"] = "REAL"
}

{
    # Leer expresión desde cada línea del archivo
    expresion = $0

    # Bandera para verificar si se encontró un token
    encontrado = 0

    # Iterar sobre los patrones definidos
    for (patron in tokens) {
        # Comprobar si la expresión coincide con el patrón
        if (expresion ~ patron) {
            print tokens[patron]
            encontrado = 1
            break
        }
    }

    # Si no se encuentra un token válido
    if (!encontrado) {
        print "Expresión no reconocida"
    }
}
