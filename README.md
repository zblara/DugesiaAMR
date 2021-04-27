# DugesiaAMR
This pipeline aims to process raw DNA sequencing data for in silico AMR gene detection and quantification. Results could be used for further downstream analysis in R Studio.

## System Requirements
###  Hardware:
• An x86-compatible platform compatible with the indicated OS and programs \
• At least 2GB of RAM, a mouse, and enough disk space for output files \
• Administrative privileges which are required to install and run the indicated programs
### Software: 
• Any version of Linux (or Windows VM running Linux) compatible with the following programs \
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
    

