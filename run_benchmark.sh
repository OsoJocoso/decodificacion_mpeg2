#!/bin/sh -f
NAME=mpeg2decode
WATTCH_BIN=${HOME}/wattch/sim-wattch-1.02d/sim-outorder
BENCH_BIN=${NAME}
BENCH_OPT="-r -f -o0"
BENCH_INP="-b ../../data/mei16v2.m2v"
BENCH_OUT="tmp_rec%d"
BENCH_ARG="${BENCH_INP} ${BENCH_OPT} ${BENCH_OUT}"
#
i=0

#echo "Data collection for MPEG2 experiment" > total_log.txt

for bpredm in comb 2lev
do
   for lsqs in 8 16
   do
      for ruus in 16 32
      do
         ${WATTCH_BIN} -bpred ${bpredm} -res:fpalu 1 -lsq:size ${lsqs} -ruu:size ${ruus}  ${BENCH_BIN} ${BENCH_ARG} > tmp_log.txt 2>&1
         echo "\nData for run $((i+=1))" >> total_log.txt
         grep "Total Power Consumption" tmp_log.txt >> total_log.txt
         grep "sim_IPC" tmp_log.txt >> total_log.txt
         grep "sim_CPI" tmp_log.txt >> total_log.txt
         grep "\.misses " tmp_log.txt | grep -v "bpred" >> total_log.txt
         grep "\.hits" tmp_log.txt >> total_log.txt
         grep "\.miss_rate" tmp_log.txt >> total_log.txt
      done
      ${WATTCH_BIN} -bpred ${bpredm} -res:fpalu 1 -lsq:size ${lsqs} -ruu:size 32 -cache:dl1 dl1:128:32:4:f -cache:dl2 ul2:1024:64:4:f -cache:il1 il1:512:32:1:f ${BENCH_BIN} ${BENCH_ARG} > tmp_log.txt 2>&1
      echo "\nData for run $((i+=1))" >> total_log.txt
      grep "Total Power Consumption" tmp_log.txt >> total_log.txt
      grep "sim_IPC" tmp_log.txt >> total_log.txt
      grep "sim_CPI" tmp_log.txt >> total_log.txt
      grep "\.misses " tmp_log.txt | grep -v "bpred" >> total_log.txt
      grep "\.hits" tmp_log.txt >> total_log.txt
      grep "\.miss_rate" tmp_log.txt >> total_log.txt
   done
done
rm tmp_log.txt tmp_rec*
