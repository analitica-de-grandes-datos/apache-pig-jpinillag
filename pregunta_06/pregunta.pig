/*
Pregunta
===========================================================================

Para el archivo `data.tsv` Calcule la cantidad de registros por clave de la 
columna 3. En otras palabras, cuántos registros hay que tengan la clave 
`aaa`?

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/

data = LOAD 'data.tsv' AS (f1:INT, f2:CHARARRAY, f3:MAP[]);

columna3 = FOREACH data GENERATE FLATTEN(f3);
claves = FOREACH columna3 GENERATE $0 AS clave;
claves_grupo = GROUP claves BY clave;
conteo = FOREACH claves_grupo GENERATE group, COUNT(claves);

STORE conteo INTO 'output' using PigStorage(',');