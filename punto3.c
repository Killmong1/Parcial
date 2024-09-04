#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int contar_coincidencias(FILE *archivo, const char *palabra) {
    int count = 0, palabra_len = strlen(palabra);
    char *linea = NULL;
    size_t len = 0;
    ssize_t read;

    while ((read = getline(&linea, &len, archivo)) != -1) {
        char *p = linea;
        while ((p = strstr(p, palabra)) != NULL) {
            count++;
            p += palabra_len; // Mover el puntero para continuar la búsqueda
        }
    }

    free(linea); // Liberar la memoria asignada por getline
    return count;
}

int main(int argc, char **argv) {
    if (argc != 3) {
        fprintf(stderr, "Uso correcto: %s <nombre_archivo> <key= palabra_clave>\n", argv[0]);
        return 1;
    }

    const char *nombre_archivo = argv[1];
    const char *entrada_completa = argv[2];

    // Extraer la palabra clave después de "key= "
    const char *palabra_clave = strstr(entrada_completa, "key=");
    if (palabra_clave) {
        palabra_clave += 4; // Desplazar el puntero para pasar "key= "
    } else {
        fprintf(stderr, "Formato de palabra clave incorrecto. Se esperaba 'key= palabra_clave'.\n");
        return 1;
    }

    FILE *archivo = fopen(nombre_archivo, "r");
    if (!archivo) {
        perror("Error abriendo el archivo");
        return 1;
    }

    int count = contar_coincidencias(archivo, palabra_clave);
    printf("%s se repite %d veces en el texto.\n", palabra_clave, count);

    fclose(archivo);
    return 0;
}

