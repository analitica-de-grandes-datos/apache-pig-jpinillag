/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Escriba el código equivalente a la siguiente consulta SQL.

   SELECT 
       firstname,
       color
   FROM 
       u
   WHERE 
       color REGEXP 'blue|green';

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
data = LOAD 'data.csv' using PigStorage(',') AS (id:INT, nombre:chararray, apellido:chararray,fecha:chararray,color:chararray,numero:INT);

data_filtrada = FILTER data BY ((INDEXOF(color, 'blue',0) >= 0) OR (INDEXOF(color, 'green',0) >= 0));
data_con_indice = FOREACH data_filtrada GENERATE nombre,color;

STORE data_con_indice INTO 'output' using PigStorage(',');