decodificacion_mpeg2
====================

Proyecto 1 Maestría Arquitectura de Sistemas Empotrados

Correr el test sin cross-compiling
------------------------------------

1) Descomprimir testbench
   >tar xvzf mediabench.tar.gz

2) Hacer Make /*Hay que editar Makefile y remover -m8*/
   >cd mediabench/mpeg2/src/mpeg2dec
   >make

3) Correr sim
   >cd ../../exec/
   >./mpeg2decode.sh


Correr el test con cross-compiling
------------------------------------

1) Descomprimir testbench
   >tar xvzf mediabench.tar.gz

2) Sobreescribir Make
   >cp Makefile mediabench/mpeg2/src/mpeg2dec/Makefile

3) Make
   >cd mediabench/mpeg2/src/mpeg2dec
   >make

3) Copiar sim
   >cp wattch_mpeg2decode.sh mediabench/mpeg2/exec/wattch_mpeg2decode.sh
   >cd ../../exec/

4)  Correr sim
   >./wattch_mpeg2decode.sh

