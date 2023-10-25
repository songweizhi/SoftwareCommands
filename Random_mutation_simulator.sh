# commands for running random_mutation_simulator.py

module load python/3.5.2
module load blast+/2.2.31

cd /srv/scratch/z5039045/Kerrin/FurtherTests_MetaChip/Random_mutation_wd

python3 /srv/scratch/z5039045/Scripts/random_mutation_simulator.py -in transferredGenes.fasta -identity 95 -ratio 1-0-1-1 &
python3 /srv/scratch/z5039045/Scripts/random_mutation_simulator.py -in transferredGenes.fasta -identity 90 -ratio 1-0-1-1 &
python3 /srv/scratch/z5039045/Scripts/random_mutation_simulator.py -in transferredGenes.fasta -identity 85 -ratio 1-0-1-1 &
python3 /srv/scratch/z5039045/Scripts/random_mutation_simulator.py -in transferredGenes.fasta -identity 80 -ratio 1-0-1-1 &
python3 /srv/scratch/z5039045/Scripts/random_mutation_simulator.py -in transferredGenes.fasta -identity 75 -ratio 1-0-1-1 &
python3 /srv/scratch/z5039045/Scripts/random_mutation_simulator.py -in transferredGenes.fasta -identity 70 -ratio 1-0-1-1 &




python3 /Users/songweizhi/PycharmProjects/MetaCHIP/HgtSIM.py -in transferredGenes.fasta -identity 90 -ratio 1-0-1-1
python3 /Users/songweizhi/PycharmProjects/MetaCHIP/Random_HGT_generator.py -transfer_profile donor2recip.txt -recipients recipients -sequences_file transferredGenes.fasta -recipient_genome_extension fna

python3 /Users/songweizhi/PycharmProjects/MetaCHIP/HgtSIM.py -t transferredGenes.fasta -i 90 -r 1-0-1-1 -d donor2recip.txt -f recipients

python3 /Users/songweizhi/PycharmProjects/MetaCHIP/HgtSIM.py -t transferredGenes.fasta -i 90 -r 1-0-1-1 -d donor2recip.txt -f recipients -x fna

python3 /Users/songweizhi/PycharmProjects/HgtSIM/HgtSIM.py -t transferredGenes.fasta -i 90 -r 1-0-1-1 -d donor2recip.txt -f recipients -x fna

python3 /Users/songweizhi/PycharmProjects/MetaCHIP/Step_6_1_assembler_recovered_transfers.py -a BAD.fna -t output_sequence_nc.fasta


python3 /Users/songweizhi/PycharmProjects/HgtSIM/HgtSIM.py -t transferredGenes.fasta -d donor2recip.txt -f recipients -x fna -r 1-0-1-1 -i 90 



python3 /Users/songweizhi/PycharmProjects/MetaCHIP/Step_6_1_assembler_recovered_transfers.py -a BAD.fna -t output_sequence_nc.fasta




python3 /Users/songweizhi/PycharmProjects/HgtSIM/HgtSIM.py -t transferredGenes.fasta -d donor2recip.txt -f recipients -x fna -r 1-0-1-1 -i 100 &
python3 /Users/songweizhi/PycharmProjects/HgtSIM/HgtSIM.py -t transferredGenes.fasta -d donor2recip.txt -f recipients -x fna -r 1-0-1-1 -i 95 &
python3 /Users/songweizhi/PycharmProjects/HgtSIM/HgtSIM.py -t transferredGenes.fasta -d donor2recip.txt -f recipients -x fna -r 1-0-1-1 -i 90 &
python3 /Users/songweizhi/PycharmProjects/HgtSIM/HgtSIM.py -t transferredGenes.fasta -d donor2recip.txt -f recipients -x fna -r 1-0-1-1 -i 85 &
python3 /Users/songweizhi/PycharmProjects/HgtSIM/HgtSIM.py -t transferredGenes.fasta -d donor2recip.txt -f recipients -x fna -r 1-0-1-1 -i 80 &
python3 /Users/songweizhi/PycharmProjects/HgtSIM/HgtSIM.py -t transferredGenes.fasta -d donor2recip.txt -f recipients -x fna -r 1-0-1-1 -i 75 &
python3 /Users/songweizhi/PycharmProjects/HgtSIM/HgtSIM.py -t transferredGenes.fasta -d donor2recip.txt -f recipients -x fna -r 1-0-1-1 -i 70 &






