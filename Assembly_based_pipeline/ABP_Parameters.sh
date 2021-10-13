#!/bin/bash 

################################################################################################################################################
# 	
#	  This Bash script is written by Z.B. Lara.
#
#	  This script performs the pre-processing and intermediate steps for the Assembly-Based Pipeline.
#		
#	  Usage:
#		  Run in terminal of choice. Make sure the prerequesites are installed and the necessary files are present.
#
################################################################################################################################################

#insert SLURM/sbatch variables here if any

ulimit -s unlimited 

SAMPLE=G1
#Affix proper file name here. Make sure that forward reads are distinct ("_1") from reverse reads ("_2") for paired-end data.

cd /path/to/raw/data &&\

megahit --presets meta-large -1 "$SAMPLE"_1.fq.gz -2 "$SAMPLE"_2.fq.gz -t 32 -m 128 -o "$SAMPLE"_assembly &&\
#Outputs the file: "$SAMPLE".contigs.fa

metaquast -o "$SAMPLE"_assembly_qc -t 8 --max-ref-num 0 "$SAMPLE"_assembly/"$SAMPLE".contigs.fa &\
#Produces visualizations that summarize assembly quality. This step is optional but if the user wishes to run it, an internet connection is necessary.

metabat -i "$SAMPLE"_assembly/"$SAMPLE".contigs.fa -o  "$SAMPLE"_bins --sensitive --specific -t 24 -v &&\
#Outputs individual Bins a.k.a. Metagenome-Assembled Genomes (MAGs)

checkm lineage_wf "$SAMPLE"_bins "$SAMPLE"_bins_qc -t 8 &&\
checkm qa "$SAMPLE"_bins "$SAMPLE"_bins_qc -o 1 &&\
#For QC of Bins. Manually check for each bin's quality based on output summary.

gtdbtk classify_wf --genome_dir /path/to/genome/directory --out_dir "$SAMPLE"_gtdbtk --cpus 16 --extension fa --force &\
#Taxonomy classification of each MAG
#Installation and GTDB-Tk database available at: https://ecogenomics.github.io/GTDBTk/installing/index.html

abricate --db card "$SAMPLE"_bins/"$SAMPLE"_bin.1 > "$SAMPLE".abricate.out
#Screening of each MAG for AMR genes using CARD database (MEGARES was unavailable as of the writing)
