%{
#include <stdio.h>
%}

%%

^[^0-9].*([a-zA-Z]*)+([0-9]*[a-zA-Z]*)*[" "]+?=[\t ]*"lambda"[\t ]+[a-zA-Z_][a-zA-Z0-9_]*[\t ]*:[\t ]*[a-zA-Z_][a-zA-Z0-9_]*[\t ]*\*\*[\t ]*[0-9]+[\t ]*\n"print"[\t ]*\([\t ]*"square"[\t ]*\([\t ]*[0-9]+[\t ]*\)[\t ]*\)  {return 1;}

.+ { printf("NO ACEPTA "); }


%%

int main(int argc, char *argv[]) {
   
   	yyin=fopen(argv[1],"r");
	int cadena;
	while( cadena=yylex()){
		
		if(cadena == 1){
			printf("ACEPTA");
		}
	}
   
    if (argc < 2) {
        printf("Por favor, ingrese el nombre de un archivo como parámetro de entrada.\n");
        return 1;
    }
    
    FILE *file = fopen(argv[1], "r");
    if (file == NULL) {
        printf("No se pudo abrir el archivo.\n");
        return 1;
    }
    
   

    
    yyin = file;
    yylex();
    
    fclose(file);
    return 0;
}

