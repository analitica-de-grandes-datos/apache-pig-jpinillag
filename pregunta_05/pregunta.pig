/*
Pregunta
===========================================================================

Para el archivo `data.tsv` compute Calcule la cantidad de registros en que 
aparece cada letra minúscula en la columna 2.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/

data = LOAD 'data.tsv' using PigStorage('\t') AS (letra:chararray,diccionario_letras:BAG{t: TUPLE(p:chararray)},lista_tuplas:chararray);

columna2 = FOREACH data GENERATE FLATTEN(diccionario_letras) AS letra;
letras_agrupadas = GROUP columna2 BY letra;
conteo_letras = FOREACH letras_agrupadas GENERATE group,COUNT(columna2);

STORE conteo_letras INTO 'output' using PigStorage(',');
