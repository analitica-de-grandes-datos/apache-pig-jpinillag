/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Cuente la cantidad de personas nacidas por año.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
data = LOAD 'data.csv' using PigStorage(',') AS (id:INT, nombre:chararray, apellido:chararray,fecha:chararray,color:chararray,numero:INT);

data = FOREACH data GENERATE SUBSTRING(fecha,0,4);
anos_nacimientos = GROUP data BY $0 ;
conteo = FOREACH anos_nacimientos GENERATE group,COUNT(data);

STORE conteo INTO 'output' using PigStorage(',');
