/*
Pregunta
===========================================================================

Para el archivo `data.tsv` compute la cantidad de registros por letra de la 
columna 2 y clave de al columna 3; esto es, por ejemplo, la cantidad de 
registros en tienen la letra `b` en la columna 2 y la clave `jjj` en la 
columna 3 es:

  ((b,jjj), 216)

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/

data = LOAD 'data.tsv' AS (f1:chararray, f2:BAG{t: TUPLE(p:chararray)}, f3:MAP[]);

f2_f3 = FOREACH data GENERATE FLATTEN(f2),FLATTEN(f3);
letra_clave = FOREACH f2_f3 GENERATE ($0, $1) AS claves;
grupo = GROUP letra_clave BY claves;
conteo = FOREACH grupo GENERATE group, COUNT(letra_clave);

STORE conteo INTO 'output' using PigStorage(',');
