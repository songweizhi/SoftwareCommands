# OrthoANI
# https://www.ezbiocloud.net/tools/orthoaniu


# load module 
module load java/8u162 


# on Mac
java -Xmx32G -jar path/to/OAU.jar -u path/to/usearch_mac -fd genome_folder > ANI_results.txt


# on Katana
module load java/8u162 
java -Xmx32G -jar path/to/OAU.jar -u path/to/usearch_linux -fd genome_folder > ANI_results.txt
java -Xmx32G -jar path/to/OAU.jar -u path/to/usearch_linux -f1 genome1.fna -f2 genome2.fas > ANI_results_genome1_genome1.txt


# example
java -Xmx32G -jar /srv/scratch/z5039045/Softwares/ANI_calculator/OAU.jar -u /srv/scratch/z5039045/Softwares/ANI_calculator/usearch -fd genomes_all > ANI_results.txt
java -Xmx32G -jar /srv/scratch/z5039045/Softwares/ANI_calculator/OAU.jar -u /srv/scratch/z5039045/Softwares/ANI_calculator/usearch -f1 PM05.fna -f2 210v_PacBio.fas > ANI_results_PM05_210V.txt



