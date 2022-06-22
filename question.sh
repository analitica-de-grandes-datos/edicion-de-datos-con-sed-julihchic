#
#  LAB: Transformación de archivos con `sed`
#  ================================================
#
#  Una tarea común en Analytics es el procesamiento de archivos en bruto para que puedan 
#  ser usados en otros procesos, donde gran parte de dicho procesamiento corresponde a la 
#  transforamción del formato. Estos archivos suelen tener millones de registros por lo que 
#  la aplicación de procedimientos manuales no es práctica.
#  
#  El archivo `data.csv` contiene una muestra de los archivos generados automáticamente 
#  por un software. El archivo contiene cuatro (4) columnas, donde los valores válidos
#  para los campos son los siguientes:
#  
#  * Columna 1: `DD/MM/AA`.
#  * Columna 2: `A`, `B`, `C`. `\N` indica NULL.
#  * Columna 3: Número entero. `\N` indica NULL.
#  * Columna 4: Número decimal. `\N` indica NULL.
#  
#  
#  Usted debe escribir un script en bash que use sed para que realice 
#  las siguientes acciones:
#    
#  * Convierta el formato de las fechas de DD/MM/YY a YYYY-MM-DD.
#  
#  * Transforme el archivo para que todos los campos nulos aparezcan como `\N`.
#  
#  * Reemplace los `;` por `,`.
#  
#  * Use el `.` para indicar decimales.
#
#  El resultado del script se escribe en pantalla.
#
#  El programa se llamara por el evaluador tal como se indica a continuación:
#
#  $ bash question.sh data.csv > output.csv
#  
#  Rta/
#  2013-03-12,A,1,100.0
#  ...
#  2014-09-01,A,3,100.4
#
#  >>> Escriba su codigo a partir de este punto <<<
#
#sed 's/\([0-9][0-9]\)\/\([0-9][0-9]\)\/\([0-9][0-9]\)/\3-\2-\1/g' data.csv > result1.csv
#sed 's/\([0-9][0-9]\)-/20\1-/' result1.csv > result2.csv
#sed 's/\([0-9]\)\//0\1\//g' result2.csv > result3.csv
#sed 's/\([0-9][0-9]\)\/\([0-9][0-9]\)\/\([0-9][0-9][0-9][0-9]\)/\3-\2-\1/g' result3.csv > item1.csv
#sed 's/;;/;\\N;/' item1.csv > r1.csv
#sed '4 s/;\\N/;\\N;\\N/' r1.csv > r2.csv
#sed '6 s/;n/;n;\\N/' r2.csv > r3.csv
#sed '7 s/;\\N;/;\\N;\\N;\\N/' r3.csv > r4.csv
#sed '9 s/;\\N/;\\N;\\N/' r4.csv > r5.csv
#sed '5 s/;\\N;\\N;/;\\N;\\N;\\N;\\N/' r5.csv > r6.csv
#sed '10 s/;\\N;\\N/;\\N;\\N;\\N/' r6.csv > item2.csv
#sed 's/;/,/g' item2.csv > item3.csv
#sed 's/,\([0-9][0-9][0-9]\)\,\([0-9]\)/,\1\.\2/' item3.csv > output.csv
#sed 's/,/./g' data.csv | sed 's/;/,/g' | sed -E 's,([0-9]{2})/([0-9]{2})/([0-9]{2}),20\3-\2-\1,g' | sed -E 's,([0-9]{1})/([0-9]{1})/([0-9]{4}),\3-0\2-0\1,g' |sed 's/,,/\,\\N,/g' | sed 's/[a-z]/\U&/g'|sed 's/,N/,\\N/g'|sed 's/,$/,\\N/'
sed 's/,/./g' data.csv > d1.csv
sed 's/;/,/g' d1.csv > d2.csv
sed -E 's,([0-9]{2})/([0-9]{2})/([0-9]{2}),20\3-\2-\1,g' d2.csv > d3.csv
sed -E 's,([0-9]{1})/([0-9]{1})/([0-9]{4}),\3-0\2-0\1,g' d3.csv > d4.csv
sed 's/,,/\,\\N,/g' d4.csv > d5.csv
sed 's/[a-z]/\U&/g' d5.csv > d6.csv
sed 's/,N/,\\N/g' d6.csv > d7.csv
sed 's/,$/,\\N/' d7.csv > output.csv



