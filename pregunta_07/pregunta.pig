/*
Pregunta
===========================================================================

Para el archivo `data.tsv` genere una tabla que contenga la primera columna,
la cantidad de elementos en la columna 2 y la cantidad de elementos en la 
columna 3 separados por coma. La tabla debe estar ordenada por las 
columnas 1, 2 y 3.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/

data = LOAD 'data.tsv' AS (f1:chararray, f2:BAG{t: TUPLE(p:chararray)}, f3:MAP[]);

conteo_filas = FOREACH data GENERATE f1,SIZE(f2),SIZE(f3);
ordered_conteo = ORDER conteo_filas BY f1 ,$1,$2;

STORE ordered_conteo INTO 'output' using PigStorage(',');