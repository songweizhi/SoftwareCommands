
module load python/2.7.15

/srv/scratch/z5039045/Softwares/growthpred-v1.07/growthpred-v1.07.py -h




module load python/2.7.15
cd /srv/scratch/z5039045/growthpred_wd
/srv/scratch/z5039045/Softwares/growthpred-v1.07/growthpred-v1.07.py -f DM_16S.fa -g DM.fna -o DM_growthpred_wd -c 0

/srv/scratch/z5039045/Softwares/growthpred-v1.07/growthpred-v1.07.py -f ecoli_ribosomal_genes.fa -g ecoli_complete_genome.fa -o DM_growthpred_wd -c 0
/srv/scratch/z5039045/Softwares/growthpred-v1.07/growthpred-v1.07.py -f ecoli_ribosomal_genes.txt -g ecoli_complete_genome.txt -o DM_growthpred_wd -c 0 -s -S
