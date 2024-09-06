**README**
Presentado por:
Elkin Benitez
----------------------------
Para ejecución de los puntos 1, 2, 3:
----------------------------
Punto1:
AFD en awk
Luego de ubicarse en la ruta del fichero se procede con las siguiente líneas de código:
python3 AFD.py <expresion_regular>

ej: 
python3 AFD.py +
python3 AFD.py ++
python3 AFD.py 123
python3 AFD.py 1.0
-----------------------------------------------------------------------------------------
Punto2:
flex -o lex.yy.c punto2.l → Genera el archivo lex.yy.c para tokenizar la entrada
gcc lex.yy.c -o punto2 -lfl → Para compilar el programa 
./punto2 punto2.txt → Para correr el programa desde el txt
-----------------------------------------------------------------------------------------
Punto3:
gcc punto3.c -o punto3 → Para compilar el programa 
./punto3 prueba3.txt "key= sofia" → Para correr el programa desde el txt y encontrar la coincidencia en el archivo
**Nota: SI NO SE UTILIZAN LAS COMILLAS DOBLES ANTES DEL KEY Y LUEGO DEL MISMO EL PROGRAMA NO CORRERA. ASÍMISMO CON LA PALABRA KEY Y EL SIMBOLO IGUAL. GRACIAS.**


