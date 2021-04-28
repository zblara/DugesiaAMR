#!/bin/bash 

#insert SLURM/sbatch variables here if any

ulimit -s unlimited 

SAMPLE=G1
#Affix proper file name here. Make sure that forward reads are distinct ("_1") from reverse reads ("_2") for paired-end data.

cd /path/to/raw/data &&\

fastp -i "$SAMPLE"_1.fq.gz -I "$SAMPLE"_2.fq.gz -o "$SAMPLE"_1_fastp.fq.gz -O "$SAMPLE"_2_fastp.fq.gz -q 33 -l 30 -w 88 -h "$SAMPLE"_fastp.html &&\

bowtie2 --end-to-end --sensitive --no-discordant --no-mixed -t -p 88 -x megares -1 "$SAMPLE"_1.fq.gz -2 "$SAMPLE"_2.fq.gz -S "$SAMPLE"_bt2.sam &&\
#Make sure you have the megares bt2 index files in the working directory.

sed '1~2d' "$SAMPLE"_bt2.sam | cut -f1,3,4,5,8 | grep -v '*' > /$SAMPLE.meg.drs && \
perl -w procSam.pl $SAMPLE.meg.drs megares.lengths > $SAMPLE.meg.csv
