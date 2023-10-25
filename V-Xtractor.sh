
module load hmmer/3.3
/srv/scratch/z5039045/Softwares/V-Xtractor/vxtractor.pl


cd /srv/scratch/z5039045
perl /srv/scratch/z5039045/Softwares/V-Xtractor/vxtractor.pl -h /srv/scratch/z5039045/Softwares/V-Xtractor/HMMs/bacteria/ -c variable_region.csv -o variable_region.fas 100_1336.fa



cd /srv/scratch/z5039045/Softwares/V-Xtractor
perl vxtractor.pl -a -r .V1-V3. -h HMMs/bacteria/ -c 100_1336_variable_region.csv -o 100_1336_variable_region.fas 100_1336.fa




cd /srv/scratch/z5039045
perl /srv/scratch/z5039045/Softwares/vxtractor/vxtractor.pl -a -h /srv/scratch/z5039045/Softwares/vxtractor/HMMs/SSU/bacteria/ -c 100_1336_variable_region.csv -o 100_1336_variable_region.fa 100_1336.fa
perl /srv/scratch/z5039045/Softwares/vxtractor/vxtractor.pl -a -h /srv/scratch/z5039045/Softwares/vxtractor/HMMs/SSU/archaea -c 100_1336_variable_region.csv -o 100_1336_variable_region.fa 100_1336.fa


cd /srv/scratch/z5039045/MarkerMAG_wd/MBARC26/MBARC26_0830_iden99_MarkerMAG_wd
perl /srv/scratch/z5039045/Softwares/vxtractor/vxtractor.pl -a -h /srv/scratch/z5039045/Softwares/vxtractor/HMMs/SSU/bacteria -c MBARC26_SILVA138_polished_polished_min1200bp_c99_variable_region_as_bacteria.csv -o MBARC26_SILVA138_polished_polished_min1200bp_c99_variable_region_as_bacteria.fa MBARC26_SILVA138_polished_polished_min1200bp_c99.0.fasta
perl /srv/scratch/z5039045/Softwares/vxtractor/vxtractor.pl -a -h /srv/scratch/z5039045/Softwares/vxtractor/HMMs/SSU/archaea -c MBARC26_SILVA138_polished_polished_min1200bp_c99_variable_region_as_archaea.csv -o MBARC26_SILVA138_polished_polished_min1200bp_c99_variable_region_as_archaea.fa MBARC26_SILVA138_polished_polished_min1200bp_c99.0.fasta


cd /srv/scratch/z5039045/MarkerMAG_wd/CAMI2_HMP/GI_0830_iden99_MarkerMAG_wd
perl /srv/scratch/z5039045/Softwares/vxtractor/vxtractor.pl -a -h /srv/scratch/z5039045/Softwares/vxtractor/HMMs/SSU/bacteria -c GI_128_16S_0.999_polished_min1200bp_c99_variable_region_as_bacteria.csv -o GI_128_16S_0.999_polished_min1200bp_c99_variable_region_as_bacteria.fa GI_128_16S_0.999_polished_min1200bp_c99.0.fasta
perl /srv/scratch/z5039045/Softwares/vxtractor/vxtractor.pl -a -h /srv/scratch/z5039045/Softwares/vxtractor/HMMs/SSU/archaea -c GI_128_16S_0.999_polished_min1200bp_c99_variable_region_as_archaea.csv -o GI_128_16S_0.999_polished_min1200bp_c99_variable_region_as_archaea.fa GI_128_16S_0.999_polished_min1200bp_c99.0.fasta


cd /srv/scratch/z5039045/MarkerMAG_wd/CAMI_Oral/Oral_0828_iden99_MarkerMAG_wd
perl /srv/scratch/z5039045/Softwares/vxtractor/vxtractor.pl -a -h /srv/scratch/z5039045/Softwares/vxtractor/HMMs/SSU/bacteria -c CAMI_Oral_138_16S_0.999.polished_min1200_polished_min1200bp_c99_variable_region_as_bacteria.csv -o CAMI_Oral_138_16S_0.999.polished_min1200_polished_min1200bp_c99_variable_region_as_bacteria.fa CAMI_Oral_138_16S_0.999.polished_min1200_polished_min1200bp_c99.0.fa
perl /srv/scratch/z5039045/Softwares/vxtractor/vxtractor.pl -a -h /srv/scratch/z5039045/Softwares/vxtractor/HMMs/SSU/archaea -c CAMI_Oral_138_16S_0.999.polished_min1200_polished_min1200bp_c99_variable_region_as_archaea.csv -o CAMI_Oral_138_16S_0.999.polished_min1200_polished_min1200bp_c99_variable_region_as_archaea.fa CAMI_Oral_138_16S_0.999.polished_min1200_polished_min1200bp_c99.0.fa


perl /srv/scratch/z5039045/Softwares/vxtractor/vxtractor.pl -a -h /srv/scratch/z5039045/Softwares/vxtractor/HMMs/SSU/bacteria/ -o /dev/null -c 100_1336_variable_region.csv 100_1336.fa &> /dev/null
