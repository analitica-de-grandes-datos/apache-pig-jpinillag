/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Escriba el código equivalente a la siguiente consulta SQL.

   SELECT 
       birthday, 
       DATE_FORMAT(birthday, "yyyy"),
       DATE_FORMAT(birthday, "yy"),
   FROM 
       persons
   LIMIT
       5;

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
data = LOAD 'data.csv' using PigStorage(',') AS (id:INT, nombre:chararray, apellido:chararray,fecha:chararray,color:chararray,numero:INT);

anos = FOREACH data GENERATE SUBSTRING (fecha, 0, 4),SUBSTRING (fecha, 2, 4);

STORE anos INTO 'output' using PigStorage(',');
