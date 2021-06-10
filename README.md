# DugesiaAMR
This pipeline aims to process raw metagenomic sequencing data for direct, in silico AMR gene detection and quantification. Results could be used for further downstream analysis in R Studio. This pipeline and accompanying research is not in any way related to the study of members of the Dugesiid family, although it is the favorite taxon of the authors.

### System Requirements
###  Hardware:
• An x86-compatible platform compatible with the indicated OS and programs \
• At least 4GB of RAM, a keyboard, and enough disk space for output files \
• Administrative privileges which are required to install and run the indicated programs
### Software: 
• Any version of Linux (or a Windows VM running Linux) compatible with the following programs (Benchmarking was performed on Ubuntu 16.04 LTS) \
• Bowtie 2.4.2 \
• FastP 0.20.0 \
• Perl 5 \
    • Unix shell of choice (Bash is utilized for the current pipeline) \
    ***Make sure that the dependencies of the above programs are also installed.
    
### Files Included:
  ✓ DugesiaAMR.sh - This is the main executable for the entire pipeline \
  ✓ procSam.pl - This is a necessary script for the DugesiaAMR pipeline \
  ✓ megares_v2.00_bt2_index.zip - This contains the prebuilt Bowtie 2 indexes but the user may build their own updated index from the Megares complete annotation found at:      https://megares.meglab.org/download/index.php \
  ✓ megares.lengths - This contains the genelengths dependencies for procSam.pl (built using bioawk).
  ✓ downstream_analysis.rmd - This is the R Markdown File which contains code for downstream statistical analysis and visualization
    
### ©2021, Z.B. Lara & C.Q. Llenado
