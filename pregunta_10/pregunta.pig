/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Genere una relación con el apellido y su longitud. Ordene por longitud y 
por apellido. Obtenga la siguiente salida.

  Hamilton,8
  Garrett,7
  Holcomb,7
  Coffey,6
  Conway,6

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
data = LOAD 'data.csv' using PigStorage(',') AS (id:INT, nombre:chararray, apellido:chararray,fecha:chararray,color:chararray,numero:INT);

columnas_especificas = FOREACH data GENERATE apellido, SIZE(apellido);
nombres_ordenados = ORDER columnas_especificas BY $1 desc,$0;

STORE nombres_ordenados INTO 'output' using PigStorage(',');
